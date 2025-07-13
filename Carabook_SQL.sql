Create database Carabook
Go

Use Carabook
Go

CREATE TABLE NhaCungCap (
    maNCC NVARCHAR(10) PRIMARY KEY,
    tenNCC NVARCHAR(100),
    diaChi NVARCHAR(200),
    sdt NVARCHAR(20)
);

CREATE TABLE TheLoai (
    maTheLoai NVARCHAR(10) PRIMARY KEY,
    tenTheLoai NVARCHAR(100)
);

CREATE TABLE SanPham (
    maSP NVARCHAR(10) PRIMARY KEY,
    tenSP NVARCHAR(100),
    donGia DECIMAL(18, 2),
    maTheLoai NVARCHAR(10),
    maNCC NVARCHAR(10),
    slTon INT,
    giamGia DECIMAL(5, 2),
    danhGia FLOAT CHECK (danhGia BETWEEN 0 AND 5),
    luotDanhGia INT,
    hinhAnhSanPham NVARCHAR(255),
    FOREIGN KEY (maTheLoai) REFERENCES TheLoai(maTheLoai),
    FOREIGN KEY (maNCC) REFERENCES NhaCungCap(maNCC)
);

ALTER TABLE SanPham
ADD soLuotBan INT DEFAULT 0;

UPDATE SanPham
SET soLuotBan = 0
WHERE soLuotBan IS NULL;


ALTER TABLE SanPham
ADD moTa NVARCHAR(4000) DEFAULT N'Không có';

UPDATE SanPham
SET moTa = N'Không có'
WHERE moTa IS NULL;




CREATE TABLE GioHang (
    maGioHang NVARCHAR(10),
    maSP NVARCHAR(10),
    soLuongMua INT,
    thanhTien DECIMAL(18, 2),
    PRIMARY KEY (maGioHang, maSP),
    FOREIGN KEY (maSP) REFERENCES SanPham(maSP)
);

CREATE TRIGGER trg_UpdateThanhTien_GioHang
ON GioHang
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE gh
    SET gh.thanhTien = gh.soLuongMua * sp.donGia
    FROM GioHang gh
    JOIN inserted i ON gh.maGioHang = i.maGioHang AND gh.maSP = i.maSP
    JOIN SanPham sp ON gh.maSP = sp.maSP;
END;


CREATE TABLE HoaDon (
    maHD NVARCHAR(10) PRIMARY KEY,
    username NVARCHAR(50),
    ngayLap DATE,
    tongTien DECIMAL(18, 2),
    ghiChu NVARCHAR(200),
    phuongThucThanhToan NVARCHAR(50),
    FOREIGN KEY (username) REFERENCES [User](username)
);

ALTER TABLE HoaDon
ADD trangThai NVARCHAR(50) DEFAULT N'Chờ xử lý';

UPDATE HoaDon 
SET trangThai = N'Chờ xử lý'


CREATE TABLE CTDonHang (
    maCTDH INT IDENTITY(1,1) PRIMARY KEY,
    maHD NVARCHAR(10),
    maSP NVARCHAR(10),
    soLuongMua INT,
    giaDonHang DECIMAL(10, 2),
    FOREIGN KEY (maHD) REFERENCES HoaDon(maHD),
    FOREIGN KEY (maSP) REFERENCES SanPham(maSP)
);



CREATE TABLE BaiVietNoiBat (
    maChuDe INT IDENTITY(1,1) PRIMARY KEY,
    tenChuDe NVARCHAR(100),
    hinhAnhChuDe NVARCHAR(255),
    noiDung NVARCHAR(MAX),
    maTheLoai NVARCHAR(10),
    FOREIGN KEY (maTheLoai) REFERENCES TheLoai(maTheLoai)
);




CREATE TABLE [User] (
    username NVARCHAR(50) PRIMARY KEY,
    password NVARCHAR(100),
    fullName NVARCHAR(100),
    email NVARCHAR(100),
    diaChi NVARCHAR(200)
);

ALTER TABLE [User]
DROP COLUMN diaChi;

ALTER TABLE [User]
ADD active BIT DEFAULT 0;


