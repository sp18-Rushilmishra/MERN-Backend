CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT, 
    gender VARCHAR(10),
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15)
);

CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    duration INTERVAL,   
    fee DECIMAL(10, 2)     
);

CREATE TABLE enrollment (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE
);

SELECT * FROM students;

SELECT * FROM courses;

SELECT * FROM enrollment;


INSERT INTO students(student_id , name , age , gender , email , phone) VALUES
(1, 'Aman Sharma', 20, 'Male', 'aman.sharma@example.com', '9876543210'),
(2, 'Bhavna Patel', 22, 'Female', 'bhavna.patel@example.com', '9876543211'),
(3, 'Chirag Verma', 21, 'Male', 'chirag.verma@example.com', '9876543212'),
(4, 'Divya Singh', 23, 'Female', 'divya.singh@example.com', '9876543213'),
(5, 'Esha Gupta', 20, 'Female', 'esha.gupta@example.com', '9876543214'),
(6, 'Farhan Khan', 24, 'Male', 'farhan.khan@example.com', '9876543215'),
(7, 'Gita Nair', 22, 'Female', 'gita.nair@example.com', '9876543216'),
(8, 'Harsh Mehta', 21, 'Male', 'harsh.mehta@example.com', '9876543217'),
(9, 'Isha Roy', 23, 'Female', 'isha.roy@example.com', '9876543218'),
(10, 'Jatin Das', 20, 'Male', 'jatin.das@example.com', '9876543219');

INSERT INTO courses(course_id , course_name , duration , fee ) VALUES
(1, 'Mathematics', '3 months', 1500.00),
(2, 'Physics', '4 months', 2000.00),
(3, 'Chemistry', '3 months', 1800.00),
(4, 'Biology', '4 months', 1900.00),
(5, 'English Literature', '2 months', 1200.00);

INSERT INTO enrollment (enrollment_id, student_id, course_id, enrollment_date) VALUES
(1, 1, 1, '2025-07-01'),
(2, 1, 2, '2025-07-01'),
(3, 2, 2, '2025-07-02'),
(4, 2, 3, '2025-07-02'),
(5, 3, 1, '2025-07-03'),
(6, 3, 5, '2025-07-03'),
(7, 4, 4, '2025-07-04'),
(8, 4, 1, '2025-07-04'),
(9, 5, 5, '2025-07-05'),
(10, 6, 3, '2025-07-06'),
(11, 7, 2, '2025-07-07'),
(12, 7, 4, '2025-07-07'),
(13, 8, 2, '2025-07-08'),
(14, 9, 4, '2025-07-09'),
(15, 10, 3, '2025-07-10');

SELECT gender , COUNT(*) AS total_students
 FROM students
 GROUP BY gender;

 SELECT gender , AVG(age) AS average_age
 FROM students
 GROUP BY gender;

 SELECT gender , MAX(age) AS max_age , MIN(age) AS min_age
 FROM students
 GROUP BY gender;

 SELECT gender , SUM(age) AS total_age
 FROM students
 GROUP BY gender;