#Створення таблиці студентів
CREATE TABLE Students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    group_id INT,
    FOREIGN KEY (group_id) REFERENCES Groups(group_id)
);

#Створення таблиці груп
CREATE TABLE Groups (
    group_id SERIAL PRIMARY KEY,
    group_name VARCHAR(100)
);

#Створення таблиці викладачів
CREATE TABLE Professors (
    professor_id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

# Створення таблиці предметів
CREATE TABLE Subjects (
    subject_id SERIAL PRIMARY KEY,
    subject_name VARCHAR(100),
    professor_id INT,
    FOREIGN KEY (professor_id) REFERENCES Professors(professor_id)
);

# Створення таблиці оцінок
CREATE TABLE Grades (
    grade_id SERIAL PRIMARY KEY,
    student_id INT,
    subject_id INT,
    grade INT,
    date_received DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id)
);

# Заповнення таблиці груп
INSERT INTO Groups (group_name) VALUES
('Group A'),
('Group B'),
('Group C');

# Заповнення таблиці викладачів
INSERT INTO Professors (name) VALUES
('Professor X'),
('Professor Y'),
('Professor Z');

# Заповнення таблиці предметів
INSERT INTO Subjects (subject_name, professor_id) VALUES
('Math', 1),
('Physics', 2),
('Chemistry', 3),
('Biology', 1),
('History', 2);

# Заповнення таблиці студентів
INSERT INTO Students (name, group_id) VALUES
('Student 1', 1),
('Student 2', 1),
('Student 3', 1),
('Student 4', 2),
('Student 5', 2),
('Student 6', 2),
('Student 7', 3),
('Student 8', 3),
('Student 9', 3);

# Заповнення таблиці оцінок
# Генеруємо 20 випадкових оцінок для кожного студента
DO $$DECLARE
    i INT;
BEGIN
    FOR i IN 1..20 LOOP
        INSERT INTO Grades (student_id, subject_id, grade, date_received)
        SELECT
            student_id,
            subject_id,
            FLOOR(RANDOM() * 100) + 1, -- Випадкова оцінка від 1 до 100
            CURRENT_DATE - (FLOOR(RANDOM() * 50) || ' days')::INTERVAL -- Випадкова дата з останніх 50 днів
        FROM
            Students
            CROSS JOIN Subjects
        LIMIT 1;
    END LOOP;
END$$;