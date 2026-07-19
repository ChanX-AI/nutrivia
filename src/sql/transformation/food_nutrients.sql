/*
===========================================================================================
		Transformation Layer
===========================================================================================
	-> the food nutrients view integrates both the food nutrient data
*/

CREATE OR REPLACE VIEW tran.vw_food_nutrients
AS
SELECT
     f.fdc_id AS food_id,
     n.id AS nutrient_id,
     fn.amount
FROM stg.food_ff f
JOIN stg.foundation_food ff
     ON f.fdc_id = ff.fdc_id
JOIN stg.food_nutrient_ff fn
     ON f.fdc_id = fn.fdc_id
JOIN tran.vw_nutrients n
     ON fn.nutrient_id = n.id
UNION ALL
SELECT
     f.fdc_id AS food_id,
     n.id AS nutrient_id,
     fn.amount
FROM stg.food_sr f
JOIN stg.sr_legacy_food sf
     ON f.fdc_id = sf.fdc_id
JOIN stg.food_nutrient_sr fn
     ON f.fdc_id = fn.fdc_id
JOIN tran.vw_nutrients n
     ON fn.nutrient_id = n.id;