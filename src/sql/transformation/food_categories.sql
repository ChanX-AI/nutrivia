/*
===========================================================================================
		Transformation Layer
===========================================================================================
	-> the food categories view is created with just selected columns from the stage layer
*/

CREATE OR REPLACE VIEW tran.vw_food_categories
AS
SELECT
     id,
     TRIM(description) AS name
FROM stg.food_category;

