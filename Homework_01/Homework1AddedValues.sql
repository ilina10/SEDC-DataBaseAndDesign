INSERT INTO Student (Id,FirstName,LastName,DateOfBirth,EnrolledDate,Gender,NationalIDNumber,StudentCardNumber)
VALUES (1, 'Viktor', 'Stefanovski','07/08/2003', '07/08/2023', 'M', '1123455','44556633')

SELECT * FROM Student

INSERT INTO Teacher (Id,FirstName,LastName,DateOfBirth,AcademicRank,HireDate)
VALUES (1, 'Marija', 'Angelovska','07/08/1974', 'Proffessor','05/10/2007')

SELECT * FROM Teacher

INSERT INTO GradeDetails (Id,GradeId,AchievmentTypeID,AchievmentPoints,AchievmentMaxPoints,AchievmentDate)
VALUES (55, 66678, 777, 90, 100,'10/07/2023')

SELECT * FROM GradeDetails

INSERT INTO Course (Id,Name,Credit,AcademicYear,Semester)
VALUES (1, 'Database', 280,'10/10/2022', 2)

SELECT * FROM Course

INSERT INTO Grade (Id,StudentId,TeacherId,Grade,Comment,CreatedDate)
VALUES (2, 444, 887, 10, 'takes responsibility forlearning','05/10/2000')

SELECT * FROM Grade

INSERT INTO AchievementType (Id,Name,Description,ParticipationRate)
VALUES (10, 'Speed test', 'Test the speed power',78.53 )

SELECT * FROM AchievementType

