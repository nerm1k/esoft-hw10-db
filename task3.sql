UPDATE students
SET phone_number = '+79322221144', address = 'улица Республики 22'
WHERE student_id = 2;

UPDATE courses
SET description = 'Курс для спортсменов обновленный'
WHERE course_name = 'Физкультура';

UPDATE enrollments
SET grade = 3
WHERE student_id = 1 AND course_id = 2;