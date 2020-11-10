Create database QuanLyBanHang
go
use QuanLyBanHang
go
create table Catelog(
	CatelogId int identity(1,1) primary key,
	CatelogName nvarchar(100),
	Status bit
)
go
create table Product(
	ProductId int identity(1,1) primary key,
	CatelogId int foreign key (CatelogId) references Catelog(CatelogId),
	ProductName nvarchar(100),
	Content nvarchar(250),
	ContentDetail ntext,
	PriceInput float,
	PriceOutput float,
	Created date,
	[Views] int,
	BuyItem int,
	Status bit
)
go
create table Color(
	ColorId int identity(1,1) primary key,
	ColorName nvarchar(100),
	Status bit
)
go
create table Size(
	SizeId int identity(1,1) primary key,
	SizeName nvarchar(100),
	Status bit
)
go
create table ProductDetail(
    ProductDetailId int identity(1,1) primary key,
	ProductId int references Product(ProductId) not null,
	ColorId int references Color(ColorId)  not null,
	SizeId int  references Size(SizeId)  not null,
	quantity int,
	Status bit,
)
go 
create table Customer(
	CustomerId int identity(1,1) primary key,
	CustomerName nvarchar(50),
	Phone char(15),
	[Address] nvarchar(200),
	Email varchar(100),
	UserName varchar(50),
	[Password] varchar(50),
	Created date,
	Status bit
)
go
create table Bill(
	BillId int identity(1,1) primary key,
	CustomerId int foreign key (CustomerId) references Customer(CustomerId),
	Created date,
	Name nvarchar(100),
	[Address] nvarchar(200),
	Phone char (15),
	Email varchar(100),
	Amount float,
	Status tinyint
)
go
create table BillDetail(
	BillId int references Bill(BillId) not null,
	ProductDetailId int references ProductDetail(ProductDetailId) not null,
	PriceUnit float,
	Quantity int,
	primary key(BillId, ProductDetailId)
)
go
insert into Catelog(CatelogName, Status)
values(N'Giầy nam',1),(N'Giầy nữ',1),(N'Dép nữ',1),(N'Dép nam',1),(N'Áo nam',1),
(N'Áo nữ',1),(N'Quần nam',1),(N'Quần nữ',1)

