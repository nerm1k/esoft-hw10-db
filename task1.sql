CREATE SEQUENCE student_id_seq;

CREATE TABLE students(
	student_id INT DEFAULT nextval('student_id_seq') PRIMARY KEY,
	first_name VARCHAR(32) NOT NULL,
	last_name VARCHAR(32) NOT NULL,
	date_of_birth date NOT NULL,
	email VARCHAR(64) NOT NULL UNIQUE,
	phone_number VARCHAR(12),
	address VARCHAR(255),
	enrollment_date DATE NOT NULL,
	gpa NUMERIC(3, 2)
);

CREATE SEQUENCE course_id_seq;

CREATE TABLE courses(
	course_id INT DEFAULT nextval('course_id_seq') PRIMARY KEY,
	course_name VARCHAR(64) NOT NULL,
	description TEXT,
	credits INT NOT NULL,
	department VARCHAR(64) NOT NULL
);

CREATE SEQUENCE enrollment_id_seq;

CREATE TABLE enrollments(
	enrollment_id INT DEFAULT nextval('enrollment_id_seq') PRIMARY KEY,
	student_id INT NOT NULL,
	course_id INT NOT NULL,
	enrollment_date DATE NOT NULL,
	grade INT,
	CONSTRAINT fk_student FOREIGN KEY(student_id) REFERENCES students(student_id),
	CONSTRAINT fk_course FOREIGN KEY(course_id) REFERENCES courses(course_id)
);

