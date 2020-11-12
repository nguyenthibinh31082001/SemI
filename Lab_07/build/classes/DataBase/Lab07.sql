use lab_06;
go
create table tblNhaXuatBan (MaNXB int identity primary key,TenNXB nvarchar(200),DiaChi nvarchar(200),Sdt int)
insert into tblNhaXuatBan values (N'Kim Đồng',N'Hà Nội','0243943473')
insert into tblNhaXuatBan values (N'Trẻ',N'HCM','0283931628')
insert into tblNhaXuatBan values (N'Giáo dục',N'Hà Nội', '0243822080')
insert into tblNhaXuatBan values (N'Hội Nhà văn',N'HCM','0243822213')
insert into tblNhaXuatBan values (N'Tư pháp',N'Hà Nội','0246263207')
go
 create table tblTheLoai (
	MaTL int identity primary key, 
	TenTL nvarchar(200),
	MoTa nvarchar(200)
 )
insert into tblTheLoai values (N'Truyện, tiểu thuyế',N'Kích thích tinh thần')
insert into tblTheLoai values (N'Tâm lý, tâm linh, tôn giáo',N'Tạo dựng một thói quen lành mạnh')
insert into tblTheLoai values (N'Thiếu nhi.', N'Củng cố vốn từ và cách hành văn')
insert into tblTheLoai values (N'Văn hóa xã hội – Lịch sử',N'Trau dồi kiến thức')
insert into tblTheLoai values (N'Chính trị – pháp luật',N'Tăng khả năng tập trung')
go
  create table tblSach (
	MaS int identity primary key, 
	TenS nvarchar(200),
	TheLoai int foreign key references tblTheLoai(MaTL),
	NXB int foreign key references tblNhaXuatBan(MaNXB),
	SoTrang int,
	GiaTien float
 )
 create table tblSinh_Vien (
	id int identity primary key, 
	rollNo varchar(8) UNIQUE,
	sv_name nvarchar(256),
	sv_address nvarchar(521),
	sv_phone nvarchar(11),
	sv_email nvarchar(64) UNIQUE
 )