CREATE TABLE DiaChiGiaoHang (
    maDC INT IDENTITY PRIMARY KEY,  
    username NVARCHAR(50),          
    diaChi NVARCHAR(255),           
    soDienThoai NVARCHAR(15),       
    tenNguoiNhan NVARCHAR(100),     
    laMacDinh BIT DEFAULT 0,        
    FOREIGN KEY (username) REFERENCES [User](username)
);



CREATE TABLE MaGiamGia (
    maGiamGia NVARCHAR(20) PRIMARY KEY,          
    tenGiamGia NVARCHAR(100),                    
    giaTriGiam INT,                              
    soLanSuDung INT,                             
    ngayBatDau DATE DEFAULT GETDATE(),           
    ngayKetThuc DATE,                            
    daKhoa BIT DEFAULT 0                         
);



-- Add data
-- Thêm các dữ liệu vào bảng Thể loại
INSERT INTO TheLoai VALUES ('SACH' ,N'Sách');
INSERT INTO TheLoai VALUES ('DCHT' ,N'Dụng cụ học tập');
INSERT INTO TheLoai VALUES ('TRUYEN' ,N'Truyện');
INSERT INTO TheLoai VALUES ('TBCN' ,N'Thiết bị công nghệ');
INSERT INTO TheLoai VALUES ('TCVB' ,N'Tạp chí và Báo');
INSERT INTO TheLoai VALUES ('DCGD' ,N'Đồ chơi giáo dục');

-- Thêm các dữ liệu vào bảng Nhà cung cấp
INSERT INTO NhaCungCap (maNCC, tenNCC, diaChi, sdt)
VALUES ('NCC01', N'Công ty cổ phần phát hành Sách TP.HCM', N'123 Đường Sách, Quận 1', '0123456789');

INSERT INTO NhaCungCap (maNCC, tenNCC, diaChi, sdt)
VALUES ('NCC02', N'Công ty Văn Phòng Phẩm Hoa Mai', N'456 Đường Văn Phòng, Quận 2', '0987654321');

INSERT INTO NhaCungCap (maNCC, tenNCC, diaChi, sdt)
VALUES ('NCC03', N'Công ty Công Nghệ Tiến Mạnh LMN', N'789 Đường Công Nghệ, Quận 3', '0234567890');

INSERT INTO NhaCungCap (maNCC, tenNCC, diaChi, sdt)
VALUES ('NCC04', N'Công ty Đồ Chơi Giáo Dục QRS', N'101 Đường Đồ Chơi, Quận 4', '0345678901');

INSERT INTO NhaCungCap (maNCC, tenNCC, diaChi, sdt)
VALUES ('NCC05', N'Công ty Tạp Chí và Báo UVW', N'202 Đường Báo Chí, Quận 5', '0456789012');


-- Thêm các dữ liệu vào bảng Sản phẩm
INSERT INTO SanPham (maSP, tenSP, donGia, maTheLoai, maNCC, slTon, giamGia, danhGia, luotDanhGia, hinhAnhSanPham)
VALUES 
('SP01', N'Sách Giáo Khoa Toán 1', 25000, 'SACH', 'NCC01', 100, 0, 4.5, 20, 'sach_toan1.jpg'),
('SP02', N'Truyện Doremon Tập 1', 18000, 'TRUYEN', 'NCC01', 80, 0, 4.8, 35, 'doremon1.jpg'),
('SP03', N'Bút bi Thiên Long', 5000, 'DCHT', 'NCC02', 500, 0, 4.2, 18, 'but_bi.jpg'),
('SP04', N'Thước kẻ 30cm', 6000, 'DCHT', 'NCC02', 300, 0, 4.0, 10, 'thuoc_ke.jpg'),
('SP05', N'Máy tính Casio FX-580VN', 550000, 'TBCN', 'NCC03', 50, 10, 4.7, 25, 'casio_580vn.jpg'),
('SP06', N'Bộ đồ chơi xếp hình LEGO', 320000, 'DCGD', 'NCC04', 70, 5, 4.9, 40, 'lego_xephinh.jpg'),
('SP07', N'Báo Tuổi Trẻ Chủ Nhật', 5000, 'TCVB', 'NCC05', 200, 0, 4.1, 7, 'baotuoitre.jpg'),
('SP08', N'Tạp chí Khoa học & Đời sống', 15000, 'TCVB', 'NCC05', 100, 0, 4.3, 12, 'tapchi_khds.jpg'),
('SP09', N'Sách Luyện Viết Chữ Đẹp', 20000, 'SACH', 'NCC01', 120, 0, 4.4, 16, 'luyenviet.jpg'),
('SP10', N'Balo Học Sinh Chống Gù', 220000, 'DCHT', 'NCC02', 60, 5, 4.6, 21, 'balo_hocsinh.jpg');

