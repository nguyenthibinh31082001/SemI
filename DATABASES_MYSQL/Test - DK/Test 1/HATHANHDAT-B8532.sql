create database B8532_Hathanhdat
go
use B8532_Hathanhdat
go
create table Employee(
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

