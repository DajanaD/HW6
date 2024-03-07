--Знайти студента із найвищим середнім балом з певного предмета
SELECT s.students_name, AVG(CAST(g.grade AS FLOAT)) AS average_grade
FROM students s
JOIN grades g ON s.id = g.student_id
JOIN subjects sub ON g.subject_id = sub.id
WHERE sub.subject_name = 'Armed forces operational officer'
GROUP BY s.id
ORDER BY average_grade DESC
LIMIT 1;
