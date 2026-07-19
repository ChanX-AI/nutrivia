/*
===========================================================================================
		Core Layer
===========================================================================================
	-> the food info table consists of all required nutrient info
*/

INSERT INTO core.food_info
SELECT 
	f.id AS id,
	f.name AS name,
	fc.name,
	f.data_type,
	MAX(CASE WHEN n.id = 1008 THEN fn.amount ELSE 0 END) AS energy_kcal,
	MAX(CASE WHEN n.id = 1003 THEN fn.amount ELSE 0 END) AS protein_gm,
	MAX(CASE WHEN n.id = 1005 THEN fn.amount ELSE 0 END) AS carbs_gm,
	MAX(CASE WHEN n.id = 1004 THEN fn.amount ELSE 0 END) AS fats_gm,
	MAX(CASE WHEN n.id = 1079 THEN fn.amount ELSE 0 END) AS fiber_gm,
	MAX(CASE WHEN n.id = 2000 THEN fn.amount ELSE 0 END) AS sugar_gm,
	MAX(CASE WHEN n.id = 1253 THEN fn.amount ELSE 0 END) AS cholesterol_mg,
	MAX(CASE WHEN n.id = 1051 THEN fn.amount ELSE 0 END) AS water_gm
FROM tran.vw_foods f
JOIN tran.vw_food_categories fc
	ON f.category_id = fc.id
JOIN tran.vw_food_nutrients fn
	ON f.id = fn.food_id
JOIN tran.vw_nutrients n
	ON fn.nutrient_id = n.id
GROUP BY 
	f.id, f.name, fc.name, f.data_type;