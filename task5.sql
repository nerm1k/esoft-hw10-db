-- 1. Получите список всех студентов, зачисленных на определенный курс, отсортированный по фамилии.
SELECT students.student_id, first_name, last_name, course_name
FROM students
LEFT JOIN enrollments ON students.student_id = enrollments.student_id
LEFT JOIN courses ON courses.course_id = enrollments.course_id
WHERE course_name = 'Математика'
ORDER BY last_name ASC;

-- 2. Получите список курсов с указанием количества студентов, зачисленных на каждый курс
SELECT c.course_id, course_name, COUNT(*) AS students_count
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id;

-- 3. Получите список студентов, которые имеют средний балл (GPA) выше определенного значения.
SELECT *
FROM students
WHERE gpa > 4;

-- 4. Получите полную информацию о зачислениях (включая имя студента и название курса), произошедших в течение последнего месяца.
SELECT enrollment_id, e.enrollment_date, grade, first_name, last_name, course_name
FROM enrollments e
LEFT JOIN students s ON e.student_id = s.student_id
LEFT JOIN courses c ON e.course_id = c.course_id
WHERE e.enrollment_date >= CURRENT_DATE - INTERVAL '1' MONTH;

-- 5. Получите список студентов, у которых нет номера телефона, отсортированный по дате зачисления.
SELECT *
FROM students
WHERE phone_number IS NULL
ORDER BY enrollment_date ASC;

-- 6. Получите список курсов, которые проводятся в определенном департаменте, и отсортируйте их по количеству кредитов.
SELECT *
FROM courses
WHERE department = 'Математическое отделение'
ORDER BY credits ASC;

-- 7. Получите полную информацию о студентах, включая курсы, на которые они зачислены, и их оценки по этим курсам.
SELECT s.*, course_name, grade
FROM students s
LEFT JOIN enrollments e ON e.student_id = s.student_id
LEFT JOIN courses c ON c.course_id = e.course_id;

-- 8. Получите список студентов, которые зачислены более чем на один курс.
SELECT student_id, COUNT(*) as courses_count
FROM enrollments s
GROUP BY student_id
HAVING COUNT(*) > 1;

-- 9. Получите список студентов, которые зачислены на курсы из разных департаментов.
SELECT student_id, COUNT(DISTINCT c.department) AS departments_count
FROM enrollments e
LEFT JOIN courses c ON e.course_id = c.course_id
GROUP BY student_id
HAVING COUNT(DISTINCT c.department) > 1;

-- 10. Получите список курсов, на которые не зачислен ни один студент.
SELECT c.*, COUNT(*) AS courses_count
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id
HAVING COUNT(*) = 0;

-- 11. Получите список студентов, которые зачислены на все курсы из определенного департамента.
SELECT student_id, department, COUNT(*) as courses_count
FROM enrollments e
LEFT JOIN courses c ON e.course_id = c.course_id
WHERE department = 'Математическое отделение'
GROUP BY student_id, department
HAVING COUNT(*) = (
	SELECT COUNT(*) as courses_count
	FROM courses
	WHERE department = 'Математическое отделение'
	GROUP BY department
);

-- 12. Найдите студентов, которые зачислены на курс с наибольшим количеством кредитов.
SELECT student_id
FROM enrollments
WHERE course_id = (
	SELECT course_id
	FROM courses
	ORDER BY credits DESC
	LIMIT 1
);

-- 13. Получите средний балл (GPA) для каждого студента, который зачислен на курсы, и отсортируйте студентов по этому среднему баллу.
SELECT s.student_id, gpa
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id
HAVING COUNT(*) > 0
ORDER BY gpa ASC;

-- 14. Получите список студентов, которые были зачислены на курсы в течение последнего года.
SELECT student_id, enrollment_date
FROM enrollments
WHERE enrollment_date >= CURRENT_DATE - INTERVAL '1' YEAR;

-- 15. Получите список студентов и их количество курсов, на которые они зачислены, отсортированный по количеству курсов.
SELECT student_id, COUNT(*) AS courses_count
FROM enrollments
GROUP BY student_id
ORDER BY courses_count ASC;
