-- обновил констрейнты, чтобы при удалении записи из основной таблицы в дочерней таблице записи тоже удалялись
ALTER TABLE enrollments  
DROP CONSTRAINT fk_student,   
ADD CONSTRAINT fk_student FOREIGN KEY (student_id)
REFERENCES students (student_id) ON DELETE CASCADE;

ALTER TABLE enrollments  
DROP CONSTRAINT fk_course,   
ADD CONSTRAINT fk_course FOREIGN KEY (course_id)
REFERENCES courses (course_id) ON DELETE CASCADE;

-- удалил студентов, которые записаны на один курс и имеющих айди меньше 4
DELETE FROM students
WHERE student_id = (
	SELECT student_id
	FROM enrollments
	GROUP BY student_id
	HAVING COUNT(*) = 1 AND student_id < 4
);

-- добавил для теста, чтобы в enrollments не было упоминаний записи на этот курс
INSERT INTO courses(course_name, description, credits, department) VALUES
	('Литература', NULL, 11, 'Литературное отделение');

-- удалил курсы, которые не упоминаются в enrollments
DELETE FROM courses
WHERE course_id NOT IN (
	SELECT course_id
	FROM enrollments
	GROUP BY course_id
);