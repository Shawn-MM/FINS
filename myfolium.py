
import sys
import os
import folium
import arrow
import pandas as pd

import requests
from PyQt5.QtWebEngineWidgets import QWebEngineView
from PyQt5.QtCore import QUrl, QPropertyAnimation, QEasingCurve, QTimer
from PyQt5.QtWidgets import QApplication, QWidget, QVBoxLayout, QHBoxLayout, QListWidget, QListWidgetItem, QLineEdit, QPushButton, QLabel, QGraphicsOpacityEffect
from PyQt5.QtGui import QFont, QPalette, QColor




API_KEY = "6b7634fdd9524d66b3271ef34cad5e56"
STORMGLASS_API_KEY = "c681d780-6258-11ee-a654-0242ac130002-c681d834-6258-11ee-a654-0242ac130002"


def get_weather_data(lat, lon):
    endpoint = f"https://api.weatherbit.io/v2.0/current?lat={lat}&lon={lon}&key={API_KEY}&units=I"
    response = requests.get(endpoint)
    data = response.json()

    # Check if the response contains an error message
    if "error" in data:
        print(f"Error: {data['error']}")
        return "Error"

    try:
        # Accessing current weather information from Weatherbit's response
        weather_description = data["data"][0]["weather"]["description"]
        temperature = data["data"][0]["temp"]
        return f"Weather: {weather_description}, Temperature: {temperature}°F"
    except KeyError:
        print(f"Error: {data}")
        return "Error"





def get_tide_data(lat, lon):
    start = arrow.now().floor('day')
    end = arrow.now().shift(days=1).floor('day')

    response = requests.get(
        'https://api.stormglass.io/v2/tide/sea-level/point',
        params={
            'lat': lat,
            'lng': lon,
            'start': start.to('UTC').timestamp(),
            'end': end.to('UTC').timestamp(),
        },
        headers={
            'Authorization': STORMGLASS_API_KEY
        }
    )

    data = response.json()

    if "errors" in data:
        print(f"Error: {data['errors']}")
        return "Error"

    try:
        first_entry = data["data"][0]
        tide_level = first_entry["sg"]
        tide_time = first_entry["time"]
        return f"Sea Level: {tide_level}m at {tide_time}"
    except (KeyError, IndexError):
        print(f"Error: {data}")
        return "Error"




