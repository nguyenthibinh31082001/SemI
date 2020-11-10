CREATE DATABASE LAB03
GO

USE LAB03
GO

CREATE TABLE VATTU(
	mavattu	CHAR(4) PRIMARY KEY, --Mã vật tư
	tenvattu VARCHAR(100) UNIQUE NOT NULL, --Tên vật tư
	dvtinh VARCHAR(10) DEFAULT(''), --Đơn vị tính
	phantram REAL CHECK(0<= phantram AND phantram <=100)
)
GO

CREATE TABLE NHACC(
	manhacc CHAR(3)	PRIMARY KEY ,
	tennhacc VARCHAR(100) NOT NULL UNIQUE,
	diachi VARCHAR(200) NOT NULL UNIQUE,
	dienthoai VARCHAR(20) DEFAULT('CHƯA CÓ')
)
GO

CREATE TABLE DONDH(
	sodh CHAR(4) PRIMARY KEY ,
	ngaydh DATETIME DEFAULT(GETDATE()),
	manhacc CHAR(3) NOT NULL
)
GO

CREATE TABLE CTDONDH(
		sodh CHAR(4) FOREIGN KEY REFERENCES DONDH(sodh),
		mavattu CHAR(4) FOREIGN KEY REFERENCES VATTU(mavattu),
		sldat INT NOT NULL CHECK(sldat > 0)
)
GO

CREATE TABLE PNHAP(
	sopn CHAR(4) PRIMARY KEY,
	ngaynhap DATETIME DEFAULT(GETDATE()),
	sodh CHAR(4) NOT NULL,
	FOREIGN KEY (sodh) REFERENCES DONDH(sodh)
)
GO

CREATE TABLE CTPNHAP(
	sopn CHAR(4),
	mavattu CHAR(4),
	solx INT NOT NULL CHECK(solx>0),
	dxuat MONEY NOT NULL CHECK(dxuat>0),
	PRIMARY KEY (sopn,mavattu),
	FOREIGN KEY (mavattu) REFERENCES VATTU(mavattu)
)
GO

CREATE TABLE PXUAT(
	sopx CHAR(4) PRIMARY KEY ,
	ngayxuat DATETIME DEFAULT(GETDATE()),
	tenkh VARCHAR(100) NOT NULL
)
GO

CREATE TABLE CTPXUAT(
	sopx CHAR(4),
	mavattu char(4),
	slxuat INT NOT NULL CHECK(slxuat>0),
	dxuat MONEY NOT NULL CHECK(dxuat>0),
	PRIMARY KEY (sopx,mavattu),
	FOREIGN KEY (mavattu) REFERENCES VATTU(mavattu)
)
GO

CREATE TABLE TONKHO(
	namthang CHAR(6) NOT NULL,
	mavattu CHAR(4) FOREIGN KEY REFERENCES VATTU(mavattu),
	sldau INT NOT NULL CHECK(sldau>0),
	tongsln INT NOT NULL  CHECK(tongsln>0),
	tongslx INT NOT NULL CHECK(tongslx>0),
	slcuoi AS(sldau + tongsln - tongslx),
	PRIMARY KEY (namthang,mavattu),
)
GO

