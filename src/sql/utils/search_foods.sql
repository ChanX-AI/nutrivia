CREATE OR REPLACE FUNCTION ai.search_foods(
	query_embedding VECTOR(384),
	top_k INT DEFAULT 5
)
RETURNS TABLE(
	id INT,
	name TEXT,
	similarity FLOAT
)
LANGUAGE SQL
AS $$
	SELECT
		f.id,
		f.name,
		1 - (e.embedding <=> query_embedding) AS similarity
	FROM core.food_info f
	JOIN ai.food_embeddings e
		ON f.id = e.id
	ORDER BY e.embedding <=> query_embedding
	LIMIT top_k;
$$;


