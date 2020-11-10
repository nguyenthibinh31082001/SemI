-- Bài thực hành Lab 09 
CREATE DATABASE BKShop
GO
USE BKShop
GO
-- Thực hiện tạo bảng giao dịch rút tiền
CREATE TABLE giao_dich_khachhang(
	id int IDENTITY(1,1) PRIMARY KEY,
	ten_kh nvarchar(64),
	so_tien_rut int
)

-- Thêm dữ liệu
INSERT INTO giao_dich_khachhang(ten_kh, so_tien_rut) VALUES
('minhvt', 1500),
('nangdv', 2700),
('ngoc trinh', 3800)

-- Truy vấn
SELECT * FROM giao_dich_khachhang


-- Tạo 1 trigger: yêu cầu khi thực hiện rút tiền không vượt quá 5000
CREATE TRIGGER KiemTra_SoTienRut
ON giao_dich_khachhang
FOR INSERT -- Có các hành động: INSERT | UPDATE | DELETE
AS -- định nghĩa thân của trigger
-- IF - Kiểm tra những điều kiện ràng buộc nghiệp vụ để đảm bảo tính đúng đắn của dữ liệu
IF (SELECT so_tien_rut FROM inserted) > 5000 
BEGIN -- bắt đầu nhóm lệnh nghiệp vụ
	PRINT N'Số tiền rút không được vượt quá 5000'
	ROLLBACK TRANSACTION
END -- kết thúc các lệnh nghiệp vụ

-- Thực thi thêm dữ liệu sau khi đã có TRIGGER
INSERT INTO giao_dich_khachhang(ten_kh, so_tien_rut) VALUES ('minhvt', 3333)

-- Sửa bảng Giao Dịch thêm cột ngày tháng thực hiện
ALTER TABLE giao_dich_khachhang
ADD	ngay_gd DATETIME

-- Tạo Trigger khi thực hiện cập nhật dữ liệu
CREATE TRIGGER kiemtra_capnhat_gd
ON giao_dich_khachhang
FOR UPDATE
AS
IF (SELECT ngay_gd FROM inserted) > getDate()
BEGIN
	PRINT N'Không thể cập nhật ngày giao dịch trong tương lai'
	ROLLBACK TRANSACTION -- Không cho phép nếu là ngày trong tương lai
END

-- Thêm dữ liệu
INSERT INTO giao_dich_khachhang(ten_kh, so_tien_rut, ngay_gd) VALUES ('minhvt', 4200, '2016-04-08') -- Insert vẫn được

-- Yêu cầu: cấm cập nhật lên cột số tiền
CREATE TRIGGER kiemtra_capnhat_sotien
ON giao_dich_khachhang
FOR UPDATE
AS
IF UPDATE(so_tien_rut)
BEGIN
	PRINT N'Lạy thánh, định hack tiền à?'
	ROLLBACK TRANSACTION
END

COMMIT WORK -- Đánh dấu sự kết thúc của Transaction – ít được sửa dụng



-- Hack tiền
UPDATE giao_dich_khachhang
SET so_tien_rut = 200
WHERE id = 6

-- Trigger cho hành động xóa
CREATE TRIGGER kiemtra_xoa
ON giao_dich_khachhang
FOR DELETE
AS
IF 10 IN (SELECT id FROM deleted)
BEGIN
	PRINT N'Không thể xóa giao dịch số 10'
	ROLLBACK TRANSACTION

END

	-- Tạo Trigger After: là những trigger được thực hiện sau khi CHUYỆN ĐÃ RỒI
CREATE TRIGGER hienthi_thongbao_xoa
ON giao_dich_khachhang
AFTER DELETE
AS
BEGIN
	DECLARE @sobanghi int;
	SELECT @sobanghi = COUNT(*) FROM deleted -- Lấy tất cả bản ghi trong bảng deleted của trigger
	PRINT N'Số bản ghi đã xóa là ' + CONVERT(varchar, @sobanghi)
END

-- Lệnh xóa
DELETE giao_dich_khachhang
WHERE giao_dich_khachhang.id > 0 AND giao_dich_khachhang.id < 3

-- Xem cú pháp tạo trigger
EXEC sp_helptext 'hienthi_thongbao_xoa'
-- Sửa TRIGGER
ALTER TRIGGER hienthi_thongbao_xoa
ON giao_dich_khachhang
AFTER DELETE
AS
BEGIN
	DECLARE @sobanghi int;
	SELECT @sobanghi = COUNT(*) FROM deleted -- Lấy tất cả bản ghi trong bảng deleted của trigger
	PRINT N'Records has been deleted ' + CONVERT(varchar, @sobanghi)
END

-- Lệnh xóa
DELETE giao_dich_khachhang
WHERE giao_dich_khachhang.id > 0 AND giao_dich_khachhang.id < 5

-- Xóa bỏ TRIGGER
DROP TRIGGER hienthi_thongbao_xoa

-- Tạo bảng Phòng Ban
CREATE TABLE PhongBan(
	id_pb int PRIMARY KEY,
	ten_pb nvarchar(128)
)
GO

-- Tạo bảng Nhân Viên
CREATE TABLE NhanVien(
	id_nv int PRIMARY KEY,
	id_pb int FOREIGN KEY REFERENCES PhongBan(id_pb),
	ten_nv nvarchar(128)  
)
GO
-- Thêm dữ liệu phòng ban
INSERT INTO PhongBan VALUES
(1,'Phong ke toan'),
(2,'Hanh chinh TH'),
(3,'Phong ky thuat')
GO

-- Thêm dữ liệu nhân viên
INSERT INTO NhanVien VALUES
(1, 1, 'Vu Tuan Minh'),
(2, 1, 'Nguyen Cong Phuong'),
(3, 3, 'Pham Van Mach')
GO

-- Tạo instead of trigger, nó sẽ được thực thi trước khi các ràng buộc được kiểm tra
CREATE TRIGGER trg_delete_pb
ON PhongBan
INSTEAD OF DELETE
AS
BEGIN
	DELETE NhanVien WHERE NhanVien.id_pb IN (SELECT id_pb FROM deleted)
END 

-- Thực hiện xóa dữ liệu có ràng buộc
DELETE PhongBan
WHERE id_pb = 1

SELECT * FROM NhanVien

-- Cú pháp tạo trigger
CREATE TRIGGER tg_createtb
ON DATABASE
FOR CREATE_TABLE, ALTER_TABLE
AS
	print N'Bạn không có quyền tạo bảng';
	ROLLBACK;

