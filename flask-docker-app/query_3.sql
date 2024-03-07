-- Знайти середній бал на потоці (по всій таблиці оцінок)
SELECT AVG(CAST(grade AS FLOAT)) AS average_grade
FROM grades;