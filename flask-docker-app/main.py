import sqlite3


    # Підключення до бази даних SQLite
conn = sqlite3.connect('database.db')
cur = conn.cursor()

# Функція для виконання запитів з файлу
def execute_query_from_file(file_name):
    with open(file_name, 'r') as file:
        query = file.read()
        cur.execute(query)
        rows = cur.fetchall()
        for row in rows:
            print(row)


if __name__ == '__main__':
    # Виконання запитів
    for i in range(1, 11):
        file_name = f'query_{i}.sql'
        print(f'Query {i}:')
        execute_query_from_file(file_name)
        print()

    # Закриваємо з'єднання
    cur.close()
    conn.close()
