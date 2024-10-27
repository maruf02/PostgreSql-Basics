-- Active: 1730033919211@@127.0.0.1@5432@university_db

-- create databade named university_db.
CREATE DATABASE university_db;
 
 -- Creating student table

 CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    age INTEGER NOT NULL,
    email VARCHAR(100) NOT NULL,
    frontend_mark INTEGER,
    backend_mark INTEGER,
    status VARCHAR(20)
);

--(Optional) insert data into student table

INSERT INTO students (student_name, age, email, frontend_mark, backend_mark, status) VALUES
('Sameer', 21, 'sameer@example.com', 48, 60, NULL),
('Zoya', 23, 'zoya@example.com', 52, 58, NULL),
( 'Nabil', 22, 'nabil@example.com', 37, 46, NULL),
( 'Rafi', 24, 'rafi@example.com', 41, 40, NULL),
('Sophia', 22, 'sophia@example.com', 50, 52, NULL),
( 'Hasan', 23, 'hasan@gmail.com', 43, 39, NULL);



-- (optional) see all data for student table
select * from students

-- creating courses table

CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(50) NOT NULL,
    credits INTEGER NOT NULL
);

INSERT INTO courses (course_name, credits) VALUES
('Next.js', 3),
('React.js', 4),
('Databases', 3),
('Prisma', 3);

-- (optional) see all data for student table
select * from courses

-- create enrollment table
CREATE TABLE enrollment (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INTEGER REFERENCES students(student_id),
    course_id INTEGER REFERENCES courses(course_id)
);

-- insert data into enrollment table with foreign key in student id and courses id

INSERT INTO enrollment (student_id, course_id) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 2);


-- (optional) see all data from enrollment table
select * from enrollment

-- (Query 1): Insert a new student record
INSERT INTO students (student_name, age, email, frontend_mark, backend_mark, status)
VALUES ('Md Rashiduzzaman MAruf', 28, 'rashiduzzaman99@gmail.com', 95, 89, NULL);


-- (Query-2)=> Retrieve the names of all students who are enrolled in the course titled 'Next.js'.
SELECT s.student_name
FROM students s
JOIN enrollment e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE c.course_name = 'Next.js';



-- Query 3: Update the status of the student with the highest total (frontend_mark + backend_mark) to 'Awarded'.
UPDATE students
SET status = 'Awarded'
WHERE (frontend_mark + backend_mark) = (
    SELECT MAX(frontend_mark + backend_mark) FROM students
);


-- Query 4: Delete all courses that have no students enrolled.
DELETE FROM courses
WHERE course_id NOT IN (SELECT DISTINCT course_id FROM enrollment);



-- Query 5: Retrieve the names of students using a limit of 2, starting from the 3rd student.
SELECT student_name
FROM students
ORDER BY student_id
OFFSET 2
LIMIT 2;



-- Query 6: Retrieve the course names and the number of students enrolled in each course.
SELECT c.course_name, COUNT(e.student_id) AS students_enrolled
FROM courses c
LEFT JOIN enrollment e ON c.course_id = e.course_id
GROUP BY c.course_name;



-- Query 7: Calculate and display the average age of all students
SELECT ROUND(AVG(age), 2) AS average_age
FROM students;

-- Query 8: Retrieve names of students whose email contains 'example.com'
SELECT student_name
FROM students
WHERE email LIKE '%example.com%';

SELECT student_name
FROM students
WHERE email NOT LIKE '%example.com%';























