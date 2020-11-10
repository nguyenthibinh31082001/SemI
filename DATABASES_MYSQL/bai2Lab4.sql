CREATE DATABASE [B2Lab4]
GO
USE B2Lab4
GO
CREATE TABLE [TaxType](
	CodeID INT IDENTITY(1,1)Primary Key NOT NULL,
	TaxName NVARCHAR(128) NULL,
	Discount FLOAT NULL
)
GO
INSERT INTO TaxType(TaxName,Discount)
VALUES (N'Thuế thân',16.8),
		(N'Thuế thu nhập cá nhân',40),
		(N'Thuế đẻ con trai',80.5)
GO
SELECT * FROM TaxType
GO
CREATE TABLE [AptechEmployee](
	EmployeeID INT  Primary Key NOT NULL,
	CodeID INT ,
	EmployeeName NVARCHAR(256) ,
	DateOfBirth DATETIME ,
	CHECK ConstraINT
)
GO
INSERT INTO AptechEmployee(EmployeeID,CodeID,EmployeeName,DateOfBirth)
VALUES (1,1,N'Trịnh văn chung','1979-03-08 00:00:00.000'),
		(2,2,N'Lại đức chung','1980-11-26 00:00:00.000')
GO
SELECT * FROM AptechEmployee
GO
CREATE TABLE [salarylevel](
	SalaryLevelID INT IDENTITY(1,1) PRIMARY KEY ,
	Level char(1) ,
	Description NVARCHAR(128)
)
GO
INSERT INTO salarylevel(Level,Description)
VALUES (N'A',N'Trường phòng'),
		(N'B',N'Trường huyện')
GO
SELECT * FROM salarylevel
GO
CREATE TABLE [SalaryMonth](
	EmployeeID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	SalaryLevelID INT  NOT NULL,
	Ratio FLOAT NOT NULL,
	Bonus FLOAT NULL,
)
GO
INSERT INTO SalaryMonth(SalaryLevelID,Ratio,Bonus)
VALUES (2,8.5,888),
		(1,6.9,999)
GO
SELECT * FROM SalaryMonth
GO