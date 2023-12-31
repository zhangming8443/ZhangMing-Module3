CREATE DATABASE furama_management;

USE furama_management;

CREATE TABLE vi_tri (
    ma_vi_tri INT,
    ten_vi_tri VARCHAR(45),
    PRIMARY KEY (ma_vi_tri)
);

CREATE TABLE trinh_do (
    ma_trinh_do INT,
    ten_trinh_do VARCHAR(45),
    PRIMARY KEY (ma_trinh_do)
);


CREATE TABLE bo_phan (
    ma_bo_phan INT,
    ten_bo_phan VARCHAR(45),
    PRIMARY KEY (ma_bo_phan)
);

CREATE TABLE loai_khach (
    ma_loai_khach INT,
    ten_loai_khach VARCHAR(45),
    PRIMARY KEY (ma_loai_khach)
);

CREATE TABLE kieu_thue (
    ma_kieu_thue INT,
    ten_kieu_thue VARCHAR(45),
    PRIMARY KEY (ma_kieu_thue)
);

CREATE TABLE loai_dich_vu (
    ma_loai_dich_vu INT,
    ten_loai_dich_vu VARCHAR(45),
    PRIMARY KEY (ma_loai_dich_vu)
);

CREATE TABLE dich_vu_di_kem (
    ma_dich_vu_di_kem INT,
    ten_dich_vu_di_kem VARCHAR(45),
    gia DOUBLE,
    don_vi VARCHAR(10),
    trang_thai VARCHAR(45),
    PRIMARY KEY (ma_dich_vu_di_kem)
);

CREATE TABLE nhan_vien (
    ma_nhan_vien INT,
    ho_ten VARCHAR(45),
    ngay_sinh DATE,
    so_cmnd VARCHAR(45),
    luong DOUBLE,
    so_dien_thoai VARCHAR(45),
    email VARCHAR(45),
    dia_chi VARCHAR(45),
    ma_vi_tri INT,
    ma_trinh_do INT,
    ma_bo_phan INT,
    PRIMARY KEY (ma_nhan_vien),
    FOREIGN KEY (ma_vi_tri)
        REFERENCES vi_tri (ma_vi_tri),
    FOREIGN KEY (ma_trinh_do)
        REFERENCES trinh_do (ma_trinh_do),
    FOREIGN KEY (ma_bo_phan)
        REFERENCES bo_phan (ma_bo_phan)
);

CREATE TABLE khach_hang (
    ma_khach_hang INT,
    ho_ten VARCHAR(45),
    ngay_sinh DATE,
    gioi_tinh BIT(1),
    so_cmnd VARCHAR(45),
    so_dien_thoai VARCHAR(45),
    email VARCHAR(45),
    dia_chi VARCHAR(45),
    ma_loai_khach INT,
    PRIMARY KEY (ma_khach_hang),
    FOREIGN KEY (ma_loai_khach)
        REFERENCES loai_khach (ma_loai_khach)
);

CREATE TABLE dich_vu (
    ma_dich_vu INT,
    ten_dich_vu VARCHAR(45),
    dien_tich INT,
    chi_phi_thue DOUBLE,
    so_nguoi_toi_da INT,
    tieu_chuan_phong VARCHAR(45),
    mo_ta_tien_nghi_khac VARCHAR(45),
    dien_tich_ho_boi DOUBLE,
    so_tang INT,
    dich_vu_mien_phi_di_kem TEXT,
    ma_kieu_thue INT,
    ma_loai_dich_vu INT,
    PRIMARY KEY (ma_dich_vu),
    FOREIGN KEY (ma_kieu_thue)
        REFERENCES kieu_thue (ma_kieu_thue),
    FOREIGN KEY (ma_loai_dich_vu)
        REFERENCES loai_dich_vu (ma_loai_dich_vu)
);

CREATE TABLE hop_dong (
    ma_hop_dong INT,
    ngay_lam_hop_dong DATETIME,
    ngay_ket_thuc DATETIME,
    tien_dat_coc DOUBLE,
    ma_nhan_vien INT,
    ma_khach_hang INT,
    ma_dich_vu INT,
    PRIMARY KEY (ma_hop_dong),
    FOREIGN KEY (ma_nhan_vien)
        REFERENCES nhan_vien (ma_nhan_vien),
    FOREIGN KEY (ma_khach_hang)
        REFERENCES khach_hang (ma_khach_hang),
    FOREIGN KEY (ma_dich_vu)
        REFERENCES dich_vu (ma_dich_vu)
);

