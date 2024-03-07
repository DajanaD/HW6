--Знайти середній бал у групах з певного предмета
SELECT g.group_id, g.group_name, AVG(grade) AS average_grade
FROM Grades gr
INNER JOIN Students s ON gr.student_id = s.student_id
INNER JOIN Groups g ON s.group_id = g.group_id
INNER JOIN Subjects sub ON gr.subject_id = sub.subject_id
WHERE sub.subject_name = 'Your_subject_name'
GROUP BY g.group_id, g.group_name;