'''
    A database connection is created using psycopg
'''

import psycopg
from .settings import Settings

def get_connection():
    try:
        connection = psycopg.connect(
            host=Settings.DB_HOST,
            port=Settings.DB_PORT,
            dbname=Settings.DB_NAME,
            user=Settings.DB_USER,
            password=Settings.DB_PASSWORD
        )
    except psycopg.Error as e:
        raise ConnectionError("connection failed", e)
    
    return connection