INSERT INTO SanPham (maSP, tenSP, donGia, maTheLoai, maNCC, slTon, giamGia, danhGia, luotDanhGia, hinhAnhSanPham, soLuotBan)
VALUES 
('SP11', N'Sách Tự Học Tiếng Anh Giao Tiếp', 45000, 'SACH', 'NCC01', 80, 0, 4.6, 18, 'tienganh.jpg', 0),
('SP12', N'Hộp Bút 3 Ngăn', 28000, 'DCHT', 'NCC02', 120, 5, 4.3, 15, 'hopbut.jpg', 0),
('SP13', N'Truyện Conan Tập 5', 22000, 'TRUYEN', 'NCC01', 70, 0, 4.9, 28, 'conan5.jpg', 0),
('SP14', N'Tai Nghe Bluetooth TWS', 350000, 'TBCN', 'NCC03', 45, 10, 4.5, 32, 'tainghe.jpg', 0),
('SP15', N'Báo Kinh Tế Thị Trường', 12000, 'TCVB', 'NCC05', 200, 0, 4.1, 6, 'baokinhte.jpg', 0),
('SP16', N'Đồ Chơi Lego Chủ Đề Động Vật', 300000, 'DCGD', 'NCC04', 65, 0, 4.7, 19, 'lego_dv.jpg', 0),
('SP17', N'Sách Kỹ Năng Sống Cho Teen', 38000, 'SACH', 'NCC01', 90, 0, 4.4, 13, 'kynangsong.jpg', 0),
('SP18', N'Máy Tính Casio FX-500MS', 420000, 'TBCN', 'NCC03', 30, 0, 4.6, 20, 'casio_500ms.jpg', 0),
('SP19', N'Bút Lông Màu 24 Màu', 32000, 'DCHT', 'NCC02', 150, 0, 4.3, 11, 'butlongmau.jpg', 0),
('SP20', N'Tạp Chí Kỹ Thuật Số', 17000, 'TCVB', 'NCC05', 110, 0, 4.2, 9, 'tapchikythuat.jpg', 0);

-- Thể loại TRUYEN
INSERT INTO SanPham (maSP, tenSP, donGia, maTheLoai, maNCC, slTon, giamGia, danhGia, luotDanhGia, hinhAnhSanPham, soLuotBan, moTa)
VALUES
('SP21', N'Truyện Thần Đồng Đất Việt Tập 1', 18000, 'TRUYEN', 'NCC01', 100, 0, 4.7, 22, 'datviet1.jpg', 0,
 N'Truyện tranh Việt Nam nổi tiếng, xoay quanh các nhân vật dân gian với trí tuệ và lòng yêu nước. Nội dung hài hước, gần gũi với văn hóa Việt, phù hợp cho học sinh tiểu học và THCS.'),
('SP22', N'Truyện Naruto Tập 10', 25000, 'TRUYEN', 'NCC01', 85, 0, 4.9, 30, 'naruto10.jpg', 0,
 N'Tiếp tục hành trình luyện tập và chiến đấu của Naruto cùng đồng đội. Truyện manga hành động hấp dẫn, truyền cảm hứng về nghị lực và tình bạn. Bản in sắc nét, giấy tốt.'),
