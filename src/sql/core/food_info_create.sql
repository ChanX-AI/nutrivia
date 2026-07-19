/*
===========================================================================================
		Core Layer
===========================================================================================
	-> the food info table is a denormalized serving table for users and APIs
*/

CREATE TABLE IF NOT EXISTS core.food_info (
	id				INT PRIMARY KEY,
	name			TEXT,
	category		VARCHAR(40),
	data_type		VARCHAR(10),
	energy_kcal		NUMERIC(8, 4),
	protein_gm		NUMERIC(8, 4),
	carbs_gm		NUMERIC(8, 4),
	fats_gm			NUMERIC(8, 4),
	fiber_gm		NUMERIC(8, 4),
	sugar_gm 	    NUMERIC(8, 4),
	cholesterol_mg  NUMERIC(8, 4),
	water_gm		NUMERIC(8, 4)
);
