--Знайти список курсів, які відвідує студент
SELECT s.student_name, sub.subject_name
FROM Students s
INNER JOIN Grades gr ON s.student_id = gr.student_id
INNER JOIN Subjects sub ON gr.subject_id = sub.subject_id;
