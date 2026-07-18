CREATE DATABASE Saudi_Tech_DB;
GO

USE Saudi_Tech_DB;
GO

CREATE TABLE Saudi_Employees (
    ID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeName NVARCHAR(100),
    City NVARCHAR(50),
    JobTitle NVARCHAR(50)
);

INSERT INTO Saudi_Employees (EmployeeName, City, JobTitle) 
VALUES 
(N'فيصل القحطاني', N'الرياض', 'AI Engineer'),
(N'سارة الشمري', N'جدة', 'Data Analyst'),
(N'عبد الرحمن الدوسري', N'الدمام', 'Cloud Developer');

SELECT * FROM Saudi_Employees;