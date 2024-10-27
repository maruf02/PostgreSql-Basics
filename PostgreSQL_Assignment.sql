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
