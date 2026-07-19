/*
==========================================================================
				AI Layer
==========================================================================
	-> creating food embeddings table that holds embeddings of food items
*/

CREATE TABLE IF NOT EXISTS ai.food_embeddings (
	id INT PRIMARY KEY,
	embedding VECTOR(384)
);