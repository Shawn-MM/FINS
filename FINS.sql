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
       ('Escambia County', 'Gulf'), #Gulf
       ('Santa Rosa County', 'Gulf'), #Gulf
       ('Okaloosa County', 'Gulf'), #Gulf
       ('Walton County', 'Gulf'), #Gulf
       ('Bay County', 'Gulf'), #Gulf
       ('Gulf County', 'Gulf'), #Gulf
       ('Franklin County', 'Gulf'), #Gulf
       ('Wakulla County', 'Gulf'), #Gulf   
	   ('Jefferson County', 'Gulf'), #Gulf 
       ('Taylor County', 'Gulf'), #Gulf
	   ('Dixie County', 'Gulf'), #Gulf
       ('Levy County', 'Gulf'), #Gulf
	   ('Citrus County', 'Gulf'), #Gulf
       ('Hernando County', 'Gulf'), #Gulf 
       ('Pasco County', 'Gulf'), #Gulf
       ('Pinellas County', 'Gulf'), #Gulf
       ('Hillsborough County', 'Gulf'),
       ('Manatee County', 'Gulf'),
       ('Sarasota County', 'Gulf'), #Gulf
       ('Charlotte County', 'Gulf'), #Gulf
       ('Lee County', 'Gulf'), #Gulf
       ('Collier County', 'Gulf'), #Gulf
       
#Regulated inbetween
        ('Monroe County', 'Gulf'), #Gulf  
 
 #counties on the Atlantic ocean
       ('Miami-Dade County', 'Atlantic'),#Atlantic 
       ('Broward County', 'Atlantic'), #Atlantic
	   ('Palm Beach County', 'Atlantic'), #Atlantic   
       ('Martin County', 'Atlantic'), #Atlantic
       ('St.Lucie County', 'Atlantic'), #Atlantic
       ('Indian River County', 'Atlantic'), #Atlantic
       ('Brevard County', 'Atlantic'),
       ('Volusia County', 'Atlantic'),  #Atlantic 
       ('Flagler County', 'Atlantic'), #Atlantic
       ('St.Johns County', 'Atlantic'), #Atlantic
       ('Duval County', 'Atlantic'), #Atlantic       
       ('Nassau County', 'Atlantic'); #Atlantic

INSERT INTO fish_species (name,county_id) VALUES
#Grouper
('Black Grouper', 1-34),
('Coney Grouper', 1-34),
('Gag Grouper', 1-29),
('Graysby Grouper', 1-34),#Atlantic, Gulf
('Misty Grouper', 1-34),#Atlantic, Gulf
('Red Hind Grouper', 1-34),#Atlantic, Gulf
('Red Grouper', 1-34),#Atlantic, Gulf
('Rock Hind Grouper', 1-34),#Atlantic, Gulf
('Scamp Grouper', 1-34),#Atlantic, Gulf
('Snowy Grouper', 1-34),#Atlantic, Gulf
('Speckled Hind Grouper', 1-34),#Atlantic, Gulf
('Tiger Grouper', 22-34),#Atlantic, Gulf
('Warsaw Grouper', 1-34),#Atlantic, Gulf
('Wreckfish Grouper', 1-34),#Atlantic
('Yellowedge Grouper', 1-34),#Atlantic, Gulf
('Yellowfin Grouper', 1-34), #Atlantic, Gulf
('Yellowmouth Grouper', 1-34),#Atlantic, Gulf

#Snapper
('Black Snapper', 1-34),#Atlantic, Gulf
('Blackfin Snapper', 1-34),#Atlantic, Gulf
('Cubera Snapper', 1-34),#Atlantic, Gulf
('Dog Snapper', 1-34),#Atlantic, Gulf
('Gray Snapper', 1-34),#Atlantic, Gulf
('Lane Snapper', 1-34),#Atlantic, Gulf
('Mahogany Snapper', 1-34),#Atlantic, Gulf
('Mangrove Snapper', 1-34),#Atlantic, Gulf
('Mutton Snapper', 1-34),#Atlantic, Gulf
('Queen Snapper', 1-34),#Atlantic, Gulf
('Red Snapper', 1-34),#Atlantic, Gulf
('Schoolmaster Snapper', 1-34),#Atlantic, Gulf
('Silk Snapper', 1-34),#Atlantic, Gulf
('Vermillion Snapper', 1-34),#Atlantic, Gulf
('Wenchman Snapper', 1-34),#Atlantic, Gulf
('Yellowtail Snapper', 1-34);#Atlantic, Gulf

