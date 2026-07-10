/*
================================================================
	Public Layer
================================================================
	-> All the core food tables are loaded
	
	** Warnings **
		The TRUNCATE command is used before loading into table
*/


-- food data types
TRUNCATE TABLE public.food_data_types;

INSERT INTO public.food_data_types
VALUES
(1, 'foundation'),
(2, 'sr legacy');

-- food categories
TRUNCATE TABLE public.food_categories;

INSERT INTO public.food_categories
SELECT
 id,
 TRIM(description) AS name
FROM common.food_category;

-- foods
TRUNCATE TABLE public.foods CASCADE;

INSERT INTO public.foods
SELECT
	f.fdc_id AS id,
	TRIM(f.description) AS name,
	f.food_category_id AS category_id,
	1 AS data_type_id
FROM foundation.food f
JOIN foundation.foundation_food ff
	ON f.fdc_id = ff.fdc_id
UNION ALL
SELECT
	f.fdc_id AS id,
	TRIM(f.description) AS name,
	f.food_category_id AS category_id,
	2 AS data_type_id
FROM sr_legacy.food f
JOIN sr_legacy.sr_legacy_food sf
	ON f.fdc_id = sf.fdc_id;
	
-- core nutrients
TRUNCATE TABLE public.core_nutrients CASCADE;

INSERT INTO public.core_nutrients
SELECT
	id,
	name,
	TRIM(unit_name) AS units
FROM common.nutrient
WHERE id IN (1008, 1003, 1004, 1079, 2000, 1253, 1051, 1005, 1079);

-- food nutrients
TRUNCATE TABLE public.food_nutrients;

INSERT INTO public.food_nutrients
SELECT
	f.fdc_id AS food_id,
	n.id AS nutrient_id,
	fn.amount
FROM foundation.food f
JOIN foundation.foundation_food ff
	ON f.fdc_id = ff.fdc_id
JOIN foundation.food_nutrient fn
	ON f.fdc_id = fn.fdc_id
JOIN public.core_nutrients n
	ON fn.nutrient_id = n.id
UNION ALL
SELECT
	f.fdc_id AS food_id,
	n.id AS nutrient_id,
	fn.amount
FROM sr_legacy.food f
JOIN sr_legacy.sr_legacy_food sf
	ON f.fdc_id = sf.fdc_id
JOIN sr_legacy.food_nutrient fn
	ON f.fdc_id = fn.fdc_id
JOIN public.core_nutrients n
	ON fn.nutrient_id = n.id;
	
