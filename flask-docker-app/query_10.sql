--Знайти середній бал у групах з певного предмета
SELECT subjects.subject_name, students.students_name,professors.professors_name,grades.date_received,grades.grade 
FROM subjects
INNER JOIN grades ON subjects.id = grades.subject_id
INNER JOIN students ON grades.student_id = students.id
INNER JOIN professors ON subjects.professor_id = professors.id
WHERE students.students_name  = 'Ian Mcdowell' AND professors.professors_name = 'Bryce Bauer'
GROUP BY subjects.subject_name , students.students_name , professors.professors_name;