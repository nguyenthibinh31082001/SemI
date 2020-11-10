-- Tạo database ProjectShoes
CREATE DATABASE [ProjectShoes]
GO
use ProjectShoes
go
-- Tạo bảng Catelog
create table [CATELOG](
	catelogId int identity(1,1) primary key,
	catelogName nvarchar(100),
	Status bit
)
go
-- tạo bảng Product
create table [PRODUCT](
	producrId int identity(1,1) primary key,
     productName nvarchar(100),
	content nvarchar(250),
	contentDetail ntext,
	priceInput float,
	priceOutput float,
	created date,
      views int,
     buyItem int,
	status bit
)
Go
-- Tạo bảng Color
create table [COLOR](
	colorId int identity(1,1) primary key,
	colorName nvarchar(100),
	status bit
)
Go
-- Tạo bảng Size
create table [SIZE](
	sizeId int identity (1,1) primary key,
	sizeName nvarchar(100),
	status bit
)
go

-- Thêm dữ liệu cho bảng Catelog
insert into CATELOG(catelogName,status)
 values(N'Giâỳ cao gót',1),
 (N'Giầy vải',1),
 (N'Giầy convert',1)
 Go
 -- Thêm dữ liệu cho bảng Product
 insert into PRODUCT(productName,content,contentDetail, priceInput, priceOutput, views, buyItem, created, status)
 values(N'Giầy cao gót hở mũi',N'Đây là giầy cao gót hở mũi mới',
 N'Giầy cao gót hỏ mũi đính đá hoa văn sang trọng'
 ,450000,470000,4,2,'2017-08-21',1),
 (N'Giầy cao gót đế bằng',N'Đây là giầy cao gót đế bằng mới',
 N'Giầy cao gót đế bằng trẻ trung'
 ,350000,380000,8,2,'2017-08-22',1),
  (N'Giầy convert cao cổ',N'Giầy convert cao cổ',
 N'Giầy convert cao cổ cho nữ'
 ,180000,230000,6,2,'2017-08-22',1)
 Go
 -- Thêm dữ liệu cho bảng Color
 insert into COLOR(colorName,status) 
 values(N'Màu xanh',1),
(N'Màu vàng',1), 
(N'Màu trắng',1)
 Go
-- Thêm dữ liệu cho bảng Size
insert into SIZE(sizeName, status)
 values(N'Size 36',1),
(N'Size 37',1),
(N'Size 38',1)
 go
-- Sửa dữ liệu bảng Catelog
update CATElOG
set catelogName = N'Giầy lười'
 where catelogId = 2
 go
-- Xóa dữ liệu bảng Product
delete from PRODUCT where productId = 2
 go
-- lệnh truy vấn kết hợp diều kiện toans tử logic
SELECT * FROM Product 
WHERE priceOutput > 500000 AND catelogId = 2
go
SELECT * FROM CATELOG
WHERE catelogName LIKE N'G%' OR catelogName LIKE N'D%'
-- Truy vấn dữ liệu sửa dụng các hàm
-- count đếm số bản ghi của Product
go
SELECT COUNT(productId) AS 'Tổng số sản phẩm'
FROM PRODUCT 
WHERE catelogId = 2
go
-- hàm avg: tính trung bình cộng
SELECT AVG(priceOutput) FROM PRODUCT
-- hàm sum- tính tổng giá trị
SELECT SUM(amount) AS 'Tổng tiền hóa đơn' FROM Bill 
-- hàm getDate()
SELECT GETDATE() AS 'Thời gian hiện tại'
-- Hàm Year
SELECT BillId, YEAR(Created) FROM Bill
-- Hàm Upper viết hoa toàn bộ
SELECT CatelogId, UPPER(CatelogName) FROM Catelog

-- Tạo CSDL ShopOnline
Create Database ShopOnline
go
USE QLBH
GO

CREATE TABLE loaiSanPham(
	Ma_loai INT IDENTITY(1,1) PRIMARY KEY,
	Ten_loai NVARCHAR(50) NOT NULL,
	Trang_thai BIT,
	Meta_keyword NVARCHAR(128),
	Meta_description NTEXT 
)
GO
CREATE TABLE SanPham(
	Ma_SP INT IDENTITY(1,1) PRIMARY KEY,
	Ma_loai INT NOT NULL,
	Ten_sp NVARCHAR(128)  NOT NULL,
	Gia_ban FLOAT,
	Gia_KM FLOAT,
	Meta_keyword NVARCHAR(128),
	Meta_description NTEXT,
	Mo_ta NTEXT 
)
GO

