create database B8601_nguyentrongtunggg
go
use B8601_nguyentrongtunggg
go
create table employee(
empID nvarchar(50) primary key not null,
empName nvarchar(50),
hiredate date,
salary float,
email nvarchar(50),
phone nvarchar(50),
sex bit,
status bit,
DepartmentID int not null ,
emptypeID int not null

)
go
create table department(
DepartmentID int primary key not null,
Departmentname nvarchar(50),
location nvarchar(50),
status bit
)
go
create table employeetype(
emptypeID int primary key not null,
emptypename nvarchar(50),
status bit
)
go
alter table dbo.employee
add constraint FK_DepartmentID
foreign key (DepartmentID) references department


alter table dbo.employee
add constraint FK_emptypeID
foreign key (emptypeID) references employeetype

insert into dbo.employeetype(emptypeID,emptypename,[status])
values
(1,N'nhân viên c? h?u',1)
(2,N'nhân viên công tác',1),
(3,N'nhân viên full time',0)
go
insert into dbo.department(DepartmentID,Departmentname,location,[status])
values
(1,N'phòng cmlt',N'304',1)
(2,N'phòng cmm',N'304',1)
(3,N'phòng ?ào t?o',N'304',1)
go
