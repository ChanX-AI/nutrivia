/*
================================================================
	Public Layer
================================================================
	-> All the core food tables are created
	
	** Warnings **
		The drop command is used before creating a table
*/

-- public nutrient
DROP TABLE IF EXISTS public.nutrient;

CREATE TABLE public.nutrient (
    id integer PRIMARY KEY,
    name text,
    unit_name text,
    nutrient_nbr text,
    rank text
);

-- food data types
DROP TABLE IF EXISTS public.food_data_types;

CREATE TABLE public.food_data_types (
	id integer PRIMARY KEY,
	name text
);

-- food categories
DROP TABLE IF EXISTS public.food_categories;

CREATE TABLE public.food_categories (
	id integer PRIMARY KEY,
	name text
);

-- foods
DROP TABLE IF EXISTS public.foods;

CREATE TABLE public.foods (
	id integer PRIMARY KEY,
	name text,
	category_id integer,
	data_type_id integer
);

-- core nutrients
DROP TABLE IF EXISTS public.core_nutrients;

CREATE TABLE public.core_nutrients (
	id integer PRIMARY KEY,
	name text,
	units text
);

DROP TABLE IF EXISTS public.food_nutrients;

CREATE TABLE public.food_nutrients (
	food_id integer REFERENCES public.foods (id),
	nutrient_id integer REFERENCES public.core_nutrients (id),
	amount integer
);

-- food info view

CREATE VIEW public.vw_food_info
SELECT 
	f.id AS id, 
	MAX(CASE WHEN n.id = 1008 THEN fn.amount END) AS energy_kcal,
	MAX(CASE WHEN n.id = 1003 THEN fn.amount END) AS protein_gm,
	MAX(CASE WHEN n.id = 1005 THEN fn.amount END) AS carbs_gm,
	MAX(CASE WHEN n.id = 1004 THEN fn.amount END) AS fats_gm,
	MAX(CASE WHEN n.id = 2000 THEN fn.amount END) AS sugar_gm,
	MAX(CASE WHEN n.id = 1253 THEN fn.amount END) AS cholesterol_mg,
	MAX(CASE WHEN n.id = 1051 THEN fn.amount END) AS water_gm
FROM public.foods f
JOIN public.food_nutrients fn
	ON f.id = fn.fdc_id
JOIN public.nutrients n
	ON fn.nutrient_id = n.id
GROUP BY f.id;
