--Знайти середній бал, який ставить певний викладач зі своїх предметів
SELECT p.professors_name, AVG(CAST(g.grade AS FLOAT)) AS average_grade
FROM grades g
JOIN subjects sub ON g.subject_id = sub.id
JOIN professors p ON sub.professor_id = p.id
GROUP BY p.id;
