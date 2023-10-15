CREATE DATABASE Counties;

USE Counties;

-- Create the regions table
CREATE TABLE regions (
    id INT AUTO_INCREMENT PRIMARY KEY, 
    name VARCHAR(255) NOT NULL
);

-- Create the counties table
CREATE TABLE counties (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
); 

-- Create the fish_species table
CREATE TABLE fish_species (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Create a table to link counties and regions
CREATE TABLE county_region (
    county_id INT,
    region_id INT,
    FOREIGN KEY (county_id) REFERENCES counties(id),
    FOREIGN KEY (region_id) REFERENCES regions(id),
    PRIMARY KEY (county_id, region_id)
);

-- Create a table to link counties and fish species
CREATE TABLE county_fish (
    county_id INT,
    fish_id INT,
    FOREIGN KEY (county_id) REFERENCES counties(id),
    FOREIGN KEY (fish_id) REFERENCES fish_species(id),
    PRIMARY KEY (county_id, fish_id)
);

-- Insert regions
INSERT INTO regions (name) VALUES ('Central West'), ('Southwest'), ('Southeast'), ('Central East'), ('North Central'), ('North West'),('North East');

-- Insert counties
INSERT INTO counties (name) 
VALUES 
       ('Hillsborough County'), -- Central west
       ('Manatee County'), -- Central west
       ('Pasco County'), -- Central west
       ('Pinellas County'), -- Central west
       ('Sarasota County'),-- Central west
-- ------------------------------------------------
       ('Brevard County'), -- Central East
       ('Indian River County'),  -- Central East
       ('Martin County'), -- Central East
       ('St.Lucie County'),  -- Central East
       ('Volusia County'),  -- Central East
-- ------------------------------------------------       
       ('Charlotte County'), -- Southwest
       ('Collier County'), -- Southwest
       ('Lee County'), -- Southwest
       ('Manatee County'), -- Southwest
       ('Sarasota County'), -- Southwest
 -- ------------------------------------------------          
       ('Broward County'), -- SouthEast
       ('Miami-Dade County'), -- SouthEast
       ('Monroe County'), -- SouthEast
       ('Palm Beach County'), -- SouthEast
   -- ------------------------------------------------              
       ('Citrus County'), -- NorthCentral
       ('Dixie County'), -- NorthCentral
       ('Pasco County'), -- NorthCentral
       ('Levy County'), -- NorthCentral
       ('Hernando County'), -- NorthCentral
    -- ------------------------------------------------         
       ('Escambia County'), -- North West
       ('Santa Rosa County'), -- North West
       ('Okaloosa County'), -- North West
       ('Walton County'), -- North West
       ('Bay County'), -- North West
       ('Gulf County'), -- North West
       ('Franklin County'), -- North West
       ('Wakulla County'), -- North West
     -- ------------------------------------------------           
       ('Nassau County'), -- North East
       ('Duval County'), -- North East
       ('St.Johns County'), -- North East
       ('Flagler County'); -- North East
       
       
	

       

       
  
       

-- Insert fish species
INSERT INTO fish_species (name) VALUES ('Fish1'), ('Fish2');

-- Link counties to their respective regions
INSERT INTO county_region (county_id, region_id) VALUES 
-- Central West---------------------------
(1, 1),  -- Hillsborough 
(2, 1),  -- Manatee 
(3, 1),  -- Pasco
(4, 1),  -- Pinellas 
(5, 1),  -- Sarasota
-- Central East----------------------------
(6, 4),  -- Brevard County 
(7, 4), -- Indian River County
(8,4), -- Martin County
(9,4), -- St.Lucie County
(10,4), -- Volusia County
-- Southwest-------------------------------
(11,2), -- Charlotte County
(12,2), -- Collier County
(13,2), -- Lee County
(14,2), -- Manatee County
(15,2), -- Sarasota County
-- Southeast-------------------------------
(16,3), -- Broward County
(17,3), -- Miami-Dade County
(18,3), -- Monroe County
(19,3), -- Palm Beach County
-- NorthCentral----------------------------
(20,5), -- citrus county
(21,5), -- dixie county
(22,5), -- pasco county
(23,5), -- levy county
(24,5), -- Hernando county
-- North West------------------------------
(25,6), -- Escambia county
(26,6), -- Santa Rosa County
(27,6), -- Okaloosa County
(28,6), -- Walton County
(29,6), -- Bay County
(30,6), -- Gulf county
(31,6), -- Frankin county
(32,6), -- Wakulla County
-- North East-----------------------------
(33,7), -- Nassau county
(34,7), -- Duval County
(35,7), -- St.Johns County
(36,7); -- Flagler county






INSERT INTO county_fish (county_id, fish_id) VALUES 
(1, 1),  -- Fish1 to County1
(2, 2);  -- Fish2 to County2


SELECT counties.name 
FROM counties 
JOIN county_region ON counties.id = county_region.county_id 
WHERE county_region.region_id = 1; 
