use BKShop
go

-- Tạo Transaction có tên là ThemPhongBan
DECLARE @TranName nvarchar(64)
SET @TranName = 'ThemPhongBan'
BEGIN TRAN @TranName
INSERT INTO BKShop.dbo.PhongBan VALUES (5, 'Phong Dao Tao')
-- thêm nhân viên

DECLARE 
	@TranName1 nvarchar(64),
	@TranName2 nvarchar(64)
SET @TranName1 = 'ThemNhanVienFulltime'
SET @TranName2 = 'ThemNhanVienParttime'

BEGIN TRAN @TranName1
	INSERT INTO NhanVien VALUES 
	(1, 1, 'Kieu Phong'),
	(2, 1, 'Mo Dung')
ROLLBACK TRAN @TranName1
BEGIN TRAN @TranName2
	INSERT INTO NhanVien VALUES 
	(4, 1, 'Doan Du')
SELECT @@TRANCOUNT AS 'Số giao dịch'
COMMIT TRAN @TranName2




-- Tạo Transaction có điểm đánh dấu
BEGIN TRAN ThemNhanVien WITH MARK 'Them nhan vien tap vụ'
GO
INSERT INTO NhanVien VALUES (6, 1, 'Duong Qua')
GO
COMMIT TRAN ThemNhanVien
GO

-- Thực thi và xử lý lỗi
BEGIN TRY
  DECLARE @num int;
  SELECT @num=217/0;
END TRY
BEGIN CATCH
  PRINT N'Có lỗi, không thể chia cho 0'
END CATCH;


-- Hiển thị chi tiết thông tin lỗi
BEGIN TRY
	SELECT 217/0;
END TRY
BEGIN CATCH
	SELECT ERROR_NUMBER() AS ErrorNumber,
			ERROR_SEVERITY() AS ErrorSeverity,
			ERROR_LINE() AS ErrorLine,
			ERROR_MESSAGE() AS ErrorMessage;
END CATCH;
GO
--
BEGIN TRAN
	BEGIN TRY
		-- DELETE FROM PhongBan WHERE id_pb = 1;
		DECLARE @num int;
		SELECT @num=217/0;
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		PRINT N'Lỗi rồi'
		ROLLBACK TRAN
	END CATCH
GO