('SP23', N'Truyện Trạng Quỳnh Tập 3', 17000, 'TRUYEN', 'NCC01', 90, 0, 4.6, 18, 'trangquynh3.jpg', 0,
 N'Câu chuyện hài hước và sắc sảo về Trạng Quỳnh – một nhân vật dân gian nổi tiếng với tài ứng biến và trí thông minh. Truyện mang tính giáo dục và giải trí cao.'),
('SP24', N'Truyện Fairy Tail Tập 15', 26000, 'TRUYEN', 'NCC01', 75, 5, 4.8, 26, 'fairytail15.jpg', 0,
 N'Truyện tranh Nhật Bản hấp dẫn về hội pháp sư Fairy Tail. Pha trộn giữa hành động, phép thuật và tình bạn sâu sắc. Hình ảnh sinh động, cuốn hút giới trẻ.'),
('SP25', N'Truyện Chú Bé Rồng Tập 7', 23000, 'TRUYEN', 'NCC01', 60, 0, 4.5, 20, 'chuberong7.jpg', 0,
 N'Câu chuyện phiêu lưu kỳ ảo của một cậu bé có khả năng đặc biệt. Truyện kết hợp giữa võ thuật, thần thoại và sự trưởng thành của nhân vật chính.'),

-- Thể loại DCHT
('SP26', N'Thước Kẻ Gỗ 20cm', 6000, 'DCHT', 'NCC02', 200, 0, 4.2, 12, 'thuocgo.jpg', 0,
 N'Thước gỗ dài 20cm, chất liệu tự nhiên, thân thiện với môi trường. Độ chính xác cao, phù hợp cho học sinh và sinh viên trong học tập và vẽ kỹ thuật.'),
('SP27', N'Sổ Tay Campus 100 Trang', 18000, 'DCHT', 'NCC02', 130, 0, 4.4, 10, 'sotay100.jpg', 0,
 N'Sổ tay Campus với 100 trang kẻ ngang, giấy trắng dày, viết không lem. Thiết kế hiện đại, bìa bền đẹp. Phù hợp ghi chú, học tập hoặc làm nhật ký.'),
('SP28', N'Bút Gel Mực Xanh 0.5mm', 8000, 'DCHT', 'NCC02', 250, 0, 4.3, 15, 'butgelxanh.jpg', 0,
 N'Bút gel nét 0.5mm, mực xanh đậm, trơn mượt, không lem. Thiết kế nhỏ gọn, nắp đậy kín, phù hợp cho học sinh, sinh viên, văn phòng.'),
('SP29', N'Bút Xóa Dạng Bút TL-01', 9000, 'DCHT', 'NCC02', 180, 0, 4.1, 8, 'butxoa.jpg', 0,
 N'Bút xóa dạng bút với đầu xóa nhỏ, dễ điều khiển, mực xóa nhanh khô. Phù hợp cho ghi chú học tập và sửa lỗi văn bản nhanh chóng, tiện lợi.'),
('SP30', N'Hộp Ghim Bấm 500 Ghim', 7000, 'DCHT', 'NCC02', 160, 0, 4.0, 7, 'ghimbam.jpg', 0,
 N'Hộp đựng 500 ghim bấm tiêu chuẩn, chất liệu thép không gỉ. Phù hợp với hầu hết các loại đồ bấm giấy. Dùng cho học sinh, giáo viên, văn phòng.');

 -- Thể loại SACH
 INSERT INTO SanPham (maSP, tenSP, donGia, maTheLoai, maNCC, slTon, giamGia, danhGia, luotDanhGia, hinhAnhSanPham, soLuotBan, moTa)
