CREATE DATABASE [B2Lab5]
GO
USE B2Lab5
GO
CREATE TABLE [DMKHOA](
	MaKH CHAR(2),
	TenKH VARCHAR(50)
)
GO
INSERT INTO DMKHOA(MaKH,TenKH)
VALUES (N'AV',N'Anh Văn'),
		(N'TH',N'Tin Học'),
		(N'TR',N'Triết'),
		(N'VL',N'Vật Lý')
GO
CREATE TABLE [DMMH](
	MaMH CHAR(2),
	TenMH VARCHAR(50),
	HeSo INT
)
GO 
INSERT INTO DMMH(MaMH,TenMH,HeSo)
VALUES (N'01',N'Cơ sở dữ liệu',2),
		(N'02',N'Trí tuệ nhân tạo',1),
		(N'03',N'TRuyền tin',1),
		(N'04',N'Thiết kế web',1),
		(N'05',N'Mạng Máy tính',1),
CREATE TABLE [DMSV](
	MaSV CHAR(3),
	TenSV VARCHAR(50),
	Nam BIT,
	MaKH CHAR(2),
	SoMonDK INT,
	DiemTB FLOAT
)
GO
INSERT INTO DMSV(MaSV,TenSV,Nam,MaKH)
VALUES (N'A01',N'Nguyễn Thanh Hải',1,N'TH'),
		(N'A02',N'Trần Văn Chính',0,N'TH'),
		(N'A03',N'Lê Bạch Yến',1,N'TH'),
		(N'A04',N'Nguyễn Công Phượng',0,N'AV'),
		(N'B01',N'Phạm Văn Mách',1,N'TR'),
		(N'B02',N'Bùi Văn Quyến',1,N'AV')
GO
CREATE TABLE [KETQUA]( 
	MaSV CHAR(3),
	MaKH CHAR(2),
	Diem FLOAT
)
GO
INSERT INTO KETQUA(MaSV,MaKH,Diem)
VALUES (N'A01',N'01',6.00),
		(N'A01',N'02',6.00),
		(N'A01',N'03',5.00),
		(N'A02',N'01',7.50),
		(N'A02',N'03',10.00),
		(N'A02',N'05',9.00),
		(N'A03',N'01',5.00),
		(N'A03',N'03',2.50),
		(N'A04',N'05',10.00),
		(N'B01',N'01',7.00),
		(N'B01',N'03',2.50),
		(N'B02',N'02',6.00),
		(N'B02',N'04',10.00)
GO