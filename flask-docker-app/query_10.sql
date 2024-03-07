--Знайти середній бал у групах з певного предмета
SELECT g.group_name, AVG(CAST(g.grade AS FLOAT)) AS average_grade
FROM students s
JOIN grades g ON s.grades_id = g.student_id
JOIN groups g ON s.group_id = g.student_id
JOIN subjects sub ON g.subject_id = sub.id
WHERE sub.subject_name = 'Armed forces operational officer'
GROUP BY g.id;