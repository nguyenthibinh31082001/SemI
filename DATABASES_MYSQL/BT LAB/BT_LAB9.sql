--1:
CREATE DATABASE BT_LAB9
GO
USE BT_LAB9
GO
--2:
CREATE TABLE Mark(
	SubjectID INT,
	StudentID INT,
	Mark INT
)
GO
CREATE TABLE Students(
	StudentID INT PRIMARY KEY,
	StudentName NVARCHAR(50),
	Age INT,
	Email VARCHAR(100)
)
GO
CREATE TABLE Classes(
	ClassID INT PRIMARY KEY,
	ClassName NVARCHAR(50)
)
GO
CREATE TABLE ClassStudent(
	ClassID INT,
	StudentID INT
)
GO
CREATE TABLE Subjects(
	SubjectID INT PRIMARY KEY,
	SubjectName NVARCHAR(50)
)
GO
ALTER TABLE dbo.Mark
ADD CONSTRAINT fk1 FOREIGN KEY (StudentID) REFERENCES dbo.Students(StudentID)
GO

ALTER TABLE dbo.ClassStudent
ADD CONSTRAINT fk2 FOREIGN KEY (StudentID) REFERENCES dbo.Students(StudentID)
GO

ALTER TABLE dbo.ClassStudent
ADD CONSTRAINT fk3 FOREIGN KEY (ClassID) REFERENCES dbo.Classes(ClassID)
GO

ALTER TABLE dbo.Mark
ADD CONSTRAINT fk4 FOREIGN KEY (SubjectID) REFERENCES dbo.Subjects(SubjectID)
GO
--3:
INSERT INTO Students(StudentID, StudentName, Age ,Email)
VALUES (1,N'Nguyen Quang An',18,N'an@yahoo.com'),
		(2,N' Nguyen Cong Vinh', 20 ,N'vinh@gmail.com'),
		(3,N' Nguyen Van Quyen ',19,N' quyen'),
		(4,N' Pham Thanh Binh', 25, N'binh@com'),
		(5,N' Nguyen Van Tai Em', 30,N' taiem@sport.vn')
GO
SELECT *FROM Students
GO
INSERT INTO Classes(ClassID ,ClassName)
VALUES (1,N' C1506L'),
		(2,N' C1603G')
GO
SELECT *FROM Classes
GO
INSERT INTO Subjects(SubjectID, SubjectName)
VALUES (1,N' SQL'),
		(2,N' Java'),
		(3,N' C'),
		(4,N' Visual Basic')
GO
SELECT *FROM Subjects
GO
INSERT INTO ClassStudent(ClassID ,StudentID)
VALUES (1, 1),
		(1, 2),
		(2 ,3),
		(2 ,4),
		(2 ,5)
GO
SELECT *FROM ClassStudent
GO
INSERT INTO Mark(SubjectID, StudentID ,Mark)
VALUES (1,1,8),
		(2,1,4),
		(1,1,9),
		(1,3,7),
		(1,4,3),
		(2,5,5),
		(3,3,8),
		(2,5,1),
		(2,4,3)
GO
SELECT *FROM Mark
GO
--4:
--Hiển thị danh sách tất cả các học viên (Danh sách phải sắp xếp theo tên học viên)