#Coastal Species 
('Alabama Shad',1-12),#Atlantic, Gulf
('African Pompano', 1-34),#Atlantic, Gulf
('Atlantic Croaker', 1-16 24-34),#Atlantic, Gulf
('Black Drum', 1-34),#Atlantic, Gulf
('Blue Catfish', 1-34),#Atlantic, Gulf
('Bluefish',, 1-34),#Atlantic, Gulf
('Bonefish', 1-34),#Atlantic, Gulf
('Gafftopsail Catfish', 1-34),#Atlantic, Gulf
('Hardhead Catfish', 1-34), #Atlantic, Gulf
('Hickory Shad', 30-34),#Atlantic, Gulf
('Mullet', 1-34),#Atlantic
('Permit', 1-34),#Atlantic, Gulf
('Pinfish', 1-34),#Atlantic, Gulf
('Pompano', 1-34),#Atlantic, Gulf
('Red Drum', 1-34), #Atlantic, Gulf
('Sand Seatrout', 1-34),#Atlantic, Gulf
('Sheepshead', 1-34), #Atlantic, Gulf
('Silver Mullet', 1-34),#Atlantic, Gulf
('Spotted Seatrout', 1-34),#Atlantic, Gulf
('Striped Mullet', 1-34),#Atlantic, Gulf
('Threadfin Shad', 1-34),#Atlantic, Gulf
('Weakfish', 1-34),#Atlantic, Gulf

#Reef Fish
('Banded Rudderfish', 1-34),#Atlantic, Gulf
('Bar Jack', 1-34),#Atlantic, Gulf
('Barracuda', 1-34),#Atlantic
('Black Sea Bass', 1-34),#Atlantic, Gulf
('Black Margate Grunt', 15-34),#Atlantic, Gulf
('Bluestriped Grunt', 1-34),#Atlantic, Gulf
('Blueline Tilefish', 1-34), #Atlantic, Gulf
('Blue Runner Jack', 1-34),#Atlantic, Gulf
('Cottonwick Grunt', 1-34),#Atlantic, Gulf
('Crevalle Jack', 1-34),#Atlantic, Gulf
('Checkered Puffer', 22-34), #Gulf
('Flounder', 1-34),#Atlantic, #Pacific
('French Grunt', 1-34),#Atlantic, Gulf
('Golden Tilefish', 1-34),#Atlantic, Gulf
('Grass Porgy', 1-34),#Atlantic, Gulf
('Great Barracuda', 1-34),#Atlantic, Gulf
('Greater Amberjack', 1-34), #Atlantic, Gulf
('Gray Triggerfish', 1-34),#Atlantic, Gulf
('Hogfish', 1-34),#Atlantic, Gulf
('Horse-eye Jack', 1-34),#Atlantic, Gulf
('Jolthead Porgy', 1-34),#Atlantic, Gulf
('Knobbed Porgy', 1-34),#Atlantic, Gulf
('Lesser Amberjack', 1-34),#Atlantic, Gulf
('Littlehead Porgy', 1-34),#Atlantic, Gulf
('Longspine Porgy',1-16 24-34),#Atlantic, Gulf
('Ocean Triggerfish', 1-34),#Atlantic, Gulf
('Parrotfish', 22-34),#Atlantic, Gulf
('Red Porgy', 25-34),#Atlantic, Gulf
('Sand Tilefish', 1-34),#Atlantic, Gulf
('Saucereye Porgy', 1-34), #Atlantic, Gulf
('Spadefish', 1-34),#Atlantic, Gulf
('Tomtate Grunt', 1-34),#Atlantic, Gulf
('Triggerfish', 1-34),#Atlantic, Gulf
('Unicorn Filefish', 1-34),#Atlantic, Gulf
('Whitebone Porgy', 1-34),#Atlantic, Gulf
('White Grunt', 1-34),#Atlantic, Gulf
('Yellow Jack', 1-34),#Atlantic, Gulf

#Peligics
('Albacore Tuna', 1-34),#Atlantic, Gulf
('Almaco Jack', 1-34),#Atlantic, Gulf
('Atlantic Bonito', 1-34),#Atlantic, Gulf
('Bigeye Tuna', 1-34),#Atlantic, Gulf
('Blackfin Tuna', 1-34),#Atlantic, Gulf
('Bluefin Tuna', 1-34), #Atlantic, Gulf
('Blue Marlin', 22-34),#Atlantic, Gulf
('Cero Mackerel', 22-34),#Atlantic, Gulf
('Cobia', 1-34), #Atlantic, Gulf
('Dolphinfish', 1-34),
('King Mackerel', 1-34),#Atlantic, Gulf
('Ladyfish', 1-34),#Atlantic, Gulf
('Little Tunny', 1-34),#Atlantic, Gulf
('Rainbow Runner', 1-34),#Atlantic, Gulf
('Roundscale Spearfish', 24-34),#Atlantic, Gulf
('Sailfish', 22-34),#Atlantic, Gulf
('Skipjack Tuna', 22-34),#Atlantic, Gulf
('Southern Kingfish', 1-34),#Atlantic, Gulf
('Swordfish', 1-34),#Atlantic, Gulf
('Spanish Mackerel', 1-34),#Atlantic, Gulf
('Tarpon', 1-34),#Atlantic, Gulf
('Tripletail', 1-34),#Atlantic, Gulf
('Wahoo', 1-34),#Atlantic, Gulf
('White Marlin', 1-34),#Atlantic, Gulf
('Yellowfin Tuna', 22-34),#Atlantic, Gulf

DELIMITER //

