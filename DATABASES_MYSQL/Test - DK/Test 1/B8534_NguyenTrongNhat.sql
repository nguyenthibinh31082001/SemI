create database B8534_NguyenTrongNhat
go

use B8534_NguyenTrongNhat
go

create table EmployeeType(
	EmpId nvarchar(50) primary key,
	EmpName nvarchar(50),
	HireDate date,
	Salary float,
	Email nvarchar(50),
	Phone nvarchar(50),
	Sex bit,
	[Status] bit ,
	DepartmentId int not null,
	EmpTypeId int not null,
)
go

create table Department(
	DepartmentId int primary key,
	DepartmenName nvarchar(50) ,
	Location nvarchar(50),
	[Status] bit not null,
)
go

create table Employee(
	EmpTypeId int primary key,
	EmpTypeName nvarchar(50),
	[Status] bit not null,
)
go

alter table EmployeeType
add constraint FK_DepartmentId foreign key (DepartmentId) references Department(DepartmentId)
go

alter table EmployeeType
add constraint FK_EmpTypeId foreign key (EmpTypeId) references Employee(EmpTypeId)
go

insert into Employee
values (1,N'Nhân viên cơ hữa',1),
	   (2,N'Nhân viên cộng tác',1),
	   (3,N'Nhân viên fulltime',1)
go

insert into Department
values (1,N'Phòng CMLT',N'304',1),
       (2,N'Phòng CMM',N'306',1),
	   (3,N'Phòng Đào Tạo',N'301',1)
go

insert into EmployeeType
values (N'E001',N'Nguyễn Công Phượng','2017-05-14',1000000,'phuong@gmail.com',0981772600,1,1,1,1),
       (N'E002',N'Nguyễn Công Hai','2017-05-14',2000000,'hai@gmail.com',0981772600,1,1,2,2),
	   (N'E003',N'Nguyễn Công Ba','2017-05-14',3000000,'ba@gmail.com',0981772600,1,1,3,3),
	   (N'E004',N'Nguyễn Công Bốn','2017-05-14',4000000,'bon@gmail.com',0981772600,1,1,2,1),
	   (N'E005',N'Nguyễn Công Năm','2017-05-14',5000000,'nam@gmail.com',0981772600,1,1,1,3)
go