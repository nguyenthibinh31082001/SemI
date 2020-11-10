create database B8501_TranNgocHoan
go
use B8501_TranNgocHoan
go
create table Employee(
EmpId nvarchar(50) primary key,
EmpName nvarchar(50),
HireDate date,
Salary float,
Email nvarchar(50),
Phone nvarchar(50),
Sex bit,
Status bit,
DepartmentID int foreign key references Department(DepartmentID),
EmpTypeID int foreign key references EmployeeType(EmpTypeId)
)
go
create table Department(
DepartmentID int primary key,
DepartmentName nvarchar(50),
Location  nvarchar(50),
Status bit
)
go
create table EmployeeType(
EmpTypeId int primary key,
EmpTypeName nvarchar(50),
Status bit
)
go
Insert into EmployeeType values
(1,'Nhân Viên C? H?u','True'),
(2,'Nhân Viên C?ng Tác','True'),
(3,'Nhân Viên Fulltime','False')
go
Insert into Department values
(1,'Phòng CMLT','304','True'),
(2,'Phòng CMM','306','True'),
(3,'Phòng ?ào T?o','301','True')
go
insert into Employee values
('E001','Nguy?n Công Ph??ng','2017-05-14',10000000,'phuongnc@gmail.com','0948385837','True','True',1,1),
('E002','Nguy?n Trung Hi?u','2014-06-08',8000000,'hieunt@gmail.com','0904488485','True','True',2,2),
('E003','Nguy?n Th? Th?y','2013-09-06',9000000,'thuynt@gmail.com','0904305253','False','True',3,3),
('E004','Nguy?n Th? Th?m','2016-08-05',65000000,'thamnt@gmail.com','0949904567','False','True',2,1),
('E005','Lê Thanh Thùy','2012-02-01',7500000,'thuylt@gmail.com','0948856932','False','False',1,3)
go