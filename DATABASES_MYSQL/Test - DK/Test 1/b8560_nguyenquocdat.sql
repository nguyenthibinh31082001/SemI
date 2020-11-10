create database B8560_NGUYENQUOCDAT
go
use B8560_NGUYENQUOCDAT
go
create table Employee
(
	EmpId nvarchar(50) not null,
	EmpName nvarchar(50),
	Hiredate date,
	Salary float,
	Email nvarchar(50),
	Phone nvarchar(50),
	Sex bit,
	[Status] bit,
	DepartmentId int not null,
	EmpTypeId int not null
)
go
create table EmployeeType
(
	EmpTypeId int not null,
	EmpTypeName nvarchar(50),
	[Status] bit 
)
go
create table Department 
(
	DepartmentId int not null,
	DepartmentName nvarchar(50) ,
	Location nvarchar(50),
	[Status] bit
)
go
alter table EmployeeType
add constraint PK_EmployeeTypeId primary key(EmpTypeId)

go
alter table Employee
add constraint PK_EmpId primary key(EmpId)

go
alter table Department
add constraint PK_DepartmentId primary key(DepartmentId)

go
alter table  Employee
add constraint FK_DepartmentID foreign key(DepartmentID) references Department

go
alter table  Employee
add constraint FK_EmpTypeId foreign key(EmpTypeId) references EmployeeType

go
insert into dbo.EmployeeType(EmpTypeId,EmpTypeName,[Status])
values
( 1,N'Nhân viên cơ hữu',1 ),
( 2,N'Nhân viên cộng tác',1 ),
( 3,N'Nhân viên fulltime',0 )

go
insert into dbo.Department(DepartmentId,DepartmentName,Location,[Status])
values
( 1,N'Phòng CMLT' , 304,1 ),
( 2,N'Phòng CMM' , 306,1 ),
( 3,N'Phòng Đào Tạo' , 301,1 )

go
insert into dbo.Employee(EmpId,EmpName,Hiredate,Salary,Email,Phone,Sex,[Status],DepartmentId,EmpTypeId)
values 
( 'E001',N'Nguyễn Công Phượng','2017-05-14',10000000,'phuongnc@gmail.com',0948385837,1,1,1,1 ),
( 'E002',N'Nguyễn Trung Hiếu','2014-06-08',8000000,'hieunt@gmail.com',0904488485,1,1,2,2 ),
( 'E003',N'Nguyễn Thị Thủy','2013-09-06',90000000,'thuynt@gmail.com',0904305253,0,1,3,3 ),
( 'E004',N'Nguyễn Thị Thắm','2016-08-05',65000000,'thamnt@gmail.com',0949904567,0,1,2,1 ),
( 'E005',N'Lê Thanh Thuỷ','2012-02-01',75000000,'thuylt@gmail.com',0948856932,0,0,1,3 )