VALUES
('SP31', N'Sách Giáo Khoa Toán Lớp 6', 25000, 'SACH', 'NCC01', 100, 0, 4.4, 10, 'toan6.jpg', 0, N'Sách giáo khoa chuẩn chương trình mới dành cho học sinh lớp 6.'),
('SP32', N'Sách Luyện Viết Chữ Đẹp', 18000, 'SACH', 'NCC01', 120, 0, 4.3, 8, 'vietchu.jpg', 0, N'Tập luyện chữ viết đẹp, rõ ràng, phù hợp học sinh tiểu học.'),
('SP33', N'Sách Kỹ Năng Làm Việc Nhóm', 39000, 'SACH', 'NCC01', 75, 5, 4.6, 14, 'kynangnhom.jpg', 0, N'Cung cấp kiến thức và kỹ năng làm việc hiệu quả theo nhóm.'),
('SP34', N'Sách Cẩm Nang Sinh Viên', 42000, 'SACH', 'NCC01', 60, 0, 4.5, 12, 'camnangsv.jpg', 0, N'Sổ tay tổng hợp thông tin, kỹ năng sống cần thiết cho sinh viên.'),
('SP35', N'Sách Tâm Lý Tuổi Teen', 36000, 'SACH', 'NCC01', 90, 0, 4.2, 11, 'tamlyteen.jpg', 0, N'Phân tích tâm lý lứa tuổi vị thành niên, giúp phụ huynh hiểu con hơn.'),
('SP36', N'Sách Luyện Thi THPT Quốc Gia Môn Văn', 55000, 'SACH', 'NCC01', 80, 0, 4.7, 19, 'thivan.jpg', 0, N'Tổng hợp kiến thức, dạng đề và bài mẫu thi Văn chuẩn cấu trúc mới.'),
('SP37', N'Sách Hướng Dẫn Sáng Tạo STEM', 48000, 'SACH', 'NCC01', 85, 0, 4.6, 16, 'stem.jpg', 0, N'Gợi ý các dự án học STEM đơn giản và hiệu quả cho học sinh THCS.'),
('SP38', N'Sách Lịch Sử Việt Nam Căn Bản', 30000, 'SACH', 'NCC01', 95, 0, 4.1, 9, 'lichsu.jpg', 0, N'Tổng hợp kiến thức lịch sử Việt Nam từ cổ đại đến hiện đại.'),
('SP39', N'Sách Tự Học Tin Học Văn Phòng', 52000, 'SACH', 'NCC01', 70, 0, 4.5, 13, 'tinhocvp.jpg', 0, N'Hướng dẫn chi tiết cách sử dụng Word, Excel, PowerPoint từ cơ bản.'),
('SP40', N'Sách Giáo Dục Công Dân Lớp 9', 22000, 'SACH', 'NCC01', 110, 0, 4.3, 10, 'gdcd9.jpg', 0, N'Sách giáo khoa GDCD theo chương trình phổ thông mới cho lớp 9.');

 -- Thể loại TCVB
INSERT INTO SanPham (maSP, tenSP, donGia, maTheLoai, maNCC, slTon, giamGia, danhGia, luotDanhGia, hinhAnhSanPham, soLuotBan, moTa)
VALUES
('SP41', N'Tạp chí Khoa học Thường Thức', 18000, 'TCVB', 'NCC05', 90, 0, 4.4, 12, 'tckhthuongthuc.jpg', 0,
 N'Tạp chí cung cấp kiến thức khoa học dễ hiểu, phù hợp với học sinh, sinh viên và người yêu thích khám phá.'),
('SP42', N'Báo Mực Tím Tuần 1', 12000, 'TCVB', 'NCC05', 100, 0, 4.5, 10, 'muctim1.jpg', 0,
 N'Báo dành cho tuổi học trò với nhiều chuyên mục về học tập, giải trí và tâm lý học đường.'),
('SP43', N'Tạp chí Thế Giới Số', 22000, 'TCVB', 'NCC05', 70, 0, 4.6, 14, 'thegioiso.jpg', 0,
 N'Cập nhật xu hướng công nghệ, đánh giá thiết bị và mẹo sử dụng kỹ thuật số hữu ích.'),
('SP44', N'Tạp chí Văn Học Tuổi Trẻ', 19000, 'TCVB', 'NCC05', 85, 0, 4.3, 9, 'vanhoctuoitre.jpg', 0,
 N'Tạp chí dành cho người yêu văn chương trẻ, giới thiệu sáng tác mới và bài bình luận sâu sắc.'),
