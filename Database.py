import mysql.connector

def fetch_counties_for_region(region_name):
    conn = mysql.connector.connect(
        host='localhost',
        user='root',
        password='Smokeyhot123',
        database='Counties'
    )

    cursor = conn.cursor()

    query = """
    SELECT counties.name 
    FROM counties 
    JOIN county_region ON counties.id = county_region.county_id 
    JOIN regions ON county_region.region_id = regions.id
    WHERE regions.name = %s;
    """
    
    cursor.execute(query, (region_name,))
    counties = cursor.fetchall()

    print(f"Counties in {region_name}:")
    for (county,) in counties:
        print(f"- {county}")

    cursor.close()
    conn.close()


if __name__ == "__main__":
    region = input("Enter the region name: (Central West, Central East, Southwest, Southeast, North Central, North West, North East) ")
    fetch_counties_for_region(region)


