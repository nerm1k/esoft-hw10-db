-- Создайте представление (VIEW), которое объединяет информацию о студентах и их зачислениях на курсы.
CREATE VIEW students_enrollments AS
	SELECT s.*, e.enrollment_date AS course_enrollment_date, e.grade, c.*
	FROM students s
	LEFT JOIN enrollments e ON s.student_id = e.student_id
	LEFT JOIN courses c ON e.course_id = c.course_id;

SELECT *
FROM students_enrollments;

-- Создайте хранимую процедуру для добавления нового студента и автоматического зачисления его на определенный курс.
CREATE PROCEDURE insert_student_and_course(IN first_name VARCHAR(32), IN last_name VARCHAR(32), IN date_of_birth DATE, IN email VARCHAR(64), IN phone_number VARCHAR(12), IN address VARCHAR(255), IN enrollment_date DATE, IN gpa NUMERIC(3, 2), IN course_id INT)
LANGUAGE SQL
AS $$
INSERT INTO students(first_name, last_name, date_of_birth, email, phone_number, address, enrollment_date) VALUES
	(first_name, last_name, date_of_birth, email, phone_number, address, enrollment_date);
INSERT INTO enrollments(student_id, course_id, enrollment_date, grade) VALUES 
	(currval('student_id_seq'), course_id, NOW(), NULL);
$$;

CALL insert_student_and_course('Николаев', 'Николай', '2002-11-15', 'nikolaev@gmail.com', '+79994443222', 'город Тюмень', '2024-05-08', 4.25, 3);