CREATE TABLE HoaDon(
	Ma_HD INT IDENTITY(1,1) PRIMARY KEY,
	Ma_KH INT  NOT NULL,
	Ngay_mua_hang DATE  NOT NULL,
	Tong_tien FLOAT  NOT NULL,
	Trang_thai_don_hang SMALLINT,
	Ten_nguoi_nhan NVARCHAR(100)  NOT NULL,
	Dia_chi_nguoi_nhan NVARCHAR (250)  NOT NULL,
	Email_nguoi_nhan VARCHAR(50)  NOT NULL,
	Phuong_thuc_thanh_toan SMALLINT  NOT NULL,
	Phuong_thuc_van_chuyen SMALLINT  NOT NULL
	
)
GO
CREATE TABLE ChiTietHoaDon(
	So_TT INT IDENTITY(1,1) PRIMARY KEY,
	Ma_HD INT NOT NULL,
	Ma_SP INT  NOT NULL,
	Gia_ban FLOAT  NOT NULL,
	So_luong INT  NOT NULL,
	Trang_thai BIT,
	Ngay_mua DATE
)
GO
CREATE TABLE KhachHang(
	Ma_KH INT IDENTITY(1,1) PRIMARY KEY,
	Ten_KH NVARCHAR(128)  NOT NULL,
	Email_KH VARCHAR(50)  NOT NULL,
	Mat_khau VARCHAR(50)  NOT NULL,
	Dien_thoai VARCHAR(11)  NOT NULL,
	Ngay_sinh DATE,
	Gioi_tinh BIT,
	Ma_phuong_xa INT,
	Dia_chi_nha NVARCHAR(250),
	Trang_thai BIT,
	
)
GO
CREATE TABLE TinhThanh(
	Ma_tinh_thanh INT IDENTITY(1,1) PRIMARY KEY,
	Trang_thai BIT,
	Ten_tinh_thanh NVARCHAR(50)  NOT NULL
)
GO
CREATE TABLE PhuongXa(
	Ma_phuong_xa INT IDENTITY(1,1) PRIMARY KEY,
	Ma_quan_huyen INT  NOT NULL,
	Ten_phuong_xa NVARCHAR(50)  NOT NULL,
	Trang_thai BIT
)
GO
CREATE TABLE QuanHuyen(
	Ma_quan_huyen INT IDENTITY(1,1) PRIMARY KEY,
	Ma_tinh_thanh INT  NOT NULL,
	Ten_quan_huyen NVARCHAR(50)  NOT NULL,
	Trang_thai BIT
)
GO

	Thực hiện thêm thông tin vào các bảng đã được tạo
INSERT INTO loaiSanPham(Ten_loai,Trang_thai,Meta_keyword,Meta_description)VALUES
	('VGA', '0', 'VGA ASUS', N'VGA hót nhất'),
	('Mainboard', '1', 'Mainboard ASUS', N'MainBoard hót nhất'),
	(N'Quạt tản nhiệt', '1',N'Quạt Cooler Master', N'Quạt tản nhiệt tốt nhất')
	
GO

INSERT INTO SanPham(Ma_loai,Ten_sp,Gia_ban,Gia_KM,Meta_keyword,Meta_description,Mo_ta )VALUES
	(1, 'Vga Asus 601',232.00,215.00,'Asus 601',N'Vga Asus tốt nhât',N'Bảo hành 3 năm'),
	(2, 'Mainboard Asus 901',899.00,800.00,'Asus 901',N'Mainboard Asus tốt nhât',N'Bảo hành 1 năm'),
	(2, 'Mainboard Asus 100',990.00,818.00,'Asus 100',N'Mainboard Asus tốt nhât',N'Bảo hành 1 năm')

GO

INSERT INTO KhachHang(Ten_KH, Email_KH, Mat_khau,Dien_thoai, Ngay_sinh, Gioi_tinh, Ma_phuong_xa, Dia_chi_nha, Trang_thai)VALUES
	(N'Hoàng Anh Tú','anhtu@gmail','123456','0909879877','1990-09-09','1',3,'3/HQV quận Cầu Giấy HN','0'),
	(N'Mai Hoa','maihoa@gmail','123','0901239877','1987-09-01','0',4,'8/TTT quận Hoàn Kiếm HNN','1'),
	(N'Nguyễn Lâm','Nlam@gmail','abc','0912379877','1966-12-12','1',5,'12/Nghĩa Tân quận Cầu Giấy HN','1')

GO

INSERT INTO HoaDon(Ma_KH,Ngay_mua_hang,Tong_tien, Trang_thai_don_hang, Ten_nguoi_nhan, Dia_chi_nguoi_nhan, Email_nguoi_nhan,Phuong_thuc_thanh_toan,Phuong_thuc_van_chuyen)VALUES
	(1,'2016-03-10',800.00,10,N'Hoàng Anh Tú',N'3/HQV quận Cầu Giấy HN','anhtu@gmail','3','1'),
	(2,'2016-03-09',1200.00,20,N'Mai Hoa',N'8/TTT quận Hoàn Kiếm HN','maihoa@gmail','4','0'),
	(3,'2016-03-08',989.00,10,N'Nguyễn Lâm',N'12/Nghĩa Tân quận Cầu Giấy HN','Nlam@gmail','5','1')
GO

INSERT INTO ChiTietHoaDon(Ma_HD, Ma_SP, Gia_ban, So_luong, Trang_thai, Ngay_mua )VALUES
	(1,1,800.00,3,'1','2016-03-10'),
	(1,2,800.00,1,'1','2016-03-10'),
	(1,3,1600.00,2,'1','2016-03-10'),
	(2,1,215.00,1,'0','2016-03-08'),
	(3,1,215.00,1,'0','2016-03-08')
GO

INSERT INTO TinhThanh(Trang_thai ,Ten_tinh_thanh) VALUES
	('0',N'Hà Nội'),
	('0',N'Hà Nam'),
	('0',N'Vĩnh Phúc'),
	('1',N'Tiền Giang'),
	('1',N'Bến Tre')
GO
INSERT INTO QuanHuyen(Ma_tinh_thanh, Ten_quan_huyen, Trang_thai )VALUES
 (1,N'Cầu Giấy','0'),
 (1,N'Tây Hồ','0'),
 (1,N'Hoàn Kiếm','1'),
 (1,N'Ba Đình','0')
GO


INSERT INTO PhuongXa(Ma_quan_huyen , Ten_phuong_xa , Trang_thai )VALUES
 (1,N'Dịch Vọng','0'),
 (1,N'Quan Hoa','0'),
 (1,N'Nghĩa Tân','0'),
 (3,N'Cửa Nam','1')
GO


