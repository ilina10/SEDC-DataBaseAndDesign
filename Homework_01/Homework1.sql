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
)

SELECT * FROM Student;

CREATE TABLE Teacher (
Id INTEGER PRIMARY KEY NOT NULL,
FirstName varchar(20) NOT NULL,
LastName varchar(30) NOT NULL,
DateOfBirth date NULL,
AcademicRank varchar(20) NULL,
HireDate date NULL
)

SELECT * FROM Teacher;

CREATE TABLE GradeDetails (
Id INTEGER PRIMARY KEY NOT NULL,
GradeID INTEGER NOT NULL,
AchievmentTypeID INTEGER NOT NULL,
AchievmentPoints int NOT NULL,
AchievmentMaxPoints INTEGER NOT NULL,
AchievmentDate date NOT NULL
)

SELECT * FROM GradeDetails;

CREATE TABLE Course (
Id INTEGER PRIMARY KEY NOT NULL,
Name varchar(20) NOT NULL,
Credit int NOT NULL,
AcademicYear date NOT NULL,
Semester int NULL
)

SELECT * FROM Course;

CREATE TABLE Grade (
Id INTEGER PRIMARY KEY NOT NULL,
StudentId int NOT NULL,
TeacherId int NOT NULL,
Grade smallint NOT NULL,
Comment varchar(100) NULL,
CreatedDate date NOT NULL
)

SELECT * FROM Grade;

CREATE TABLE AchievementType (
Id INTEGER PRIMARY KEY NOT NULL,
Name varchar(20) NOT NULL,
Description varchar(100) NULL,
ParticipationRate float(2)
)
SELECT * FROM AchievementType;