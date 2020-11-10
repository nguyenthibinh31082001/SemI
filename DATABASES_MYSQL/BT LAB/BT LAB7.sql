--Question 1:
CREATE DATABASE [BTLab7]
GO
USE BTLab7
GO
--Question 2:
CREATE TABLE [QuanHuyen](
	[MAQH] INT IDENTITY(1,1) NOT NULL,
	[TenQH] NVARCHAR(100) NOT NULL
)
GO
CREATE TABLE [DuongPho](
	[DuongID] INT NOT NULL,
	[MAQH] INT NOT NULL,
	[TENDUONG] NVARCHAR(100) NOT NULL,
	[NgayDuyetTen] DATETIME NULL
)
GO
CREATE TABLE [Nha_Tren_Pho](
	[NhaID] INT NOT NULL,
	[DuongID] INT NOT NULL,
	[ChuHo] NVARCHAR(50) NULL,
	[Dientich] MONEY NULL
)
GO
/*Question 3:
Sử dụng câu lệnh Alter table để thêm cột [SoNhanKhau] kiểu [INT] vào bảng [Nha_tren_pho]*/
ALTER TABLE [Nha_Tren_Pho]
ADD [SoNhanKhau] INT
GO
/*Question 4:
Áp dụng Primary Key ConstraINT cho cột [MAQH] của bảng [QuanHuyen]*/
ALTER TABLE [QuanHuyen]
ADD PRIMARY KEY(MAQH)
GO
--Áp dụng Primary Key ConstraINT cho cột [DuongID] của bảng [DuongPho]
ALTER TABLE [DuongPho]
ADD PRIMARY KEY(DuongID)
GO
--Áp dụng Primary Key ConstraINT cho cột [NhaID] trên bảng [Nha_Tren_Pho].
ALTER TABLE [Nha_Tren_Pho]
ADD PRIMARY KEY(NhaID)
GO
--Áp dụng Foreign Key ConstraINT cho bảng [Nha_Tren_Pho] tham chiếu tới bảng [DuongPho].
ALTER TABLE dbo.Nha_Tren_Pho
ADD CONSTRAINT fk1 FOREIGN KEY (DuongID) REFERENCES dbo.DuongPho(DuongID)
GO
--Áp dụng Foreign Key ConstraINT cho bảng [DuongPho] tham chiếu tới bảng [Quanhuyen].
ALTER TABLE dbo.DuongPho
ADD CONSTRAINT fk2 FOREIGN KEY(MAQH) REFERENCES dbo.QuanHuyen(MAQH)
GO
--Áp dụng Check ConstraINT cho cột [NgayDuyetTen] trong bảng [DuongPho] với giá trị trong khoảng “02/09/1945” và ngày hiện tại.
ALTER TABLE dbo.DuongPho
ADD CONSTRAINT check_tien CHECK(NgayDuyetTen > '02/09/1945'AND NgayDuyetTen < '26/12/2019')
GO
--Áp dụng Unique ConstraINT cho cột [TenQH] trong bảng [QuanHuyen].
ALTER TABLE dbo.QuanHuyen
ADD UNIQUE(TenQH)
GO
--Áp dụng Default ConstraINT cho cột [SoNhanKhau] trong bảng [Nha_Tren_Pho] với giá trị mặc định 1.
ALTER TABLE dbo.Nha_Tren_Pho
ADD CONSTRAINT  get_nk DEFAULT(1) FOR SoNhanKhau
GO
--Question 5:
INSERT INTO QuanHuyen(TenQH)
VALUES (N'Hoang Mai'),
		(N'Pho Cau Giay')
GO
SELECT * FROM QuanHuyen
GO
INSERT INTO DuongPho(DuongID, MaQH ,TENDuong)
VALUES (1,1,N'Hoang Quoc Viet'),
		(2,1,N'Pham Van Dong'),
		(3,2,N'Tran Cung')
GO
SELECT * FROM DuongPho
GO
INSERT INTO Nha_Tren_Pho(NhaID,DuongID,SoNhanKhau)
VALUES (1,1,2),
		(2,1,4),
		(3,2,6)
GO
SELECT * FROM Nha_Tren_Pho
GO
--Question 6:
--Sử dụng câu lệnh update với .WRITE(expression, @offset, @Length) function để thay đổi [TENDUONG] từ “Pho Cau Giay” thành “Duong Cau Giay”.
UPDATE QuanHuyen
SET TENQH = 'Duong Cau Giay'
WHERE MAQH = 2
GO
SELECT * FROM QuanHuyen
GO
--Question 7:
--Tạo view có tên [vw_all_Nha_Tren_Pho] kết hợp dữ liệu từ 3 bảng: [Nha_Tren_Pho],[DuongPho] và [QuanHuyen].
--Thông tin gồm các cột: QuanHuyen.TenQH, DuongPho.TENDUONG,DuongPho.NgayDuyetTen, Nha_Tren_Pho.ChuHo, Nha_Tren_Pho.Dientich,Nha_Tren_Pho.SoNhanKhau
CREATE VIEW vw_all_Nha_Tren_Pho AS
SELECT D.TENDUONG, D.NgayDuyetTen, N.ChuHo, N.Dientich
FROM DuongPho D INNER JOIN Nha_Tren_Pho N
ON D.DuongID = N.DuongID
GO
SELECT * FROM vw_all_Nha_Tren_Pho
GO