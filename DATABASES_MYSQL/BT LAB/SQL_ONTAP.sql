--Xây dựng một cơ sở dữ liệu như trên đặt tên là: MaSV_TenSV--
CREATE DATABASE SQL_ONTAP
GO
USE SQL_ONTAP
GO
--Tạo các bảng--
CREATE TABLE Employee (
	EmpId nvarchar(50) not null,
	EmpName nvarchar(50) null,
	HireDate date null,
	Salary float null,
	Email nvarchar(50) null,
	Phone nvarchar(50) null,
	Sex bit null,
	Status bit null,
	DepartmentId int not null,
	EmpTypeId int not null
)
GO
CREATE TABLE Department (
	DepartmentId int not null,
	DepartmentName nvarchar(50) null,
	Location nvarchar(50) null,
	Status bit null
)
GO
CREATE TABLE EmployeeType(
	EmpTypeId int not null,
	EmpTypeName nvarchar(50) null,
	Status bit null
)
GO
--Thêm khóa chính cho các bảng--
ALTER TABLE Employee
ADD CONSTRAINT key_Employee PRIMARY KEY (EmpId);
GO
ALTER TABLE Department
ADD CONSTRAINT key_Department PRIMARY KEY (DepartmentId);
GO
ALTER TABLE EmployeeType
ADD CONSTRAINT key_EmployeeType PRIMARY KEY (EmpTypeId);
GO
--Cột DepartmentID là khóa ngoại, tham chiếu tới bảng Department--
ALTER TABLE Employee
ADD CONSTRAINt Employee_Department FOREIGN KEY (DepartmentId) REFERENCES Department (DepartmentId);
GO
--Cột EmpTypeId là khóa ngoại, tham chiếu tới bảng EmployeeType--
ALTER TABLE Employee
ADD CONSTRAINt Employee_EmployeeType FOREIGN KEY (EmpTypeId) REFERENCES EmployeeType(EmpTypeId);
GO
--Thêm dữ liệu vào các bảng--
INSERT INTO EmployeeType
VALUES
	(1,N'Nhân viên cơ hữu',1),
	(2,N'Nhân viên công tác',1),
	(3,N'Nhân viên fulltime',0)
GO
SELECT *FROM EmployeeType
GO
INSERT INTO Department
VALUES
	(1,N'Phòng CMLT',304,1),
	(2,N'Phòng CMM',306,1),
	(3,N'Phòng Đào Tạo',301,1)
GO
SELECT *FROM Department
GO
INSERT INTO Employee
VALUES
	('E001',N'Nguyễn Công Phượng','2017-05-14',10000000,'phuongnc@gmail.com','0948385837',1,1,1,1),
	('E002',N'Nguyễn Trung Hiếu','2014-06-08',8000000,'hieunt@gmail.com','0904488485',1,1,2,2),
	('E003',N'Nguyễn Thị Thủy','2013-09-06',9000000,'thuynt@gmail.com','0904305253',0,1,3,3),
	('E004',N'Nguyễn Thị Thắm','2016-08-05',6500000,'thamnt@gmail.com','0949904567',0,1,2,1),
	('E005',N'Lê Thanh Thùy','2012-02-01',7500000,'thuylt@gmail.com','0948856932',0,0,1,3)
