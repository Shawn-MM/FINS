import mysql.connector
import sys
import folium
import json
from PyQt5 import QtWidgets, QtWebEngineWidgets
from PyQt5.QtWidgets import QMessageBox


#Notes for myself
# 1) look up certain animals that can only be found in the gulf of mexico or atantic ocen
# 2) 

#markers
def load_markers(filename):
    with open(filename, 'r') as file:
        return json.load(file)


#get fish by county 

def fetch_fish_by_county(county_name):
    connection = mysql.connector.connect(
        host='localhost',
        user='root',
        password='Smokeyhot123',
        database='FINS'
    )

    cursor = connection.cursor()
    query = """
    SELECT fish_species.name
    FROM fish_species
    JOIN county_fish ON fish_species.id = county_fish.fish_id
    JOIN counties ON counties.id = county_fish.county_id
    WHERE counties.name = %s
    """
    cursor.execute(query, (county_name,))
    result = cursor.fetchall()
    cursor.close()
    connection.close()

    return [item[0] for item in result]





#counties
def fetch_all_counties():
    connection = mysql.connector.connect(
        host='localhost',
        user='root',
        password='Smokeyhot123',
        database='FINS'
    )

    cursor = connection.cursor()
    query = "SELECT name FROM counties"
    cursor.execute(query)
    result = cursor.fetchall()
    cursor.close()
    connection.close()

    return [item[0] for item in result]


#fwc regulations
def fetch_fish_details(fish_name):
    connection = mysql.connector.connect(
        host='localhost',
        user='root',
        password='Smokeyhot123',
        database='FINS'
    )

    cursor = connection.cursor()
    query = """
    SELECT f.season, f.bag_limit, f.min_size, f.max_size, f.measurement_type
    FROM fish_details f
    JOIN fish_species s ON f.fish_id = s.id
    WHERE s.name = %s
    """
    cursor.execute(query, (fish_name,))
    result = cursor.fetchone()
    cursor.close()

    if result:
        return {
            "season": result[0],
            "bag_limit": result[1],
            "min_size": result[2],
            "max_size": result[3],
            "measurement_type": result[4]
        }
    return None


# UI
class MainWindow(QtWidgets.QMainWindow):
    def __init__(self):
        super().__init__()

        self.setWindowTitle('FINS')

        self.browser = QtWebEngineWidgets.QWebEngineView()
        self.browser.setHtml(self.create_folium_map())

        self.button = QtWidgets.QPushButton('View FWC Regulations')
        self.button.clicked.connect(self.show_regulations)

        layout = QtWidgets.QVBoxLayout()
        layout.addWidget(self.browser)
        layout.addWidget(self.button)

        central_widget = QtWidgets.QWidget()
        central_widget.setLayout(layout)
        self.setCentralWidget(central_widget)

    def create_folium_map(self):
        m = folium.Map(location=[27.9944024, -81.7602544], zoom_start=6)

        # Markers
        markers = load_markers('markers.json')

        for marker in markers:
            folium.Marker(
                location=marker["coordinates"],
                tooltip=marker["name"],
                popup=marker["name"],
                icon=folium.Icon(icon="cloud"),
            ).add_to(m)

        data = m._repr_html_()
        return data

    def show_regulations(self):
        self.regulations_window = RegulationsWindow()
        self.regulations_window.show()

class RegulationsWindow(QtWidgets.QDialog):
    def __init__(self):
        super().__init__()

        self.setWindowTitle('FWC Regulations')
        
        self.counties_list = QtWidgets.QListWidget()
        counties = fetch_all_counties()
        self.counties_list.addItems(counties)
        
        self.fish_list = QtWidgets.QListWidget()
        
        # display
        self.fish_details_display = QtWidgets.QTextEdit()
        self.fish_details_display.setReadOnly(True)  

        layout = QtWidgets.QVBoxLayout()
        layout.addWidget(QtWidgets.QLabel("Counties:"))  
        layout.addWidget(self.counties_list)
        layout.addWidget(QtWidgets.QLabel("Fish Species:")) 
        layout.addWidget(self.fish_list)
        layout.addWidget(QtWidgets.QLabel("Fish Details:")) 
        layout.addWidget(self.fish_details_display)  
        self.setLayout(layout)

        self.counties_list.itemClicked.connect(self.display_fish_species)

        self.fish_list.itemClicked.connect(self.display_fish_details)

    def display_fish_species(self, item):
        county_name = item.text()
        fish_species = fetch_fish_by_county(county_name)
        self.fish_list.clear()
        self.fish_list.addItems(fish_species)

    def display_fish_details(self, item):
        fish_name = item.text()
        details = fetch_fish_details(fish_name)
        if details:
            details_msg = (
                f"Season: {details['season']}\n"
                f"Bag Limit: {details['bag_limit']}\n"
                f"Minimum Size: {details['min_size']}\n"
                f"Maximum Size: {details['max_size']}\n"
                f"Measurement Type: {details['measurement_type']}"
            )

            self.fish_details_display.setText(details_msg)
        else:
            self.fish_details_display.setText("Details not found!")




if __name__ == '__main__':
    app = QtWidgets.QApplication(sys.argv)
    window = MainWindow()
    window.show()
    sys.exit(app.exec_())
