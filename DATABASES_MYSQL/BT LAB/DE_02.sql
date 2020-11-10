CREATE DATABASE [DE02]
GO
USE DE02
GO
CREATE TABLE [Categories](
	Id INT IDENTITY(1,1) PRIMARY KEY ,
	name NVARCHAR(50) UNIQUE,
	counts SMALLINT DEFAULT(0)
)
GO
INSERT INTO Categories(name,counts)
VALUES (N'Du lịch trong nước',2),
		(N'Khám phá',5),
		(N'Du lịch tâm linh',1),
		(N'Nghỉ dưỡng',4)
GO
SELECT * FROM Categories
GO
CREATE TABLE [Travels](
	Id INT IDENTITY(1,1) PRIMARY KEY,
	name NVARCHAR(50),
	price FLOAT NOT NULL,
	days TINYINT NOT NULL ,
	cat_id INT,
	start_date DATETIME NOT NULL 
)
GO
INSERT INTO Travels(name,price,days,cat_id,start_date)
VALUES (N'Hà nội TP vì hòa bình',125, 1,1,'2019-03-26 08:15:00'),
		(N'Đà lạt- nơi tình yêu bắt đầu',350 ,3,1,'2019-04-30 20:00:00'),
		(N'Hà giang mùa hoa ta0 giác mạch',90 ,2,1,'2019-09-01 15:00:00'),
		(N'Phú quốc hòn đảo mộng mơ',1120 ,8,4,'2019-05-18 06:00:00'),
		(N'Ninh bình tìm về bản ngã',589 ,4,3,'2019-03-26 08:15:00'),
		(N'Nha trang TP vì hòa bình',486 ,6,4,'2019-09-01 15:00:00')
GO
SELECT * FROM Travels
GO
--IV:
ALTER TABLE Travels
ADD CONSTRAINT  get_start_date DEFAULT (GETDATE()) FOR start_date
GO
ALTER TABLE dbo.Travels
ADD CONSTRAINT  get_day DEFAULT(1) FOR days
GO
ALTER TABLE dbo.Travels
ADD CONSTRAINT  get_price DEFAULT(0) FOR price
GO
ALTER TABLE dbo.Travels
ADD CONSTRAINT  get_days CHECK(price < 99000)
GO
--Đặt cột cat_id ở bảng Travels là khóa ngoại liên kết tới cột id ở bảng categories
ALTER TABLE dbo.Travels
ADD CONSTRAINT fk1 FOREIGN KEY (cat_id) REFERENCES dbo.Categories(Id)
GO
--Tạo ràng buộc trên cột days ở bảng Travels nằm trong khoảng 0 – 15
ALTER TABLE dbo.Travels
ADD CONSTRAINT check_Travel CHECK(days BETWEEN 0 AND 15)
GO
--Thêm ràng buộc không để trùng trên cột name ở bảng Travels
ALTER TABLE dbo.Travels
ADD UNIQUE(name)
GO
--Cập nhật giá tiền lên thêm 10% đối với tour thuộc danh mục “Du lịch trong nước” mà có số ngày tour >= 2
UPDATE dbo.Travels
SET dbo.Travels.price = price+(10/100)
FROM dbo.Categories cat, dbo.Travels tra
WHERE cat.Name ='Du lịch trong nước' AND tra.days >= 2 AND cat.Id = tra.cat_id
GO
--Hoặc:
UPDATE Travels
SET price = (price * 1.1) 
WHERE cat_id = 1 AND days >=2
GO
SELECT * FROM Travels
GO
--Truy vấn hiển thị dữ liệu các tour kèm tên danh mục tour là gì, sắp xếp giá theo thứ tự tăng dần
SELECT tra.Id,cat.name,tra.name,tra.price,tra.days,tra.cat_id,tra.start_date 
FROM dbo.Categories cat, dbo.Travels tra 
WHERE tra.Id = cat.Id ORDER BY tra.price ASC
GO
SELECT Categories.name,Travels.name,Travels.price FROM Travels
INNER JOIN Categories ON Categories.id = Travels.cat_id ORDER BY price ASC
GO
--Phần V: Tạo View thực hiện chức năng sau:
--Hiển thị toàn bộ tour ngắn ngày (<=2) kèm tên danh mục tour
CREATE VIEW tour_ngan AS 
SELECT Categories.name AS cate_name,Travels.name,Travels.days FROM Travels,Categories 
WHERE days <=2
GO
SELECT *FROM tour_ngan
GO
--Hiển thị toàn bộ tour mà tên của danh mục chứa cụm từ “du lịch”, và kèm tên danh mục tour
CREATE VIEW contain_dulich AS 
SELECT .Categories.name AS cate_name,Travels.name FROM Travels,Categories
WHERE Categories.id = Travels.cat_id AND Categories.name LIKE N'%Du lịch%'
GO
SELECT *FROM contain_dulich
GO
--Phần VI: Tạo Store Procedure thực hiện chức năng sau:
-- Hiển thị danh sách tour có số ngày nhiều nhất
CREATE PROCEDURE get_tours AS
SELECT cat.name,tra.name,(SELECT  MAX (tra.days)  FROM dbo.Travels tra) AS DayMax FROM dbo.Categories cat, dbo.Travels tra 
WHERE tra.cat_id = cat.Id AND tra.Id = 4
GO
EXEC get_tours
GO
-- Hiển thị danh sách tour với tham số tìm kiếm là tên danh mục hoặc tên tour
CREATE PROCEDURE [SerchTourByName]
@name NVARCHAR(50)
AS
BEGIN
	SELECT Cate.name,Cate.counts,Tour.name,Tour.price,Tour.days,Tour.start_date FROM dbo.Categories AS Cate,dbo.Travels AS Tour
	WHERE (Cate.name = @name OR Tour.name = @name)
	AND Cate.id = Tour.cat_id

END
GO
 
--VII. Tạo Trigger thực hiện chức năng sau:
--Khi thêm mới tour ở bảng Travels, tự động tăng thêm dữ liệu counts ở bảng categories lên 1 đơn vị tương ứng với danh mục tour được thêm
CREATE TRIGGER insert_Tour ON dbo.Travels
AFTER INSERT
AS 
BEGIN
	UPDATE dbo.Categories SET counts = ((SELECT counts
		FROM dbo.Categories
		WHERE id = Inserted.cat_id) + 1) FROM dbo.Categories AS categories JOIN inserted ON categories.id = inserted.cat_id 
		WHERE categories.id = Inserted.cat_id;
	
END 
GO 
--Khi cập nhật dữ liệu tour trong bảng Travels, nếu dữ liệu giá < 0 thì không cho cập nhật và hiển thị thông báo "Lỗi dữ liệu"
CREATE TRIGGER update_trigger 
ON Travels
FOR UPDATE
AS
IF(SELECT price FROM Inserted )< 0
BEGIN 
	PRINT N'Lỗi dữ liệu'
	ROLLBACK TRANSACTION
END
GO

--Hoặc:
UPDATE Travels
SET Travels.price= -5
WHERE Id = 1
GO
CREATE TRIGGER check_price 
ON dbo.Travels
FOR INSERT 
AS 
IF (SELECT price FROM Inserted) <0
BEGIN 
	PRINT N'Lỗi dữ liệu'
	ROLLBACK TRANSACTION
END
GO
UPDATE Travels
SET Travels.price= -5
WHERE Id = 1
GO