CREATE TABLE hop_dong_chi_tiet (
    ma_hop_dong_chi_tiet INT,
    so_luong INT,
    ma_hop_dong INT,
    ma_dich_vu_di_kem INT,
    PRIMARY KEY (ma_hop_dong_chi_tiet),
    FOREIGN KEY (ma_hop_dong)
        REFERENCES hop_dong (ma_hop_dong),
    FOREIGN KEY (ma_dich_vu_di_kem)
        REFERENCES dich_vu_di_kem (ma_dich_vu_di_kem)
);
insert into furama_management.vi_tri (ma_vi_tri, ten_vi_tri) value
('1', 'Quản Lý'),
('2', 'Nhân Viên');

insert into furama_management.trinh_do (ma_trinh_do, ten_trinh_do) value
('1', 'Trung Cấp'),
('2', 'Cao Đẳng'),
('3', 'Đại Học'),
('4', 'Sau Đại Học');

insert into furama_management.bo_phan (ma_bo_phan, ten_bo_phan) value
('1', 'Sale-Marketing'),
('2', 'Hành chính'),
('3', 'Phục vụ'),
('4', 'Quản lý');

insert into furama_management.nhan_vien (ma_nhan_vien, ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi,  ma_vi_tri, ma_trinh_do, ma_bo_phan) value 
('1','Nguyễn Văn An', '1970-11-07', '456231786', '10000000', '0901234121', 'annguyen@gmail.com', '295 Nguyễn Tất Thành, Đà Nẵng', '1', '3', '1'),
('2','Lê Văn Bình', '1997-04-09', '654231234', '7000000', '0934212314', 'binhlv@gmail.com', '22 Yên Bái, Đà Nẵng', '1', '2', '2'),
('3','Hồ Thị Yến', '1995-12-12', '999231723', '14000000', '0412352315', 'thiyen@gmail.com', 'K234/11 Điện Biên Phủ, Gia Lai', '1', '3', '2'),
('4','Võ Công Toản', '1980-04-04', '123231365', '17000000', '0374443232', 'toan0404@gmail.com', '77 Hoàng Diệu, Quảng Trị', '1', '4', '4'),
('5','Nguyễn Bỉnh Phát', '1999-12-09', '454363232', '6000000', '0902341231', 'phatphat@gmail.com', '43 Yên Bái, Đà Nẵng', '2', '1', '1'),
('6','Khúc Nguyễn An Nghi', '2000-11-08', '964542311', '7000000', '0978653213', 'annghi20@gmail.com', '294 Nguyễn Tất Thành, Đà Nẵng', '2', '2', '3'),
('7','Nguyễn Hữu Hà', '1993-01-01', '534323231', '8000000', '0941234553', 'nhh0101@gmail.com', '4 Nguyễn Chí Thanh, Huế', '2', '3', '2'),
('8','Nguyễn Hà Đông', '1989-09-03', '234414123', '9000000', '0642123111', 'donghanguyen@gmail.com', '111 Hùng Vương, Hà Nội', '2', '4', '4'),
('9','Tòng Hoang', '1982-09-03', '256781231', '6000000', '0245144444', 'hoangtong@gmail.com', '213 Hàm Nghi, Đà Nẵng', '2', '4', '4'),
('10','Nguyễn Công Đạo', '1994-01-08', '755434343', '8000000', '0988767111', 'nguyencongdao12@gmail.com', '6 Hoà Khánh, Đồng Nai', '2', '3', '2');

insert into furama_management.loai_khach (ma_loai_khach, ten_loai_khach) value
('1', 'Diamond'),
('2', 'Platinium'),
('3', 'Gold'),
('4', 'Silver'),
('5', 'Member');

