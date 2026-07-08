-- =====================================
-- sr legacy food tables
-- ======================================

-- food
DROP TABLE IF EXISTS sr_legacy_stg.food;

CREATE TABLE sr_legacy_stg.food (
    fdc_id integer PRIMARY KEY,
    data_type text,
    description text,
    food_category_id integer REFERENCES public.food_category (id),
    publication_date text
);

-- sr_legacy food
DROP TABLE IF EXISTS sr_legacy_stg.sr_legacy_food;

CREATE TABLE sr_legacy_stg.sr_legacy_food (
    fdc_id integer PRIMARY KEY REFERENCES sr_legacy_stg.food (fdc_id),
    ndb_number integer
);

-- food nutrient
DROP TABLE IF EXISTS sr_legacy_stg.food_nutrient;

CREATE TABLE sr_legacy_stg.food_nutrient (
    id integer PRIMARY KEY,
    fdc_id integer REFERENCES sr_legacy_stg.food (fdc_id),
    nutrient_id integer REFERENCES public.nutrient (id),
    amount numeric(8,2),
    data_point text,
    derivation_id text,
    min text,
    max text,
    median text,
    foot_note text,
    min_year_acquired text
);
