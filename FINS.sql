CREATE DATABASE FINS;
USE FINS;

CREATE TABLE counties (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
); 

CREATE TABLE fish_species (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE county_fish (
    county_id INT,
    fish_id INT,
    FOREIGN KEY (county_id) REFERENCES counties(id),
    FOREIGN KEY (fish_id) REFERENCES fish_species(id),
    PRIMARY KEY (county_id, fish_id)
);



CREATE TABLE fish_details (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fish_id INT, -- foreign key
    season ENUM('Spring', 'Summer', 'Fall', 'Winter','Illegal','All','Winter,Spring','Fall,Winter,Spring','Fall,Spring','Summer,Spring', 'Fall,Winter'),
    bag_limit INT,
    min_size DECIMAL(5,2),
    max_size DECIMAL(5,2),
    measurement_type ENUM('Fork Length', 'Total Length', 'Standard Length','CFL','LJF'),
    FOREIGN KEY (fish_id) REFERENCES fish_species(id) 
);

ALTER TABLE counties ADD location ENUM('Gulf', 'Atlantic') NOT NULL;
ALTER TABLE fish_species ADD location ENUM('Gulf', 'Atlantic', 'Both') NOT NULL;

INSERT INTO counties (name, location) VALUES 
	#All counties in the gulf of mexico
       ('Hillsborough County', 'Gulf'),
       ('Manatee County', 'Gulf'),
       ('Pasco County', 'Gulf'), #Gulf
       ('Pinellas County', 'Gulf'), #Gulf
       ('Sarasota County', 'Gulf'), #Gulf
       ('Charlotte County', 'Gulf'), #Gulf
       ('Collier County', 'Gulf'), #Gulf
       ('Lee County', 'Gulf'), #Gulf
       ('Monroe County', 'Gulf'), #Gulf           
       ('Citrus County', 'Gulf'), #Gulf
       ('Dixie County', 'Gulf'), #Gulf
       ('Levy County', 'Gulf'), #Gulf
       ('Hernando County', 'Gulf'), #Gulf   
       ('Escambia County', 'Gulf'), #Gulf
       ('Santa Rosa County', 'Gulf'), #Gulf
       ('Okaloosa County', 'Gulf'), #Gulf
       ('Walton County', 'Gulf'), #Gulf
       ('Bay County', 'Gulf'), #Gulf
       ('Gulf County', 'Gulf'), #Gulf
       ('Franklin County', 'Gulf'), #Gulf
       ('Wakulla County', 'Gulf'), #Gulf           
       
 
 #counties on the Atlantic ocean
       ('Brevard County', 'Atlantic'),
       ('Indian River County', 'Atlantic'), #Atlantic
       ('Martin County', 'Atlantic'), #Atlantic
       ('St.Lucie County', 'Atlantic'), #Atlantic
       ('Volusia County', 'Atlantic'),  #Atlantic 
       ('Broward County', 'Atlantic'), #Atlantic
       ('Miami-Dade County', 'Atlantic'),#Atlantic       
	   ('Palm Beach County', 'Atlantic'), #Atlantic        
       ('Nassau County', 'Atlantic'), #Atlantic
       ('Duval County', 'Atlantic'), #Atlantic
       ('St.Johns County', 'Atlantic'), #Atlantic
       ('Flagler County', 'Atlantic'); #Atlantic
       
       
       

INSERT INTO fish_species (name, location) VALUES

#fish species and whether it's atlantic or gulf
('Alabama Shad', 'Both'),#Atlantic, Gulf
('Albacore Tuna', 'Both'),#Atlantic, Gulf
('Almaco Jack', 'Both'),#Atlantic, Gulf
('Atlantic Bonito', 'Both'),#Atlantic, Gulf
('Atlantic Croaker', 'Both'),#Atlantic, Gulf
('African Pompano', 'Both'),#Atlantic, Gulf
('American Shad', 'Both'),#Atlantic, Gulf
('Banded Rudderfish', 'Both'),#Atlantic, Gulf
('Bar Jack', 'Both'),#Atlantic, Gulf
('Barracuda', 'Both'),#Atlantic
('Bigeye Tuna', 'Both'),#Atlantic, Gulf
('Black Drum', 'Both'),#Atlantic, Gulf
('Black Grouper', 'Both'),#Atlantic, Gulf
('Black Margate Grunt', 'Both'),#Atlantic, Gulf
('Black Sea Bass', 'Both'),#Atlantic, Gulf
('Black Snapper', 'Both'),#Atlantic, Gulf
('Blackfin Snapper', 'Both'),#Atlantic, Gulf
('Blackfin Tuna', 'Both'),#Atlantic, Gulf
('Blueline Tilefish', 'Both'), #Atlantic, Gulf
#
('Bluestriped Grunt', 'Both'),#Atlantic, Gulf
('Bluefin Tuna', 'Both'), #Atlantic, Gulf
('Blue Catfish', 'Both'),#Atlantic, Gulf
('Blue Marlin', 'Both'),#Atlantic, Gulf
('Blue Runner Jack', 'Both'),#Atlantic, Gulf
('Bluefish', 'Both'),#Atlantic, Gulf
('Bonefish', 'Both'),#Atlantic, Gulf
('Cero Mackerel', 'Both'),#Atlantic, Gulf
('Cobia', 'Both'), #Atlantic, Gulf
('Coney Grouper', 'Both'), #Atlantic, Gulf
('Cottonwick Grunt', 'Both'),#Atlantic, Gulf
('Crevalle Jack', 'Both'),#Atlantic, Gulf
('Checkered Puffer', 'Gulf'), #Gulf
('Cubera Snapper', 'Both'),#Atlantic, Gulf
('Dolphinfish','Gulf'),
('Dog Snapper', 'Both'),#Atlantic, Gulf
('Flounder', 'Both'),#Atlantic, #Pacific
('French Grunt', 'Both'),#Atlantic, Gulf
('Gafftopsail Catfish', 'Both'),#Atlantic, Gulf
#
('Gag Grouper', 'Both'),#Atlantic, Gulf
('Golden Tilefish', 'Both'),#Atlantic, Gulf
('Grass Porgy', 'Both'),#Atlantic, Gulf
('Great Barracuda', 'Both'),#Atlantic, Gulf
('Graysby Grouper', 'Both'),#Atlantic, Gulf
('Gray Snapper', 'Both'),#Atlantic, Gulf
('Gray Triggerfish', 'Both'),#Atlantic, Gulf
('Greater Amberjack', 'Both'), #Atlantic, Gulf
('Hardhead Catfish', 'Both'), #Atlantic, Gulf
('Hickory Shad', 'Both'),#Atlantic, Gulf
('Hogfish', 'Both'),#Atlantic, Gulf
('Horse-eye Jack', 'Both'),#Atlantic, Gulf
('Jolthead Porgy', 'Both'),#Atlantic, Gulf
('King Mackerel', 'Both'),#Atlantic, Gulf
('Knobbed Porgy', 'Both'),#Atlantic, Gulf
('Lane Snapper', 'Both'),#Atlantic, Gulf
('Ladyfish', 'Both'),#Atlantic, Gulf
('Lesser Amberjack', 'Both'),#Atlantic, Gulf
('Lionfish', 'Both'),#Atlantic, Gulf
#
('Little Tunny', 'Both'),#Atlantic, Gulf
('Littlehead Porgy', 'Both'),#Atlantic, Gulf
('Longspine Porgy', 'Both'),#Atlantic, Gulf
('Mahogany Snapper', 'Both'),#Atlantic, Gulf
('Mangrove Snapper', 'Both'),
('Marine Life Species', 'Both'),#Atlantic, Gulf
('Margate Grunt', 'Both'),#Atlantic, Gulf
('Misty Grouper', 'Both'),#Atlantic, Gulf
('Mullet','Atlantic'),#Atlantic
('Mutton Snapper', 'Both'),#Atlantic, Gulf
('Mutten Snapper', 'Both'),
('Ocean Triggerfish', 'Both'),#Atlantic, Gulf
('Parrotfish', 'Both'),#Atlantic, Gulf
('Permit', 'Both'),#Atlantic, Gulf
('Pinfish', 'Both'),#Atlantic, Gulf
('Pompano', 'Both'),#Atlantic, Gulf
('Porkfish Grunt', 'Both'),#Atlantic, Gulf
('Queen Snapper', 'Both'),#Atlantic, Gulf
('Queen Triggerfish', 'Both'),#Atlantic, Gulf
#
('Rainbow Runner', 'Both'),#Atlantic, Gulf
('Red Drum', 'Both'), #Atlantic, Gulf
('Red Grouper', 'Both'),#Atlantic, Gulf
('Red Hind Grouper', 'Both'),#Atlantic, Gulf
('Red Porgy', 'Both'),#Atlantic, Gulf
('Red Snapper', 'Both'),#Atlantic, Gulf
('Rock Hind Grouper', 'Both'),#Atlantic, Gulf
('Roundscale Spearfish', 'Both'),#Atlantic, Gulf
('Sailfish', 'Both'),#Atlantic, Gulf
('Sailors Choice Grunt', 'Both'),#Atlantic, Gulf
('Saucereye Porgy', 'Both'), #Atlantic, Gulf
('Sand Seatrout', 'Both'),#Atlantic, Gulf
('Sand Tilefish', 'Both'),#Atlantic, Gulf
('Scamp Grouper', 'Both'),#Atlantic, Gulf
('Scubera Stapper', 'Atlantic'),#Atlantic
('Schoolmaster Snapper', 'Both'),#Atlantic, Gulf
('Sheepshead Porgy', 'Both'),#Atlantic, Gulf
('Sheepshead', 'Both'), #Atlantic, Gulf
('Silk Snapper', 'Both'),#Atlantic, Gulf
#
('Silver Mullet', 'Both'),#Atlantic, Gulf
('Skipjack Tuna', 'Both'),#Atlantic, Gulf
('Snowy Grouper', 'Both'),#Atlantic, Gulf
('Southern Kingfish', 'Both'),#Atlantic, Gulf
('Spanish Mackerel', 'Both'),#Atlantic, Gulf
('Spadefish', 'Both'),#Atlantic, Gulf
('Speckled Hind Grouper', 'Both'),#Atlantic, Gulf
('Spot', 'Both'),#Atlantic, Gulf
('Spotted Seatrout', 'Both'),#Atlantic, Gulf
('Striped Mullet', 'Both'),#Atlantic, Gulf
('Striped Bass', 'Both'),#Atlantic, Gulf
('Swordfish', 'Both'),#Atlantic, Gulf
('Tarpon', 'Both'),#Atlantic, Gulf
('Threadfin Shad', 'Both'),#Atlantic, Gulf
('Tiger Grouper', 'Both'),#Atlantic, Gulf
('Tomtate Grunt', 'Both'),#Atlantic, Gulf
('Triggerfish', 'Both'),#Atlantic, Gulf
('Tripletail', 'Both'),#Atlantic, Gulf
('Unicorn Filefish', 'Both'),#Atlantic, Gulf
#
('Vermillion Snapper', 'Both'),#Atlantic, Gulf
('Wahoo', 'Both'),#Atlantic, Gulf
('Warsaw Grouper', 'Both'),#Atlantic, Gulf
('Weakfish', 'Both'),#Atlantic, Gulf
('Wenchman Snapper', 'Both'),#Atlantic, Gulf
('White Grunt', 'Both'),#Atlantic, Gulf
('White Marlin', 'Both'),#Atlantic, Gulf
('Whitebone Porgy', 'Both'),#Atlantic, Gulf
('Wreckfish Grouper', 'Both'),#Atlantic
('Yellow Jack', 'Both'),#Atlantic, Gulf
('Yellowedge Grouper', 'Both'),#Atlantic, Gulf
('Yellowfin Grouper', 'Both'), #Atlantic, Gulf
('Yellowfin Tuna', 'Both'),#Atlantic, Gulf
('Yellowmouth Grouper', 'Both'),#Atlantic, Gulf
('Yellowtail Snapper', 'Both');#Atlantic, Gulf


DELIMITER //

#Creates ID for each fish and county (instead if doing it by hand)

CREATE PROCEDURE PopulateCountyFish()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE c_id INT;
    DECLARE c_location ENUM('Gulf', 'Atlantic');
    DECLARE cur CURSOR FOR SELECT id, location FROM counties;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO c_id, c_location;

        IF done THEN
            LEAVE read_loop;
        END IF;

        IF c_location = 'Gulf' THEN
            INSERT INTO county_fish (county_id, fish_id)
            SELECT c_id, id FROM fish_species WHERE location IN ('Gulf', 'Both');
        ELSEIF c_location = 'Atlantic' THEN
            INSERT INTO county_fish (county_id, fish_id)
            SELECT c_id, id FROM fish_species WHERE location IN ('Atlantic', 'Both');
        END IF;

    END LOOP;

    CLOSE cur;
END //


DELIMITER ;

CALL PopulateCountyFish();

SELECT * FROM county_fish;





INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 10, 12, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Alabama Shad';


INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Albacore Tuna';


INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Almaco Jack';


INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Atlantic Bonito';


INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 50, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Atlantic Croaker';


INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 2, 24, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'African Pompano';


INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 10, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'American Shad';


INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 5, 14, 22, 'Fork Length' 
FROM fish_species 
WHERE name = 'Banded Rudderfish';


INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'ALL', NULL, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Bar Jack';


INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 2, 15, 36, 'Fork Length' 
FROM fish_species 
WHERE name = 'Barracuda';


INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', NULL, 27, NULL, 'CFL' 
FROM fish_species 
WHERE name = 'Bigeye Tuna';


INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 5, 14, 24, 'Total Length' 
FROM fish_species 
WHERE name = 'Black Drum';


INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'Winter,Spring', 1, 24, NULL, 'Total Length' 
FROM fish_species 
WHERE name = 'Black Grouper';


INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Black Margate Grunt';


INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 7, 13, NULL, 'Total Length' 
FROM fish_species 
WHERE name = 'Black Sea Bass';


INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 10, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Black Snapper';


INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 10, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Blackfin Snapper';


INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 2, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Blackfin Tuna';


INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'Fall,Winter,Spring', 3, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Blueline Tilefish';


INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Bluestriped Grunt';


INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'Spring', 5, 12.5, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Bluefin Tuna';


INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Blue Catfish';


INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 1, 99, NULL, 'LJF' 
FROM fish_species 
WHERE name = 'Blue Marlin';


INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Blue Runner Jack';


INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 3, 12, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Bluefish';


INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Bonefish';


INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Cero Mackerel';


INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 1, 36, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Cobia';


INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'Winter,Spring', 3, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Coney Grouper';


INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Cottonwick Grunt';


INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Crevalle Jack';


INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'Illegal', NULL, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Checkered Puffer';

############################################################
INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 10, 12, 30, 'Total Length' 
FROM fish_species 
WHERE name = 'Cubera Snapper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 5, 20, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Dolphinfish';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 10, 12, NULL, 'Total Length' 
FROM fish_species 
WHERE name = 'Dog Snapper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'Fall', 5, 14, NULL, 'Total Length' 
FROM fish_species 
WHERE name = 'Flounder';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'French Grunt';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Gafftopsail Catfish';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'Fall,Winter,Spring', 1, 24, NULL, 'Total Length' 
FROM fish_species 
WHERE name = 'Gag Grouper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 1, NULL, NULL, 'Total Length' 
FROM fish_species 
WHERE name = 'Golden Tilefish';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Grass Porgy';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 2, 15, 36, 'Fork Length' 
FROM fish_species 
WHERE name = 'Great Barracuda';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'Winter,Spring', 3, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Graysby Grouper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'ALL', 5, 10, NULL, 'Total Length' 
FROM fish_species 
WHERE name = 'Gray Snapper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 10, 12, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Gray Triggerfish';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 1, 28, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Greater Amberjack';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Hardhead Catfish';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 10, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Hickory Shad';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'Fall,Spring', 1, 16, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Hogfish';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Horse-eye Jack';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Jolthead Porgy';

############################################################
INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 2, 24, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'King Mackerel';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Knobbed Porgy';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 10, 8, NULL, 'Total Length' 
FROM fish_species 
WHERE name = 'Lane Snapper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Ladyfish';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 5, 14, 2, 'Fork Length' 
FROM fish_species 
WHERE name = 'Lesser Amberjack';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Lionfish';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Little Tunny';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Littlehead Porgy';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Longspine Porgy';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 10, 12, NULL, 'Total Length' 
FROM fish_species 
WHERE name = 'Mahogany Snapper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 5, 10, NULL, 'Total Length' 
FROM fish_species 
WHERE name = 'Mangrove Snapper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Margate Grunt';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'ALL', 3, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Misty Grouper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Mullet';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 5, 18, NULL, 'Total Length' 
FROM fish_species 
WHERE name = 'Mutton Snapper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Ocean Triggerfish';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 1, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Parrotfish';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 2, 11, 22, 'Fork Length' 
FROM fish_species 
WHERE name = 'Permit';

####################################################

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Pinfish';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 6, 11, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Pompano';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 1, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Porkfish Grunt';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 10, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Queen Snapper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 1, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Queen Triggerfish';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Rainbow Runner';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 1, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Red Drum';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'Winter,Spring', 3, 20, NULL, 'Total Length' 
FROM fish_species 
WHERE name = 'Red Grouper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'Winter,Spring', 3, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Red Hind Grouper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'Summer,Spring', 1, 14, NULL, 'Total Length' 
FROM fish_species 
WHERE name = 'Red Porgy';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 2, 20, NULL, 'Total Length' 
FROM fish_species 
WHERE name = 'Red Snapper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'Winter,Spring', 3, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Rock Hind Grouper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 1, 66, NULL, 'LJF' 
FROM fish_species 
WHERE name = 'Roundscale Spearfish';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 1, 63, NULL, 'LJF' 
FROM fish_species 
WHERE name = 'Sailfish';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Sailors Choice Grunt';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Saucereye Porgy';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Sand Seatrout';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Sand Tilefish';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'Fall,Winter,Spring', 3, 20, NULL, 'Total Length' 
FROM fish_species 
WHERE name = 'Scamp Grouper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Scubera Stapper';

###############################################
INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 10, 10, NULL, 'Total Length' 
FROM fish_species 
WHERE name = 'Schoolmaster Snapper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Sheepshead Porgy';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 8, 12, NULL, 'Total Length' 
FROM fish_species 
WHERE name = 'Sheepshead';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 10, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Silk Snapper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Silver Mullet';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Skipjack Tuna';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 1, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Snowy Grouper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Southern Kingfish';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 15, 12, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Spanish Mackerel';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 1, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Spadefish';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 1, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Speckled Hind Grouper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 50, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Spot';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'Fall,Winter', 2, 15, 19, 'Total Length' 
FROM fish_species 
WHERE name = 'Spotted Seatrout';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 50, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Striped Mullet';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 20, NULL, NULL, 'Total Length' 
FROM fish_species 
WHERE name = 'Striped Bass';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 1, 47, NULL, 'LJF' 
FROM fish_species 
WHERE name = 'Swordfish';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Tarpon';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Threadfin Shad';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'Winter,Spring', 3, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Tiger Grouper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Tomtate Grunt';

###############################################
INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 10, 12, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Triggerfish';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 2, 18, NULL, 'Total Length' 
FROM fish_species 
WHERE name = 'Tripletail';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Unicorn Filefish';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 5, 12, NULL, 'Total Length' 
FROM fish_species 
WHERE name = 'Vermillion Snapper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 2, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Wahoo';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 1, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Warsaw Grouper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Weakfish';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 10, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Wenchman Snapper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'White Grunt';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 1, 66, NULL, 'LJF' 
FROM fish_species 
WHERE name = 'White Marlin';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Whitebone Porgy';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Wreckfish Grouper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Yellow Jack';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'Winter,Spring', 3, NULL, NULL, 'Fork Length' 
FROM fish_species 
WHERE name = 'Yellowedge Grouper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'Winter,Spring', 3, 20, NULL, 'Total Length' 
FROM fish_species 
WHERE name = 'Yellowfin Grouper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 3, 27, NULL, 'CFL' 
FROM fish_species 
WHERE name = 'Yellowfin Tuna';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'Winter,Spring', 3, 20, NULL, 'Total Length' 
FROM fish_species 
WHERE name = 'Yellowmouth Grouper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type)
SELECT id, 'All', 10, 12, NULL, 'Total Length' 
FROM fish_species 
WHERE name = 'Yellowtail Snapper';








