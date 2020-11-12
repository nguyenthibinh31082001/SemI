USE lab_06;
go
CREATE TABLE tblSinh_Vien (
id int NOT NULL identity,
rollNo varchar(8) NOT NULL unique,
sv_name nvarchar(256) NOT NULL,
sv_address nvarchar(521)  NOT NULL,
sv_phone varchar(11) NOT NULL,
sv_email varchar(64) NOT NULL unique,
PRIMARY KEY (id),
);