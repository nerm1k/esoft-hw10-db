# PostgreSQL
___
### 1. Задание1: Создание таблиц 
Создайте таблицу Students для хранения информации о студентах. Таблица должна содержать следующие поля:
- student_id (тип данных на ваш выбор, первичный ключ, автоинкрементируемый)
- first_name (обязательное поле)
- last_name (обязательное поле)
- date_of_birth (дата рождения, обязательное поле)
- email (уникальное, обязательное поле)
- phone_number (необязательное поле)
- address (необязательное поле)
- enrollment_date (дата зачисления, обязательное поле)
- gpa (средний балл, может быть пустым)


Создайте таблицу Courses для хранения информации о курсах. Таблица должна содержать следующие поля:
- course_id (тип данных на ваш выбор, первичный ключ, автоинкрементируемый)
- course_name (обязательное поле)
- description (необязательное поле)
- credits (обязательное поле, целое число)
- department (обязательное поле)


Создайте таблицу Enrollments для хранения информации о зачислениях студентов на курсы. Таблица должна содержать следующие поля:
- enrollment_id (тип данных на ваш выбор, первичный ключ, автоинкрементируемый)
- student_id (внешний ключ, ссылается на Students.student_id)
- course_id (внешний ключ, ссылается на Courses.course_id)
- enrollment_date (обязательное поле)
- grade (необязательное поле)

### 2. Задание 2: Вставка данных
Напишите SQL-запросы для добавления данных в таблицы Students, Courses и Enrollments. Добавьте по крайней мере 5 студентов, 3 курса и 5 зачислений. Убедитесь, что некоторые из полей grade и phone_number в таблице Students остались пустыми.


### 3. Задание 3: Обновление данных
Напишите SQL-запросы для выполнения следующих операций:
- Обновите информацию о студенте, изменив его адрес и номер телефона.
- Обновите описание одного из курсов.
- Обновите оценку за курс для одного из зачислений.


### 4. Задание 4: Удаление данных
Напишите SQL-запросы для выполнения следующих операций:
- Удалите студента, который был зачислен на курс.
- Удалите курс, который не имеет зачисленных студентов.


### 5. Задание 5: Выборка данных
Напишите SQL-запросы для выполнения следующих операций:
- Получите список всех студентов, зачисленных на определенный курс, отсортированный по фамилии.
- Получите список курсов с указанием количества студентов, зачисленных на каждый курс.
- Получите список студентов, которые имеют средний балл (GPA) выше определенного значения.
- Получите полную информацию о зачислениях (включая имя студента и название курса), произошедших в течение последнего месяца.
- Получите список студентов, у которых нет номера телефона, отсортированный по дате зачисления.
- Получите список курсов, которые проводятся в определенном департаменте, и отсортируйте их по количеству кредитов.
- Получите полную информацию о студентах, включая курсы, на которые они зачислены, и их оценки по этим курсам.
- Получите список студентов, которые зачислены более чем на один курс.
- Получите список студентов, которые зачислены на курсы из разных департаментов.
- Получите список курсов, на которые не зачислен ни один студент.
- Получите список студентов, которые зачислены на все курсы из определенного департамента.
- Найдите студентов, которые зачислены на курс с наибольшим количеством кредитов.
- Получите средний балл (GPA) для каждого студента, который зачислен на курсы, и отсортируйте студентов по этому среднему баллу.
- Получите список студентов, которые были зачислены на курсы в течение последнего года.
- Получите список студентов и их количество курсов, на которые они зачислены, отсортированный по количеству курсов.


### Доп. задания
- Создайте представление (VIEW), которое объединяет информацию о студентах и их зачислениях на курсы.
- Создайте хранимую процедуру для добавления нового студента и автоматического зачисления его на определенный курс.


