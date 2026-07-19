/*
================================================================
	Stage Layer foundation
================================================================
	* All the core sr legacy food tables are created
	* All the tables are loaded accordingly with the USDA food data after creation
*/



-- food
CREATE TABLE IF NOT EXISTS stg.food_sr (
    fdc_id INT PRIMARY KEY,
    data_type VARCHAR(30),
    description TEXT,
    food_category_id INT,
    publication_date VARCHAR(10),

	CONSTRAINT fk_food_category
		FOREIGN KEY (food_category_id)
		REFERENCES stg.food_category(id)
);

-- foundation food
CREATE TABLE IF NOT EXISTS stg.sr_legacy_food (
    fdc_id INT PRIMARY KEY,
    NDB_number INT,

	CONSTRAINT fk_sr_legacy_food_sr
		FOREIGN KEY (fdc_id)
		REFERENCES stg.food_sr(fdc_id)
);

-- food nutrient
CREATE TABLE IF NOT EXISTS stg.food_nutrient_sr (
    id INT PRIMARY KEY,
    fdc_id INT,
    nutrient_id INT,
    amount NUMERIC(8,2),
    data_points VARCHAR(10),
    derivation_id VARCHAR(10),
    min VARCHAR(10),
    max VARCHAR(10),
    median VARCHAR(10),
    footnote TEXT,
    min_year_acquired VARCHAR(20),

	CONSTRAINT fk_food_nutrient_food_sr
		FOREIGN KEY (fdc_id)
		REFERENCES stg.food_sr(fdc_id),

	CONSTRAINT fk_food_nutrient
		FOREIGN KEY (nutrient_id)
		REFERENCES stg.nutrient(id)
);