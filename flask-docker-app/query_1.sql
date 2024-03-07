-- Знайти 5 студентів із найбільшим середнім балом з усіх предметів
SELECT s.students_name, AVG(CAST(g.grade AS FLOAT)) AS average_grade
FROM students s
JOIN grades g ON s.id = g.student_id
GROUP BY s.id
ORDER BY average_grade DESC
LIMIT 5;