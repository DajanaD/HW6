--Знайти середній бал, який ставить певний викладач зі своїх предметів
SELECT t.teacher_name, AVG(gr.grade) AS average_grade
FROM Teachers t
INNER JOIN Subjects sub ON t.teacher_id = sub.teacher_id
INNER JOIN Grades gr ON sub.subject_id = gr.subject_id
GROUP BY t.teacher_name;
