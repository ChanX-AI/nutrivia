/*
  =========================================
    Stage Layer - common tables
  =========================================
       * tables that are common to foundation and sr legacy are created
	   * All tables are loaded accordingly with the USDA food data after creation
	   * nutrient table is loaded with extra record (2066, 'UNKNOWN', NULL, NULL, NULL)
*/

-- nutrient
CREATE TABLE IF NOT EXISTS stg.nutrient (
    id INT PRIMARY KEY,
    name TEXT,
    unit_name VARCHAR(20),
    nutrient_nbr VARCHAR(20),
    rank VARCHAR(20)
);

-- food category
CREATE TABLE IF NOT EXISTS stg.food_category (
  id INT PRIMARY KEY,
  code INT,
  description TEXT
);
