Use BKShop
go
DECLARE 
	@tong_so_nv int,
	@tong_so_pb int
SELECT @tong_so_nv = COUNT(*) FROM NhanVien
SET @tong_so_pb = (SELECT COUNT(*) FROM PhongBan)
PRINT N'Tổng số nhân viên BKShop là: ' + CONVERT(varchar,@tong_so_nv)
PRINT N'Trong khi đó có tới ' + CONVERT(varchar,@tong_so_pb) + N' phòng ban'
GO
-- Tạo đòng bộ
CREATE SYNONYM GDKH FOR BKShop.dbo.giao_dich_khachhang
GO
SELECT * FROM GDKH
GO
-- So sánh

BEGIN
	DECLARE 
		@soA int,
		@soB int
	SET @soA = 6
	SET @soB = 8
	IF @soA > @soB
		PRINT N'Số A lớn hơn số B'
	ELSE
		PRINT N'Số A nhỏ hơn số B'
END
-- if - else in ra số chẵn từ 10- 95
DECLARE @flag int
SET @flag = 10
WHILE (@flag <=95)
  BEGIN
  IF @flag%2 =0
   PRINT @flag
   SET @flag = @flag + 1
   CONTINUE;
  END
GO


-- update
DECLARE @flag int
SET @flag = 10
WHILE (@flag <=95)
  BEGIN
  SET @flag = @flag + 1 
  IF @flag < 30
	CONTINUE; -- Từ khóa có tác dụng chuyển vòng lặp kế tiếp
  IF @flag = 60
	BREAK; -- Dừng ngay lập tức vòng lặp
  IF @flag%2 =0
   PRINT @flag     
END
GO
-- truy vấn nhân viên phòng kỹ thuật

CREATE FUNCTION getNhanVienKyThuat()
RETURNS TABLE
AS
RETURN(
	SELECT * FROM NhanVien WHERE id_pb = 3
)
GO
SELECT * FROM getNhanVienKyThuat()
GO

-- Tính tổng 2 số truyền vào

GO
CREATE FUNCTION tinhTong(@soA int, @soB int)
RETURNS int
AS
BEGIN
	RETURN @soA + @soB
END
GO
SELECT dbo.tinhTong(2,4)
GO
