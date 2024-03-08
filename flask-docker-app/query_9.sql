--Список курсів, які певному студенту читає певний викладач
SELECT sub.subject_name
FROM students s
JOIN grades g ON s.id = g.student_id
JOIN subjects sub ON g.subject_id = sub.id
JOIN professors p ON sub.professor_id = p.id
WHERE s.students_name = 'Ian Mcdowell' AND p.professors_name = 'Bryce Bauer';
