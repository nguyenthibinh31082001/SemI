CREATE DATABASE lab_06;
go

USE lab_06;
go

CREATE TABLE tblsinhvien (
id int NOT NULL identity,
rollnumber varchar(15) NOT NULL unique,
name nvarchar(50) NOT NULL,
address nvarchar(200) DEFAULT NULL,
phone varchar(11) DEFAULT NULL,
gender bit NOT NULL,
PRIMARY KEY (id),
);

INSERT INTO tblsinhvien (rollnumber, name, address, phone, gender) VALUES
('C1505001', 'Ma Sieu', 'Tay Luong', '19001265', 1),
('C1505002', 'Dieu Thuyen', 'To Chau', '19001001', 0),
('C1505003', 'Ma Sieu', 'Tay Luong', '19001265', 1);
select * from tblsinhvien