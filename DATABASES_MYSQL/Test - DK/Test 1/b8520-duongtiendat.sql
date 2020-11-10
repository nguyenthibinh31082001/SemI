create database b8520_DUONGTIENDAT
go
use b8520_DUONGTIENDAT
go

create table employee (
	empid nvarchar (50) not null,
	empname nvarchar(50),
	hiredate date ,
	salary float ,
	email nvarchar (50),
	phone nvarchar (50),
	sex bit ,
	[status] bit not null,
	departmenid int not null,
	emptypeid int not null,
)
go

create table department(
	departmenid int not null,
	departmentname nvarchar(50),
	location nvarchar(50),
	[status] bit ,
)
go

create table employeetype(
	emptypeid int not null,
	emptypename nvarchar(50),
	[status] bit,
)
go

alter table employee
add constraint pk_employee primary key (empid)
go

alter table department
add constraint pk_department primary key (departmenid)
go

alter table employeetype
add constraint pk_employeetype primary key (emptypeid)
go

alter table employee
add constraint Fk_employee foreign key(departmenid) references department
go

alter table employee
add constraint Fk_employeetype foreign key(emptypeid) references employeetype
go

INSERT INTO employeetype(emptypeid,emptypename,[status]) VALUES
(1,N'Nhân viên cơ hữu',1),
(2,N'Nhân viên cộng tác',1),
(3,N'Nhân viên fulltime',2)
go


insert into department(departmenid,departmentname,location,[status]) values
(1,N'Phòng CMLT',304,1),
(2,N'Phòng CMM',306,1),
(3,N'Phòng Đào Tạo',301,1)
go
insert into employee(empid,empname,hiredate,salary,email,phone,sex,[status],departmenid,emptypeid) values
('E001',N'Nguyễn Công Phượng','2017-05-14',10000000,'phuongnc@gmail.com',0948385837,1,1,1,1),
('E002',N'Nguyễn Trung Hiếu','2014-06-08',80000000,'hieunc@gmail.com',0904488485,1,1,2,2),
('E003',N'Nguyễn Thị Thủy','2013-09-06',90000000,'thuync@gmail.com',0904305253,1,1,3,3),
('E004',N'Nguyễn Thị Thắm','2016-08-05',650000000,'thamnc@gmail.com',0949904567,0,1,2,1),
('E005',N'Lê Thanh Thủy','2012-02-01',750000000,'thuylt@gmail.com',0948385837,0,1,1,3)