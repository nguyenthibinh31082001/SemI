CREATE DATABASE NguyenHuuLoi_B8548
GO
USE NguyenHuuLoi_B8548
go
CREATE TABLE Employee(
	EmpId NVARCHAR(50) PRIMARY KEY NOT NULL,
	EmpName NVARCHAR(50) NULL,
	HireDate DATE NULL,
	Salary FLOAT NULL,
	Email NVARCHAR(50) NULL,
	Phine NVARCHAR(50) NULL,
	Sex BIT NULL,
	Status BIT NULL,
	DepartmentId INT NOT NULL,
	EmpTypeId INT NOT NULL
)
GO
CREATE TABLE Department(
	DepartmentId INT NOT NULL,
	DepartmentName NVARCHAR(50)  NULL,
	Location NVARCHAR(50)  NULL,
	Status BIT	NULL
)
GO	
CREATE TABLE EmployeeType(
	EmpTypeId INT NOT NULL,
	EmTypeName NVARCHAR(50) NULL,
	Status BIT NULL
)
GO

ALTER TABLE dbo.Department
ADD CONSTRAINT Pk_DepartmentId PRIMARY KEY (DepartmentId)
GO	
ALTER TABLE dbo.Employee
ADD CONSTRAINT KN_DepartmentId FOREIGN KEY(DepartmentId) REFERENCES dbo.Department
GO
ALTER TABLE dbo.EmployeeType
ADD CONSTRAINT PK_EmpTypeId PRIMARY KEY(EmpTypeId)
GO	
ALTER TABLE dbo.EmployeeType
ADD CONSTRAINT KN_EmpTypeId FOREIGN KEY(EmpTypeId) REFERENCES dbo.EmployeeType
GO	
INSERT INTO dbo.EmployeeType
        ( EmpTypeId, EmTypeName, Status )
VALUES  ( 1, -- EmpTypeId - int
          N'Phòng CMLT', -- EmTypeName - nvarchar(50)
          NULL  -- Status - bit
          ),
		  ( 2, -- EmpTypeId - int
          N'Phòng CMM', -- EmTypeName - nvarchar(50)
          NULL  -- Status - bit
          ),
		  ( 3, -- EmpTypeId - int
          N'Phòng Đào Tạo', -- EmTypeName - nvarchar(50)
          NULL  -- Status - bit
          )
		  GO	
INSERT INTO dbo.Department
        ( DepartmentId ,
          DepartmentName ,
          Location ,
          Status
        )
VALUES  ( 01 , -- DepartmentId - int
          N'Phòng CMLT' , -- DepartmentName - nvarchar(50)
          N'304' , -- Location - nvarchar(50)
          NULL  -- Status - bit
        ),
		( 02 , -- DepartmentId - int
          N'Phòng CMM' , -- DepartmentName - nvarchar(50)
          N'306' , -- Location - nvarchar(50)
          NULL  -- Status - bit
        ),
		( 03 , -- DepartmentId - int
          N'Phòng Đào Tạo' , -- DepartmentName - nvarchar(50)
          N'301' , -- Location - nvarchar(50)
          NULL  -- Status - bit
        )
		GO	

INSERT INTO dbo.Employee
        ( EmpId ,
          EmpName ,
          HireDate ,
          Salary ,
          Email ,
          Phine ,
          Sex ,
          Status ,
          DepartmentId ,
          EmpTypeId
        )
VALUES  ( N'E001' , -- EmpId - nvarchar(50)
          N'Nguyễn Công phượng' , -- EmpName - nvarchar(50)
          GETDATE('2000-05-03') , -- HireDate - date
          400000 , -- Salary - float
          N'Phuong84@gmail.com' , -- Email - nvarchar(50)
          N'01656533403' , -- Phine - nvarchar(50)
          NULL , -- Sex - bit
          NULL , -- Status - bit
          0 , -- DepartmentId - int
          0  -- EmpTypeId - int
        ),
		( N'E002' , -- EmpId - nvarchar(50)
          N'Nguyễn Trung Hiếu' , -- EmpName - nvarchar(50)
          GETDATE('2000-05-03') , -- HireDate - date
          200000 , -- Salary - float
          N'HuuLoi05@gmail.com' , -- Email - nvarchar(50)
          N'01656533403' , -- Phine - nvarchar(50)
          NULL , -- Sex - bit
          NULL , -- Status - bit
          0 , -- DepartmentId - int
          0  -- EmpTypeId - int
        ),
		( N'E003' , -- EmpId - nvarchar(50)
          N'Nguyễn Thị Thủy' , -- EmpName - nvarchar(50)
          GETDATE('2000-05-03') , -- HireDate - date
          500000, -- Salary - float
          N'Thuy87@gmail.com' , -- Email - nvarchar(50)
          N'01656533403' , -- Phine - nvarchar(50)
          NULL , -- Sex - bit
          NULL , -- Status - bit
          0 , -- DepartmentId - int
          0  -- EmpTypeId - int
        )
		GO
			