#Creates ID for each fish and county (instead if doing it by hand)
#REDO WITH INTERNET...
CREATE PROCEDURE PopulateCountyFish()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE c_id INT;
    DECLARE c_location INT;
    DECLARE cur CURSOR FOR SELECT id, location FROM counties;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO c_id, c_location;

        IF done THEN
            LEAVE read_loop;
        END IF;

        IF c_location = c_id THEN
            INSERT INTO county_fish (county_id, fish_id)
            SELECT c_id, id FROM fish_species;
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

-- GROUPERS---------------------------------------------------------------------------------
INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'Winter,Spring', 1, 24, NULL, 'Total Length','Sub 60 ft sandy areas', 'Any live bait','20lbs drag', 'Black_Grouper'
FROM fish_species 
WHERE name = 'Black Grouper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'Winter,Spring', 3, NULL, NULL, 'Fork Length' ,'Reefs and Clear waters', 'Live Bait /Shrimp','20lbs drag line', 'Coney_Grouper'
FROM fish_species 
WHERE name = 'Coney Grouper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'Fall,Winter,Spring', 1, 24, NULL, 'Total Length', 'Fork Length' ,'Rocky Ledges/wrecks', 'Live Bait /Shrimp','Trolling large deep diving plugs or use texas rigs', 'Gag_Grouper'
FROM fish_species 
WHERE name = 'Gag Grouper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'Winter,Spring', 3, NULL, NULL, 'Fork Length', 'Fork Length', 'Rocky Ledges Wreaks and Reefs', 'Live Bait /Shrimp','Texas Rig, troll along ledges', 'Graysby_Grouper'
FROM fish_species 
WHERE name = 'Graysby Grouper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'ALL', 3, NULL, NULL, 'Fork Length' , 'Fork Length', 'Deep Flats and sandy beds', 'Live Bait /Shrimp','Bottom Fish around Rocks', 'Misty_Grouper'
FROM fish_species 
WHERE name = 'Misty Grouper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'Winter,Spring', 3, NULL, NULL, 'Fork Length', 'Rocky Ledges Wreaks and Reefs', 'Live Bait /Shrimp','Bottom fish around rocks', 'Red_Hind_Grouper'
FROM fish_species 
WHERE name = 'Red Hind Grouper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'Winter,Spring', 3, 20, NULL, 'Total Length', 'Rocky Ledges Wreaks and Reefs', 'Live Bait /Shrimp','Live Bait /Shrimp', 'Red_Grouper'
FROM fish_species 
WHERE name = 'Red Grouper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'Winter,Spring', 3, 20, NULL, 'Total Length', 'Rocky Ledges Wreaks and Reefs', 'Live Bait /Shrimp','Fish outside of Rock Entrnces', 'Rock_Hind_Grouper'
FROM fish_species 
WHERE name = 'Rock Hind Grouper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'Fall,Winter,Spring', 3, 20, NULL, 'Total Length', 'Deep Flats and sandy beds', 'Live Bait /Shrimp','Live Bait /Shrimp', 'Scamp_Grouper'
FROM fish_species 
WHERE name = 'Scamp Grouper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 1, NULL, NULL, 'Fork Length', 'Deep Flats and sandy beds', 'Live Bait /Shrimp','Live Bait /Shrimp', 'Snowy_Grouper'
FROM fish_species 
WHERE name = 'Snowy Grouper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 1, NULL, NULL, 'Fork Length', 'Deep Flats and sandy beds', 'Live Bait /Shrimp','Fish close to ocean bottom', 'Speckled_Hind_Grouper'
FROM fish_species 
WHERE name = 'Speckled Hind Grouper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'Winter,Spring', 3, NULL, NULL, 'Fork Length', 'Rocky Ledges Wreaks and Reefs', 'Live Bait /Shrimp','Attempt to drop outside rocks', 'Tiger_Grouper'
FROM fish_species 
WHERE name = 'Tiger Grouper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 1, NULL, NULL, 'Fork Length', 'Rocky Ledges Wreaks and Reefs', 'Live Bait /Shrimp','Use Florida gulf rig', 'Warsaw_Grouper'
FROM fish_species 
WHERE name = 'Warsaw Grouper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length', 'Rocky Ledges Wreaks and Reefs', 'Live Bait /Shrimp','Use texas trolling rig', 'Wreakfish_Grouper'
FROM fish_species 
WHERE name = 'Wreckfish Grouper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'Winter,Spring', 3, NULL, NULL, 'Fork Length', 'Deep Flats and sandy beds', 'Live Bait /Shrimp','Live Bait /Shrimp', 'Yellowedge_Grouper'
FROM fish_species 
WHERE name = 'Yellowedge Grouper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'Winter,Spring', 3, 20, NULL, 'Total Length', 'Deep Flats and sandy beds', 'Live Bait /Shrimp','Live Bait /Shrimp', 'Yellowfin_Grouper'
FROM fish_species 
WHERE name = 'Yellowfin Grouper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'Winter,Spring', 3, 20, NULL, 'Total Length', 'Deep Flats and sandy beds', 'Live Bait /Shrimp','Live Bait /Shrimp', 'Yellowmouth_Grouper'
FROM fish_species 
WHERE name = 'Yellowmouth Grouper';

