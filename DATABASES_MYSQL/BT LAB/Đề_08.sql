--Question 1:
CREATE DATABASE [BTLab6]
GO
USE BTLab6
GO
--Question 2:
CREATE TABLE Travels(
	trID INT NOT NULL,
	name VARCHAR(100) NOT NULL,
	price FLOAT NULL,
	days INT NOT NULL,
	catID INT NOT NULL,
	startdate DATETIME NULL
)
GO
CREATE TABLE Categories(
	catID INT NOT NULL,
	catName VARCHAR(100) NOT NULL,
	counts INT NULL
)
GO
--Question 3:
--Hãy tạo Primary Key trên cột “trID” cho bảng Travels . (1)
ALTER TABLE dbo.Travels 
ADD PRIMARY KEY(trID)
GO
--Hãy tạo Primary Key trên cột “catID” cho bảng Categories. (1)
ALTER TABLE dbo.Categories
ADD PRIMARY KEY(catID)
GO

--Hãy tạo khóa ngoài Foreign Key Constraint cho bảng Travels tham chiếu đến bảng Categories v ới cột chung là “catID”. (1.5)
ALTER TABLE dbo.Travels
ADD CONSTRAINT fk1 FOREIGN KEY(catID) REFERENCES dbo.Categories(catID)
GO
--Question 4:
--Hãy tạo một Check Constraint trên cột days cho bảng Travels nằm trong khoảng từ 0 và 15. (2)
ALTER TABLE dbo.Travels
ADD CONSTRAINT check_days CHECK(days BETWEEN 0 AND 15)
GO

--Hãy tạo một Unique Constraint trên cột name cho bảng Travels. (1)
ALTER TABLE dbo.Travels
ADD UNIQUE(name)
GO

--Question 3
ALTER TABLE dbo.Travels
ADD CONSTRAINT  get_date DEFAULT(GETDATE()) FOR startdate
GO

--Question 5: 
INSERT INTO dbo.Categories(catID,catName)
VALUES
(100,'Beaches'),
(200,'Family Travel'),
(300,'Food and Drink'),
(400,'Skiing')
GO
SELECT * FROM Categories
GO

INSERT INTO dbo.Travels
VALUES
(10,'Manele Bay,Hawaii',200,2,100,'2011-04-30 00:00:00:00'),
(11,'Hilton Waikoloa Village',250,4,200,'2011-04-16 00:00:00:00'),
(12,'Clearwater Beach,Florida',300,7,100,'2011-02-11 00:00:00:00'),
(13,'Sandwich Paradise',180,2,300,'2011-01-10 00:00:00:00'),
(14,'Cape May,New Jersey',380,4,100,'2011-01-18 00:00:00:00')
GO
SELECT * FROM Travels
GO
--Question 6
/*Hãy sử dụng lệnh ​Update để tăng giá (price) 10% cho tất cả các dòng trong
bảng ​Travels mà số ngày (days) > 5 ngày và thuộc loại (Categories) “​Food and
Drink” */
UPDATE dbo.Travels
SET dbo.Travels.price = price+(10/100)
FROM dbo.Categories cat, dbo.Travels tra
WHERE cat.catName ='Food and Drink' AND tra.days >5
GO


--Question 7:
/*Hãy sử dụng lệnh ​Select , mệnh đề ​GROUP, JOIN để lấy ra thông tin thống kê
số lượng (Quantity) chuyến du lịch (travels) theo từng phân loại (Categories),
kết quả phải được sắp xếp theo số lượng giảm dần*/
SELECT cat.catID,cat.catName,COUNT(cat.catID) AS quantity FROM dbo.Travels tra JOIN dbo.Categories cat
ON cat.catID = tra.catID
GROUP BY cat.catID,cat.catName
ORDER BY quantity DESC
GO

--Question 8:
UPDATE dbo.Categories
SET counts = COUNT(catID)
GO
SELECT cat.catID, cat.catName,tra.name,COUNT(tra.catID),cat.counts AS Quantity
FROM dbo.Travels tra JOIN dbo.Categories cat
ON tra.catID = cat.catID
GROUP BY cat.catID, cat.catName,tra.name,cat.counts ORDER BY cat.catName DESC
GO
--Question 9:
/*CREATE TRIGGER TG_startdate ON dbo.Travels FOR DELETE
AS 
BEGIN
	DECLARE @detele INT
	SET @detele = (SELECT COUNT(*) FROM Deleted);
	BEGIN
		UPDATE dbo.Categories
		SET counts -= @detele
	END
END
GO

SELECT * FROM dbo.Categories
GO
SELECT * FROM dbo.Travels
GO

DELETE dbo.Categories
WHERE catID
GO

CREATE TRIGGER TG_days ON dbo.Travels FOR INSERT
AS
BEGIN
	IF (SELECT Inserted.startdate FROM Inserted) < (GETDATE())
	BEGIN
		PRINT 'xxx'
		ROLLBACK TRAN
	END
END
GO

INSERT INTO dbo.Travels
VALUES
(15,'ccc',200,2,100,'2020-01-18 00:00:00:00')
GO*/

--Question 9:
/*Tạo trigger khi update Travels, nếu price < 0 thì thông báo lỗi và không
cho phép update*/
CREATE TRIGGER update_trigger 
ON Travels
FOR UPDATE
AS
IF(SELECT price FROM Inserted )< 0
BEGIN 
	PRINT N'Chưa có giá trị tiền !! Không cho phép update'
	ROLLBACK TRANSACTION
END
GO
UPDATE Travels
SET Travels.price= -5
WHERE trID = 10
GO
--Tạo trigger khi thêm mới Travels, nếu startdate < ngày hiện tại thì thông
báo lỗi và không cho phép insert
CREATE TRIGGER insert_trigger
ON Travels
FOR INSERT
AS
IF(SELECT startdate FROM Inserted) < GETDATE()
BEGIN
	PRINT N'Không được insert!!'
	ROLLBACK TRANSACTION
END

INSERT INTO Travels(trID,name,price,days,catID,startdate )
VALUES (22,'Manele Bay,Hawaii',5,2,100,'2020-1-1')
GO
SELECT *FROM Travels
GO
--Tạo trigger khi xóa Travels thì update giá trị của counts trong bảng
Categories
CREATE TRIGGER delete_update
ON Travels
FOR DELETE
AS
BEGIN 
	UPDATE Categories
	SET
END