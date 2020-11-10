--Tạo cơ sở dữ liệu BKTravel--
CREATE DATABASE BKTravel
GO
--Sử dụng cơ sở dữ liệu BKTravel-- 
USE BKTravel
GO
--Tạo bảng Categories--
CREATE TABLE Categories(
		id INT IDENTITY(1,1),
		name NVARCHAR(50) UNIQUE,
		counts SMALLINT DEFAULT(0)
)
GO
--Chèn dữ liệu vào bảng Categories--
INSERT INTO Categories(name,counts)
VALUES
(N'Du lịch trong nước',2),
(N'Khám phá',5),
(N'Du lịch tâm linh',1),
(N'Nghỉ dưỡng',4)
GO
SELECT *FROM Categories
GO
--Tạo bảng Travels--
CREATE TABLE Travels(
	id INT IDENTITY(1,1),
	name NVARCHAR(50),
	price FLOAT DEFAULT(0) CHECK(price<99000) NOT NULL,
	days TINYINT DEFAULT(1) NOT NULL,
	cat_id INT,
	start_date DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
)
GO
--Chèn dữ liệu vào bảng Travels--
INSERT INTO Travels(name,price,days,cat_id,start_date)
VALUES
	(N'Hà Nội TP vì hòa bình',125,1,1,'2019-03-26 08:15:00'),
	(N'Đà Lạt - Nơi tình yêu bắt đầu',350,3,1,'2019-04-30 20:00:00'),
	(N'Hà Giang mùa hoa Tam Giác Mạch',90,2,1,'2019-09-01 15:00:00'),
	(N'Phú Quốc – hòn đảo mộng mơ',1120,8,4,'2019-05-18 06:00:00'),
	(N'Ninh Bình – Tìm về bản ngã',589,4,3,'2019-03-26 08:15:00'),
	(N'Nha Trang – Thiên đường nghỉ dưỡng',486,6,4,'2019-09-01 15:00:00')
GO
SELECT *FROM Travels
GO
--Đặt khóa chính id cho bảng Categories--
ALTER TABLE Categories
ADD CONSTRAINT Categories_id PRIMARY KEY (id)
GO
--Đặt khóa chính id cho bảng Travels--
ALTER TABLE Travels
ADD CONSTRAINT Travels_id PRIMARY KEY (id)
GO
--Đặt cột cat_id ở bảng Travels là khóa ngoại liên kết tới cột id ở bảng categories--
ALTER TABLE .Travels
ADD CONSTRAINT id_vs_id FOREIGN KEY (cat_id) REFERENCES dbo.Categories(id)
GO 
--Tạo ràng buộc trên cột days ở bảng Travels nằm trong khoảng 0 – 15--
ALTER TABLE Travels 
ADD CONSTRAINT validate_days CHECK(days>=0 AND days<16)
GO
--Thêm ràng buộc không để trùng trên cột name ở bảng Travels--
ALTER TABLE Travels ADD CONSTRAINT unique_Name_Travles UNIQUE(name)
GO
--Cập nhật giá tiền lên thêm 10% đối với tour thuộc danh mục “Du lịch trong nước” mà có số ngày tour >= 2--
UPDATE Travels
SET price = (price * 1.1) WHERE cat_id = 1 AND days >=2
GO
SELECT *FROM Travels
GO
--Truy vấn hiển thị dữ liệu các tour kèm tên danh mục tour là gì, sắp xếp giá theo thứ tự tăng dần--
SELECT Categories.name,Travels.name,Travels.price FROM Travels
INNER JOIN Categories ON Categories.id = Travels.cat_id ORDER BY price ASC
GO
--Hiển thị toàn bộ tour ngắn ngày (<=2) kèm tên danh mục tour--
CREATE VIEW tour_ngan AS 
SELECT Categories.name AS cate_name,Travels.name,Travels.days FROM Travels,Categories 
WHERE days <=2
GO
SELECT *FROM tour_ngan
GO
--Hiển thị toàn bộ tour mà tên của danh mục chứa cụm từ “du lịch”, và kèm tên danh mục tour--
CREATE VIEW contain_dulich AS 
SELECT .Categories.name AS cate_name,Travels.name FROM Travels,Categories
WHERE Categories.id = Travels.cat_id AND Categories.name LIKE N'%Du lịch%'
GO
SELECT *FROM contain_dulich
GO
--Hiển thị danh sách tour có số ngày nhiều nhất--
CREATE PROCEDURE max_tour AS 
SELECT name,days FROM Travels 
WHERE days = (SELECT MAX(days) FROM Travels)
GO
EXEC max_tour
GO
--Hiển thị danh sách tour với tham số tìm kiếm là tên danh mục hoặc tên tour--
CREATE PROCEDURE [SerchTourByName]
@name NVARCHAR(50)
AS
BEGIN
	SELECT Cate.name,Cate.counts,Tour.name,Tour.price,Tour.days,Tour.start_date FROM dbo.Categories AS Cate,dbo.Travels AS Tour
	WHERE (Cate.name = @name OR Tour.name = @name)
	AND Cate.id = Tour.cat_id

END
GO
--Khi thêm mới tour ở bảng Travels, tự động tăng thêm dữ liệu counts ở bảng categories lên 1 đơn vị tương ứng với danh mục tour được thêm--
CREATE TRIGGER insert_Tours 
ON dbo.Travels
AFTER INSERT
AS 
BEGIN
	UPDATE dbo.Categories SET counts = ((SELECT counts
		FROM dbo.Categories
		WHERE id = Inserted.cat_id) + 1) FROM dbo.Categories AS categories JOIN inserted ON categories.id = inserted.cat_id 
		WHERE categories.id = Inserted.cat_id;
	
END 
GO 

--Khi cập nhật dữ liệu tour trong bảng Travels, nếu dữ liệu giá < 0 thì không cho cập nhật và hiển thị thông báo "Lỗi dữ liệu"--
CREATE TRIGGER check_prices ON dbo.Travels
FOR UPDATE 
AS 
IF (SELECT price FROM Inserted) <0
BEGIN 
	PRINT N'Lỗi dữ liệu'
	ROLLBACK TRANSACTION
END

UPDATE Travels
SET Travels.price= -5
WHERE id = 1
GO