-- TASK_01

CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    "group" VARCHAR(20)
);

CREATE TABLE grades (
    id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(id),
    subject VARCHAR(50),
    grade INT
);

-- TASK_02

INSERT INTO students (name, age, "group") VALUES
('Ali', 19, 'Group A'),
('Laylo', 21, 'Group B'),
('Vali', 22, 'Group A'),
('Dilnoza', 20, 'Group C'),
('Javlon', 23, 'Group B');

INSERT INTO grades (student_id, subject, grade) VALUES
(1, 'Math', 90),
(1, 'Physics', 80),
(2, 'Math', 95),
(2, 'History', 89),
(3, 'Physics', 76),
(3, 'Math', 88),
(4, 'Chemistry', 70),
(4, 'Biology', 75),
(5, 'Math', 92),
(5, 'History', 85);

-- TASK_03

SELECT name, "group"
FROM students;

-- TASK_04

SELECT s.name, s."group", g.subject, g.grade
FROM students s
JOIN grades g ON s.id = g.student_id;

-- TASK_05

SELECT name, age, "group"
FROM students
WHERE age > 20;

-- TASK_06

SELECT s.name, AVG(g.grade) AS average_grade
FROM students s
JOIN grades g ON s.id = g.student_id
GROUP BY s.name;

-- TASK_07

SELECT "group", COUNT(*) AS student_count
FROM students
GROUP BY "group";

-- TASK_08

SELECT s.name, g.subject, g.grade
FROM students s
JOIN grades g ON s.id = g.student_id
WHERE g.grade = (SELECT MAX(grade) FROM grades);


-- TASK_09

SELECT name, "group"
FROM students
WHERE name LIKE 'A%';

-- TASK_10

DELETE FROM students
WHERE "group" = 'Group C';