('SP45', N'Báo Thiếu Niên Tiền Phong', 15000, 'TCVB', 'NCC05', 110, 0, 4.2, 8, 'thieunientienphong.jpg', 0,
 N'Báo dành cho thiếu nhi và học sinh, mang tính giáo dục cao với nội dung vui nhộn và bổ ích.');

  -- Thể loại TBCN
 INSERT INTO SanPham (maSP, tenSP, donGia, maTheLoai, maNCC, slTon, giamGia, danhGia, luotDanhGia, hinhAnhSanPham, soLuotBan, moTa)
VALUES
('SP46', N'Tai Nghe Bluetooth Không Dây', 320000, 'TBCN', 'NCC03', 60, 5, 4.5, 18, 'tainghe_bt.jpg', 0,
 N'Tai nghe Bluetooth kết nối ổn định, âm thanh rõ ràng, thời lượng pin dài.'),
('SP47', N'Chuột Không Dây Logitech M185', 250000, 'TBCN', 'NCC03', 80, 0, 4.6, 22, 'chuot_m185.jpg', 0,
 N'Chuột không dây tiện lợi, độ nhạy cao, thích hợp cho học tập và làm việc.'),
('SP48', N'Bàn Phím Cơ Có Đèn RGB', 590000, 'TBCN', 'NCC03', 40, 0, 4.7, 25, 'banphim_rgb.jpg', 0,
 N'Bàn phím cơ học gõ êm, hiệu ứng đèn RGB bắt mắt, dùng cho game và gõ văn bản.'),
('SP49', N'USB 32GB Kingston', 160000, 'TBCN', 'NCC03', 100, 0, 4.4, 19, 'usb_32gb.jpg', 0,
 N'Dung lượng lớn, tốc độ truyền nhanh, thiết kế nhỏ gọn tiện mang theo.'),
('SP50', N'Máy In Canon LBP2900', 2150000, 'TBCN', 'NCC03', 20, 0, 4.8, 27, 'canon_lbp2900.jpg', 0,
 N'Máy in laser nhỏ gọn, tốc độ in nhanh, phù hợp văn phòng và gia đình.'),
('SP51', N'Loa Bluetooth Mini JBL GO', 650000, 'TBCN', 'NCC03', 35, 0, 4.6, 16, 'jbl_go.jpg', 0,
 N'Loa Bluetooth mini âm thanh chất lượng, pin bền, dễ kết nối mọi thiết bị.'),
('SP52', N'Sạc Dự Phòng 10.000mAh Xiaomi', 450000, 'TBCN', 'NCC03', 50, 0, 4.5, 21, 'sacdp.jpg', 0,
 N'Dung lượng pin lớn, sạc nhanh, thiết kế mỏng nhẹ, vỏ nhôm chắc chắn.'),
('SP53', N'Webcam Full HD 1080p', 720000, 'TBCN', 'NCC03', 25, 0, 4.4, 15, 'webcam_hd.jpg', 0,
 N'Webcam độ phân giải cao, hỗ trợ họp trực tuyến, có micro tích hợp.'),
('SP54', N'Ổ Cứng Di Động 1TB WD', 1550000, 'TBCN', 'NCC03', 30, 0, 4.7, 17, 'hdd1tb.jpg', 0,
 N'Lưu trữ dữ liệu lớn, kết nối USB 3.0 tốc độ cao, bảo mật an toàn.'),
('SP55', N'Bộ Phát Wifi 4G LTE Huawei', 950000, 'TBCN', 'NCC03', 28, 0, 4.5, 20, 'wifi_4g.jpg', 0,
 N'Hỗ trợ sim 4G, phát wifi ổn định cho nhiều thiết bị cùng lúc.');








