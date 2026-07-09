/*
  =========================================
    Stage Layer common
  =========================================
    -> tables that are common to stage foundation and stage sr legacy are created

    ** WARNINGS **
        * DROP command is used before creating tables

  	Note: 
  		* All tables are loaded accordingly with the USDA food data after creation
*/

-- nutrient
DROP TABLE IF EXISTS common.nutrient;

CREATE TABLE common.nutrient (
    id integer PRIMARY KEY,
    name text,
    unit_name text,
    nutrient_nbr text,
    rank text
);

-- food category
DROP TABLE IF EXISTS common.food_category;

CREATE TABLE common.food_category (
  id integer PRIMARY KEY,
  code integer,
  description text
);

