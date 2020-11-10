use QuanLyBanHang
go 

-- Tạo Indexes cho bảng Color trên cột ColorId
CREATE INDEX ID_ColorId 
ON Color (ColorId)

-- Tạo Clustered Indexes cho bảng Customer trên cột CustomerId
CREATE CLUSTERED INDEX Id_CustomerId
ON Customer (CustomerId)

-- Tạo NonClustered Indexes cho bảng Customer trên cột Email
CREATE NONCLUSTERED INDEX NID_Email_Customer
ON Customer(Email)



-- Database mẫu cho bài thực hành Lab 08 - Indexes

CREATE DATABASE QLBH
GO -- Tạo CSDL

USE QLBH
GO -- Sử dụng CSDL

-- Tạo bảng Loại Sản Phẩm
CREATE TABLE Catelog(
	CatelogId INT IDENTITY(1,1) PRIMARY KEY,
	CatelogName NVARCHAR(50) NOT NULL,
	Status BIT,
	Meta_keyword NVARCHAR(128),
	Meta_description NTEXT 
)
GO

-- Tạo bảng Sản Phẩm
CREATE TABLE Product(
	ProductId INT IDENTITY(1,1) PRIMARY KEY,
	CatelogId INT NOT NULL,
	ProductName NVARCHAR(128)  NOT NULL,
	PriceOutput FLOAT,
	PriceShare FLOAT,
	Meta_keyword NVARCHAR(128),
	Meta_description NTEXT,
	Content NTEXT 
)
GO

-- Tạo bảng Hóa Đơn
CREATE TABLE Bill(
	BillId INT IDENTITY(1,1) PRIMARY KEY,
	CustomerId INT  NOT NULL,
	Created DATE  NOT NULL,
	Amount FLOAT  NOT NULL,
	Status SMALLINT,
	Name NVARCHAR(100)  NOT NULL,
	Address NVARCHAR (250)  NOT NULL,
	Email VARCHAR(50)  NOT NULL,
	PaymentMethod SMALLINT  NOT NULL,
	ShipMethod SMALLINT  NOT NULL
	
)
GO

-- Tạo bảng Chi Tiết Hóa Đơn
CREATE TABLE BillDetail(
	BillDetailId INT IDENTITY(1,1) PRIMARY KEY,
	BillId INT NOT NULL,
	ProductId INT  NOT NULL,
	PriceOutput FLOAT  NOT NULL,
	Quantity  INT  NOT NULL,
	Status BIT,
	Created DATE
)
GO

-- Tạo bảng Khách Hàng
CREATE TABLE Customer(
	CustomerId INT, -- IDENTITY(1,1) PRIMARY KEY,
	CustomerName NVARCHAR(128)  NOT NULL,
	Email VARCHAR(50)  NOT NULL,
	Password VARCHAR(50)  NOT NULL,
	Phone VARCHAR(11)  NOT NULL,
	Birthday DATE,
	Sex BIT,
	PrecinctId INT,
	Address NVARCHAR(250),
	Status BIT,
	
)
GO

-- Tạo bảng Tỉnh Thành
CREATE TABLE Province(
	ProvinceId INT, -- IDENTITY(1,1) PRIMARY KEY,
	Status BIT,
	ProvinceName NVARCHAR(50)  NOT NULL
)
GO

-- Tạo bảng Phường Xã
CREATE TABLE Precinct(
	PrecinctId INT IDENTITY(1,1) PRIMARY KEY,
	DistrictId INT  NOT NULL,
	PrecinctName NVARCHAR(50)  NOT NULL,
	Status BIT
)
GO

-- Tạo bảng Quận Huyện
CREATE TABLE District(
	DistrictId INT, -- IDENTITY(1,1) PRIMARY KEY,
	ProvinceIdn INT  NOT NULL,
	DistrictName NVARCHAR(50)  NOT NULL,
	Status BIT
)
GO
-- ============ KẾT THÚC KHỞI TẠO CSDL ====================