class MyApp(QWidget):
    def __init__(self):
        super().__init__()
        mainLayout = QHBoxLayout()
        mapLayout = QVBoxLayout()
        self.browser = QWebEngineView()
        self.map = folium.Map(location=[27.9944024, -81.7602544], zoom_start=6)

        # Assuming the first column of your Excel file has fish names
        self.data = pd.read_excel('Fish_Regulations_and_Locations.xlsx', engine='openpyxl')
   
        # Initializing the error label
        self.error_label = QLabel(self)
        self.error_label.setStyleSheet("background-color: red; color: white; padding: 5px;")
        self.error_label.hide()  # Initially hidden

        # Search bar components
        self.search_label = QLabel("Search:")
        self.search_edit = QLineEdit(self)
        self.search_button = QPushButton("Search", self)
        self.search_button.clicked.connect(self.perform_search)

        # Add search bar components to layout
        mapLayout.addWidget(self.search_label)
        mapLayout.addWidget(self.search_edit)
        mapLayout.addWidget(self.search_button)

        # Customizing the font for the search bar
        customFont = QFont("Georgia", 14)  # Font name and size
        self.search_edit.setFont(customFont)

       # Customizing the text color and background color for the search bar
        palette = QPalette()
        palette.setColor(QPalette.Text, QColor("black"))  # Text color
        palette.setColor(QPalette.Base, QColor("lightgreen"))  # Background color
        self.search_edit.setPalette(palette)

        locations = [
            ([30.3935, -86.4958], "Destin"),
            ([29.2108, -81.0228], "Daytona Beach"),

        ]

        for location, name in locations:
            weather_info = get_weather_data(location[0], location[1])
            tide_info = get_tide_data(location[0], location[1])
            folium.Marker(location, popup=f"{name}<br>{weather_info}<br>{tide_info}").add_to(self.map)


        filepath = os.path.abspath("florida_map.html")
        self.map.save(filepath)

        self.browser.setUrl(QUrl.fromLocalFile(filepath))
        mapLayout.addWidget(self.browser)


        #link(s) to external websites such as FWC and fishing guides(?)
        link = QLabel(self)
        link.setText('<a href="https://myfwc.com/">FWC Official Website</a>')
        link.setOpenExternalLinks(True)  # This ensures that the link is opened in a default browser when clicked
        item = QListWidgetItem(" ")

        self.sideMenu = QListWidget()
        
        
        #regulation information
        self.sideMenu.addItem(QListWidgetItem("FWC \nRegulations ")) #section header for fwc regulations
        self.regionItem = QListWidgetItem("Region: ")
        self.sideMenu.addItem(self.regionItem)
        self.minsizeItem = QListWidgetItem("Min Size: ")
        self.sideMenu.addItem(self.minsizeItem)
        self.maxsizeItem = QListWidgetItem("Max Size: ")
        self.sideMenu.addItem(self.maxsizeItem)
        self.baglimitItem = QListWidgetItem("Bag Limit: ")
        self.sideMenu.addItem(self.baglimitItem)
        self.seasonItem = QListWidgetItem("Seasons: ")
        self.sideMenu.addItem(self.seasonItem)
 
        self.sideMenu.addItem(QListWidgetItem("\nWeather ")) #section header for weather
        self.temperatureItem = QListWidgetItem("Temperature: ")
        self.sideMenu.addItem(self.temperatureItem)

        self.sideMenu.addItem(QListWidgetItem("\nOther ")) #section header for miscellaneous
        self.sideMenu.addItem(item)
        self.sideMenu.setItemWidget(item, link)
        self.sideMenu.addItem(QListWidgetItem("Choose County: \n"))

        #adjust sidemenu color and fonts
        textFont2 = QFont("Georgia", 8)
        SectionFont = QFont("Georgia", 12)
        SectionFont.setBold(True)
        self.sideMenu.setPalette(palette)
        self.sideMenu.setFont(textFont2)
        item = self.sideMenu.item(0)  # gets the first item (regulations) and set its font bigger
        item2 = self.sideMenu.item(6)  #weather item
        item3 = self.sideMenu.item(8) #other item
        item.setFont(SectionFont)
        item2.setFont(SectionFont)
        item3.setFont(SectionFont)



        mainLayout.addLayout(mapLayout, 4)
        mainLayout.addWidget(self.sideMenu, 1)


        self.setLayout(mainLayout)
        

    def display_error(self, error_msg):
        self.error_label.setText(error_msg)
        self.error_label.setFixedWidth(300)
        self.error_label.show()

        # Set QTimer to start fading out after 2 seconds
        QTimer.singleShot(2000, self.fade_out_error)

    def fade_out_error(self):
        # Create opacity effect for fading
        self.opacity_effect = QGraphicsOpacityEffect()
        self.error_label.setGraphicsEffect(self.opacity_effect)

        # Create animation for fading
        self.animation = QPropertyAnimation(self.opacity_effect, b"opacity")
        self.animation.setDuration(2000)  # 2 seconds
        self.animation.setStartValue(1.0)
        self.animation.setEndValue(0.0)
        self.animation.setEasingCurve(QEasingCurve.OutCubic)
        self.animation.finished.connect(self.error_label.hide)
        self.animation.start()


#Everything for the search function:
    #actual search function
    def perform_search(self):
        try:
            query = self.search_edit.text()
            fish_details = self.search_fish(query)

            #update information on menu based on searched fish
            self.regionItem.setText(f"Region: {fish_details.get('regions', 'N/A')}")
            self.minsizeItem.setText(f"Min Size: {fish_details.get('minSize', 'N/A')}")
            self.maxsizeItem.setText(f"Max Size: {fish_details.get('maxSize', 'N/A')}")
            self.baglimitItem.setText(f"Bag Limit: {fish_details.get('bagLimit', 'N/A')}")
            self.seasonItem.setText(f"Season: {fish_details.get('Season', 'N/A')}")
        except Exception as e:
            self.display_error(str(e))


#function for pulling data based on fish searched
    def search_fish(self, fish_name):
        try:
            result = self.data[self.data['Fish'] == fish_name].fillna("none")

            if result.empty:
                self.display_error(f"Fish {fish_name} not found.")
                return {}

            details = {
                'regions': str(result['Regions'].iloc[0]),
                'minSize': str(result['MIN-Size'].iloc[0]),
                'maxSize': str(result['MAX-Size'].iloc[0]),
                'bagLimit': str(result['Bag Limit'].iloc[0]),  # Adjust the column name if different
                'Season': str(result['Season'].iloc[0])
            }
            return details
        except Exception as e:
            self.display_error(str(e))
            return {}


if __name__ == '__main__':
    app = QApplication(sys.argv)
    app.setStyle('Fusion')
    window = MyApp()
    window.setWindowTitle('FINS?')
    window.show()
    sys.exit(app.exec_())
