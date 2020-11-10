USE QuanLyBanHang
GO
-- ======== Sử dụng CSDL QuanLyBanHang =============

SELECT * FROM Catelog
GO
-- Truy vấn bảng Catelog
SELECT * FROM Product
GO

-- Viết câu lệnh khai báo biến trong SQL, thực thi phép toán và
-- hiển thị kết quả. Khai báo biến chuỗi, gán giá trị và in ra màn hình.
DECLARE @ketQua int;
SET @ketQua = 6+9 * 2 + (1+1);
SELECT @ketQua;

-- Sử dụng truy vấn không FROM
DECLARE 
	@first_name nvarchar(128),
	@last_name nvarchar(128)
SET @first_name = N'Vũ Tuấn '
SET @last_name = N'Minh'
PRINT N'Chào mừng bạn ' + @first_name + @last_name + N' đến với lớp học SQL'
SELECT @first_name + @last_name AS 'Tên sinh viên'

-- SELECT không có FROM
SELECT LEFT('Tôi yêu Việt Nam!', 3)
-- hàm LEFT
SELECT LEFT(CatelogName, 3) AS 'Tên viết tắt' FROM Catelog
-- Hàm RIGHT
SELECT RIGHT(UserName, 3) FROM Customer
-- Hàm LEN
SELECT LEN(Address) FROM Customer

-- Hàm Count - đếm tổng số bản ghi tìm thấy
SELECT COUNT(*) AS 'Tổng số sản phẩm' FROM Product

-- Truy vấn lấy một số cột dữ liệu
SELECT Product.ProductId, Product.ProductName,
 Product.PriceInput FROM Product

 -- Truy vấn lấy một số cột dữ liệu
SELECT 
	Product.ProductID, 
	Product.ProductName, 
	Product.PriceOutput, 
	Product.PriceOutput * 0.9 AS 'Giá bán KM' -- Khuyến mại giảm giá 10%
FROM Product

-- Lọc lấy danh sách các thành phố của khách hàng
SELECT DISTINCT(Address) FROM Customer

-- Lấy về 3 khách hàng đầu tiên
SELECT TOP 3 * FROM Customer

-- Lấy về 10% sản phẩm đầu tiên
SELECT TOP (10) PERCENT * FROM Product
SELECT COUNT(*) FROM Product
 
 -- LIKE 
 SELECT * FROM Product
WHERE ProductName LIKE N'%Áo%'

-- IN
SELECT ProductId,ProductName,PriceOutput FROM Product 
WHERE PriceOutput IN (300000,400000)

--BETWEEN
SELECT ProductId,ProductName,PriceOutput FROM Product 
WHERE PriceOutput BETWEEN 300000 AND 500000


