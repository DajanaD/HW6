-- Знайти 5 студентів із найбільшим середнім балом з усіх предметів
SELECT s.student_id, s.student_name, AVG(g.grade) AS average_grade
FROM Students s
INNER JOIN Grades g ON s.student_id = g.student_id
GROUP BY s.student_id, s.student_name
ORDER BY average_grade DESC
LIMIT 5;