insert into furama_management.khach_hang (ma_khach_hang, ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi, ma_loai_khach) value 
('1', 'Nguyễn Thị Hào', '1970-11-07', 0, '643431213', '0945423362', 'thihao07@gmail.com', '23 Nguyễn Hoàng, Đà Nẵng','5'),
('2', 'Phạm Xuân Diệu', '1992-08-08', 1, '865342123', '0954333333', 'xuandieu92@gmail.com', 'K77/22 Thái Phiên, Quảng Trị', '3'),
('3', 'Trương Đình Nghệ', '1990-02-27', 1, '488645199', '0373213122', 'nghenhan2702@gmail.com', 'K323/12 Ông Ích Khiêm, Vinh', '1'),
('4', 'Dương Văn Quan', '1981-07-08', 1, '543432111', '0490039241', 'duongquan@gmail.com', 'K453/12 Lê Lợi, Đà Nẵng', '1'),
('5', 'Hoàng Trần Nhi Nhi', '1995-12-09', 0, '795453345', '0312345678', 'nhinhi123@gmail.com', '224 Lý Thái Tổ, Gia Lai', '4'),
('6', 'Tôn Nữ Mộc Châu', '2005-12-06', 0, '732434215', '0988888844', 'tonnuchau@gmail.com', '37 Yên Thế, Đà Nẵng', '4'),
('7', 'Nguyễn Mỹ Kim', '1984-04-08', 0, '856453123', '0912345698', 'kimcuong84@gmail.com', 'K123/45 Lê Lợi, Hồ Chí Minh', '1'),
('8', 'Nguyễn Thị Hào', '1999-04-08', 0, '965656433', '0763212345', 'haohao99@gmail.com', '55 Nguyễn Văn Linh, Kon Tumkhach_hang', '3'),
('9', 'Trần Đại Danh', '1994-07-01', 1, '432341235', '0643343433', 'danhhai99@gmail.com', '24 Lý Thường Kiệt, Quảng Ngãi', '1'),
('10', 'Nguyễn Tâm Đắc', '1989-07-01', 1, '344343432', '0987654321', 'dactam@gmail.com', '22 Ngô Quyền, Đà Nẵng', '2');

insert into furama_management.kieu_thue (ma_kieu_thue, ten_kieu_thue) value
('1', 'year'),
('2', 'month'),
('3', 'day'),
('4', 'hour');

insert into furama_management.loai_dich_vu (ma_loai_dich_vu, ten_loai_dich_vu) value
('1', 'Villa'),
('2', 'House'),
('3', 'Room');

insert into furama_management.dich_vu_di_kem (ma_dich_vu_di_kem, ten_dich_vu_di_kem, gia, don_vi, trang_thai) value
('1', 'Karaoke', '10000', 'giờ', 'tiện nghi, hiện tại'),
('2', 'Thuê xe máy', '10000', 'chiếc', 'hỏng 1 xe'),
('3', 'Thuê xe đạp', '20000', 'chiếc', 'tốt'),
('4', 'Buffet buổi sáng', '15000', 'suất', 'đầy đủ đồ ăn, tráng miệng'),
('5', 'Buffet buổi trưa', '90000', 'suất', 'đầy đủ đồ ăn, tráng miệng'),
('6', 'Buffet buổi tối', '16000', 'suất', 'đầy đủ đồ ăn, tráng miệng');

insert into furama_management.dich_vu (ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, so_nguoi_toi_da, tieu_chuan_phong, mo_ta_tien_nghi_khac, dien_tich_ho_boi, so_tang, dich_vu_mien_phi_di_kem, ma_kieu_thue, ma_loai_dich_vu) value 
('1', 'Villa Beach Front', '25000', '1000000', '10', 'vip', 'Có hồ bơi', '500', '4', null, '3', '1'),
('2', 'House Princess 01', '14000', '5000000', '7', 'vip', 'Có thêm bếp nướng', null, '3', null, '2', '2'),
('3', 'Room Twin 01', '5000', '1000000', '2', 'normal', 'Có tivi', null, null, '1 Xe máy, 1 Xe đạp', '4', '3'),
('4', 'Villa No Beach Front', '22000', '9000000', '8', 'normal', 'Có hồ bơi', '300', '3', null, '3', '1'),
('5', 'House Princess 02', '10000', '4000000', '5', 'normal', 'Có thêm bếp nướng', null, '2', null, '3', '2'),
('6', 'Room Twin 02', '3000', '900000', '2', 'normal', 'Có tivi', null, null, '1 Xe máy', '4', '3');

