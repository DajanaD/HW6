-- Створення таблиці груп
DROP TABLE IF EXISTS groups;
CREATE TABLE groups (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    group_name VARCHAR(100) UNIQUE NOT NULL
);

-- Створення таблиці студентів
DROP TABLE IF EXISTS students;
CREATE TABLE students (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(100) UNIQUE NOT NULL
    group_id INTEGER,
    FOREIGN KEY (group_id) REFERENCES Groups(group_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Створення таблиці викладачів
DROP TABLE IF EXISTS professors;
CREATE TABLE professors (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(100) UNIQUE NOT NULL
);

-- Створення таблиці предметів
DROP TABLE IF EXISTS subjects;
CREATE TABLE subjects (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    subject_name VARCHAR(100),
    professor_id INTEGER,
    FOREIGN KEY (professor_id) REFERENCES Professors(professor_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Створення таблиці оцінок
DROP TABLE IF EXISTS grades;
CREATE TABLE grades (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_id INTEGER,
    subject_id INTEGER,
    grade INTEGER,
    date_received DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
        ON DELETE CASCADE
        ON UPDATE CASCADE
    FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- -- Заповнення таблиці груп
-- INSERT INTO Groups (group_name) VALUES
-- ('Group A'),
-- ('Group B'),
-- ('Group C');

-- -- Заповнення таблиці викладачів
-- INSERT INTO Professors (name) VALUES
-- ('Professor X'),
-- ('Professor Y'),
-- ('Professor Z');

-- -- Заповнення таблиці предметів
-- INSERT INTO Subjects (subject_name, professor_id) VALUES
-- ('Math', 1),
-- ('Physics', 2),
-- ('Chemistry', 3),
-- ('Biology', 1),
-- ('History', 2);

-- -- Заповнення таблиці студентів
-- INSERT INTO Students (name, group_id) VALUES
-- ('Student 1', 1),
-- ('Student 2', 1),
-- ('Student 3', 1),
-- ('Student 4', 2),
-- ('Student 5', 2),
-- ('Student 6', 2),
-- ('Student 7', 3),
-- ('Student 8', 3),
-- ('Student 9', 3);

-- -- Заповнення таблиці оцінок
-- -- Генеруємо 20 випадкових оцінок для кожного студента
-- DO $$DECLARE
--     i INT;
-- BEGIN
--     FOR i IN 1..20 LOOP
--         INSERT INTO Grades (student_id, subject_id, grade, date_received)
--         SELECT
--             student_id,
--             subject_id,
--             FLOOR(RANDOM() * 100) + 1, -- Випадкова оцінка від 1 до 100
--             CURRENT_DATE - (FLOOR(RANDOM() * 50) || ' days')::INTERVAL -- Випадкова дата з останніх 50 днів
--         FROM
--             Students
--             CROSS JOIN Subjects
--         LIMIT 1;
--     END LOOP;
-- END$$;
