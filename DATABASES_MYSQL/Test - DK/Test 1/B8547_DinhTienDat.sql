CREATE DATABASE B8547_DinhTienDat
GO
USE B8547_DinhTienDat
GO

CREATE TABLE employee(
	empid NVARCHAR(50) not null PRIMARY KEY,
	empname NVARCHAR(50) null,
	hiredate DATE null,
	salary FLOAT null,
	email NVARCHAR (50)null,
	phone NVARCHAR (50)null,
	sex BIT null,
	status BIT null,
	departmentid INT not null FOREIGN KEY REFERENCES department(departmentid),
	emptypeid INT not null FOREIGN KEY REFERENCES  employeetype(emptypeid)
)
GO
CREATE TABLE department(
	departmentid INT not null PRIMARY KEY,
	departmentname NVARCHAR (50) null,
	location NVARCHAR (50) null,
	status BIT null
)
GO
CREATE TABLE employeetype(
	emptypeid INT not null PRIMARY KEY,
	emptypename NVARCHAR(50) null,
	status BIT null
)
GO
INSERT INTO employeetype (emptypeid,emptypename,status) VALUES
('1',N'Nhân viên cơ hữu','TRUE'),
('2',N'Nhân viên công tác','TRUE'),
('3',N'Nhân viên fulltime','FALSE');
GO
INSERT INTO department (departmentid,departmentname,location,status) VALUES
('1','Phòng CMLT','304','TRUE'),
('2','Phòng CMM','306','TRUE'),
('3','Phòng Đào Tạo','301','TRUE');
GO
INSERT INTO employee (empid,empname,hiredate,salary,email,phone,sex,status,departmentid,emptypeid) VALUES
('E001','Nguyễn Công Phượng','2017-05-14','100000000','phuongnc@gmail.com','0948385837','1','1','1','1'),
('E002','Nguyễn Trung Hiếu','2014-06-08','80000000','hieunt@gmail.com','0904488485','1','1','2','2'),
('E003','Nguyễn Thị Thủy','2013-09-06','90000000','thuynt@gmail.com','0904305253','0','1','3','3'),
('E004','Nguyễn Thị Thắm','2016-08-05','65000000','thamnt@gmil.com','0949904567','0','1','2','1'),
('E005','Lê Thanh Thủy','2012-02-01','75000000','thuylt@gmail.com','0948856932','0','0','1','1');
GO