insert into furama_management.hop_dong (ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu) value
('1', '2020-12-08', '2020-12-08',	 '0',		 '3',	 '1',	 '3'),
('2', '2020-07-14', '2020-07-21',	 '200000',	 '7',	 '3',	 '1'),
('3', '2021-03-15', '2021-03-17',	 '50000',	 '3',	 '4',	 '2'),
('4', '2021-01-14', '2021-01-18',	 '100000',	 '7',	 '5',	 '5'),
('5', '2021-07-14', '2021-07-15',	 '0',		 '7',	 '2',	 '6'),
('6', '2021-06-01', '2021-06-03',	 '0',		 '7',	 '7',	 '6'),
('7', '2021-09-02', '2021-09-05',	 '100000',	 '7',	 '4',	 '4'),
('8', '2021-06-17', '2021-06-18',	 '150000',	 '3',	 '4',	 '1'),
('9', '2020-11-19', '2020-11-19',	 '0',		 '3',	 '4',	 '3'),
('10', '2021-04-12', '2021-04-14',	 '0',		 '10',	 '3',	 '5'),
('11', '2021-04-25', '2021-04-25',	 '0',		 '2',	 '2',	 '1'),
('12', '2021-05-25', '2021-05-27',	 '0',		 '7',	 '10',	 '1');

insert into furama_management.hop_dong_chi_tiet (ma_hop_dong_chi_tiet, so_luong, ma_hop_dong, ma_dich_vu_di_kem) value
('1', '5',	 '2', 	'4'),
('2', '8',	 '2', 	'5'),
('3', '15',	 '2', 	'6'),
('4', '1',	 '3', 	'1'),
('5', '11',	 '3', 	'2'),
('6', '1',	 '1',	'3'),
('7', '2',	 '1',	'2'),
('8', '2',	 '12',	'2');

-- request 2 
SELECT 
    *
FROM
    nhan_vien
WHERE
    ho_ten REGEXP '^[H,K,T]'
        AND CHAR_LENGTH(ho_ten) <= 15;

-- request 3
SELECT 
    *
FROM
    khach_hang
WHERE
    dia_chi LIKE '%Quảng Trị%'
        OR dia_chi LIKE '%Đà Nẵng%'
        AND TIMESTAMPDIFF(YEAR,
        ngay_sinh,
        CURDATE()) BETWEEN 18 AND 50;

-- request 4
SELECT 
    khach_hang.ma_khach_hang,
    khach_hang.ho_ten,
    COUNT(hop_dong.ma_khach_hang) AS so_lan_dat_phong
FROM
    khach_hang
        JOIN
    hop_dong ON hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
        JOIN
    loai_khach ON loai_khach.ma_loai_khach = khach_hang.ma_loai_khach
WHERE
    ten_loai_khach = 'Diamond'
GROUP BY ma_khach_hang;

-- request 5
SELECT 
    kh.ma_khach_hang,
    kh.ho_ten,
    lk.ten_loai_khach,
    hd.ma_hop_dong,
    dv.ten_dich_vu,
    hd.ngay_lam_hop_dong,
    hd.ngay_ket_thuc,
    dv.chi_phi_thue + IFNULL((dvdk.gia * hdct.so_luong), 0) AS tong_tien
FROM
    khach_hang kh
        LEFT JOIN
    loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
        LEFT JOIN
    hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
        LEFT JOIN
    dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
        LEFT JOIN
    hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
        LEFT JOIN
    dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem;

-- request 6
SELECT 
    dv.ma_dich_vu,
    dv.ten_dich_vu,
    dv.dien_tich,
    dv.chi_phi_thue,
    ldv.ten_loai_dich_vu
FROM
    dich_vu dv
        LEFT JOIN
    loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
        LEFT JOIN
    hop_dong hd ON dv.ma_dich_vu = hd.ma_dich_vu
WHERE
    dv.ma_dich_vu NOT IN (SELECT 
            hd.ma_dich_vu
        FROM
            hop_dong hd
        WHERE
            YEAR(hd.ngay_lam_hop_dong) = 2021
                AND QUARTER(hd.ngay_lam_hop_dong) = 1)
