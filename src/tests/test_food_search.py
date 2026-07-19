from ..config.database import get_connection
from sentence_transformers import SentenceTransformer

model = SentenceTransformer("BAAI/bge-small-en-v1.5")

with get_connection() as conn:
    with conn.cursor() as cur:
        user_input = 'banana'
        input_embedding = model.encode(user_input).tolist()

        cur.execute('SELECT * FROM ai.search_foods(%s, 10)', (str(input_embedding),))
        result = cur.fetchall()

        for id, food, similarity in result:
            print(id, food)