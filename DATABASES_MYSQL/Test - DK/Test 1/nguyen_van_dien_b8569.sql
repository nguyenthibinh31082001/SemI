CREATE DATABASE DIEN_B8569
GO

USE DIEN_B8569
GO

CREATE TABLE Employee(
	EmpId NVARCHAR(50) PRIMARY KEY,
	EmpName NVARCHAR(50),
	HireDate DATE,
	Salary FLOAT,
	Email NVARCHAR(50),
	Phone NVARCHAR(50),
	Sex BIT,
	[Status] BIT,
	DepartmantId INT NOT NULL,
	EmpTypeId INT NOT NULL,

)
GO

ALTER TABLE Employee
	ADD FOREIGN KEY (DepartmantId) REFERENCES Department (DepartmentId)
GO

ALTER TABLE Employee
	ADD FOREIGN KEY (EmpTypeId) REFERENCES EmployeeType (EmpTypeId)
GO

CREATE TABLE Department(
	DepartmentId INT PRIMARY KEY,
	DepartmentName NVARCHAR(50),
	Location NVARCHAR(50),
	[Status] BIT

)
GO

CREATE TABLE EmployeeType(
	EmpTypeId INT PRIMARY KEY,
	EmpTypeName NVARCHAR(50),
	[Status] BIT
)
GO

SELECT * FROM EmployeeType
GO

INSERT INTO EmployeeType VALUES
	(1,N'Nhân viên cơ hữu',1),
	(2,N'Nhân viên cộng tác',1),
	(3,N'Nhân viên fulltime',0)
GO

INSERT INTO Department VALUES
	(1,N'Phòng CMLT',N'304',1),
	(2,N'Phòng CMM',N'306',1),
	(3,N'Phòng Đào tạo',N'301',1)
GO

SELECT * FROM Department
GO

INSERT INTO Employee VALUES
	(N'E001',N'Nguyễn Công Phượng','2017-05-14',10000000,N'phuongnc@gmail.com',N'0948385837',1,1,1,1),
	(N'E002',N'Nguyễn Trung Hiếu','2014-06-08',8000000,N'hieunt@gmail.com',N'0904488485',1,1,2,2),
	(N'E003',N'Nguyễn Thị Thủy','2013-09-06',9000000,N'thuynt@gmail.com',N'0948385837',0,1,3,3),
	(N'E004',N'Nguyễn Thị Thẩm','2016-08-05',65000000,N'thamnt@gmail.com',N'094838567',0,1,2,1),
	(N'E005',N'Lê Thanh Thúy','2012-02-01',75000000,N'thuylt@gmail.com',N'0948385932',0,0,1,3)
GO

SELECT * FROM Employee
GO
