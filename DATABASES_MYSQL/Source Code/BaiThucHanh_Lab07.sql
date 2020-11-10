USE QuanLyBanHang
Go
-- tạo view vwProductInfor
CREATE VIEW vwProductInfo AS
SELECT ProductId, ProductName, PriceInput,PriceOutput, Status
FROM Product;
GO
-- lệnh truy vấn view
SELECT * FROM vwProductInfo

-- tạo view vwProductDetails
go
CREATE VIEW vwProductDetails
AS
SELECT p.ProductId,p.ProductName, p.PriceOutput
	,c.CatelogName ,p.Status 
FROM Product p
INNER JOIN Catelog c
ON p.CatelogId = c.CatelogId
GO
-- truy vấn view
SELECT * FROM vwProductDetails

 -- Tạo View đã sắp xếp và lấy ra 10 sản phẩm đầu tiên
 go
CREATE VIEW vwSortedProductDetails
AS
SELECT TOP 10 
		p.ProductId,p.ProductName,p.PriceOutput,c.CatelogName
FROM Product p
INNER JOIN Catelog c
ON c.CatelogId = p.CatelogId
ORDER BY p.ProductName -- Sắp xếp theo tên
GO

-- truy vấn view
SELECT * FROM vwSortedProductDetails

-- Thực hiện INSERT trên VIEW
create database  QLNS
go
use QLNS
go
-- Tạo bảng
CREATE TABLE Employee_Personal_Details
(
EmpID int NOT NULL,
FirstName varchar(30) NOT NULL,
LastName varchar(30) NOT NULL,
Address varchar(30)
)
GO
CREATE TABLE Employee_Salary_Details
(
EmpID
int NOT NULL,
Designation varchar(30),
Salary int NOT NULL
)
-- Tạo View
go
CREATE VIEW vwEmployee_Details
AS
SELECT e1.EmpID, FirstName, LastName, Designation, Salary
FROM Employee_Personal_Details e1
JOIN Employee_Salary_Details e2
ON e1.EmpID = e2.EmpID
-- Tạo View
go
CREATE VIEW vwEm_de AS
SELECT EmpID, FirstName, LastName 
FROM Employee_Personal_Details
GO
--Thêm dữ liệu vào view
INSERT INTO vwEm_de VALUES (1, 'Vu Tuan', 'Minh')
--Truy vấn dữ liệu của view
SELECT * FROM vwEm_de
SELECT * FROM Employee_Personal_Details

-- UPDATE View
-- Tạo bảng
CREATE TABLE Product_Details
(
ProductID int,
ProductName varchar(30),
Rate money
)
-- Thêm dữ liệu
INSERT INTO Product_Details VALUES
(1, 'Kem danh rang',N'PK nhà vệ sinh',50),
(2, 'Ban chai',N'PK nhà vệ sinh', 33),
(3, 'Xa phong tam',N'HC phòng tắm', 69),
(4, 'Bong ngoay tai',N'VV may mặc', 99),
(6, 'Dau goi',N'HC phòng tắm', 39)
-- Truy vấn
SELECT * FROM Product_Details
-- Tạo view
go
CREATE VIEW vwProduct_Details
AS
SELECT
ProductName, Rate FROM Product_Details
go
-- Cập nhật View
UPDATE vwProduct_Details
SET Rate=3000
WHERE ProductName = 'Kem danh rang'

-- Sửa bảng và thêm cột
ALTER TABLE Product_Details
ADD [Description] nvarchar(max)
GO

-- Tạo View 
CREATE VIEW vwProduct_Full_Details
AS
	SELECT ProductName, [Description], Rate 
	FROM Product_Details


-- Cập nhật View với dữ liệu text
UPDATE vwProduct_Full_Details
SET [Description] .WRITE(N'-phukien',2,1)
WHERE ProductName='Kem danh rang'
GO

-- Chỉnh sửa View
ALTER VIEW vwProduct_Full_Details
AS
	SELECT ProductID, ProductName, [Description], Rate 
	FROM Product_Details

	-- Truy vấn
SELECT * FROM vwProduct_Full_Details

-- Xem mã nguồn SQL viết lên View
EXEC sp_helptext vwProduct_Full_Details

use QuanLyBanHang
-- View với từ khóa With Check Option
CREATE VIEW vwProductInfo AS
SELECT ProductID, ProductName,PriceOutput,Status
FROM Product
WHERE PriceOutput <= 400000
WITH CHECK OPTION;
GO
select * from vwProductInfo

UPDATE vwProductInfo set  PriceOutput = 500000
WHERE ProductId = 13

-- thủ tục
go
alter proc getProductInfor
as
begin
Select top 10
 ProductId,ProductName, PriceOutput,CatelogName
from Product inner join Catelog 
on Product.CatelogId = Catelog.CatelogId
end
go
--thực thi thủ tục
go
EXEC getProductInfor
-- thủ tục có truyền tham số
go
create procedure getBillBuyCustomer
@id int
as
begin
Select BillId, Amount from Bill
where CustomerId = @id
end
-- tHực thi thủ tục
EXEC getBillBuyCustomer 1



EXEC sp_helptext getBillBuyCustomer
--updatePro
ALTER PROCEDURE getBillBuyCustomer
@name nvarchar(50)
AS
SELECT BillId,Amount
FROM Bill b
JOIN Customer c
ON b.CustomerId = c.CustomerId
WHERE c.CustomerName = @name;
GO

EXEC getBillBuyCustomer 'Trinh Dinh Long'

-- 
alter PROCEDURE totalBill
@name nvarchar(50), 
@sum int OUTPUT
AS
begin
SELECT @sum= SUM(BillId)
FROM Bill b
JOIN Customer c
ON b.CustomerId = c.CustomerId
WHERE c.CustomerName = @name
end
GO
-- Thực thi thủ tục
DECLARE @sum int;
EXEC totalBill 'Trinh Dinh Long', @sum OUTPUT;
PRINT 'So luong don hang: ' + convert(varchar(100),@sum);
GO
-- xem thủ tuc
SELECT TABLE_CATALOG, TABLE_SCHEMA, TABLE_NAME, TABLE_TYPE
FROM INFORMATION_SCHEMA.TABLES;