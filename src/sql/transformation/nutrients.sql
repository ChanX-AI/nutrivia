/*
===========================================================================================
		Transformation Layer
===========================================================================================
	-> the nurients view consists of only selected nutrients
*/

CREATE OR REPLACE VIEW tran.vw_nutrients
AS
SELECT
     id,
     name,
     TRIM(unit_name) AS units
FROM stg.nutrient
WHERE id IN (1008, 1003, 1004, 1079, 2000, 1253, 1051, 1005);