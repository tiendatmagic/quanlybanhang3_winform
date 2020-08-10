create database quanlybanhangahihi
use quanlybanhangahihi

create table tblKhach(
	MaKhach nvarchar(10) not null,
	TenKhach nvarchar(50) not null,
	DiaChi nvarchar(50) not null,
	DienThoai nvarchar(50) not null,
	primary key (MaKhach),
)
create table tblChatLieu(
	MaChatLieu nvarchar(10) not null,
	TenChatLieu nvarchar(50) not null,
	primary key(MaChatLieu),
)
create table tblNhanVien(
	MaNhanVien nvarchar(10) not null,
	TenNhanVien nvarchar(50) not null,
	GioiTinh nvarchar(10) not null,
	DiaChi nvarchar(50) not null,
	DienThoai nvarchar(15) not null,
	NgaySinh date ,
	primary key(MaNhanVien)
)
create table tblHang(
	MaHang nvarchar(50) not null,
	TenHang nvarchar(50)not null,
	MaChatLieu nvarchar(10) not null,
	SoLuong int not null,
	DonGiaNhap int not null,
	DonGiaBan int not null,
	Anh nvarchar(200) ,
	GhiChu nvarchar(200),
	primary key (MaHang)
	)

	create table tblHDBan(
	MaHDBan nvarchar(30) not null,
	MaNhanVien nvarchar(10) not null,
	NgayBan datetime not null,
	MaKhach nvarchar(10) not null,
	TongTien int not null,
	primary key (MaHDBan)
)
create table tblChiTietHDBan(
	MaHDBan nvarchar(30) not null,
	MaHang nvarchar(50) not null,
	SoLuong int not null,
	DonGia int not null,
	GiamGia int not null,
	ThanhTien int not null,
	primary key(MaHDBan,MaHang)
)
ALTER TABLE tblHDBan
 ADD CONSTRAINT fk_maKH
  FOREIGN KEY (MaKhach)
  REFERENCES tblKhach (MaKhach);

INSERT INTO tblKhach
VALUES ('MK001','Tran My Linh','So 1 nha trang','0987563211')
INSERT INTO tblKhach
VALUES ('MK002','Nguyen Cao Luong','So 2 nha trang','0987521411')
INSERT INTO tblKhach
VALUES ('MK003','Bui Van Minh','So 3 nha trang','09651384')
INSERT INTO tblKhach
VALUES ('MK004','Phan Giao Luu','So 4 nha trang','0975361')
INSERT INTO tblKhach
VALUES ('MK005','Cao Quoc Tien','So 5 nha trang','0953214')

INSERT INTO tblChatLieu
VALUES ('MCL01','Go')
INSERT INTO tblChatLieu
VALUES ('MCL02','Nhua')
INSERT INTO tblChatLieu
VALUES ('MCL03','Thuy Tinh')
INSERT INTO tblChatLieu
VALUES ('MCL04','Nhom')
INSERT INTO tblChatLieu
VALUES ('MCL015','Sat')

INSERT INTO tblNhanVien
VALUES ('MNV01','Nguyen Thuong','Nam',' Dien Phu','0975361','2000-05-01')
INSERT INTO tblNhanVien
VALUES ('MNV02','Nguyen Linh','Nu',' Cam Ranh','0975361','1998-05-02')
INSERT INTO tblNhanVien
VALUES ('MNV03','Nguyen Thi Loan','Nu','Dien Tan','0975361','2001-05-03')
INSERT INTO tblNhanVien
VALUES ('MNV04','Phan Quoc Dat','Nam','Dien Phuoc','0975361','2000-05-04')
INSERT INTO tblNhanVien
VALUES ('MNV05','Bui Ngoc Phu','Nam',' Dien Toan','0975361','2000-05-05')

INSERT INTO tblHang
VALUES ('M001','Ban','MCL01','2','100','100000',NULL,NULL)
INSERT INTO tblHang
VALUES ('M002','Ghe','MCL01','2','100','100000',NULL,NULL)
INSERT INTO tblHang
VALUES ('M003','Kinh','MCL03','2','100','100000',NULL,NULL)
INSERT INTO tblHang
VALUES ('M004','Cua','MCL05','2','100','100000',NULL,NULL)
INSERT INTO tblHang
VALUES ('M005','tivi','MCL02','2','100','100000',NULL,NULL)

INSERT INTO tblHDBan
VALUES ('MB01','MNV01','2020-06-22','MK001','1000000')
INSERT INTO tblHDBan
VALUES ('MB02','MNV02','2020-06-23','MK002','2000000')
INSERT INTO tblHDBan
VALUES ('MB03','MNV03','2020-06-24','MK003','3000000')
INSERT INTO tblHDBan
VALUES ('MB04','MNV04','2020-06-25','MK004','4000000')
INSERT INTO tblHDBan
VALUES ('MB05','MNV05','2020-06-26','MK005','5000000')

INSERT INTO tblChiTietHDBan
VALUES ('MB01','M001','2','1000','5','20000')
INSERT INTO tblChiTietHDBan
VALUES ('MB02','M002','3','2000','6','30000')
INSERT INTO tblChiTietHDBan
VALUES ('MB03','M003','4','3000','7','40000')
INSERT INTO tblChiTietHDBan
VALUES ('MB04','M004','5','4000','2','50000')
INSERT INTO tblChiTietHDBan
VALUES ('MB05','M005','6','5000','1','60000')


SELECT*
FROM tblKhach
SELECT*
FROM tblChatLieu
SELECT*
FROM tblNhanVien
SELECT*
FROM tblHang
SELECT*
FROM tblHDBan
SELECT*
FROM tblChiTietHDBan