-- SNAPPERS---------------------------------------------------------------------------------
INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 10, NULL, NULL, 'Fork Length', 'Salt Flats and close to shore', 'Live Whiting ',' Snatcher Rig', 'Black_Snapper'
FROM fish_species 
WHERE name = 'Black Snapper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 10, NULL, NULL, 'Fork Length', 'Grass and Salt flats', 'Live Shrimp ',' Snatcher Rig', 'Blackfin_Snapper'
FROM fish_species 
WHERE name = 'Blackfin Snapper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 10, 12, 30, 'Total Length', 'Oster Beds and inlets', 'Shrimp/Octopus ',' Snatch Rig', 'Cuvera_Snapper'
FROM fish_species 
WHERE name = 'Cubera Snapper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 10, 12, NULL, 'Total Length', 'Salt Flats and close to shore', 'Shrimp/Octopus ',' Snatch Rig', 'Dog_Snapper'
FROM fish_species 
WHERE name = 'Dog Snapper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'ALL', 5, 10, NULL, 'Total Length', 'Grass and Salt flats', 'Shrimp/Octopus ',' Snatch Rig', 'Grey_Snapper'
FROM fish_species 
WHERE name = 'Gray Snapper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 10, 8, NULL, 'Oster Beds and inlets', 'Grass and Salt flats', 'Shrimp/Octopus ',' Snatch Rig', 'Lane_Snapper'
FROM fish_species 
WHERE name = 'Lane Snapper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 10, 12, NULL, 'Total Length', 'Grass and Salt flats', 'Shrimp/Octopus ',' Snatch Rig', 'Mahogany_Snapper'
FROM fish_species 
WHERE name = 'Mahogany Snapper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 5, 10, NULL, 'Total Length', 'Grass and Salt flats', 'Live Whiting ',' Snatcher Rig', 'Mangrove_Snapper'
FROM fish_species 
WHERE name = 'Mangrove Snapper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 5, 18, NULL,'Oster Beds and inlets', 'Salt Flats and close to shore', 'Live Whiting ',' Snatcher Rig', 'Mutton_Snapper'
FROM fish_species 
WHERE name = 'Mutton Snapper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 10, NULL, NULL, 'Fork Length', 'Grass and Salt flats', 'Live Shrimp ',' Snatcher Rig', 'Queen_Snapper'
FROM fish_species 
WHERE name = 'Queen Snapper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 2, 20, NULL, 'Total Length', 'Grass and Salt flats', 'Live Shrimp ',' Snatcher Rig', 'Red_Snapper'
FROM fish_species 
WHERE name = 'Red Snapper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 10, 10, NULL, 'Total Length', 'Salt Flats and close to shore', 'Live Whiting ',' Snatcher Rig', 'Schoolmaster_Snapper'
FROM fish_species 
WHERE name = 'Schoolmaster Snapper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 10, NULL, NULL, 'Fork Length', 'Oster Beds and inlets', 'Live Shrimp on Snatcher Rig', 'Silk_Snapper'
FROM fish_species 
WHERE name = 'Silk Snapper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 5, 12, NULL, 'Total Length', 'Grass and Salt flats', 'Live Whiting ',' Snatcher Rig', 'Vermillion_Snapper'
FROM fish_species 
WHERE name = 'Vermillion Snapper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 10, NULL, NULL, 'Fork Length', 'Oster Beds and inlets', 'Live Shrimp ',' Snatcher Rig', 'Wenchman_Snapper'
FROM fish_species 
WHERE name = 'Wenchman Snapper';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 10, 12, NULL, 'Total Length', 'Salt Flats and close to shore', 'Shrimp/Octopus ',' Snatch Rig', 'Yellowtail_Snapper'
FROM fish_species 
WHERE name = 'Yellowtail Snapper';

