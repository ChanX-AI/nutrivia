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

-- public food category
DROP TABLE IF EXISTS public.food_category;

CREATE TABLE public.food_category (
    id integer PRIMARY KEY,
    code integer,
    description text
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



