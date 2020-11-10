use QuanLyBanHang
go
-- Truy vấn tới bảng Catelog lấy thông tin  Catelog
SELECT CatelogId, CatelogName FROM Catelog

-- Lấy về id của danh mục và số lượng sản phẩm
SELECT 
	c.CatelogId, c.CatelogName,
	COUNT(ProductId) AS 'Tổng sản phẩm'
FROM Catelog c
join Product p
on c.CatelogId = p.CatelogId
GROUP BY c.CatelogId, CatelogName -- Lệnh nhóm

-- Nhóm các sản phẩm 
SELECT 
	CatelogId, 
	AVG(PriceOutput) AS 'Giá trung bình'
FROM Product
GROUP BY CatelogId
-- lấy thông tin doang số theo sản phẩm
SELECT 
	ProductDetailId,
	SUM(Quantity * PriceUnit) AS 'Tổng doanh số'
FROM BillDetail
WHERE [ProductDetailId] <= 5 -- Điều kiện lọc
GROUP BY ALL ProductDetailId -- Lệnh nhóm chấp nhận cả khi điều kiện lọc ko thỏa và gán giá trị NULL

--
CREATE TABLE ThongKeBanHang(
	sanpham nvarchar(128),
	giatien float,
	ngayban date
)

-- Thêm dữ liệu
INSERT INTO ThongKeBanHang VALUES ('Nokia 1200', 100, '2016-03-19')
INSERT INTO ThongKeBanHang VALUES ('Samsung Trend', 120, '2016-03-19')
INSERT INTO ThongKeBanHang VALUES ('HTC One', 50, '2016-03-19')
INSERT INTO ThongKeBanHang VALUES ('HTC One', 50, '2016-03-19')
INSERT INTO ThongKeBanHang VALUES ('HTC One M8', 100, '2016-03-19')
INSERT INTO ThongKeBanHang VALUES ('HTC One M9', 150, '2016-03-19')
INSERT INTO ThongKeBanHang VALUES ('Samsung Trend', 120, '2016-03-20')
INSERT INTO ThongKeBanHang VALUES ('Nokia 1200', 120, '2016-03-20')

-- Xem tổng doanh thu theo ngày bán hàng
SELECT 
	ngayban,
	SUM(giatien)
FROM ThongKeBanHang
WHERE giatien > 50 -- Lệnh lọc bản ghi
GROUP BY ngayban 
HAVING SUM(giatien) >= 300 -- Lệnh chỉ lấy về tổng doanh số trong ngày lớn hơn 300$
GO

-- Tính trung bình giá sản phẩm trong tất cả hóa đơn
SELECT AVG(don_gia) AS 'Giá sản phẩm trung bình' FROM BillDetail

-- Lấy về giá sản phẩm đắt nhất
SELECT MAX(PriceOutput) AS 'Giá đắt nhất' FROM Product

-- Tính tổng doanh thu bán hàng
SELECT SUM(Amount) AS 'Tổng doanh thu' FROM Bill

-- Truy vấn lấy về ngày đặt hàng là ngày cuối cùng trong CSDL
SELECT 
	BillId, 
	CustomerId,
     Amount,
     Created
FROM Bill
WHERE 
-- Đặt điều kiện tìm kiếm là ngày Created là ngày cuối cùng trong csdl
Created = (
	-- Lấy về ngày cuối cùng trong bảng SalesOrderHeader
	SELECT MAX(Created) FROM Bill
)

-- lấy thông itn sản phẩm mà danh mục sản phẩm là "áo nam"
SELECT ProductId,ProductName, CatelogId 
FROM Product
WHERE Product.CatelogId IN
 ( SELECT CatelogId
   FROM Catelog 
   WHERE CatelogName = N'Áo nam')

-- Lấy thông tin sản phảm có màu xanh
/*
Truy vấn lồng
*/
SELECT ProductId,ProductName, PriceInput,PriceOutput
FROM Product
WHERE ProductId IN(
	SELECT ProductId
	FROM ProductDetail
	WHERE ColorId IN (
		SELECT ColorId
		FROM Color
		WHERE ColorName = N'Màu xanh'
	)
)
USE QuanLyHangHoa
GO
-- Truy vấn bảng hóa đơn và lấy về cả thông tin khách hàng
SELECT 
	b.BillId, 
	b.Name, 
	b.Address,
b.Phone,
b.Email
FROM Bill b, Customer c
WHERE c.CustomerId = b.CustomerId

USE QuanLyBanHang
GO
-- Truy vấn bảng hóa đơn và lấy về cả thông tin khách hàng
SELECT 
	b.BillId, 
	b.Name, 
	b.Address,
     b.Phone,
     b.Email
FROM Bill b INNER JOIN Customer c
ON b.CustomerId = c.CustomerId

-- Left join
SELECT CatelogName, ProductName
FROM Catelog LEFT JOIN Product
ON Catelog.CatelogId = Product.CatelogId

-- UNION, INTERSECT và EXCEPT
-- Tạo bảng
CREATE TABLE #test1(id INT, txt VARCHAR(10) )
CREATE TABLE #test2(id INT, txt VARCHAR(10) )
GO
INSERT #test1 VALUES(1,'a1')
INSERT #test1 VALUES(2,'a2')
 
INSERT #test2 VALUES(1,'a1') -- trùng với một bản ghi của #test1
INSERT #test2 VALUES(3,'a3')
-- UNION
SELECT * FROM #test1
UNION
SELECT * FROM #test2
-- EXCEPT
SELECT * FROM #test1
EXCEPT
SELECT * FROM #test2
-- INTERSERT
SELECT * FROM #test1
INTERSERT
SELECT * FROM #test2