-- COASTAL SPECIES--------------------------------------------------------------------------
INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 10, 12, NULL, 'Fork Length', 'inlets', 'Any Oily Baitfish, EEL','Cast against the current and Float down', 'Alabama_Shad'
FROM fish_species 
WHERE name = 'Alabama Shad';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 2, 24, NULL, 'Fork Length', 'Grass/Salt flats', 'Shrimp, Squid, Minnows, and Most Live Bait','Fish  on Simple Weighted Rig, larger line size', 'African_Pompano'
FROM fish_species 
WHERE name = 'African Pompano';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 50, NULL, NULL, 'Fork Length', 'Grass/Salt flats', 'Shrimp, Squid an Minnows','Fish  on Simple Weighted Rig, larger line size', 'Atlantic_Croaker'
FROM fish_species 
WHERE name = 'Atlantic Croaker';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 5, 14, 24, 'Total Length', 'Oster Beds and inlets', 'Blue Crab or Baitfish Cutlets','Fish  on Simple Weighted Rig, larger line size', 'Black_Drum'
FROM fish_species 
WHERE name = 'Black Drum';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length', 'Anywhere', 'Any Dead Bait','Trying not to Catch is the best way to', 'Blue_Catfish'
FROM fish_species 
WHERE name = 'Blue Catfish';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 3, 12, NULL, 'Fork Length', 'Grass/Salt flats', 'Any Oily Baitfish, EEL','Fish  on Simple Weighted Rig, larger line size', 'Bluefish'
FROM fish_species 
WHERE name = 'Bluefish';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length', 'Grass/Salt flats', 'Any Dead Bait','Fish  on Simple Weighted Rig, larger line size', 'Bonefish'
FROM fish_species 
WHERE name = 'Bonefish';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length', 'Anywhere', 'Any Dead Bait','Trying not to Catch is the best way to', 'Gafftopsail_Catfish'
FROM fish_species 
WHERE name = 'Gafftopsail Catfish';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length', 'Anywhere', 'Any Dead Bait','Trying not to Catch is the best way to', 'Heardhead_Catfish'
FROM fish_species 
WHERE name = 'Hardhead Catfish';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 10, NULL, NULL, 'Fork Length', 'Grass/Salt flats and inlets', 'Shrimp, Squid, Minnows','Cast against the current and Float down', 'Hickory_Shad'
FROM fish_species 
WHERE name = 'Hickory Shad';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length', 'Grass/Salt flats and inlets', 'Vegetarian','Netfish on Jumping Mullett Schools', 'Mullet'
FROM fish_species 
WHERE name = 'Mullet';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 2, 11, 22, 'Fork Length', 'Anywhere', 'Any Dead Bait','Clear line, they scare easy', 'Permit'
FROM fish_species 
WHERE name = 'Permit';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length', 'Anywhere', 'Any Dead Bait','Netfish near shore, use small hook on canepole', 'Pinfish'
FROM fish_species 
WHERE name = 'Pinfish';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 6, 11, NULL, 'Fork Length', 'Grass/Salt flats', 'Shrimp, Squid, Minnows, and Most Live Bait','Fish  on Simple Weighted Rig, larger line size', 'Pompano'
FROM fish_species 
WHERE name = 'Pompano';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 1, NULL, NULL, 'Fork Length', 'Oster Beds and inlets', 'Shrimp, Squid and Minnows','Fish  on Simple Weighted Rig, larger line size', 'Red_Drum'
FROM fish_species 
WHERE name = 'Red Drum';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length', 'Grass Salt and Sand flats with structures', 'Shrimp, Squid, Minnows, and Most Live Bait','Cast against the current and Float', 'Sand_Seatrout'
FROM fish_species 
WHERE name = 'Sand Seatrout';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 8, 12, NULL, 'Total Length', 'Grass Salt and Sand flats with structures', 'Shrimp, Squid, Minnows, and Most Live Bait','Fish  on Simple Weighted Rig, larger line size', 'Sheepshead'
FROM fish_species 
WHERE name = 'Sheepshead';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length', 'Grass/Salt flats and inlets', 'Vegetarian','Netfish on Jumping Mullett Schools', 'Silver_Mullet'
FROM fish_species 
WHERE name = 'Silver Mullet';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'Fall,Winter', 2, 15, 19, 'Total Length', 'Grass Salt and Sand flats with structures', 'live Shrimp, Pinfish and Herrings','Cast against the current and Float', 'Spotted_Seatrout'
FROM fish_species 
WHERE name = 'Spotted Seatrout';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 50, NULL, NULL, 'Fork Length', 'Grass/Salt flats and inlets', 'Vegetarian','Netfish on Jumping Mullett Schools', 'Striped_Mullet'
FROM fish_species 
WHERE name = 'Striped Mullet';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length', 'Grass Salt and Sand flats with structures', 'Shrimp, Squid, Minnows, and Most Live Bait','Cast against the current and Float', 'Threadfin_Shad'
FROM fish_species 
WHERE name = 'Threadfin Shad';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length', 'Anywhere', 'Any Dead Bait','Chum water and use spin tackle', 'Weakfish'
FROM fish_species 
WHERE name = 'Weakfish';