-- ############### Thêm dữ liệu vào bảng ###############
-- Loại Sản Phẩm
INSERT INTO Catelog(CatelogName,Status,Meta_keyword,Meta_description)VALUES
('VGA', 0, 'VGA ASUS', N'VGA hót nhất'),
('Mainboard', 1, 'Mainboard ASUS', N'MainBoard hót nhất'),
(N'Quạt tản nhiệt', 1, N'Quạt Cooler Master', N'Quạt tản nhiệt tốt nhất')	
GO

-- Sản Phẩm
INSERT INTO Product(CatelogId,ProductName,PriceOutput,PriceShare,Meta_keyword,Meta_description,Content )VALUES
(1, 'Vga Asus 601', 232.00, 215.00, 'Asus 601', N'Vga Asus tốt nhât', N'Bảo hành 3 năm'),
(2, 'Mainboard Asus 901', 899.00, 800.00, 'Asus 901', N'Mainboard Asus tốt nhât', N'Bảo hành 1 năm'),
(2, 'Mainboard Asus 100', 990.00, 818.00, 'Asus 100', N'Mainboard Asus tốt nhât', N'Bảo hành 1 năm')
GO

-- Khách Hàng
INSERT INTO Customer(CustomerName, Email, Password, Phone, Birthday, Sex, PrecinctId, Address, Status)VALUES
(N'Hoàng Anh Tú','anhtu@gmail', 'abc123','0909879877','1990-09-09',1,3,'3/HQV quận Cầu Giấy HN',0),
(N'Mai Hoa','maihoa@gmail', '123456','0901239877','1987-09-01',0,4,'8/TTT quận Hoàn Kiếm HNN',1),
(N'Nguyễn Lâm','Nlam@gmail', '654321','0912379877','1966-12-12',1,5,'12/Nghĩa Tân quận Cầu Giấy HN',1)
GO

-- Hóa Đơn
INSERT INTO Bill(CustomerId,Created,Amount, Status, Name, Address, Email,PaymentMethod,ShipMethod)VALUES
(1,'2016-03-10',800.00,10,N'Hoàng Anh Tú',N'3/HQV quận Cầu Giấy HN','anhtu@gmail',3,1),
(2,'2016-03-09',1200.00,20,N'Mai Hoa',N'8/TTT quận Hoàn Kiếm HN','maihoa@gmail',4,0),
(3,'2016-03-08',989.00,10,N'Nguyễn Lâm',N'12/Nghĩa Tân quận Cầu Giấy HN','Nlam@gmail',5,1)
GO

-- Chi tiết hóa đơn
INSERT INTO BillDetail(BillId, ProductId, PriceOutput, Quantity, Status, Created )VALUES
(1,1,800.00,3,1,'2016-03-10'),
(1,2,800.00,1,1,'2016-03-10'),
(1,3,1600.00,2,1,'2016-03-10'),
(2,1,215.00,1,0,'2016-03-08'),
(3,1,215.00,1,0,'2016-03-08')
GO

-- Tỉnh Thành
INSERT INTO Province(Status ,ProvinceName) VALUES
(0,N'Hà Nội'),
(0,N'Hà Nam'),
(0,N'Vĩnh Phúc'),
(1,N'Tiền Giang'),
(1,N'Bến Tre')
GO

-- Quận Huyện
INSERT INTO District(ProvinceId, DistrictName, Status )VALUES
(1,N'Cầu Giấy',0),
(1,N'Tây Hồ',0),
(1,N'Hoàn Kiếm',1),
(1,N'Ba Đình',0)
GO

-- Phường Xã
INSERT INTO Precinct(DistrictId , PrecinctName , Status )VALUES
(1,N'Dịch Vọng',0),
(1,N'Quan Hoa',0),
(1,N'Nghĩa Tân',0),
(3,N'Cửa Nam',1)
GO
