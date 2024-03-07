--Знайти студента із найвищим середнім балом з певного предмета
SELECT s.student_id, s.student_name, AVG(g.grade) AS average_grade
FROM Students s
INNER JOIN Grades g ON s.student_id = g.student_id
INNER JOIN Subjects sub ON g.subject_id = sub.subject_id
WHERE sub.subject_name = 'Your_subject_name'
GROUP BY s.student_id, s.student_name
ORDER BY average_grade DESC
LIMIT 1;