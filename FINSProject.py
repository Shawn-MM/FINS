import mysql.connector
import sys
import folium
import requests
import json
from PyQt5.QtWidgets import QLineEdit
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
        border-radius: 6px;
        background-color: #ffffff;
        font-size: 16px;
        padding: 8px 15px;
        color: #2e3d49;
    }
    QPushButton:hover {
        background-color: #dae8fc;
        border-color: #2b579a;
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
        border: 2px solid #c3c3c3;
        border-radius: 4px;
    }
"""



def get_weather_data(lat, lon, api_key):
    try:
        response = requests.get(
            f"http://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={api_key}&units=metric"
        )
        return response.json()
    except requests.RequestException:
        return None



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

        self.OPENWEATHER_API_KEY = '8ed79aed83fee8ed61742932ac7c841c'

        self.setStyleSheet(style_sheet)
        self.setWindowTitle('FINS')

        self.resize(1200, 800)

        self.browser = QtWebEngineWidgets.QWebEngineView()
        self.browser.setHtml(self.create_folium_map())

        self.button = QtWidgets.QPushButton('View FWC Regulations')


        font = QtGui.QFont("Times New Roman", 10)

        self.button.setFont(font)


        self.button.clicked.connect(self.show_regulations)

        layout = QtWidgets.QVBoxLayout()
        layout.addWidget(self.browser)
        layout.addWidget(self.button)

        central_widget = QtWidgets.QWidget()
        central_widget.setLayout(layout)
        self.setCentralWidget(central_widget)
    

    def create_folium_map(self):
        m = folium.Map(location=[27.9944024, -81.7602544], zoom_start=7)

        # Markers
        markers = load_markers('markers.json')

        for marker in markers:
            # Fetch weather data
            weather_data = get_weather_data(marker["coordinates"][0], marker["coordinates"][1], self.OPENWEATHER_API_KEY)
            if weather_data:
                weather_info = (
                    f"Weather: {weather_data['weather'][0]['description']}, "
                    f"Temperature: {weather_data['main']['temp']} °C, "
                    f"Pressure: {weather_data['main']['pressure']} hPa"
                )
            else:
                weather_info = "Weather data not available"

            folium.Marker(
                location=marker["coordinates"],
                tooltip=marker["name"],
                popup=folium.Popup(f'<b>{marker["name"]}</b><br>{weather_info}', max_width=200)
            ).add_to(m)
        map_html = m._repr_html_()
        return f'<div style="border-radius: 4px; overflow: hidden;">{map_html}</div>'
   

    #Show the regulations
    def show_regulations(self):
        self.regulations_window = RegulationsWindow()
        self.regulations_window.show()


class RegulationsWindow(QtWidgets.QDialog):
    def __init__(self):
        super().__init__()


        self.setStyleSheet(style_sheet)
        self.setStyleSheet("background-color: #E8E1EF;")

        self.setStyleSheet("""
            QDialog {
                background-color: #E8E1EF;
                color: black; 
            }
            QLabel {
                color: black;
            }
            QListWidget, QTextEdit {
                color: white; 
                background-color: #333333; 
                border: 1px solid #dddddd;
                font-size: 13px;
            }
            QComboBox {
                color: white; 
                background-color: #333333;
                border: 1px solid #dddddd;
                font-size: 13px;
                padding: 5px;
            }
            QComboBox QAbstractItemView {
                color: white; 
                background-color: #333333;
                selection-background-color: #555555;
            }
        """)

        self.setWindowTitle('FWC Regulations')

        self.search_bar = QtWidgets.QLineEdit()
        self.search_bar.setPlaceholderText("Search...")



        self.counties_list = QtWidgets.QListWidget()
        counties = get_counties_from_api()
        self.counties_list.addItems(counties)

        self.fish_list = QtWidgets.QListWidget()

    
        #Add a dropdown for filtering
        self.filter_dropdown = QtWidgets.QComboBox()
        self.filter_dropdown.addItem("Filter by...")
        self.filter_dropdown.addItem("Season")
        self.filter_dropdown.addItem("Bag Limit")


        self.bag_limit_dropdown = QtWidgets.QComboBox()
        self.bag_limit_dropdown.addItem("Select a bag limit...")
        self.bag_limit_dropdown.addItems([str(i) for i in range(1, 16)])
        self.bag_limit_dropdown.hide()
        self.bag_limit_dropdown.currentIndexChanged.connect(self.bag_limit_changed)






        self.season_dropdown = QtWidgets.QComboBox()
        self.season_dropdown.hide()

        #Connect first dropdown to function that will show the second dropdown
        self.filter_dropdown.currentIndexChanged.connect(self.filter_selection_changed)

        #display
        self.fish_details_display = QtWidgets.QTextEdit()
        self.fish_details_display.setReadOnly(True)

        layout = QtWidgets.QVBoxLayout()
        self.layout = QtWidgets.QVBoxLayout()
        layout.addWidget(self.search_bar)
        layout.addWidget(QtWidgets.QLabel("Filter:"))
        layout.addWidget(self.filter_dropdown)
        layout.addWidget(self.bag_limit_dropdown)
        layout.addWidget(self.season_dropdown) 
        layout.addWidget(QtWidgets.QLabel("Counties:"))
        layout.addWidget(self.counties_list)
        layout.addWidget(QtWidgets.QLabel("Fish Species:"))
        layout.addWidget(self.fish_list)
        layout.addWidget(QtWidgets.QLabel("Fish Details:"))
        layout.addWidget(self.fish_details_display)


        self.setLayout(layout)


        self.search_bar.textChanged.connect(self.on_search)
        self.counties_list.itemClicked.connect(self.display_fish_species)
        self.fish_list.itemClicked.connect(self.display_fish_details)

        self.season_dropdown.currentIndexChanged.connect(self.season_changed)
    
    def on_search(self, text):
    #clear the current items 
        self.fish_list.clear()

    #if the text is empty, reset the list
        if not text.strip():
            return

    #api to get fish name
        response = requests.get(f'http://localhost:5000/fish-details/{text}')
        if response.status_code == 200:
            fish_details = response.json()
            if fish_details:
            # Display the details of the searched fish
                self.display_fish_details_custom(fish_details)
            else:
                self.fish_details_display.setText("No fish found with that name!")
        else:
            self.fish_details_display.setText("Error fetching fish details!")
    def display_fish_details_custom(self, details):
    #we need this. it works like this. leave it
        if details:
            details_msg = (
                f"Season: {details['season']}\n"
                f"Bag Limit: {details['bag_limit']}\n"
                f"Minimum Size: {details['min_size']}\n"
                f"Maximum Size: {details['max_size']}\n"
                f"Measurement Type: {details['measurement_type']}\n"
                f"Environment Type: {details['env_type']}\n"
                f"Bait: {details['bait']}\n"
                f"General Tips: {details['gen_tips']}"
            )
            self.fish_details_display.setText(details_msg)
        else:
            self.fish_details_display.setText("Details not found!")
        

    def filter_selection_changed(self, index):
        #season filter
        if self.filter_dropdown.currentText() == "Season":
            self.season_dropdown.clear()
            self.season_dropdown.addItem("Select a season...")
            self.season_dropdown.addItems(["All","Spring", "Summer", "Fall", "Winter"]) 
            self.season_dropdown.show()
        else:
            self.season_dropdown.hide()  #hide second dropdown

        if self.filter_dropdown.currentText() == "Bag Limit":

            if self.filter_dropdown.currentText() == "Season":
                self.season_dropdown.show()
                self.bag_limit_dropdown.hide()
            elif self.filter_dropdown.currentText() == "Bag Limit":
                self.bag_limit_dropdown.show()
                self.season_dropdown.hide()
            else:
                self.season_dropdown.hide()
                self.bag_limit_dropdown.hide()
            # Create the bag_limit_dropdown if it doesn't exist
            if not hasattr(self, 'bag_limit_dropdown'):
                self.bag_limit_dropdown = QtWidgets.QComboBox()
                self.bag_limit_dropdown.addItem("Select a bag limit...")
                self.bag_limit_dropdown.addItems(["1", "2", "3", "4", "5"])
                self.bag_limit_dropdown.currentIndexChanged.connect(self.bag_limit_changed)
                

                filter_index = self.layout.indexOf(self.filter_dropdown)
                self.layout.insertWidget(filter_index + 1, self.bag_limit_dropdown)
                
            #show bag if hideen
            self.bag_limit_dropdown.show()


        elif hasattr(self, 'bag_limit_dropdown'):
            self.bag_limit_dropdown.hide()

        if self.filter_dropdown.currentText() != "Season":
            self.season_dropdown.hide()


        elif self.filter_dropdown.currentText() == "Season":
            self.season_dropdown.show()
        

        self.layout.update()

    def bag_limit_changed(self, index):
        if index > 0:
            selected_bag_limit = int(self.bag_limit_dropdown.itemText(index))
            self.update_display_for_bag_limit(selected_bag_limit)

    def update_display_for_bag_limit(self, bag_limit):
        fish_species = self.fetch_fish_by_bag_limit(bag_limit)
        self.fish_list.clear()
        self.fish_list.addItems(fish_species)

    def fetch_fish_by_bag_limit(self, bag_limit):
        response = requests.get(f'http://localhost:5000/fish-by-bag-limit/{bag_limit}')
        return response.json() if response.status_code == 200 else []

    def season_changed(self, index):
        if index > 0:
            selected_season = self.season_dropdown.itemText(index)
            self.update_display_for_season(selected_season)


    def update_display_for_season(self, season):
        #update fish on season
        fish_species = self.fetch_fish_by_season(season)
        self.fish_list.clear()
        self.fish_list.addItems(fish_species)


    def apply_filter(self, index):
        #for another filter
        pass

    def fetch_fish_by_season(self, season):

        connection = mysql.connector.connect(
            host='localhost',
            user='root',
            password='Smokeyhot123',
            database='teehee1'
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

        #names from query resultss
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
                f"Measurement Type: {details['measurement_type']}\n"
                f"Environment Type: {details['env_type']}\n"
                f"Bait: {details['bait']}\n"
                f"General Tips: {details['gen_tips']}"
            )

            self.fish_details_display.setText(details_msg)
        else:
            self.fish_details_display.setText("Details not found!")




if __name__ == '__main__':
    app = QtWidgets.QApplication(sys.argv)
    window = MainWindow()
    window.show()
    sys.exit(app.exec_())