-- REEF FISH--------------------------------------------------------------------------------
INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 5, 14, 22, 'Fork Length', 'Grass Flats', 'Smaller Baitfish Cutlets','Fish  on Simple Weighted Rig, larger line size', 'Banded_Rudderfish'
FROM fish_species 
WHERE name = 'Banded Rudderfish';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'ALL', NULL, NULL, NULL, 'Fork Length', 'Grass Salt and Sand flats with structures', 'Shrimp, Squid, Minnows, and Most Live Bait','Fish  on Simple Weighted Rig, larger line size', 'Bar_Jack'
FROM fish_species 
WHERE name = 'Bar Jack';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 2, 15, 36, 'Fork Length', 'Grass Salt and Sand flats with structures', 'Shrimp, Squid, Minnows, and Most Live Bait','Fish  on Simple Weighted Rig, larger line size', 'Barracuda'
FROM fish_species 
WHERE name = 'Barracuda';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length', 'Grass/Salt flats and inlets', 'Shrimp, Squid, Minnows, and Most Live Bait','Multihook trolling rig, weighted at bottom, and tense line', 'Black_Margate_Grunt'
FROM fish_species 
WHERE name = 'Black Margate Grunt';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 7, 13, NULL, 'Total Length', 'Grass Salt and Sand flats with structures', 'Shrimp, Squid, Minnows, and Most Live Bait','Use Spincaster and cast as close to rocks as possible', 'Black_Sea_Bass'
FROM fish_species 
WHERE name = 'Black Sea Bass';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length', 'Grass Salt and Sand flats with structures', 'Shrimp, Squid, Minnows, and Most Live Bait','Multihook trolling rig, weighted at bottom, and tense line', 'Bluestriped_Grunt'
FROM fish_species 
WHERE name = 'Bluestriped Grunt';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'Fall,Winter,Spring', 3, NULL, NULL, 'Fork Length', 'Deep waters of 60ft+', 'Blue Crab or Baitfish Cutlets','Fish  on Simple Weighted Rig, larger line size', 'Blueline_Tilefish'
FROM fish_species 
WHERE name = 'Blueline Tilefish';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length', 'Grass Salt and Sand flats with structures', 'Smaller Baitfish Cutlets','Fish  on Simple Weighted Rig, larger line size', 'Blue_Runner_Jack'
FROM fish_species 
WHERE name = 'Blue Runner Jack';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length', 'Grass Salt and Sand flats with structures', 'Shrimp, Squid, Minnows, and Most Live Bait','Multihook trolling rig, weighted at bottom, and tense line', 'Cottonwick_Grunt'
FROM fish_species 
WHERE name = 'Cottonwick Grunt';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length', 'Grass Salt and Sand flats with structures', 'Shrimp, Squid, Minnows, and Most Live Bait','Fish  on Simple Weighted Rig, larger line size', 'Crevalle_Jack'
FROM fish_species 
WHERE name = 'Crevalle Jack';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'Illegal', NULL, NULL, NULL, 'Fork Length', 'Shallow Reefs', ' ',' ', 'Checkered_Puffer'
FROM fish_species 
WHERE name = 'Checkered Puffer';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'Fall', 5, 14, NULL, 'Total Length', 'Grass/Salt flats', 'Any Dead Bait','Have bait sitting on or close to ground loose line', 'Flounder'
FROM fish_species 
WHERE name = 'Flounder';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length', 'Shallow Reefs', 'Shrimp, Squid, Minnows, and Most Live Bait','Multihook trolling rig, weighted at bottom, and tense line', 'French_Grunt'
FROM fish_species 
WHERE name = 'French Grunt';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 1, NULL, NULL, 'Total Length', 'Deep waters of 60ft+', 'Smaller Baitfish Cutlets','Fish  on Simple Weighted Rig, larger line size', 'Golden_Tilefish'
FROM fish_species 
WHERE name = 'Golden Tilefish';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length', 'Grass/Salt flats', 'Any Oily Baitfish, EEL','Multihook trolling rig, weighted at bottom, and tense line', 'Grass_Porgy'
FROM fish_species 
WHERE name = 'Grass Porgy';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 2, 15, 36, 'Fork Length', 'Grass Salt and Sand flats with structures', 'Smaller Baitfish Cutlets','Fish  on Simple Weighted Rig, larger line size', 'Great_Barracuda'
FROM fish_species 
WHERE name = 'Great Barracuda';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 1, 28, NULL, 'Fork Length', 'Grass Salt and Sand flats with structures', 'Smaller Baitfish Cutlets','Fish  on Simple Weighted Rig, larger line size', 'Greater_Amberjack'
FROM fish_species 
WHERE name = 'Greater Amberjack';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 10, 12, NULL, 'Fork Length', 'Grass/Salt flats', 'Smaller Baitfish Cutlets','Fish on Simple Weighted Rig, larger line size', 'Grey_Triggerfish'
FROM fish_species 
WHERE name = 'Gray Triggerfish';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'Fall,Spring', 1, 16, NULL, 'Fork Length', 'Shallow Rock Structures', 'Any Dead Bait','Fish on Simple Weighted Rig, larger line size', 'Hogfish'
FROM fish_species 
WHERE name = 'Hogfish';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length', 'Grass Salt and Sand flats with structures', 'Smaller Baitfish Cutlets','Fish on Simple Weighted Rig, larger line size', 'Horse-eye_Jack'
FROM fish_species 
WHERE name = 'Horse-eye Jack';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length', 'Shallow Rock Structures', 'Smaller Baitfish Cutlets','Multihook trolling rig, weighted at bottom, and tense line', 'Jolthead_Porgy'
FROM fish_species 
WHERE name = 'Jolthead Porgy';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length', 'Grass Salt and Sand flats with structures', 'Any Oily Baitfish, EEL','Multihook trolling rig, weighted at bottom, and tense line', 'Knobbed_Porgy'
FROM fish_species 
WHERE name = 'Knobbed Porgy';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 5, 14, 2, 'Fork Length', 'Grass Salt and Sand flats with structures', 'Smaller Baitfish Cutlets','Fish  on Simple Weighted Rig, larger line size', 'Lesser_Amberjack'
FROM fish_species 
WHERE name = 'Lesser Amberjack';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length', 'Grass Salt and Sand flats with structures', 'Any Oily Baitfish, EEL','Multihook trolling rig, weighted at bottom, and tense line', 'Littlehead_Porgy'
FROM fish_species 
WHERE name = 'Littlehead Porgy';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length', 'Grass Salt and Sand flats with structures', 'Any Oily Baitfish, EEL','Multihook trolling rig, weighted at bottom, and tense line', 'Longspine_Porgy'
FROM fish_species 
WHERE name = 'Longspine Porgy';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length', 'Deep waters of 60ft+', 'Larger Baitfish Cutlets','Fish  on Simple Weighted Rig, larger line size', 'Ocean_Triggerfish'
FROM fish_species 
WHERE name = 'Ocean Triggerfish';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 1, NULL, NULL, 'Fork Length', 'Grass/Salt flats', 'Shrimp, Squid, Minnows, and Most Live Bait','Fish  on Simple Weighted Rig, larger line size', 'Parrotfish'
FROM fish_species 
WHERE name = 'Parrotfish';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'Summer,Spring', 1, 14, NULL, 'Total Length', 'Anywhere', 'Shrimp, Squid, Minnows, and Most Live Bait','Multihook trolling rig, weighted at bottom, and tense line', 'Red_Porgy'
FROM fish_species 
WHERE name = 'Red Porgy';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length', 'Sand flats and inlets', 'Shrimp, Squid, Minnows, and Most Live Bait','Bottomfish for them with heavy lead', 'Sand_Tilefish'
FROM fish_species 
WHERE name = 'Sand Tilefish';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length', 'Deep waters of 60ft+', 'Any Oily Baitfish, EEL','Multihook trolling rig, weighted at bottom, and tense line', 'Saucereye_Porgy'
FROM fish_species 
WHERE name = 'Saucereye Porgy';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 1, NULL, NULL, 'Fork Length', 'Anywhere', 'Any Dead Bait','Position against current, do not position watercraft directly above strucuture', 'Spadefish'
FROM fish_species 
WHERE name = 'Spadefish';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length', 'Inlets', 'live Shrimp, Pinfish and Herrings','Multihook trolling rig, weighted at bottom, and tense line', 'Tomate_Grunt'
FROM fish_species 
WHERE name = 'Tomtate Grunt';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 10, 12, NULL, 'Fork Length', 'Anywhere', 'Any Dead Bait','Multihook trolling rig, weighted at bottom, and tense line', 'Triggerfish'
FROM fish_species 
WHERE name = 'Triggerfish';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length', 'Oster Beds and inlets', 'Blue Crab or Baitfish Cutlets','Bottomfish for them with heavy lead', 'Unicorn_Filefish'
FROM fish_species 
WHERE name = 'Unicorn Filefish';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length', 'Inlets', 'Any Dead Bait','Any Oily Baitfish, EEL', 'Whitebone_Porgy'
FROM fish_species 
WHERE name = 'Whitebone Porgy';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length', 'Inlets/Mangrove tunnels', 'Any Dead Bait','Multihook trolling rig, weighted at bottom, and tense line', 'White_Grunt'
FROM fish_species 
WHERE name = 'White Grunt';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length', 'Grass/Salt flats', 'Larger Baitfish Cutlets','Fish  on Simple Weighted Rig, larger line size', 'Yellow_Jack'
FROM fish_species 
WHERE name = 'Yellow Jack';

