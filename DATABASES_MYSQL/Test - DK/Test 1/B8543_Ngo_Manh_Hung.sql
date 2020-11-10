CREATE DATABASE B8543_NGOMANHHUNG
GO
USE B8543_NGOMANHHUNG
GO
 CREATE TABLE Department(
	DepartmentId INT PRIMARY KEY IDENTITY,
	DepartmentName NVARCHAR(50) NULL,
	Location NVARCHAR(50) NULL,
	Status BIT NULL
)
GO
 CREATE TABLE EmployeeType(
	EmpTypeId INT PRIMARY KEY IDENTITY,
	EmpTypeName NVARCHAR(50) NULL,
	Status BIT NULL
)
GO
CREATE TABLE Employee(
	EmpId NVARCHAR(50) PRIMARY KEY,
	EmpName NVARCHAR(50) NULL,
	HireDate DATE NULL,
	Salary FLOAT NULL,
	Email NVARCHAR(50) NULL,
	Phone NVARCHAR(50) NULL,
	Sex BIT NULL,
	Status BIT NULL,
	DepartmentId INT NOT NULL FOREIGN KEY REFERENCES Department(DepartmentId),
	EmpTypeId int NOT NULL FOREIGN KEY REFERENCES EmployeeType(EmpTypeId)
) 
GO
INSERT INTO EmployeeType(EmpTypeName,Status) 
VALUES(N'Nhân viên h?u c?',1),
(N'Nhân viên c?ng tác',1 ),
(N'Nhân viên fulltime',0 )
GO

INSERT INTO Department(DepartmentName,Location,Status) 
VALUES(N'Phòng CMLT',304,1),
(N'Phòng CMM',306,1 ),
(N'Phòng ?ào t?o',301,1)

GO
INSERT INTO Employee
VALUES('E001',N'Nguy?n Công Ph??ng','20170514',1000000,'phuongnc@gmail.com',0948385837,1,1,1,1),
('E002',N'Nguy?n Trung Hi?u','20170514',9000000,'hieunt@gmail.com',0948385837,1,1,2,2),
('E003',N'Nguy?n Th? Th?y','20170514',800000,'thuynt@gmail.com',0948385837,0,1,3,3)