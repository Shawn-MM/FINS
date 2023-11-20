import mysql.connector
import sys
import folium
import requests
import json
from PyQt5 import QtGui
from PyQt5 import QtWidgets, QtWebEngineWidgets
from PyQt5.QtWidgets import QMessageBox





#Styles the front end to make it look a bit better. This can be edited if anyone wants. It's similar to css
style_sheet = """
    QMainWindow {
        background-color: #f5f5f5;
    }
    QPushButton {
        border: 2px solid #4a90e2;
        border-radius: 4px;
        background-color: #ffffff;
        font-size: 14px;
        padding: 5px 10px;
        color: black;
    }
    QPushButton:hover {
        background-color: #e0e0e0;
    }
    QLabel {
        font-size: 14px;
    }
    QListWidget {
        border: 1px solid #dddddd;
        font-size: 13px;
    }
    QTextEdit {
        border: 1px solid #dddddd;
        font-size: 13px;
    }
    QComboBox {
        border: 1px solid #dddddd;
        font-size: 13px;
        padding: 5px;
    }
    QWebEngineView {
        border: 1px solid #dddddd;
    }
"""




#markers
def load_markers(filename):
    with open(filename, 'r') as file:
        return json.load(file)


#All this uses GET requests from API to grab data

def get_counties_from_api():
    response = requests.get('http://localhost:5000/counties')
    return response.json() if response.status_code == 200 else []


def get_fish_details_from_api(fish_name):
    response = requests.get(f'http://localhost:5000/fish-details/{fish_name}')
    return response.json() if response.status_code == 200 else None

def get_fish_by_county_from_api(county_name):
    response = requests.get(f'http://localhost:5000/fish-by-county/{county_name}')
    return response.json() if response.status_code == 200 else []



# UI
class MainWindow(QtWidgets.QMainWindow):
    def __init__(self):
        super().__init__()

        self.setStyleSheet(style_sheet)
        self.setWindowTitle('FINS')

        self.browser = QtWebEngineWidgets.QWebEngineView()
        self.browser.setHtml(self.create_folium_map())

        self.button = QtWidgets.QPushButton('View FWC Regulations')

        font = QtGui.QFont("Arial", 10)
        self.button.setFont(font)


        self.button.clicked.connect(self.show_regulations)

        layout = QtWidgets.QVBoxLayout()
        layout.addWidget(self.browser)
        layout.addWidget(self.button)

        central_widget = QtWidgets.QWidget()
        central_widget.setLayout(layout)
        self.setCentralWidget(central_widget)
        

    #Folium map logic
    def create_folium_map(self):
        m = folium.Map(location=[27.9944024, -81.7602544], zoom_start=6)

        #Markers
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

    #Show the regulations
    def show_regulations(self):
        self.regulations_window = RegulationsWindow()
        self.regulations_window.show()


class RegulationsWindow(QtWidgets.QDialog):
    def __init__(self):
        super().__init__()
        self.setStyleSheet(style_sheet)

        self.setWindowTitle('FWC Regulations')

        self.counties_list = QtWidgets.QListWidget()
        counties = get_counties_from_api()
        self.counties_list.addItems(counties)

        self.fish_list = QtWidgets.QListWidget()

        #Add a dropdown for filtering
        self.filter_dropdown = QtWidgets.QComboBox()
        self.filter_dropdown.addItem("Filter by...")
        self.filter_dropdown.addItem("Season")
        self.filter_dropdown.addItem("Bag Limit")
        self.filter_dropdown.addItem("Size Restrictions")


        #Create a second dropdown for seasons, but do not add it to the layout yet
        self.season_dropdown = QtWidgets.QComboBox()
        #Hide the inital season dropdown menu 
        self.season_dropdown.hide()  

        #Connect first dropdown to function that will show the second dropdown
        self.filter_dropdown.currentIndexChanged.connect(self.filter_selection_changed)

        #display
        self.fish_details_display = QtWidgets.QTextEdit()
        self.fish_details_display.setReadOnly(True)

        layout = QtWidgets.QVBoxLayout()
        layout.addWidget(QtWidgets.QLabel("Filter:"))
        layout.addWidget(self.filter_dropdown)
        layout.addWidget(self.season_dropdown)  # Add the season dropdown to the layout
        layout.addWidget(QtWidgets.QLabel("Counties:"))
        layout.addWidget(self.counties_list)
        layout.addWidget(QtWidgets.QLabel("Fish Species:"))
        layout.addWidget(self.fish_list)
        layout.addWidget(QtWidgets.QLabel("Fish Details:"))
        layout.addWidget(self.fish_details_display)
        self.setLayout(layout)

        self.counties_list.itemClicked.connect(self.display_fish_species)
        self.fish_list.itemClicked.connect(self.display_fish_details)

        self.season_dropdown.currentIndexChanged.connect(self.season_changed)

    def filter_selection_changed(self, index):
        #If 'Season' is selected, then show dropdown
        if self.filter_dropdown.currentText() == "Season":
            self.season_dropdown.clear()  
            self.season_dropdown.addItem("Select a season...")
            self.season_dropdown.addItems(["All","Spring", "Summer", "Fall", "Winter"])  #Add seasons or fetch dynamically
            self.season_dropdown.show()  
        else:
            self.season_dropdown.hide()  #Hide the second dropdown for other filters if we feel needed

    def season_changed(self, index):
        #Avoid action on the default dropdown item selection
        if index > 0:  
            selected_season = self.season_dropdown.itemText(index)
            self.update_display_for_season(selected_season)


    def update_display_for_season(self, season):
        #Update fish list based on the selected season
        fish_species = self.fetch_fish_by_season(season)
        self.fish_list.clear()
        self.fish_list.addItems(fish_species)


    def apply_filter(self, index):
        #Placeholder for logic for other filters. Maybe have a more descriptive function name if we need

        pass

    def fetch_fish_by_season(self, season):
        #Fetch fish species available in the selected season
        connection = mysql.connector.connect(
            host='localhost',
            user='root',
            password='Smokeyhot123',
            database='FINS'
        )

        cursor = connection.cursor()
        query = """
        SELECT fs.name
        FROM fish_species fs
        INNER JOIN fish_details fd ON fs.id = fd.fish_id
        WHERE FIND_IN_SET(%s, fd.season) > 0
        """
        cursor.execute(query, (season,))
        result = cursor.fetchall()
        cursor.close()
        connection.close()

        #Extract the names of the fish species from the query results
        return [item[0] for item in result] if result else []

    def display_fish_species(self, item):
        county_name = item.text()
        fish_species = get_fish_by_county_from_api(county_name)
        self.fish_list.clear()
        self.fish_list.addItems(fish_species)

    def display_fish_details(self, item):
        fish_name = item.text()
        details = get_fish_details_from_api(fish_name)
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
