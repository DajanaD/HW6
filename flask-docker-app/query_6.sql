--Знайти оцінки студентів у окремій групі з певного предмета
SELECT s.students_name, g.grade
FROM students s
JOIN grades g ON s.id = g.student_id
JOIN groups gr ON s.group_id = gr.id
JOIN subjects sub ON g.subject_id = sub.id
WHERE gr.group_name = 'Group 1' AND sub.subject_name = 'Psychotherapist, dance movement';
