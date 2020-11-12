USE lab_06;
go
CREATE TABLE tblProduct (
mahh int NOT NULL identity,
tenhh nvarchar(50) NOT NULL,
nhasx nvarchar(200) NOT NULL,
soluong int NOT NULL,
giagoc float NOT NULL,
vat int NOT NULL,
PRIMARY KEY (mahh),
);
