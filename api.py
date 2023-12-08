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
        database='teehee1'
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
        database='teehee1'
    )

    cursor = connection.cursor()
    query = """
    SELECT f.season, f.bag_limit, f.min_size, f.max_size, f.measurement_type, f.env_type, f.bait, f.gen_tips
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
            "measurement_type": result[4],
            "env_type": result[5],
            "bait": result[6],
            "gen_tips": result[7]
        }
    return None

@app.route('/fish-by-county/<county_name>')
#get fish by county
def get_fish_by_county(county_name):
    connection = mysql.connector.connect(
        host='localhost',
        user='root',
        password='Smokeyhot123',
        database='teehee1'
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



import requests

@app.route('/weather/<float:lat>/<float:lon>')
def get_weather(lat, lon):
    api_key = 'Apu4i9Eg9SKtiMnIZSAaVFSHOQXPwdsb'
    url = f'https://api.tomorrow.io/v4/timelines'
    
    # define params
    params = {
        'location': f'{lat},{lon}',
        'fields': ['temperature', 'windSpeed', 'humidity'], 
        'units': 'imperial',  
        'timesteps': 'current',
        'apikey': api_key,
    }

    #make request
    response = requests.get(url, params=params)
    if response.status_code == 200:
        return response.json()  #weather returns as json
    else:
        return jsonify({'error': 'Could not fetch weather data'}), response.status_code
    



from flask import jsonify

@app.route('/fish-by-bag-limit/<int:bag_limit>')
def get_fish_by_bag_limit(bag_limit):
    if not 1 <= bag_limit <= 15:
        return jsonify({"error": "Bag limit must be between 1 and 15."}), 400

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
    WHERE fd.bag_limit = %s
    """
    cursor.execute(query, (bag_limit,))
    result = cursor.fetchall()
    cursor.close()
    connection.close()

    if not result:
        return jsonify({"error": "No fish found for the specified bag limit."}), 404

    return jsonify([item[0] for item in result])


@app.route('/all-fish-species')
def get_all_fish_species():
    connection = mysql.connector.connect(
        host='localhost',
        user='root',
        password='Smokeyhot123',
        database='teehee1'
    )

    cursor = connection.cursor()
    query = "SELECT name FROM fish_species"
    cursor.execute(query)
    result = cursor.fetchall()
    cursor.close()
    connection.close()

    return jsonify([item[0] for item in result])


@app.route('/fish-by-season/<season>')
def get_fish_by_season(season):
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

    return jsonify([item[0] for item in result])







if __name__ == '__main__':
    app.run(debug=True)