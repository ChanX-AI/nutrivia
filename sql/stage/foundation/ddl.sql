/*
================================================================
	Stage Layer foundation_stg
================================================================
	-> All the core foundation food tables are created and loaded
	
	** Warnings **
		The drop command is used before creating a table
	
	Note: 
		* All tables are loaded accordingly with the USDA food data after creation
		* Manually a row with (id: 2066, name: 'UNKNOWN') is inserted in the public.nutrient
    	* Schemas are manually created

*/

-- Schemas creation (public is in-built)
--CREATE SCHEMA IF NOT EXISTS foundation_stg;
--CREATE SCHEMA IF NOT EXISTS sr_legacy_stg;

-- =====================================
-- foundation food tables
-- ======================================

-- food
DROP TABLE IF EXISTS foundation_stg.food;

CREATE TABLE foundation_stg.food (
    fdc_id integer PRIMARY KEY,
    data_type text,
    description text,
    food_category_id integer REFERENCES public.food_category (id),
    publication_date text
);

-- foundation food
DROP TABLE IF EXISTS foundation_stg.foundation_food;

CREATE TABLE foundation_stg.foundation_food (
    fdc_id integer PRIMARY KEY REFERENCES foundation_stg.food (fdc_id),
    ndb_number integer,
    foot_note text
);

-- food nutrient
DROP TABLE IF EXISTS foundation_stg.food_nutrient;

CREATE TABLE foundation_stg.food_nutrient (
    id integer PRIMARY KEY,
    fdc_id integer REFERENCES foundation_stg.food (fdc_id),
    nutrient_id integer REFERENCES public.nutrient (id),
    amount numeric(8,2),
    data_point text,
    derivation_id text,
    min text,
    max text,
    median text,
    foot_note text,
    min_year_acquired text
);
