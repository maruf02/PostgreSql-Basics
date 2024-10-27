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

--(Query-1) insert data into student table

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


CREATE TABLE enrollment (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(50) NOT NULL,
    credits INTEGER NOT NULL
);

