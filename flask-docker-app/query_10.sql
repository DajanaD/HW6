--Список курсів, які певному студенту читає певний викладач
SELECT s.student_name, sub.subject_name
FROM Students s
INNER JOIN Grades gr ON s.student_id = gr.student_id
INNER JOIN Subjects sub ON gr.subject_id = sub.subject_id
INNER JOIN Teachers t ON sub.teacher_id = t.teacher_id
WHERE s.student_name = 'Your_student_name' AND t.teacher_name = 'Your_teacher_name';