GROUP BY dv.ma_dich_vu;

-- request 7 
SELECT 
    dich_vu.ma_dich_vu,
    dich_vu.ten_dich_vu,
    dich_vu.dien_tich,
    dich_vu.so_nguoi_toi_da,
    dich_vu.chi_phi_thue,
    loai_dich_vu.ten_loai_dich_vu
FROM
    dich_vu
        LEFT JOIN
    loai_dich_vu ON dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
        LEFT JOIN
    hop_dong ON dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
WHERE
    dich_vu.ma_dich_vu NOT IN (SELECT 
            hop_dong.ma_dich_vu
        FROM
            hop_dong
        WHERE
            YEAR(hop_dong.ngay_lam_hop_dong) = 2021)
        AND YEAR(hop_dong.ngay_lam_hop_dong) = 2020
GROUP BY hop_dong.ma_dich_vu;

-- request 8
SELECT 
    khach_hang.ho_ten
FROM
    khach_hang
GROUP BY khach_hang.ho_ten;

SELECT DISTINCT
    khach_hang.ho_ten
FROM
    khach_hang;

SELECT 
    khach_hang.ho_ten
FROM
    khach_hang 
UNION 
SELECT 
    khach_hang.ho_ten
FROM
    khach_hang;

-- request 9 
SELECT 
    MONTH(hop_dong.ngay_lam_hop_dong) AS thang,
    COUNT(hop_dong.ma_khach_hang) AS so_khach_dat_phong
FROM
    hop_dong
WHERE
    YEAR(hop_dong.ngay_lam_hop_dong) = 2021
GROUP BY thang
ORDER BY thang; 
	
-- request 10
SELECT 
    hop_dong.ma_hop_dong,
    hop_dong.ngay_ket_thuc,
    hop_dong.tien_dat_coc,
    IFNULL(SUM(hop_dong_chi_tiet.so_luong), 0) AS so_luong_dich_vu_di_kem
FROM
    hop_dong
        LEFT JOIN
    hop_dong_chi_tiet ON hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
GROUP BY hop_dong.ma_hop_dong;

-- request 11 
SELECT 
    dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem
FROM
    dich_vu_di_kem dvdk
        JOIN
    hop_dong_chi_tiet hdct ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
        JOIN
    hop_dong hd ON hd.ma_hop_dong = hdct.ma_hop_dong
        JOIN
    khach_hang kh ON kh.ma_khach_hang = hd.ma_khach_hang
        JOIN
    loai_khach lk ON lk.ma_loai_khach = kh.ma_loai_khach
WHERE
    lk.ten_loai_khach = 'Diamond'
        AND (kh.dia_chi LIKE '%Vinh%'
        OR kh.dia_chi LIKE '%Quảng Ngãi%');

-- request 12
SELECT 
    hd.ma_hop_dong,
    nv.ho_ten,
    kh.ho_ten,
    kh.so_dien_thoai,
    dv.ten_dich_vu,
    SUM(hdct.so_luong) AS so_luong_dich_vu_di_kem,
    hd.tien_dat_coc
FROM
    hop_dong hd
        JOIN
    nhan_vien nv ON hd.ma_nhan_vien = nv.ma_nhan_vien
        JOIN
    khach_hang kh ON hd.ma_khach_hang = kh.ma_khach_hang
        JOIN
    dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
        JOIN
    hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
        JOIN
    dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
WHERE
    MONTH(ngay_lam_hop_dong) > 9
        AND YEAR(ngay_lam_hop_dong) = 2020
        AND hd.ma_hop_dong NOT IN (SELECT 
            hd.ma_hop_dong
        FROM
            hop_dong hd
        WHERE
            MONTH(ngay_lam_hop_dong) < 7
                AND YEAR(ngay_lam_hop_dong) = 2021)
GROUP BY hd.ma_hop_dong;

-- request 13
SELECT 
    dvdk.ma_dich_vu_di_kem,
    dvdk.ten_dich_vu_di_kem,
    SUM(hdct.so_luong) AS so_luong_dich_vu_di_kem
FROM
    hop_dong_chi_tiet hdct
        JOIN
    dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