-- PELAGIC ----------------------------------------------------------------------------------
INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length', 'Deep waters of 60ft+', 'Larger Baitfish Cutlets','Larger Baitfish Cutlets','Fish at a Variety of Diffrent Depts on Simple Weighted Rig', 'Albacore_Tuna'
FROM fish_species 
WHERE name = 'Albacore Tuna';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length', 'Grass/Salt flats and inlets', 'Larger Baitfish Cutlets','Larger Baitfish Cutlets','Fish on Simple Weighted Rig, larger line size', 'Almaco_Jack'
FROM fish_species 
WHERE name = 'Almaco Jack';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length', 'Deep waters of 60ft+', 'Larger Baitfish Cutlets','Fish  on Simple Weighted Rig, larger line size, Deep Depths', 'Atlantic_Bonito'
FROM fish_species 
WHERE name = 'Atlantic Bonito';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', NULL, 27, NULL, 'CFL', 'Deep waters of 60ft+', 'Larger Baitfish Cutlets','Larger Baitfish Cutlets','Fish at a Variety of Diffrent Depts on Simple Weighted Rig', 'Bigeye_Tuna'
FROM fish_species 
WHERE name = 'Bigeye Tuna';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 2, NULL, NULL, 'Fork Length', 'Deep waters of 60ft+', 'Larger Baitfish Cutlets','Larger Baitfish Cutlets','Fish at a Variety of Diffrent Depts on Simple Weighted Rig', 'Blackfin_Tuna'
FROM fish_species 
WHERE name = 'Blackfin Tuna';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'Spring', 5, 12.5, NULL, 'Fork Length', 'Deep waters of 60ft+', 'Larger Baitfish Cutlets','Larger Baitfish Cutlets','Fish at a Variety of Diffrent Depts on Simple Weighted Rig', 'Bluefin_Tuna'
FROM fish_species 
WHERE name = 'Bluefin Tuna';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 1, 99, NULL, 'LJF', 'Deep waters of 60ft+', 'Larger Baitfish Cutlets','Fish  on Simple Weighted Rig, larger line size', 'Blue_Marlin'
FROM fish_species 
WHERE name = 'Blue Marlin';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length', 'Grass/Salt flats and inlets', 'Larger Baitfish Cutlets','Fish  on Simple Weighted Rig, larger line size', 'Cero_Mackerel'
FROM fish_species 
WHERE name = 'Cero Mackerel';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 1, 36, NULL, 'Fork Length', 'Oster Beds and inlets', 'Smaller Baitfish Cutlets','Fish closer to shore, wait to tire them out before pulling in', 'Cobia'
FROM fish_species 
WHERE name = 'Cobia';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 5, 20, NULL, 'Fork Length', 'Deep waters of 60ft+', 'Larger Baitfish Cutlets','Fish  on Simple Weighted Rig, larger line size', 'Dolphinfish'
FROM fish_species 
WHERE name = 'Dolphinfish';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 2, 24, NULL, 'Fork Length', 'Grass/Salt flats and inlets', 'Larger Baitfish Cutlets','Fish  on Simple Weighted Rig, larger line size', 'King_Mackerel'
FROM fish_species 
WHERE name = 'King Mackerel';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length', 'Grass/Salt flats and inlets', 'Larger Baitfish Cutlets','Fish  on Simple Weighted Rig, larger line size', 'Ladyfish'
FROM fish_species 
WHERE name = 'Ladyfish';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length', 'Deep waters of 60ft+', 'Larger Baitfish Cutlets','Larger Baitfish Cutlets','Fish at a Variety of Diffrent Depts on Simple Weighted Rig', 'Little_Tunny'
FROM fish_species 
WHERE name = 'Little Tunny';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length', 'Grass/Salt flats and inlets', 'Larger Baitfish Cutlets','Fish  on Simple Weighted Rig, larger line size', 'Rainbow_Runner'
FROM fish_species 
WHERE name = 'Rainbow Runner';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 1, 66, NULL, 'LJF', 'Deep waters of 60ft+', 'Larger Baitfish Cutlets','Fish  on Simple Weighted Rig, larger line size', 'Roundscale_Spearfish'
FROM fish_species 
WHERE name = 'Roundscale Spearfish';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 1, 63, NULL, 'LJF', 'Deep waters of 60ft+', 'Larger Baitfish Cutlets','Fish  on Simple Weighted Rig, larger line size', 'Sailfish'
FROM fish_species 
WHERE name = 'Sailfish';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length', 'Deep waters of 60ft+', 'Larger Baitfish Cutlets','Larger Baitfish Cutlets','Fish at a Variety of Diffrent Depts on Simple Weighted Rig', 'Skipjack_Tuna'
FROM fish_species 
WHERE name = 'Skipjack Tuna';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length', 'Deep waters of 60ft+', 'Larger Baitfish Cutlets','Fish  on Simple Weighted Rig, larger line size', 'Southern_Kingfish'
FROM fish_species 
WHERE name = 'Southern Kingfish';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 15, 12, NULL, 'Fork Length', 'Grass/Salt flats and inlets', 'Larger Baitfish Cutlets','Fish  on Simple Weighted Rig, larger line size', 'Spanish_Mackerel'
FROM fish_species 
WHERE name = 'Spanish Mackerel';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 1, 47, NULL, 'LJF', 'Deep waters of 60ft+', 'Larger Baitfish Cutlets','Fish  on Simple Weighted Rig, larger line size', 'Swordfish'
FROM fish_species 
WHERE name = 'Swordfish';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', NULL, NULL, NULL, 'Fork Length', 'Oster Beds and inlets', 'Blue Crab Larger Baitfish Cutlets','Fish  on simple weighted rig, wait to hook untill it jumps', 'Tarpon'
FROM fish_species 
WHERE name = 'Tarpon';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 2, 18, NULL, 'Total Length', 'Bayfish/Flats', 'Larger Baitfish Cutlets','Fish  on Simple Weighted Rig, larger line size', 'Tripletail'
FROM fish_species 
WHERE name = 'Tripletail';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 2, NULL, NULL, 'Fork Length', 'Bayfish/Flats', 'Larger Baitfish Cutlets','Fish  on Simple Weighted Rig, larger line size', 'Wahoo'
FROM fish_species 
WHERE name = 'Wahoo';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 1, 66, NULL, 'LJF', 'Deep waters of 60ft+', 'Larger Baitfish Cutlets','Fish  on Simple Weighted Rig, larger line size', 'White_Marlin'
FROM fish_species 
WHERE name = 'White Marlin';

INSERT INTO fish_details (fish_id, season, bag_limit, min_size, max_size, measurement_type, env_type, bait, gen_tips, pic_id)
SELECT id, 'All', 3, 27, NULL, 'CFL', 'Deep waters of 60ft+', 'Larger Baitfish Cutlets','Fish at a Variety of Diffrent Depts on Simple Weighted Rig', 'Yellowfin_Tuna'
FROM fish_species 
WHERE name = 'Yellowfin Tuna';

