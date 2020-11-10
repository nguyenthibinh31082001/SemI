CREATE DATABASE [B1Lab5]
GO
USE B1Lab5
GO
CREATE TABLE [StudentS](
	RN CHAR(3) PRIMARY KEY, 
	Name NVARCHAR(100),
	Age INT,
	Gender NVARCHAR(10)
)
GO
INSERT INTO StudentS(RN,Name,Age,Gender)
VALUES (N'C01',N'Mỹ Linh',18,N'Nữ'),
		(N'C02',N'Vĩnh Hưng',18,N'Nam'),
		(N'C03',N'Tử Long',19,N'Nam'),
		(N'C04',N'Tài Linh',20,N'Nam'),
		(N'C05',N'Mỹ Lề',20,N'Nữ'),
		(N'C06',N'Ngọc Anh',18,N'Nữ')
GO
SELECT * FROM StudentS
GO
CREATE TABLE [Subject](
	sID INT IDENTITY(1,1) PRIMARY KEY,
	sName NVARCHAR(100)
)
GO
INSERT INTO Subject(sName)
VALUES (N'SQL'),
		(N'LGC'),
		(N'HTML'),
		(N'CF')
GO
SELECT * FROM Subject
GO
CREATE TABLE [Studentsubject](
	RN CHAR(3) FOREIGN KEY (RN) REFERENCES dbo.StudentS(RN), 
	SID INT , 
	Mark FLOAT, 
	Date DATETIME,
	PRIMARY KEY (RN,SID)
)
GO
INSERT INTO StudentSubject(RN,SID,Mark,Date)
VALUES (N'C01',1,8,'7-28-2005'),
		(N'C02',2,3,'7-29-2005'),
		(N'C03',3,9,'7-31-2005'),
		(N'C04',1,5,'7-30-2005'),
		(N'C05',4,10,'7-19-2005'),
		(N'C06',1,9,'7-25-2005')
GO
SELECT * FROM StudentSubject
GO
ALTER TABLE StudentSubject
ADD CONSTRAINT check_Mark CHECK (Mark BETWEEN 0 AND 10);
GO
SELECT Name FROM StudentS
GO
SELECT TOP 3 PERCENT RN,Name,Age,Gender FROM StudentS
GO
