--Pre-requisites: database from Homework 1 with some dummy data inserted

CREATE TABLE Student 
(
Id INTEGER PRIMARY KEY NOT NULL,
FirstName varchar(20) NOT NULL,
LastName varchar(30) NOT NULL,
DateOfBirth date NULL,
EnrolledDate date NULL,
Gender nchar(1) NULL,
NationalIDNumber varchar(20) NULL,
StudentCardNumber varchar(10) NULL
);

CREATE TABLE Teacher (
Id INTEGER PRIMARY KEY NOT NULL,
FirstName varchar(20) NOT NULL,
LastName varchar(30) NOT NULL,
DateOfBirth date NULL,
AcademicRank varchar(20) NULL,
HireDate date NULL
);

CREATE TABLE GradeDetails (
Id INTEGER PRIMARY KEY NOT NULL,
GradeID INTEGER NOT NULL,
AchievmentTypeID INTEGER NOT NULL,
AchievmentPoints int NOT NULL,
AchievmentMaxPoints INTEGER NOT NULL,
AchievmentDate date NOT NULL
);


CREATE TABLE Course (
Id INTEGER PRIMARY KEY NOT NULL,
Name varchar(20) NOT NULL,
Credit int NOT NULL,
AcademicYear date NOT NULL,
Semester int NULL
);

CREATE TABLE Grade (
Id INTEGER PRIMARY KEY NOT NULL,
StudentId int NOT NULL,
TeacherId int NOT NULL,
Grade smallint NOT NULL,
Comment varchar(100) NULL,
CreatedDate date NOT NULL
);

CREATE TABLE AchievementType (
Id INTEGER PRIMARY KEY NOT NULL,
Name varchar(20) NOT NULL,
Description varchar(100) NULL,
ParticipationRate float(2)
);

INSERT INTO Student (Id,FirstName,LastName,DateOfBirth,EnrolledDate,Gender,NationalIDNumber,StudentCardNumber)
VALUES (4445, 'Petar', 'Stefanoski','06/08/2003', '01/08/2023', 'M', '112345','4455663'),
(4446, 'Ema', 'Stefanovska','07/09/2003', '07/09/2023', 'F', '113455','4455633');

SELECT * FROM Student;

INSERT INTO Teacher (Id,FirstName,LastName,DateOfBirth,AcademicRank,HireDate)
VALUES (3, 'Sara', 'Angelovka','07/08/1976', 'Proffessor','05/10/2007'),
(33, 'Lea', 'Angelovski','07/08/1975', 'Proffessor','05/10/2007');

SELECT * FROM Teacher;

INSERT INTO GradeDetails (Id,GradeId,AchievmentTypeID,AchievmentPoints,AchievmentMaxPoints,AchievmentDate)
VALUES (54, 666678, 7677, 90, 100,'09/07/2023'),
(56, 66679, 773, 70, 100,'11/07/2023');

SELECT * FROM GradeDetails;

INSERT INTO Course (Id,Name,Credit,AcademicYear,Semester)
VALUES (2, 'HTML', 160,'10/10/2021', 2),
(3, 'CSS', 160,'10/10/2021', 2)

SELECT * FROM Course;

INSERT INTO Grade (Id,StudentId,TeacherId,Grade,Comment,CreatedDate)
VALUES (4, 4445, 8877, 8, 'takes responsibility for learning','04/10/2000'),
(3, 4446, 8878, 9, 'takes responsibility for learning','06/10/2000'),
(3, 4446, 8878, 9, 'takes responsibility for learning','06/10/2000')

SELECT * FROM Grade;

INSERT INTO AchievementType (Id,Name,Description,ParticipationRate,)
VALUES (101, 'E.intelegence test', 'Test the e.intelegence power',79.52),
(103, 'Math test', 'Test the math power',77.51 )

SELECT * FROM AchievementType;

--This above is the data base from Homework 1.
-- HOMEWORK 1/3

--Calculate the count of all grades in the system
SELECT g.grade, count(*) as grade_count
from grade g
group by g.grade

--Calculate the count of all grades per Teacher in the system
select t.id, count(g.grade) as grades_count_per_teacher
from teacher t
inner join grade g on t.id = g.teacherId
group by t.id

--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)
select t.id 
from teacher t
inner join grade g on t.id = g.teacherId
inner join student s on s.id = g.studentId
group by t.id
having count (s.id) < 100

--Find the maximal grade, and the average grade per student on all grades in the system
select avg(grade), max(grade)
from grade g
inner join student s on g.studentId = s.id

--HOMEWORK 2/3

--Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200

select t.id
from grade g
inner join teacher t on g.teacherId = t.id
group by t.id
having count(grade) > 200

--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100) and filter teachers with more than 50 Grade count

SELECT g.teacherId, COUNT(*) AS grade_count
FROM grade g
WHERE g.studentId < 100
GROUP BY g.teacherId
HAVING COUNT(*) > 50

-- Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system. Filter only records where Maximal Grade is equal to Average Grade
select studentId, count(*) as grade_count, avg(g.grade), max(g.grade)
from grade g
inner join student s on g.studentId = s.id
group by studentId
having max(grade) = avg(grade)

-- List Student First Name and Last Name next to the other details from previous query

select studentId, count(*) as grade_count, avg(g.grade), max(g.grade), string_agg(firstName || ', ' || lastName, ', ') as student_names 
from grade g
inner join student s on g.studentId = s.id
group by studentId
having max(grade) = avg(grade)

--HOMEWORK 3/3

--Create new view (vw_StudentGrades) that will List all StudentIds and count of Grades per student
CREATE view student_grades_view as 
select studentId, count (*) as grade_count
from grade g
inner join student s on g.studentId = s.id
group by studentId

select * from student_grades_view 

--Change the view to show Student First and Last Names instead of StudentID

CREATE view student_grades_names_view as 
select studentId, string_agg (firstName || ', ' || lastName, ', ') as student_name, count (*) as grade_count
from grade g
inner join student s on g.studentId = s.id
group by studentId

select * from student_grades_names_view
