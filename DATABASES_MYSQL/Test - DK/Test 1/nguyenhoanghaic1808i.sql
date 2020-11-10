﻿create database nguyenhoanghai_b8500
go
use nguyenhoanghai_b8500
go
create table Employee(
	EmpId nvarchar(50) primary key not null,
	EmpName nvarchar(50),
	HireDate date ,
	Salary float,
	Email nvarchar(50),
	Phone nvarchar(50),
	Sex bit,
	Status bit ,
	DepartmentId int not null,
	EmpTypeId int not null,
)
go
create table Department(
	DepartmentId int primary key not null,
	DepartmentName nvarchar(50),
	Location nvarchar(50),
	Status bit
)
go
create table EmployeeType(
	EmpTypeId int primary key not null,
	EmpTypenmae nvarchar(50),
	Status bit
)
go
alter table Employee
	add foreign key (DepartmentId) references Department(DepartmentId)
alter table Employee
	add foreign key (EmpTypeId) references EmployeeType(EmpTypeId)
insert into EmployeeType values
	(1,'Nhân viên cơ hữu','True'),
	(2,'Nhân viên cộng tác','True'),
	(3,'Nhân viên full time','False')
go
insert into Department values
	(1,'Phong CML',304,'True'),
	(2,'Phong CMM',306,'True'),
	(3,'Phong dao tao',301,'True')
go
insert into Employee values
	('E001','Nguyễn Công Phượng','2017-05-14',10000000,'phuongnc@gmail.com','0948385837','True','True',1,1),
	('E002','Nguyễn Trung Hiếu','2014-06-08',8000000,'hieunt@gmail.com','0904488485','True','True',2,2),
	('E003','Nguyễn Thị Thủy','2013-09-06',9000000,'thuynt@gmail.com','0904305253','False','True',3,3),
	('E004','Nguyễn Thi Thắm','2016-08-05',6500000,'thamnt@gmail.com','0949904567','False','True',2,1),
	('E005','Lê Thanh Thủy','2012-05-01',7500000,'thuylt@gmail.com','0948856932','False','False',1,3)
go	
select * from Employee
go