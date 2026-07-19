/*
===========================================================================================
		Transformation Layer
===========================================================================================
	-> the foods view integrates food data from foundation foods and sr legacy foods
*/

CREATE OR REPLACE VIEW tran.vw_foods
AS
SELECT
     f.fdc_id AS id,
     TRIM(f.description) AS name,
     f.food_category_id AS category_id,
     'foundation' AS data_type
FROM stg.food_ff f
JOIN stg.foundation_food ff
     ON f.fdc_id = ff.fdc_id
UNION ALL
SELECT
     f.fdc_id AS id,
     TRIM(f.description) AS name,
     f.food_category_id AS category_id,
     'sr-legacy' AS data_type
FROM stg.food_sr f
JOIN stg.sr_legacy_food sf
     ON f.fdc_id = sf.fdc_id;