insert into Product(CatelogId,ProductName,Content,ContentDetail,PriceInput,PriceOutput,Created,[Views], BuyItem, Status)
values(1,N'Giầy buộc giây công sở Sanvado',N'Giày buộc dây công sở Sanvado mũi bóng màu đen (MP-6033)',N'Giày buộc dây công sở Sanvado mũi bóng màu đen (MP-6033)',350000,400000,'2017-08-20',8,4,1),
(1,N'Giày nam buộc dây James Blanc',N'Giày nam buộc dây James Blanc da trơn màu đen (JB-6881)',N'Giày nam buộc dây James Blanc da trơn màu đen (JB-6881)',500000,600000,'2017-08-15',12,2,1),
(1,N'Giáy da mềm Asos',N'Giáy da mềm Asos',N'Giáy da mềm Asos',350000,400000,'2017-07-20',8,4,1),
(2,N'Giày cao gót mũi nhọn',N'Giày cao gót mũi nhọn',N'Giày cao gót mũi nhọn',60000,650000,'2017-08-12',10,5,1),
(2,N'Giày cao gót đính đá mủi hở',N'Giày cao gót đính đá mủi hở',N'Giày cao gót đính đá mủi hở',350000,450000,'2017-06-02',8,8,1),
(2,N'Giày cao gót dây buộc Asos',N'Giày cao gót dây buộc Asos',N'Giày cao gót dây buộc Asos',550000,600000,'2017-08-22',18,4,1),
(3,N'Dép xỏ ngón nhiều màu - DT170',N'Dép xỏ ngón nhiều màu - DT170',N'Dép xỏ ngón nhiều màu - DT170',750000,800000,'2017-08-05',6,2,1),
(3,N'Dép quai ngang',N'Dép quai ngang',N'Dép quai ngang',300000,350000,'2017-07-22',5,4,1),
(3,N'Dép đế xuồng hoa hồng quai trong',N'Dép đế xuồng hoa hồng quai trong',N'Dép đế xuồng hoa hồng quai trong',350000,400000,'2017-07-14',0,0,1),
(4,N'Dép cao su nam quai liền',N'Dép cao su nam quai liền',N'Dép cao su nam quai liền',630000,680000,'2017-06-20',4,0,1),
(4,N'xăng đan nam',N'xăng đan nam',N'xăng đan nam',700000,750000,'2017-06-15',20,10,1),
(4,N'Dép xỏ ngón kito thailand',N'Dép xỏ ngón kito thailand',N'Dép xỏ ngón kito thailand',800000,850000,'2017-06-24',8,1,1),
(5,N'Áo thun Nike cổ tròn',N'Áo thun Nike cổ tròn',N'Áo thun Nike cổ tròn',350000,400000,'2017-05-21',14,4,1),
(5,N'Áo sơ mi nam ngắn tay họa tiết',N'Áo sơ mi nam ngắn tay họa tiết',N'Áo sơ mi nam ngắn tay họa tiết',370000,400000,'2017-05-06',20,15,1),
(5,N'Áo thun nam cổ tròn ECO JEA',N'Áo thun nam cổ tròn ECO JEA',N'Áo thun nam cổ tròn ECO JEA',250000,300000,'2017-05-17',9,4,1),
(5,N'Áo sơ mi nam dài tay VŨ TUẤN',N'Áo sơ mi nam dài tay VŨ TUẤN',N'Áo sơ mi nam dài tay VŨ TUẤN',390000,450000,'2017-04-20',9,3,1),
(6,N'Áo voan cộc tay cao cổ',N'Áo voan cộc tay cao cổ',N'Áo voan cộc tay cao cổ',850000,900000,'2017-08-08',7,5,1),
(7,N'Quần Jean rạch gối bó',N'Quần Jean rạch gối bó',N'Quần Jean rạch gối bó',650000,700000,'2017-06-14',6,0,1),
(8,N'Quần jean bóng',N'Quần jean bóng',N'Quần jean bóng',900000,950000,'2017-08-20',0,0,1),
(8,N'Quần cạp cao Rivington',N'Quần cạp cao Rivington',N'Quần cạp cao Rivington',900000,1000000,'2017-05-25',8,2,1)
go
insert into Color(ColorName, Status)
values(N'Màu đỏ',1),(N'Màu xanh',1),(N'Màu tím',1),(N'Màu trắng',1),(N'Màu đen',1),(N'Màu hồng',1),(N'Màu vàng',1)
go
insert into Size(SizeName, Status)
values(N'Size 36', 1),(N'Size 37', 1),(N'Size 38', 1),(N'Size 39', 1),(N'Size S', 1),(N'Size M', 1),(N'Size L', 1),(N'Size 26', 1),
(N'Size 27', 1),(N'Size 28', 1),(N'Size 40', 1),(N'Size 41', 1),(N'Size 42', 1),(N'Size 43', 1)

select * from Product

insert into Customer values('Trinh Dinh Long','0956783453','Hai Duong','long@gmail.com','Dinh Long','long123','2017-08-26',1),
('Hoang Tuan Anh','087543178','Nam Dinh','anh@gmail.com','Tuan Anh','123','2017-08-26',1),
('Do My Linh','0989654387','Hai Phong','linhdm@gmail.com','Linh Do','123456','2017-05-26',1),
('Tran The tai','0865432098','Ha Nam','tai@gmail.com','Tran Tai','abcd','2017-05-09',1),
('Nguyen Tien Thanh ','01654325677','Thai Nguyen','tienthanh@gmail.com','Tien Thanh','ththth','2017-07-09',1),
('Trinh Dinh Quang','0966678456','Thanh Hoa','quang@gmail.com','Quang Dinh','quang567','2017-08-08',1)

insert into ProductDetail values(1,1,1,4,1),(1,2,1,6,1),(2,2,2,5,1),(2,1,3,4,1),
(9,2,4,5,1),(9,3,2,3,1),(15,4,1,4,1),(15,4,4,2,1)

insert into Bill values(1,'2017-08-22','Dinh Long','Hai Duong','0956783453','long@gmail.com',800000,1),
						(1,'2017-08-16','Dinh Long','Hai Duong','0956783453','long@gmail.com',1000000,1),
						(2,'2017-08-20','Hoang Tuan Anh','Nam Dinh','087543178','anh@gmail.com',700000,1),
						(2,'2017-08-08','Hoang Tuan Anh','Nam Dinh','087543178','anh@gmail.com',1000000,1)

insert into BillDetail values(1,1,400000,2),(2,2,400000,1),(2,3,600000,1),(3,6,400000,1),
                       (3,7,300000,1),(4,1,400000,1),(4,7,300000,2)