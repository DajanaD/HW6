--Знайти список курсів, які відвідує студент
SELECT DISTINCT sub.subject_name
FROM students s
JOIN grades g ON s.id = g.student_id
JOIN subjects sub ON g.subject_id = sub.id
WHERE s.students_name = 'Ian Mcdowell';
