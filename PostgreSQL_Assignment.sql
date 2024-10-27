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