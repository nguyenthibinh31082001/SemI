CREATE DATABASE B8480_BuiNgocCanh
GO

USE B8480_BuiNgocCanh
GO



CREATE TABLE Department(
	DepartmentId INT PRIMARY KEY,
	DepartmentName NVARCHAR(50),
	Location NVARCHAR(50),
	Status BIT
)
GO

CREATE TABLE EmployeeType(
	EmpTypeId INT PRIMARY KEY,
	EmpTypeName NVARCHAR(50),
	Status BIT
)
GO

CREATE TABLE Employee(
	EmpId NVARCHAR(50) PRIMARY KEY,
	EmpName NVARCHAR(50),
	HireDate DATE,
	Salary FLOAT,
	Email NVARCHAR(50),
	Phone NVARCHAR(50),
	Sex BIT,
	Status BIT,
	DepartmentId INT FOREIGN KEY REFERENCES Department(DepartmentId),
	EmpTypeId INT FOREIGN KEY REFERENCES EmployeeType(EmpTypeId)
)
GO

/*
DROP TABLE Employee
DROP TABLE Department
DROP TABLE EmployeeType
*/

INSERT INTO EmployeeType VALUES
(1, 'Nh�n Vi�n H?u C?', 'True'),
(2, 'Nh�n Vi�n C?ng T�c', 'True'),
(3, 'Nh�n Vi�n FullTime', 'False')
GO

INSERT INTO Department VALUES 
(1, 'Ph�ng CMLT', '304', 'True'),
(2, 'Ph�ng CMM', '306', 'True'),
(3, 'Ph�ng ?�o T?o', '301', 'True')
GO

INSERT INTO Employee VALUES 
('E001', 'Nguy?n C�ng Ph??ng', '2017-05-14', 10000000, 'phuongnc@gmail.com', '0948385837', 'True','True', 1, 1),
('E002', 'Nguy?n Trung Hi?u', '2017-05-14', 8000000, 'hieunt@gmail.com', '0904488485', 'True','True', 1, 1),
('E003', 'Nguy?n Th? Th?y', '2017-05-14', 9000000, 'thuynt@gmail.com', '0904305253', 'False', 'True', 1, 1),
('E004', 'Nguy?n Th? Th?m', '2017-05-14', 6500000, 'thamnt@gmail.com', '0949904567', 'False','True', 1, 1),
('E005', 'L� Thanh Th?y', '2017-05-14', 7500000, 'thuylt@gmail.com', '0948856932', 'False','False', 1, 1)
GO

