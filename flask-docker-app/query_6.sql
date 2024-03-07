--Знайти список студентів у певній групі
SELECT s.student_name
FROM Students s
INNER JOIN Groups g ON s.group_id = g.group_id
WHERE g.group_name = 'Your_group_name';
