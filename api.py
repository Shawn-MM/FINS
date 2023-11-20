import mysql.connector
from flask import Flask, jsonify
app = Flask(__name__)

#All queries called to SQL. You must run this program before running the other "FINSProject.py". To do this, go into command terminal
#and open the directory for this project. Then you run the command 'python api.py', or depending on your version, 'python3 api.py'
#Basically, all it does is run api.py in the background. Then go back into vscode and run FINSProject.py



@app.route('/counties')
#get counties
def get_counties():
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

@app.route('/fish-details/<fish_name>')
def get_fish_details(fish_name):
    #get fwc regulations
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

@app.route('/fish-by-county/<county_name>')
#get fish by county
def get_fish_by_county(county_name):
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

if __name__ == '__main__':
    app.run(debug=True)