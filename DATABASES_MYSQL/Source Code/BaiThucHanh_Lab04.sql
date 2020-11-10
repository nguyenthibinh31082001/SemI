CREATE DATABASE ProjectShoes
GO

USE ProjectShoes
GO
-- Tạo bảng danh mục sản phẩm
CREATE TABLE CATELOG(
	CatelogId int identity(1,1) PRIMARY KEY, -- Khóa chính, kiểu int, tự tăng
	CatelogName nvarchar(50) NOT NULL, -- Không được để trống
	Status tinyint DEFAULT(1) -- Mặc định dữ liệu là 1
)
GO
-- Thêm dữ liệu
INSERT INTO CATELOG (CatelogName) VALUES
(N'Giày nam'),
(N'Giày cao'),
(N'Ủng cao su'),
(N'Bốt nữ cao'),
(N'Bốt nữ da')
GO
-- Truy vấn bảng
SELECT * FROM CATELOG
GO
-- Tạo bảng SAN_PHAM
CREATE TABLE PRODUCT(
	ProductId int identity(1,1) PRIMARY KEY, -- Khóa chính
	ProductName nvarchar(200) NOT NULL, -- Không để trống
	Content nvarchar(250),
	ContentDetail ntext,
	PriceInput float NOT NULL DEFAULT(0), -- Không để trống, mặc định là 0
     PriceOutput float NOT NULL DEFAULT(0), -- Không để trống, mặc định là 0
	Views int NOT NULL DEFAULT(0), -- Không để trống, mặc định là 0
	Created datetime CHECK(Created >= GETDATE()), -- Kiểm tra giá trị nhập luôn >= ngày hiện tại
	Status tinyint CHECK(Status = 0 OR Status = 1) DEFAULT(1), -- Trạng thái chỉ có 2 giá trị 0 hoặc 1
	CatelogId int FOREIGN KEY REFERENCES CATELOG(CatelogId)
)
GO 
-- Thêm dữ liệu
INSERT INTO PRODUCT(ProductName, PriceInput,PriceOutput, Created, CatelogId) VALUES
('Conserve Chuck 1', 600,650, GETDATE(), 1),
('Gucci SNN69', 120, 150, GETDATE(), 2),
('Adidas', 1450, 1600, GETDATE(), 1),
('Nike MG21', 690,750, GETDATE(), 3),
('Tom 300', 55, 65, GETDATE(), 3),
('Lacoste 066', 99,105, GETDATE(), 5)
GO
-- Truy vấn bảng
SELECT * FROM PRODUCT
GO

-- Thêm ràng buộc giá nhập phải lớn hơn 0
ALTER TABLE PRODUCT
ADD CONSTRAINT ck_PriceInput CHECK(PriceInput >= 0)

-- Thêm ràng buộc giá nhập phải lớn hơn gia ban
ALTER TABLE PRODUCT
ADD CONSTRAINT ck_PriceOutPut CHECK(PriceOutput > PriceInput)

-- Xóa ràng buộc giá trị mặc định
ALTER TABLE PRODUCT
DROP CONSTRAINT DF__PRODUCT__PriceIn__24927208
GO
-- xóa ràng buộc giá trị mặc định của giá bán
ALTER TABLE PRODUCT
DROP CONSTRAINT DF__PRODUCT__PriceOu__25869641
GO

-- Xóa ràng buộc kiểm tra giá nhập lớn hơn 0
ALTER TABLE PRODUCT
DROP CONSTRAINT ck_PriceInput
GO
-- Xóa ràng buộc kiểm tra giá bán lớn hơn giá nhập
ALTER TABLE PRODUCT
DROP CONSTRAINT ck_PriceOutput
GO
-- Sửa kiểu dữ liệu cột giá nhập thành money
ALTER TABLE PRODUCT
ALTER COLUMN PriceInput money 
-- Thêm lại ràng buộc thêm giá trị mặc định
ALTER TABLE PRODUCT
ADD CONSTRAINT df_gia_PriceInput DEFAULT(0) FOR PriceInput
GO

-- Thêm lại ràng buộc kiểm tra lớn hơn 0
ALTER TABLE PRODUCT
ADD CONSTRAINT ck_PriceInput CHECK(PriceInput >= 0)
GO
-- Thêm 3 cột như mô tả
ALTER TABLE PRODUCT
ADD Bar_code uniqueidentifier
GO
ALTER TABLE PRODUCT
ADD PriceUnit nvarchar(16)
GO
ALTER TABLE PRODUCT
ADD Img_thumb nvarchar(512)
GO
INSERT INTO PRODUCT(ProductName, PriceInput,PriceOutput, Created, CatelogId, PriceUnit, Img_thumb, Bar_code) VALUES
('Conserve Chuck 111', 600,650, GETDATE(), 1,N'chiếc','/giaynam/cc12016sdsdf.png',NEWID()),
('Gucci SNN99', 120,150, '2016-03-12 14:32:15', 2,N'hộp','/giaynu/cc12016sdsdf.png',NEWID()),
('Adidas 123', 1450,1500, GETDATE(), 1,N'cái','/giaycao/cc12016sdsdf.png',NEWID())
GO
SELECT * FROM PRODUCT
GO






