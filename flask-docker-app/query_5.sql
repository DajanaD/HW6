-- Знайти які курси читає певний викладач
SELECT t.teacher_name, sub.subject_name
FROM Teachers t
INNER JOIN Subjects sub ON t.teacher_id = sub.teacher_id
WHERE t.teacher_name = 'Your_teacher_name';
