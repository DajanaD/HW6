--Знайти оцінки студентів у окремій групі з певного предмета
SELECT s.student_name, gr.grade
FROM Students s
INNER JOIN Grades gr ON s.student_id = gr.student_id
INNER JOIN Subjects sub ON gr.subject_id = sub.subject_id
INNER JOIN Groups g ON s.group_id = g.group_id
WHERE g.group_name = 'Your_group_name' AND sub.subject_name = 'Your_subject_name';
