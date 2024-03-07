--Знайти список студентів у певній групі
SELECT s.students_name
FROM students s
JOIN groups g ON s.group_id = g.id
WHERE g.group_name = 'Group 1';