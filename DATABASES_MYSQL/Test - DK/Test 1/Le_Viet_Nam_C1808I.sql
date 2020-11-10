create database LE_VIET_NAM_C1808I
go

use LE_VIET_NAM_C1808I
go






create table Department(
DepartmentID int primary key not null,
DepartmentName nvarchar(50),
Location nvarchar(50),
[Status] bit
)
go



create table EmployeeType(
EmpTypeID int primary key not null,
EmpTypeName nvarchar(50),
[Status] bit
)
go


create table Employee(
EmpID nvarchar(50) primary key not null,
EmpName nvarchar(50),
HireDate date,
Salary float,
Email nvarchar(50),
Phone nvarchar(50),
Sex bit,
[Status] bit,
DepartmenID int not null,
EmpTypeID int not null,
)
go

alter table Employee
add foreign key(DepartmenID) references Department(DepartmentID)
go

alter table Employee
add foreign key(EmpTypeID) references EmployeeType(EmpTypeID)
go



select * from Department
go

insert into Department values
(1,N'Phòng CMLT',304,1),
(2,N'Phòng CMM',306,1),
(3,N'Phòng Đào Tạo',301,1)
go


insert into EmployeeType values
(1,N'Nhân viên sơ cứu',1),
(2,N'Nhân viên cộng tác',1),
(3,N'Nhân viên Fulltime',0)
go

select * from EmployeeType
go

insert into Employee values
(N'E001',N'Nguyễn Công Phượng','2017-05-14',10000000,N'phuongnc@gmail.com',N'0948385837',1,1,1,1),
(N'E002',N'Nguyễn Trung Hiếu','2014-06-08',8000000,N'hieunt@gmail.com',N'0904488485',1,1,2,2),
(N'E003',N'Nguyễn Thị Thủy','2013-09-06',9000000,N'thuynt@gmail.com',N'0904305203',0,1,3,3),
(N'E004',N'Nguyễn Thị Thắm','2016-08-05',6500000,N'thamnt@gmail.com',N'0949904567',0,1,2,1),
(N'E005',N'Lê Thanh Thủy','2012-02-01',7500000,N'thuylt@gmail.com',N'0948856932',0,0,1,3)
go

select * from Employee
go