DEPARTMENTS TABLE:-

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);

INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
(1, 'Computer Science'),
(2, 'Mathematics');


STUDENTS TABLE:-

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100),
    BirthDate DATE,
    EnrollmentDate DATE
);

INSERT INTO Students
(StudentID, FirstName, LastName, Email, BirthDate, EnrollmentDate)
VALUES
(1, 'John', 'Doe', 'john@email.com', '2000-01-15', '2022-08-01'),
(2, 'Jane', 'Smith', 'jane@email.com', '1999-05-25', '2021-08-01'),
(3, 'Rahul', 'Mehta', 'rahul@email.com', '2001-03-10', '2023-01-15'),
(4, 'Priya', 'Shah', 'priya@email.com', '2000-07-20', '2023-07-10'),
(5, 'Neha', 'Patel', 'neha@email.com', '2002-02-18', '2024-01-12'),
(6, 'Rohan', 'Desai', 'rohan@email.com', '1999-11-05', '2020-06-15'),
(7, 'Aisha', 'Khan', 'aisha@email.com', '2001-09-14', '2024-08-20'),
(8, 'Karan', 'Joshi', 'karan@email.com', '2000-12-30', '2022-09-05'),
(9, 'Meera', 'Shah', 'meera@email.com', '2002-04-11', '2023-08-25'),
(10, 'Arjun', 'Patel', 'arjun@email.com', '1998-10-19', '2019-07-01'),
(11, 'Sneha', 'Mehta', 'sneha@email.com', '2001-01-22', '2024-02-10');


COURSES TABLE:-

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    DepartmentID INT,
    Credits INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

INSERT INTO Courses
(CourseID, CourseName, DepartmentID, Credits)
VALUES
(101, 'Introduction to SQL', 1, 3),
(102, 'Data Structures', 2, 4),
(103, 'Database Management Systems', 1, 4),
(104, 'Statistics', 2, 3),
(105, 'Calculus', 2, 4);


INSTRUCTORS TABLE:-

CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100),
    DepartmentID INT,
    Salary DECIMAL(10,2),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

INSERT INTO Instructors
(InstructorID, FirstName, LastName, Email, DepartmentID, Salary)
VALUES
(1, 'Alice', 'Johnson', 'alice@univ.com', 1, 50000.00),
(2, 'Bob', 'Lee', 'bob@univ.com', 2, 55000.00),
(3, 'Carol', 'Brown', 'carol@univ.com', 1, 60000.00);



CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

ENROLLMENTS TABLE:-

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Enrollments
(EnrollmentID, StudentID, CourseID, EnrollmentDate)
VALUES
(1, 1, 101, '2022-08-01'),
(2, 2, 101, '2021-08-01'),
(3, 3, 101, '2023-01-15'),
(4, 4, 101, '2023-07-10'),
(5, 5, 101, '2024-01-12'),
(6, 6, 101, '2020-06-15'),
(7, 7, 101, '2024-08-20'),
(8, 8, 101, '2022-09-05'),
(9, 9, 101, '2023-08-25'),
(10, 10, 101, '2019-07-01'),
(11, 11, 101, '2024-02-10'),
(12, 1, 102, '2022-08-05'),
(13, 2, 102, '2021-08-05'),
(14, 3, 102, '2023-01-20'),
(15, 4, 102, '2023-07-15');

1 . CURD OPERATION :-
ON DEPARTMENTS:-
•	CREATE
       INSERT INTO Departments (DepartmentID, DepartmentName) VALUES (3, 'Physics');
•	 READ 
       SELECT * FROM Departments;
•	UPDATE 
       UPDATE Departments SET DepartmentName = 'Physics and Applied Science' WHERE DepartmentID = 3;
•	DELETE
        DELETE FROM Departments WHERE DepartmentID = 3;         
     
          SELECT * FROM Departments;

ON DEPARTMENTS:-
•	CREATE
       INSERT INTO Departments (DepartmentID, DepartmentName) VALUES (3, 'Physics');
•	 READ 
       SELECT * FROM Departments;
•	UPDATE 
       UPDATE Departments SET DepartmentName = 'Physics and Applied Science' WHERE DepartmentID = 3;
•	DELETE
        DELETE FROM Departments WHERE DepartmentID = 3;         
     
          SELECT * FROM Departments;

 