-- Hiển thị danh sách tất cả các môn học
CREATE VIEW vw_Subject AS
SELECT SubjectName FROM Subjects
GO
SELECT *FROM vw_Subject
GO
--Hiển thị danh sách những học viên nào có địa chỉ email chính xác
CREATE VIEW danhsach_email AS
SELECT  Email FROM Students WHERE Email LIKE '%_@__%.__%'
GO
SELECT *FROM danhsach_email
GO
--Hiển thị danh sách những học viên có họ là Nguyễn
CREATE VIEW vw_danhsach_honguyen AS
SELECT StudentName FROM Students WHERE StudentName LIKE N'%Nguyen%';
GO
SELECT *FROM vw_danhsach_honguyen
GO
-- Hiển thị danh sách các bạn học viên của lớp C1506L
CREATE VIEW vw_C1506L AS
SELECT ST.StudentID,ST.StudentName FROM Classes C,ClassStudent CL,Students ST
WHERE ST.StudentID = CL.StudentID AND C.ClassID = CL.ClassID AND C.ClassID= 1
GO
SELECT *FROM vw_C1506L
GO
-- Hiển thị danh sách và điểm học viên ứng với môn học
CREATE VIEW vw_dsd AS
SELECT  ST.StudentID,ST.StudentName,S.SubjectID,S.SubjectName ,M.Mark FROM Students ST, Subjects S, Mark M
WHERE ST.StudentID = M.StudentID AND S.SubjectID = M.SubjectID
GO
SELECT *FROM vw_dsd
GO
--Hiển thị danh sách học viên chưa thi môn nào (Chưa có điểm)
CREATE VIEW vw_hs_chuathi2 AS
SELECT ST.StudentName FROM Mark M,Students ST
WHERE ST.StudentID NOT IN (SELECT M.StudentID FROM Mark M WHERE M.Mark< 0)
GO
SELECT *FROM vw_hs_chuathi2
GO
--Hiển thị môn nào chưa được học viên nào thi
CREATE VIEW vw_monchuathi
-- Tính điểm trung bình cho các học viên
CREATE VIEW vw_ĐTB1 AS  
SELECT ST.StudentName,AVG(M.Mark) AS 'ĐIỂM TB' FROM Mark M INNER JOIN Students ST
ON   ST.StudentID = M.StudentID 
GROUP BY M.StudentID,ST.StudentName
GO
SELECT *FROM vw_ĐTB1
GO

--Hiển thị môn học nào được thi nhiều nhất
CREATE VIEW vw_monthinhieunhat AS 
SELECT S.SubjectName,COUNT(M.SubjectID) FROM Mark M, Subjects S
WHERE S.SubjectID = M.SubjectID AND M.SubjectID > ALL (SELECT M.SubjectID FROM Mark M) 
GROUP BY M.SubjectID
GO
SELECT *FROM vw_monthinhieunhat 
GO
-- Hiển thị môn học nào có học sinh thi được điểm cao nhất
CREATE VIEW vw_moncaodiemnhat2 AS
SELECT S.SubjectName,M.Mark FROM Subjects S, Mark M
WHERE M.Mark>=ALL(SELECT M.Mark FROM Mark M) AND M.SubjectID = S.SubjectID
GO
SELECT *FROM vw_moncaodiemnhat2
GO
-- Hiển thị môn học nào có nhiều điểm dưới trung bình nhất ( <5)
CREATE VIEW vw_TBduoi5 AS
SELECT S.SubjectName,COUNT(M.SubjectID),M.Mark FROM Subjects S INNER JOIN Mark M
ON S.SubjectID = M.SubjectID AND M.Mark<5
GO
SELECT *FROM vw_TBduoi5
GO
--5. Tạo rang buộc
--Viet Check Constraint de kiem tra do tuoi nhap vao trong bang Student yeu cau Age >15 va Age < 50
ALTER TABLE Students
ADD CONSTRAINT check_tuoi CHECK (Age >15 AND Age < 50)
GO
SELECT *FROM Students
GO
--Loại bỏ tất cả quan hệ giữa các bảng

--Xóa học viên có StudentID là 1

--Trong bảng Student them một column Status có kiểu dữ liệu là Bit và có giá trị Default là 1
ALTER TABLE dbo.Students
ADD Status BIT DEFAULT (1)
GO
SELECT *FROM Students
GO
--Cập nhật giá trị Status trong bảng Student là 1
UPDATE dbo.Students
SET Status = 1
WHERE  StudentID>=1 AND StudentID<=5
GO
SELECT * FROM Students
GO 
