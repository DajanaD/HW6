-- Знайти які курси читає певний викладач
SELECT sub.subject_name
FROM subjects sub
JOIN professors p ON sub.professor_id = p.id
WHERE p.professors_name = 'Daniel Miller';