ON STUDENTS :-
•	CREATE
         INSERT INTO Students (StudentID, FirstName, LastName, Email, BirthDate, EnrollmentDate) VALUES (12, 'Amit', 'Patel', 'amit@email.com', '2001-06-15', '2024-09-01'); 

•	 READ
        SELECT * FROM Students; 
•	 UPDATE 
        UPDATE Students SET Email = 'amit.patel@email.com' WHERE StudentID = 12; 

•	 DELETE 
        DELETE FROM Students WHERE StudentID = 12;
       
         SELECT * FROM Students;

2.  RETRIVE STUDENT WHO ENROOLED AFTER 2022.:-
SELECT *
FROM Students
WHERE EnrollmentDate > '2022-12-31';

3. RETRIVE COURSE WITH LIMIT 5.:-

SELECT *
FROM Courses
WHERE DepartmentID = 2
LIMIT 5;

4.FILTERING DATA:-
SELECT CourseID, COUNT(StudentID) AS StudentCount
FROM Enrollments
GROUP BY CourseID
HAVING COUNT(StudentID) > 5;

5.FIND STUDENTS WHO ARE ENROLLED IN BOTH SQL&DATA STRUCTURE:-
SELECT StudentID
FROM Enrollments
WHERE CourseID IN (101, 102)
GROUP BY StudentID
HAVING COUNT(DISTINCT CourseID) = 2;

6. Find students who are either enrolled to SQL or Data STRUCTURE:-
SELECT DISTINCT
       s.StudentID,
       s.FirstName,
       s.LastName
FROM Students s
JOIN Enrollments e
ON s.StudentID = e.StudentID
WHERE e.CourseID IN (101, 102);

7. Calculate the average number of credits for all courses.:-
SELECT AVG(Credits) AS AverageCredits

8. Find the maximum salary:-
SELECT MAX(Salary) AS MaximumSalary
FROM Instructors
WHERE DepartmentID = 1;

9. Count the number of students enrolled in each department.
SELECT d.DepartmentName,
       COUNT(DISTINCT e.StudentID) AS StudentCount
FROM Departments d
JOIN Courses c
ON d.DepartmentID = c.DepartmentID
JOIN Enrollments e
ON c.CourseID = e.CourseID
GROUP BY d.DepartmentID, d.DepartmentName;
 
10. Perform INNER JOIN to retrieve students and their     corresponding courses.:-
SELECT
    s.FirstName,
    s.LastName,
    c.CourseName
FROM Students s
INNER JOIN Enrollments e
ON s.StudentID = e.StudentID
INNER JOIN Courses c
ON e.CourseID = c.CourseID;

11. Perform LEFT JOIN:-
SELECT
    s.StudentID,
    s.FirstName,
    s.LastName,
    c.CourseName
FROM Students s
LEFT JOIN Enrollments e
ON s.StudentID = e.StudentID
LEFT JOIN Courses c
ON e.CourseID = c.CourseID;


12. Subquery: courses that have more than 10 students.:-
SELECT DISTINCT
       s.StudentID,
       s.FirstName,
       s.LastName
FROM Students s
WHERE s.StudentID IN
(
    SELECT e.StudentID
    FROM Enrollments e
    WHERE e.CourseID IN
    (
        SELECT CourseID
        FROM Enrollments
        GROUP BY CourseID
        HAVING COUNT(StudentID) > 10
    )
);

13. EXRRACT THE YEAR FROM THE ENROLLMENTDATE OF STUDENTS:-
SELECT Student_ID, First_Name, Last_Name,
       strftime('%Y', EnrollmentDate) AS Enrollment_Year
FROM Students;

14. Concatenate the instructor's first and last name.:-
SELECT CONCAT(FirstName, ' ', LastName) AS InstructorName
FROM Instructors;


15. Calculate the average number of students enrolled in courses.
SELECT AVG(StudentCount) AS AverageStudents
FROM
(
    SELECT CourseID, COUNT(StudentID) AS StudentCount
    FROM Enrollments
    GROUP BY CourseID
) AS CourseEnrollment;
                       
16. Label students as "Senior" or "Junior" based on their year of enrollment.:-
SELECT
    StudentID,
    FirstName,
    LastName,
    CASE
        WHEN DATEDIFF(CURDATE(), EnrollmentDate) > 4 * 365
        THEN 'Senior'
        ELSE 'Junior'
    END AS StudentStatus
FROM Students;






































































