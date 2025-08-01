DROP TABLE IF EXISTS enrollment;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS students;

CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT, 
    gender VARCHAR(10),
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) UNIQUE -- Added unique here from start
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

-- Inserting data, removing explicit serial IDs for auto increment
INSERT INTO students(name, age, gender, email, phone) VALUES
('Aman Sharma', 20, 'Male', 'aman.sharma@example.com', '9876543210'),
('Bhavna Patel', 22, 'Female', 'bhavna.patel@example.com', '9876543211'),
('Chirag Verma', 21, 'Male', 'chirag.verma@example.com', '9876543212'),
('Divya Singh', 23, 'Female', 'divya.singh@example.com', '9876543213'),
('Esha Gupta', 20, 'Female', 'esha.gupta@example.com', '9876543214'),
('Farhan Khan', 24, 'Male', 'farhan.khan@example.com', '9876543215'),
('Gita Nair', 22, 'Female', 'gita.nair@example.com', '9876543216'),
('Harsh Mehta', 21, 'Male', 'harsh.mehta@example.com', '9876543217'),
('Isha Roy', 23, 'Female', 'isha.roy@example.com', '9876543218'),
('Jatin Das', 20, 'Male', 'jatin.das@example.com', '9876543219');

INSERT INTO courses(course_name, duration, fee) VALUES
('Mathematics', INTERVAL '3 months', 1500.00),
('Physics', INTERVAL '4 months', 2000.00),
('Chemistry', INTERVAL '3 months', 1800.00),
('Biology', INTERVAL '4 months', 1900.00),
('English Literature', INTERVAL '2 months', 1200.00);

INSERT INTO enrollment(student_id, course_id, enrollment_date) VALUES
(1, 1, '2025-07-01'),
(1, 2, '2025-07-01'),
(2, 2, '2025-07-02'),
(2, 3, '2025-07-02'),
(3, 1, '2025-07-03'),
(3, 5, '2025-07-03'),
(4, 4, '2025-07-04'),
(4, 1, '2025-07-04'),
(5, 5, '2025-07-05'),
(6, 3, '2025-07-06'),
(7, 2, '2025-07-07'),
(7, 4, '2025-07-07'),
(8, 2, '2025-07-08'),
(9, 4, '2025-07-09'),
(10, 3, '2025-07-10');

-- 1. List students with courses
SELECT s.name AS student_name, c.course_name
FROM students s
JOIN enrollment e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
ORDER BY s.student_id;

-- 2. Number of enrolled students per course
SELECT c.course_name, COUNT(e.student_id) AS enrolled_students
FROM courses c
LEFT JOIN enrollment e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;

-- 3. Students not enrolled in any course
SELECT s.*
FROM students s
LEFT JOIN enrollment e ON s.student_id = e.student_id
WHERE e.student_id IS NULL;

-- 4. Students enrolled in more than one course
SELECT s.student_id, s.name, COUNT(e.course_id) AS num_courses
FROM students s
JOIN enrollment e ON s.student_id = e.student_id
GROUP BY s.student_id, s.name
HAVING COUNT(e.course_id) > 1;

-- 5. Courses without any enrolled students
SELECT c.*
FROM courses c
LEFT JOIN enrollment e ON c.course_id = e.course_id
WHERE e.course_id IS NULL;

-- 6. Student enrolled most recently
SELECT s.*, e.enrollment_date
FROM enrollment e
JOIN students s ON e.student_id = s.student_id
ORDER BY e.enrollment_date DESC
LIMIT 1;

-- 7. Update fee for Mathematics course
UPDATE courses
SET fee = 5500 -- corrected column name and new fee
WHERE course_name = 'Mathematics';

-- 8. Remove all enrollments for a dropped-out student (example student_id = 5)
DELETE FROM enrollment WHERE student_id = 5;

-- 9. Update duration for a course (example course_name = 'Computer Science')
-- Note: Since Computer Science course does NOT exist, just showing how:
UPDATE courses
SET duration = INTERVAL '18 weeks'
WHERE course_name = 'Computer Science';

-- 10. Unique constraint on phone column already added in CREATE TABLE.

-- 11. Add an index on enrollment_date column
CREATE INDEX idx_enrollmentdate ON enrollment(enrollment_date);

-- 12. Add CHECK constraint for minimum course fee (must be >= 1000)
ALTER TABLE courses
ADD CONSTRAINT chk_fee_min CHECK (fee >= 1000);

-- 13. Count total students
SELECT COUNT(*) AS total_students FROM students;

-- 14. Calculate total fees of all courses
SELECT SUM(fee) AS total_fees FROM courses;

-- 15. Calculate average age of students
SELECT AVG(age) AS average_age FROM students;

-- 16. Find minimum course fee
SELECT MIN(fee) AS lowest_fee FROM courses;

-- 17. Find maximum course fee
SELECT MAX(fee) AS highest_fee FROM courses;
