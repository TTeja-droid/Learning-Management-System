create database project;
use project;
CREATE TABLE Students2(student_id INT PRIMARY KEY, student_name VARCHAR(100) NOT NULL, 
email VARCHAR(100) UNIQUE NOT NULL, phone VARCHAR(20) NOT NULL,city VARCHAR(50) NOT NULL);

INSERT INTO Students2 VALUES
(101,'Aarav Sharma', 'aarav@gmail.com','9876500001','Hyderabad'),
(102,'Bhavya Reddy', 'bhavya@gmail.com','9876500002','Vijayawada'),
(103,'Charan Kumar', 'charan@gmail.com','9876500003','Visakhapatnam'),
(104,'Divya Patel', 'divya@gmail.com','9876500004','Bengaluru'),
(105,'Esha Gupta', 'esha@gmail.com','9876500005','Chennai'),
(106,'Farhan Ali', 'farhan@gmail.com','9876500006','Mumbai'),
(107,'Gopi Krishna', 'gopi@gmail.com','9876500007','Warangal'),
(108,'Harini Rao', 'harini@gmail.com','9876500008','Guntur'),
(109,'Ishaan Verma', 'ishaan@gmail.com','9876500009','Pune'),
(110,'John Mathew', 'john@gmail.com','9876500010','Kochi');

CREATE TABLE Mentors(mentor_id INT PRIMARY KEY, mentor_name VARCHAR(100) NOT NULL, expertise VARCHAR(100) NOT NULL);

INSERT INTO Mentors VALUES
(201,'Dr. Santhosh Kumar', 'Machine Learning'),
(202,'Priya Nair', 'Data Analytics'),
(203,'Rahul Mehta', 'Web Development'),
(204,'Sneha Reddy', 'Cloud Computing'),
(205,'Arjun Singh', 'Cyber Security');
CREATE TABLE Courses (course_id INT PRIMARY KEY, mentor_id INT NOT NULL, course_name VARCHAR(100) NOT NULL, 
category VARCHAR(50) NOT NULL, duration INT NOT NULL);
INSERT INTO Courses VALUES
(301,201,'Machine Learning','AI',60),
(302,202,'Data Analytics','Analytics',45),
(303,203,'Python Full Stack', 'Web Development',75),
(304,204,'AWS Cloud','Cloud',40),
(305,205,'Cyber Security Basics','Security',35),
(306,202,'Power BI', 'Business Intelligence',30);

CREATE TABLE Enrollment (enrollment_id INT PRIMARY KEY, student_id INT, course_id INT, enroll_date DATE, status VARCHAR(20));
INSERT INTO Enrollment VALUES
(501,101,301,'2026-07-01','Active'),
(502,102,302,'2026-07-02','Completed'),
(503,103,303,'2026-07-03','Active'),
(504,104,304,'2026-07-04','Completed'),
(505,105,305,'2026-07-05','Active'),
(506,106,306,'2026-07-06','Completed'),
(507,107,301,'2026-07-07','Active'),
(508,108,302,'2026-07-08','Completed'),
(509,109,303,'2026-07-09','Dropped'),
(510,110,304,'2026-07-10','Active'),
(511,101,306,'2026-07-11','Completed'),
(512,103,305,'2026-07-12','Active');

CREATE TABLE Assessments (assessment_id INT PRIMARY KEY, student_id INT, course_id INT, assessment_name VARCHAR(100), 
score DECIMAL(5,2), assessment_date DATE);
INSERT INTO Assessments VALUES
(601,101,301,'Quiz 1',85.50,'2026-07-05'),
(602,101,301,'Final Assessment',91.00,'2026-07-15'),
(603,102,302,'Assignment 1',78.00,'2026-07-06'),
(604,102,302,'Final Assessment',88.50,'2026-07-16'),
(605,103,303,'Quiz 1',81.00,'2026-07-07'),
(606,103,303,'Project Evaluation',75.50,'2026-07-17'),
(607,104,304,'Quiz 1',92.00,'2026-07-08'),
(608,104,304,'Final Assessment',89.00,'2026-07-18'),
(609,105,305,'Assignment 1',84.00,'2026-07-09'),
(610,106,306,'Quiz 1',91.50,'2026-07-10'),
(611,107,301,'Assignment 1',80.00,'2026-07-11'),
(612,108,302,'Quiz 2',87.00,'2026-07-12'),
(613,109,303,'Final Assessment',83.50,'2026-07-13'),
(614,110,304,'Project Evaluation',86.00,'2026-07-14'),
(615,101,306,'Dashboard Project',95.00,'2026-07-20');