GROUP BY dvdk.ma_dich_vu_di_kem , dvdk.ten_dich_vu_di_kem
HAVING SUM(hdct.so_luong) = (SELECT 
        MAX(so_luong_dich_vu_di_kem)
    FROM
        (SELECT 
            SUM(hdct.so_luong) AS so_luong_dich_vu_di_kem
        FROM
            hop_dong_chi_tiet hdct
        GROUP BY ma_dich_vu_di_kem) AS sldvdk);

-- request 14
SET sql_mode = 0;
SELECT 
    hd.ma_hop_dong,
    ldv.ten_loai_dich_vu,
    dvdk.ten_dich_vu_di_kem,
    COUNT(hdct.ma_dich_vu_di_kem) AS so_lan_su_dung
FROM
    dich_vu dv
        JOIN
    hop_dong hd ON dv.ma_dich_vu = hd.ma_dich_vu
        JOIN
    hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
        JOIN
    dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
        JOIN
    loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
GROUP BY ten_dich_vu_di_kem
HAVING so_lan_su_dung = 1
ORDER BY hd.ma_hop_dong;
SET sql_mode = 1;

-- request 15
SELECT 
    nv.ma_nhan_vien,
    nv.ho_ten,
    td.ten_trinh_do,
    bp.ten_bo_phan,
    nv.so_dien_thoai,
    nv.dia_chi
FROM
    nhan_vien nv
        JOIN
    trinh_do td ON nv.ma_trinh_do = td.ma_trinh_do
        JOIN
    bo_phan bp ON nv.ma_bo_phan = bp.ma_bo_phan
        JOIN
    hop_dong hd ON nv.ma_nhan_vien = hd.ma_nhan_vien
GROUP BY hd.ma_nhan_vien
HAVING COUNT(hd.ma_nhan_vien) > 0
    AND COUNT(hd.ma_nhan_vien) < 4;

-- request 16
SELECT 
    nv.ma_nhan_vien, nv.ho_ten
FROM
    nhan_vien nv
WHERE
    ma_nhan_vien NOT IN (SELECT DISTINCT
            nv.ma_nhan_vien
        FROM
            nhan_vien nv
                LEFT JOIN
            hop_dong hd ON hd.ma_nhan_vien = nv.ma_nhan_vien
        WHERE
            YEAR(hd.ngay_lam_hop_dong) BETWEEN 2019 AND 2021);

-- request 17
SET sql_safe_updates = 1;
UPDATE khach_hang kh
        JOIN
    loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
        JOIN
    hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
        JOIN
    dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
        JOIN
    hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
        JOIN
    dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem 
SET 
    kh.ma_loai_khach = 1
WHERE
    kh.ma_khach_hang IN (SELECT 
            *
        FROM
            (SELECT 
                kh.ma_khach_hang
            FROM
                khach_hang kh
            JOIN loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
            JOIN hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
            JOIN dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
            JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
            JOIN dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
            WHERE
                YEAR(hd.ngay_lam_hop_dong) = 2021
                    AND ten_loai_khach = 'Platinium'
                    AND (dvdk.gia * hdct.so_luong + dv.chi_phi_thue) > 1000000) AS temp);

-- request 18    
ALTER TABLE khach_hang 
ADD count int ;
UPDATE khach_hang
        LEFT JOIN
    hop_dong ON khach_hang.ma_khach_hang = hop_dong.ma_khach_hang 
SET 
    count = 1
WHERE
    YEAR(hop_dong.ngay_lam_hop_dong) < 2021;

-- request 19
SET sql_safe_updates = 0;
UPDATE dich_vu_di_kem 
SET 	
    gia = gia * 2
WHERE
    ma_dich_vu_di_kem IN (SELECT 
            ma_dich_vu_di_kem
        FROM
            hop_dong_chi_tiet hdct
                JOIN
            hop_dong hd ON hdct.ma_hop_dong = hd.ma_hop_dong
        WHERE
            YEAR(hd.ngay_lam_hop_dong) = 2020
        GROUP BY hdct.ma_dich_vu_di_kem
        HAVING SUM(hdct.so_luong) > 10);
SET sql_safe_updates = 1;

-- request 20
SELECT ma_nhan_vien AS id, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
FROM nhan_vien
UNION ALL
SELECT ma_khach_hang AS id, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
FROM khach_hang;