-- Thêm các dữ liệu vào bảng Bài viết nổi bật
INSERT INTO BaiVietNoiBat (tenChuDe, hinhAnhChuDe, noiDung, maTheLoai)
VALUES 
(N'Khám phá sách hay cho thiếu nhi', 'sach_thieunhi.jpg', N'Giới thiệu những cuốn sách bổ ích giúp phát triển tư duy và đạo đức cho trẻ em.', 'SACH'),
(N'Truyện tranh giúp trẻ học nhanh hơn', 'truyen_giaoduc.jpg', N'Những bộ truyện tranh vừa mang tính giải trí vừa giúp phát triển trí tuệ.', 'TRUYEN'),
(N'Dụng cụ học tập thông minh năm 2025', 'dcht_2025.jpg', N'Xu hướng mới trong việc chọn mua dụng cụ học tập tiện ích và sáng tạo.', 'DCHT'),
(N'Thiết bị công nghệ hỗ trợ học online', 'tbcn_online.jpg', N'Tổng hợp các thiết bị công nghệ phù hợp với việc học trực tuyến cho học sinh, sinh viên.', 'TBCN'),
(N'Tạp chí khoa học dành cho tuổi teen', 'tcvb_khoahoc.jpg', N'Tạp chí thú vị, nội dung khoa học được trình bày phù hợp với lứa tuổi học sinh.', 'TCVB'),
(N'Đồ chơi giáo dục phát triển trí tuệ', 'dcgd_tritue.jpg', N'Bài viết chia sẻ top các sản phẩm đồ chơi giúp trẻ vừa học vừa chơi.', 'DCGD'),
(N'Sách luyện thi THPT quốc gia 2025', 'sach_thpt.jpg', N'Tổng hợp sách luyện thi hiệu quả cho các bạn học sinh chuẩn bị kỳ thi THPT quốc gia.', 'SACH'),
(N'Truyện tranh manga nổi bật tháng 6', 'truyen_manga.jpg', N'Những đầu truyện manga được độc giả yêu thích nhất trong tháng 6.', 'TRUYEN'),
(N'Cách chọn balo và hộp bút phù hợp', 'dcht_balo.png', N'Hướng dẫn chọn mua balo và hộp bút phù hợp với từng lứa tuổi học sinh.', 'DCHT'),
(N'Tin tức mới nhất về công nghệ giáo dục', 'tbcn_edutech.png', N'Cập nhật các giải pháp công nghệ mới áp dụng vào ngành giáo dục.', 'TBCN');

INSERT INTO [User] (username, password, fullName, email)
VALUES (
    'sang123',
    '123456',
    N'Phạm Quang Sáng',
    'sang123@gmail.com'
);
UPDATE [User]
SET active = 1
WHERE username = 'sang123';

INSERT INTO [User] (username, password) VALUES ('sanglaida', '999999')

INSERT INTO DiaChiGiaoHang (username, diaChi, soDienThoai, tenNguoiNhan, laMacDinh)
VALUES 
('sang123', N'123 Đường Lê Lợi, Quận 1, TP.HCM', '0909123456', N'Phạm Quang Sáng', 1),
('sang123', N'456 Trần Hưng Đạo, Quận 5, TP.HCM', '0912345678', N'Sáng P.Q.', 0);





INSERT INTO MaGiamGia (maGiamGia, tenGiamGia, giaTriGiam, soLanSuDung, ngayBatDau, ngayKetThuc)
VALUES (
    'SALE13000', 
    N'Giảm 13.000 cho đơn bất kỳ', 
    13000, 
    50, 
    GETDATE(), 
    DATEADD(DAY, 3, GETDATE())
);
INSERT INTO MaGiamGia (maGiamGia, tenGiamGia, giaTriGiam, soLanSuDung, ngayBatDau, ngayKetThuc, daKhoa)
VALUES 
('SALE10000', N'Giảm ngay 10.000 cho mọi đơn hàng', 10000, 30, GETDATE(), DATEADD(DAY, 3, GETDATE()), 0),
('GIAM15000', N'Ưu đãi 15.000 cho đơn từ 100.000', 15000, 40, GETDATE(), DATEADD(DAY, 3, GETDATE()), 0),
('NEWUSER20000', N'Tặng 20.000 cho khách hàng mới', 20000, 20, GETDATE(), DATEADD(DAY, 3, GETDATE()), 0),
('BACK2SCHOOL', N'Giảm 12.000 mùa tựu trường', 12000, 25, GETDATE(), DATEADD(DAY, 3, GETDATE()), 0),
('FREESHIP30000', N'Hỗ trợ 30.000 phí giao hàng', 30000, 15, GETDATE(), DATEADD(DAY, 3, GETDATE()), 0);