select *from students2;
select*from mentors;
select*from courses;
select*from enrollmen t;
select*from Assessments;
#1
select student_name from students2;
#9
SELECT *FROM Courses WHERE course_name LIKE '%Data%';
#10
select*from assessments where assessment_date = current_date();
#11
select student_id,course_id,enroll_date, Datediff(curdate(),enroll_date) as days_since_enrollement from enrollment;
#12
select assessment_date, date_format(assessment_date,'%d-%b-%y') as recent_dates from assessments;
#13
select*from enrollment where enroll_date between '2026-07-01' and '2026-07-30';
#14
select course_id,count(student_id) as no_of_students from enrollment group by course_id;
#15
select course_id, avg(score) as avg_score from assessments group by course_id;
#16
select max(score) as heighest_score,min(score) as lowest_score from assessments;
#17
select course_id,count(student_id) as total_students from enrollment group by course_id having count(student_id) > 5;
#18
select s.student_name,c.course_name from students2 s inner join enrollment e on s.student_id=e.student_id inner join courses c on e.course_id=c.course_id;
#19
select c.course_name ,m.mentor_name from courses c inner join mentors m on c.mentor_id=m.mentor_id;
#20
select s.student_name,c.course_name,e.status from students2 s inner join enrollment e on s.student_id = e.student_id inner join courses c on e.course_id = c.course_id;
#21
select a.assessment_id,s.student_name,c.course_name,a.score,a.assessment_date from assessments a inner join students2 s on a.student_id = s.student_id inner join
courses c on a.course_id=c.course_id;
#22
select m.mentor_name,c.course_name from mentors m inner join courses c on m.mentor_id=c.mentor_id;
#23
select s.student_id,s.student_name from students2 s left join enrollment e on s.student_id = e.student_id where e.student_id is null;
#24
select course_id,course_name from courses c; 
#26
select s.student_id,s.student_name,a.score from students2 s inner join assessments a on s.student_id = a.student_id where a.score>(select avg(score)from assessments);
#27
select course_name,duration from courses where duration = (select max(duration) from courses);
#28
select s.student_name,c.course_name,a.score from assessments a inner join students2 s 
on a.student_id = s.student_id inner join courses c on a.course_id = c.course_id 
where a.score=(select max(a2.score) from assessments a2 where a2.course_id = a.course_id);
#29
create view student_course_view as
select s.student_name,c.course_name,e.status from students2 s inner join enrollment e 
on s.student_id =e.student_id inner join courses c on e.course_id = c.course_id;
#30
create view assessment_result_view as
select s.student_name,c.course_name,a.score,a.assessment_date 
from assessments a inner join students2 s on a.student_id = s.student_id 
inner join courses c on a.course_id =c.course_id;
#31
select*from student_course_view;
select*from assessment_result_view;
#32
start transaction; update enrollment set status='completed' where enrollment_id = 501;
#33
update assessments
set score=90 where assessment_id=601; 
savepoint sp1;
#34
rollback to sp1;
#35
commit;
#36
start transaction;
delete from assessments where assessment_id =601;
rollback;
#37
call get_courses_by_category('ai');
#38
call get_student_average(101);
#39

#40

#1
SELECT * FROM Students2;
#2
DELETE FROM Enrollment
WHERE status = 'Dropped';
#4
SELECT UPPER(mentor_name)
FROM Mentors;

SELECT LOWER(course_name)
FROM Courses;
#3
UPDATE Enrollment
SET status = 'Completed'
WHERE student_id = 101
AND status = 'Active';

set sql_safe_updates=0;

#2
DELETE FROM Enrollment
WHERE status = 'Dropped';
