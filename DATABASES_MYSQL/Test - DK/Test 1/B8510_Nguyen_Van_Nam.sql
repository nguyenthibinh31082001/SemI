create database B8510_NGUYEN_VAN_NAM
GO
USE B8510_NGUYEN_VAN_NAM
GO
CREATE TABLE EmployeeType(
	EmployeeTypeID int IDENTITY(1,1) primary key,
	EmployeeTypeName varchar(50) null,
	[Status] bit null
)
go
create table Employee(
	EmpId nvarchar(50) primary key,
	EmpName nvarchar(50) null,
	HireDate date null,
	Salary float null,
	Email nvarchar(50) null,
	Phone nvarchar(50) null,
	Sex bit null,
	[Status] bit null,
	DepartmentId int not null,
	EmployeeTypeID int not null
)
go
create table Department(
	DepartmentId int primary key,
	DepartmentName nvarchar(50) null,
	Location nvarchar(50) null,
	[Status] bit null
)
go
alter table Employee add Foreign key (DepartmentId) references Department(DepartmentId)
GO
alter table Employee add Foreign key (EmployeeTypeID) references EmployeeType(EmployeeTypeID)
GO
insert into EmployeeType
values('Nhân viên cơ hưu',1),
('Nhân viên cộng tác',1),
('Nhân viên fulltime',0)
insert into Department
values (1,'Phòng CMLT',304,1),
(2,'Phòng CMM',305,1),
(3,'Phòng Đào Tạo',301,1)
insert into Employee
values('E001','Nguyễn Công Phượng','05-05-2017',10000000,'phuongnc@gmail.com',0949395837,1,1,1,1),
('E002','Nguyễn Trung Hiếu','06-08-2014',8000000,'hieunt@gmail.com',0904488485,1,1,2,2),
('E003','Nguyễn Thị Thủy','09-06-2013',9000000,'thuynt@gmail.com',0904305253,0,1,3,3),
('E004','Nguyễn thị thẩm','08-05-2016',6500000,'thamnt@gmail.com',0949904567,0,1,2,1),
('E005','Lê thị thùy','02-01-2012',7500000,'thuynt@gmail.com',0948856931,0,1,1,3)