GO
SELECT *FROM Employee
GO
--Hiển thị thông tin theo kết quả--
SELECT Employee.EmpId AS MaNV,Employee.EmpName AS TenNV,Employee.Sex AS GioiTinh,Employee.Salary AS Luong,Department.DepartmentName AS TenPhong
FROM Employee,Department 
WHERE Employee.DepartmentID = Department.DepartmentID
ORDER BY Employee.Salary ASC;
GO
--Hoac:
SELECT Em.EmpId,Em.EmpName,Em.Sex,Em.Salary,De.DepartmentName
FROM Employee Em,Department De
WHERE Em.DepartmentId = De.DepartmentId
ORDER BY Em.Salary ASC;
GO
--Hiển thị thông tin sinh viên có tên sinh viên có ký tự cuối là ‘g’--
SELECT * FROM Employee WHERE EmpName LIKE '%g'
GO
--Hiển thị thông tin theo kết quả sau--
SELECT Em.EmpId,Em.EmpName,De.DepartmentId,De.DepartmentName
FROM Employee Em,Department De
WHERE Em.DepartmentID = De.DepartmentID
GO
--Cập nhật nhân viên có trạng thái là false thành nhân viên có trạng thái là NULL--
UPDATE Employee
SET Status = NULL
WHERE Status = 0
GO
SELECT *FROM Employee
GO
--Xóa nhân viên có trạng thái là null--
DELETE FROM Employee WHERE EmpId = 'E005'
GO
SELECT *FROM Employee
GO
--Tạo chỉ mục cho (Index) trên cột EmpName của bảng Employee--
CREATE INDEX chi_muc ON Employee(EmpName)
GO
SELECT *FROM Employee
GO
--Tạo View có tên vwEmployee--
CREATE VIEW vw_Employee AS
SELECT Em.EmpName AS TenNhanVien,De.DepartmentName AS TenPhongBan,De.Location AS NoiLamViec,Et.EmpTypeName AS LoaiNhanVien
FROM Employee Em,Department De,EmployeeType Et
WHERE Em.DepartmentID = De.DepartmentID AND Em.EmpTypeId = Et.EmpTypeId  
GO
SELECT *FROM vw_Employee
GO
--Tạo một thủ tục lấy thông tin nhân viên có lương nhân viên nằm trong khoảng (x-y), trong đó x,y là hai tham số đầu vào kiểu float--
CREATE PROCEDURE tim_kiem_salary
	@luongX float,
	@luongY float
AS
BEGIN
	SELECT * FROM Employee
	WHERE Employee.Salary BETWEEN @luongX AND @luongY
END
GO
/*Tạo một thủ tục cập nhật thông tin nhân viên thực hiện: kiểm tra nếu 
HireDate > ngày hiện tại thì không cho phép cập nhật và thông báo ‘HireDate lon hon ngay hien tai’,
ngược lại cho phép cập nhật và thông báo ‘Cap nhat thanh cong’*/
CREATE PROCEDURE validate_Day
	@date DATE
AS
IF (@date > GETDATE())
	BEGIN
		PRINT N'HireDate không được lớn hơn ngày hiện tại'
	END
ELSE 
	BEGIN 
		PRINT N'Cập nhật ngày thành công'
	END
GO
--Tạo một thủ tục hiển thị các thông tin nhân viên có lương lớn hơn 7000000--
CREATE PROCEDURE salary_Check AS 
SELECT * FROM Employee 
WHERE Salary > 7000000
GO
EXEC salary_Check
GO
--Tạo trigger trên bảng Employee, trigger không cho phép thêm mới nhân viên có HireDate lớn hơn ngày hiện tại--
CREATE TRIGGER check_HireDate ON Employee
FOR INSERT
AS
IF (SELECT HireDate FROM Inserted) > GETDATE()
BEGIN
	PRINT N'HireDate không được lớn hơn ngày hiện tại'
	ROLLBACK TRANSACTION
END
GO
--Tạo trigger trên bảng Department, trigger không cho phép cập nhật thông tin của các phòng ban có tên là ‘Phòng CMLT’--
CREATE TRIGGER check_PhongBan ON Department
FOR UPDATE
AS
IF (SELECT DepartmentName FROM Inserted) = N'Phòng CMLT'
BEGIN
	PRINT N'Không được cập nhật phòng ban có tên là Phòng CMLT'
	ROLLBACK TRANSACTION
END
GO
--Tạo trigger trên bảng EmployeeType, trigger không cho phép xóa thông tin loại nhân viên có status = 1--
CREATE TRIGGER check_Status ON EmployeeType
FOR DELETE
AS
IF (SELECT Status FROM Deleted) = 1
BEGIN
	PRINT N'Không được xóa thông tin loại nhân viên có status = 1'
	ROLLBACK TRANSACTION
END
GO