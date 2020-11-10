create database baitap3
go
use baitap3
go


create table Employeetype (
	emptypeID nvarchar (50) primary key not null,
	emptypename nvarchar (50),
	staTus bit 


)
go

Create table department (
	depatmentID  int primary key not null,
	departmentname nvarchar(50),
	Location nvarchar(50),
	status bit

	 
)
go
create table Employee (
	EmpID nvarchar(50) primary key not null,
	Empname nvarchar(50),
	hiredate date,
	salary float,
	email nvarchar(50),
	phone nvarchar (50),

	sex bit,
	status bit,
	departmentID int not null,
	EmptypeiD int not null





)
go 

after table dbo.Employee
add constraint FK_departmentID
foreign key (FK_departmentID) references Department

go

after table dbo.employee
add constraint FK_EmptypeID 
foreign key (EmptypeId) references employeetype
 
 go
 insert into dbo.Employeetype (emtypeID,emptypename,staTus) values
 (1,N'nhân viên cơ hữu',1),
 (2,N'nhân viên cộng tác',1),
 (3, N'nhân viên full time',2 )

go

insert into dbo.department (depatmentID,departmentname,Location,status) values
(1,N'Phòng CMLT',304,1)
(2,N'phòng cmm',306,1)
(3,N'phòng đào tạo',301,1)

go
