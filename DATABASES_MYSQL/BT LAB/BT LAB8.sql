CREATE DATABASE [B1Lab8]
GO
USE B1Lab8
GO
CREATE TABLE [Hang_Hoa](
	MaHH Char(4) PRIMARY KEY Not Null,
	TenHH NVARCHAR(50) NOT NULL
)
GO
CREATE TABLE [NVL](
	MaNVL CHAR(4) PRIMARY KEY NOT NULL,
	TenNVL NVARCHAR(50) NOT NULL,
	DvTinh CHAR(10),
	DonGia FLOAT CHECK (DonGia>=0)
)
GO
 CREATE TABLE[Dinh_Muc](
	MaHH CHAR(4) NOT NULL,
	MaNVL CHAR(4) NOT NULL,
	SlDinhMuc REAL CHECK(SlDinhMuc>=0),
	PRIMARY KEY (MaHH,MaNVL)
)
GO
CREATE TABLE [KHSX](
	NamThang CHAR(6 ) NOT NULL,
	MaHH CHAR(4) NOT NULL,
	SlSanXuat INT CHECK(SlSanXuat>0),
	PRIMARY KEY (NamThang,MaHH)
)
GO
ALTER TABLE dbo.Dinh_Muc
ADD CONSTRAINT fk1 FOREIGN KEY(MaHH) REFERENCES dbo.Hang_Hoa(MaHH)
GO
ALTER TABLE dbo.Dinh_Muc
ADD CONSTRAINT fk2 FOREIGN KEY(MaNVL) REFERENCES dbo.NVL(MaNVL)
GO
ALTER TABLE dbo.KHSX
ADD CONSTRAINT fk3 FOREIGN KEY(MaHH) REFERENCES dbo.Hang_Hoa(MaHH)
GO
INSERT INTO [Hang_Hoa](MaHH,TenHH)
VALUES (N'G001',N'Giày thể thao'),
		(N'G002',N'Giày thòi trang'),
		(N'G003',N'Giày trẻ em')
GO
SELECT * FROM Hang_Hoa
GO
INSERT INTO NVL(MaNVL,TenNVL,DvTinh,DonGia)
VALUES (N'D001',N'Da',N'Tấm',100000),
		(N'D002',N'Giả da',N'Mét',70000),
		(N'D003',N'Nhựa',N'Kg',120000),
		(N'D004',N'Keo',N'Kg',80000),
		(N'D005',N'Chỉ',N'Mét',30000)
GO
SELECT * FROM NVL
GO
INSERT INTO Dinh_Muc(MaHH,MaNVL,SlDinhMuc)
VALUES (N'G001',N'D001',0.3),
		(N'G001',N'D002',0.2),
		(N'G001',N'D003',0.3),
		(N'G002',N'D001',0.2),
		(N'G002',N'D002',0.1),
		(N'G002',N'D003',0.2),
		(N'G003',N'D002',0.1),
		(N'G003',N'D003',0.1),
		(N'G003',N'D004',0.3),
		(N'G003',N'D005',0.3)
GO
SELECT * FROM Dinh_Muc
GO
INSERT INTO KHSX(NamThang,MaHH,SlSanXuat)
VALUES (N'200504',N'G001',8000),
		(N'200504',N'G002',7500),
		(N'200504',N'G003',7000),
		(N'200505',N'G001',7500),
		(N'200505',N'G002',8000)
GO
SELECT * FROM KHSX
GO
--Phần 2:
SELECT N.MaNVL,N.TenNVL,N.DvTinh,D.SlDinhMuc FROM NVL N,Dinh_Muc D
WHERE N.MaNVL = D.MaNVL AND D.MaHH = 'G001'
GO
SELECT MaNVL,TenNVL,(SELECT COUNT(*) FROM Dinh_Muc AS D WHERE D.MaNVL = N.MaNVL )AS 'Tổng số hàng hóa' FROM NVL AS N
GO
SELECT N.MaNVL,N.TenNVL ,(D.SlDinhMuc*K.SlSanXuat) AS 'Số lượng dự đoán' FROM NVL N,Dinh_Muc D,KHSX K
WHERE N.MaNVL = D.MaNVL AND K.MaHH = D.MaHH AND K.NamThang <= '200504'
GO
SELECT N.MaNVL,N.TenNVL ,(D.SlDinhMuc*K.SlSanXuat) AS 'Số lượng dự đoán', ((D.SlDinhMuc*K.SlSanXuat)*N.DonGia)AS 'Thành tiền dự toán' 
FROM NVL N,Dinh_Muc D,KHSX K
WHERE N.MaNVL = D.MaNVL AND K.MaHH = D.MaHH AND K.NamThang <= '200504'
GO
--Phần 3:
--Liệt kê số lượng sản xuất của các hàng hoá có mã G001 theo kế hoạch sản xuất trong tháng 4 năm 2005.
CREATE VIEW vw_slsx AS
SELECT H.MaHH,H.TenHH,K.SlSanXuat FROM Hang_Hoa H,KHSX K
WHERE H.MaHH = K.MaHH AND K.MaHH = 'G001' AND K.NamThang <= '200504'
GO
SELECT *FROM vw_slsx
GO
--Liệt kê các hàng hoá khác nhau đã được sản xuất trong năm 2005
CREATE VIEW vw__hanghoakhacnhau AS
SELECT H.MaHH,H.TenHH FROM Hang_Hoa H
GO
SELECT *FROM vw__hanghoakhacnhau
GO
--Liệt kê các hàng hoá chỉ được sản xuất từ những NVL có đơn giá từ 80 000 trở lên
CREATE VIEW vw_hh AS
SELECT H.MaHH,H.TenHH,N.TenNVL,N.DonGia FROM Hang_Hoa H,NVL N
WHERE N.DonGia > 80000
GO
SELECT *FROM vw_hh
GO
--Liệt kê các hàng hoá được sản xuất từ những NVL có số lượng định mức là 0,3
CREATE VIEW vw_hhsx AS
SELECT H.MaHH,H.TenHH,N.TenNVL,D.SlDinhMuc FROM Hang_Hoa H,NVL N,Dinh_Muc D
WHERE D.SlDinhMuc = 0.3 AND D.MaHH = H.MaHH AND N.MaNVL = D.MaNVL
GO
SELECT *FROM vw_hhsx
GO
--Liệt kê các hàng hoá có tên bắt đầu bằng chữ “Giày”, các chữ sau đó là ký tự bất kỳ
CREATE VIEW vw_Giay AS
SELECT MaHH,TenHH FROM Hang_Hoa
WHERE TenHH LIKE 'G%'
GO
SELECT *FROM vw_Giay
GO
--Phần 4: Sao lưu, thay đổi cấu trúc bảng
--Thêm vào bảng hang_hoa cột ghi_chu, kiểu dữ liệu varchar(50)
ALTER TABLE hang_hoa
ADD ghi_chu varchar(50)
GO
SELECT *FROM hang_hoa
GO
--Tạo 1 bảng sao của bảng hang_hoa có tên là hang_hoa_backup (lệnh Select…into)
SELECT * INTO hang_hoa_backup 
FROM hang_hoa
GO
SELECT *FROM hang_hoa_backup
GO