CREATE DATABASE CHUONG_B8555
GO

USE CHUONG_B8555
GO

CREATE TABLE Employee(
EmpId nvarchar(50) primary key not null,
EmpName nvarchar(50) ,
HireDate date,
Salary float,
Email nvarchar(50),
Phone nvarchar(50),
Sex bit,
[Status] bit,
DepartmentId int ,
EmpTypeId int
)
GO
CREATE TABLE Department(
DepartmentId int primary key not null,
DepartmentName nvarchar(50),
Location nvarchar(50),
[status] bit
)
GO
CREATE TABLE EmployeeType (
EmpTypeId int primary key not null,
EmpTypeName nvarchar(50),
[status] bit
)
GO
alter table Employee
add foreign key(DepartmentId) references Department(DepartmentId)
go
alter table Employee
add foreign key(EmpTypeId) references EmployeeType(EmpTypeId)
go 
select * from Employee
Go
insert into Employee values
('E001',N'Nguyễn Công Phượng','2017-05-14',10000000,N'phuongnc@gmail.com', '0948385837',1,1,1,1)
('E002',N'Nguyễn Trung Hiếu','2014-06-08',8000000,N'hieunt@gmail.com', '0904488485', 1,1,2,2)
('E003',N'Nguyễn Thị Thủy','2013-09-06',9000000,N'thuynt@gmail.com', '0904305253', 0,1,3,3)
('E004',N'Nguyễn Thị Thắm','2016-08-05',6500000,N'thamnt@gmail.com', '0983939387', 0,1,3,2)
('E005',N'Lê Thanh Thùy','2012-02-11',7500000,N'thuylt@gmail.com', '0949552837', 0,1,1,3)
Go

select * from EmployeeType
Go

insert into EmployeeType values
(1,N'Nhân viên cơ hữu','True')
(2,N'Nhân viên cộng tác','True')
(3,N'Phòng đào tạo','False')
Go

insert into Department values
(1,N'Phòng CMLT', '304', 'True')
(1,N'Phòng CMM', '306', 'True')
(1,N'Phòng Đào tạo', '301', 'True')
Go
select * from Department 
Go

