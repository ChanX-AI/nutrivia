from ..config.database import get_connection
from sentence_transformers import SentenceTransformer

model = SentenceTransformer("BAAI/bge-small-en-v1.5")

with get_connection() as conn:
    with conn.cursor() as read_cur, conn.cursor() as write_cur:
        read_cur.execute('SELECT id, name FROM core.food_info')

        for food_id, food_name in read_cur:
            embedding = model.encode(food_name, normalize_embeddings=True)
            write_cur.execute(
                '''
                INSERT INTO ai.food_embeddings (
                    id,
                    embedding
                )
                VALUES (%s, %s)
                ''', 
                (food_id, embedding.tolist())
            )

        conn.commit()
            