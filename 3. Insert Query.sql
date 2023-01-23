INSERT INTO MsStaff VALUES 
('ST001', 'Alberto Roberto', 'alberto.robert12@bluejack.com','1997-05-12','Male','+6289211234911','23 Melvin Street',3000000),
('ST002', 'Jaqueline Mariane', 'jaq.mare35@sunib.edu','1998-06-03','Female','+6282755832771','77 Aimster Street',3500000),
('ST003', 'Rachella Sinaga', 'rachelrachel12@bluejack.com','1996-11-07','Female','+628921184915','12 Ragnarok Street',2500000),
('ST004', 'Jason Derulis', 'derulis.jason.57@bluejack.com','1999-09-05','Male','+6289213212319','90 Blackbird Street',1500000),
('ST005', 'Martson Marzanda', 'mazda44martson@sunib.edu','1994-01-29','Male','+6283645123491','05 Arkham Street',2000000),
('ST006', 'Renyta Tuuk', 'renytarenyta55@sunib.edu','1995-04-01','Female','+6281982831892','99 Calvin Street',4000000),
('ST007', 'Nikolei Verveg', 'vervegopen@bluejack.com','1991-10-13','Male','+6281232334911','21 Pandora Street',5500000),
('ST008', 'Catharina Butterfly', 'catnekopoi@sunib.edu','1998-04-18','Female','+6289211756919','69 Zeusian Street',2500000),
('ST009', 'Rengar Absodian', 'oceanstone5341@sunib.edu','1999-10-02','Male','+6285647564738','43 Arach Street',4000000),
('ST010', 'Kaguya Livy', 'livylive@bluejack.com','1996-12-06','Female','+6284509114658','36 Solo Street',3000000);

INSERT INTO MsVendor VALUES
('VE001', 'Mobile Seller', 'm.s@bluejack.com', '+6287870111222', 'Idjen Street'),
('VE002', 'Handy Shop', 'h.s@bluejack.com', '+6287870222111', 'Braga Street'),
('VE003', 'Smartphone Market', 's.m@bluejack.com',  '+6287870121212', 'Tugu Street'),
('VE004', 'Selular ID', 's.id@sunib.edu', '+6287870212121', 'Merdeka Street'),
('VE005', 'Eka Cellular', 'e.c@sunib.edu', '+6287870111111', 'Asia Afrika Street'),
('VE006', 'iBox', 'ibox@sunib.edu', '+6287870222222', 'Kencana Street'),
('VE007', 'Vendor Smartphone Indonesia', 'vsi@sunib.edu', '+6287870123123', 'Musi Street'),
('VE008', 'Angkasa Seluler', 'a.s@bluejack.com', '+6287870321321', 'Riau Street'),
('VE009', 'Nepu-Nepu Shop', 'nns@bluejack.com','+6287870112233', 'Ahmad Yani Street'),
('VE010', 'DB Seluler', 'dbs@bluejack.com', '+6287870332211', 'Soekarno - Hatta Street');

INSERT INTO MsCustomer VALUES
('CU001', 'Jake', 'jake@bluejack.com', '1977-12-12', 'Male', '+6287890111222', 'Kuda Street'),
('CU002', 'Ice King', 'iceking@bluejack.com', '1978-11-11', 'Male','+6287850222111', 'Kura-Kura Street'),
('CU003', 'Fiona', 'fiona@bluejack.com', '1979-10-10','Female', '+6287840121212', 'Kepiting Street'),
('CU004', 'Bubble Gum', 'bubblegum@sunib.edu', '1980-09-09', 'Male', '+6287860212121', 'Keong Street'),
('CU005', 'BMO', 'bmo@sunib.edu', '1981-08-08', 'Male', '+6287820111111', 'Katak Street'),
('CU006', 'Patrick', 'patrick@sunib.edu', '1982-07-07', 'Male', '+6287810222222', 'Kambing Street'),
('CU007', 'Rick', 'rick@sunib.edu', '1983-06-06', 'Male', '+6287830123123', 'Kancil Street'),
('CU008', 'Morty', 'morty@bluejack.com', '1984-05-05', 'Male', '+6287880321321', 'Kelinci StreeT'),
('CU009', 'Bart Simpson', 'bartsimpson@bluejack.com', '1985-04-04', 'Male', '+6287800112233', 'Kucing Street'),
('CU010', 'Peppa Pig', 'peppapig@bluejack.com', '1986-03-03', 'Female', '+6287770332211', 'Kudanil Street')

INSERT INTO MsPhoneBrand VALUES 
('PB001', 'Apple'),
('PB002', 'Lenovo'),
('PB003', 'Samsung'),
('PB004', 'ASUS'),
('PB005', 'Xiaomi'),
('PB006', 'Huawei'),
('PB007', 'Vivo'),
('PB008', 'Realme'),
('PB009', 'Oppo'),
('PB010', 'Sony')

INSERT INTO MsPhone VALUES 
('PO001', 'PB003', 'Samsung Galaxy A12', 2130000),
('PO002', 'PB001', 'iPhone XR', 7499000),
('PO003', 'PB007', 'Vivo X60', 7999000),
('PO004', 'PB008', 'Realme 8', 3250000),
('PO005', 'PB010', 'Sony Xperia 10 III Lite', 6468000),
('PO006', 'PB005', 'Xiaomi Redmi Note 10 Pro', 2180000),
('PO007', 'PB009', 'Oppo A16', 2499000),
('PO008', 'PB004', 'ASUS ZenFone Max Pro M1', 1600000),
('PO009', 'PB002', 'Lenovo Vibe K4 Note', 2834000),
('PO010', 'PB006', 'Huawei Nova 7', 2900000)

INSERT INTO PurchaseTransaction VALUES
('PH001','ST004','VE003','2020-06-15'),
('PH002','ST005','VE002','2020-03-19'),
('PH003','ST001','VE002','2021-05-24'),
('PH004','ST009','VE005','2020-11-18'),
('PH005','ST004','VE001','2021-04-01'),
('PH006','ST007','VE006','2021-04-21'),
('PH007','ST002','VE008','2021-11-10'),
('PH008','ST010','VE009','2021-02-14'),
('PH009','ST006','VE004','2021-05-13'),
('PH010','ST003','VE010','2021-01-23'),
('PH011','ST008','VE005','2021-07-20'),
('PH012','ST006','VE002','2021-08-17'),
('PH013','ST004','VE003','2021-05-17'),
('PH014','ST002','VE005','2021-04-18'),
('PH015','ST010','VE010','2021-02-04');

INSERT INTO PurchaseTransactionDetails VALUES
('PH001','PO003','30'),
('PH001','PO001','50'),
('PH002','PO002','25'),
('PH003','PO007','30'),
('PH003','PO010','15'),
('PH004','PO006','20'),
('PH005','PO008','10'),
('PH005','PO009','20'),
('PH006','PO003','30'),
('PH007','PO001','25'),
('PH007','PO002','15'),
('PH008','PO007','15'),
('PH008','PO005','35'),
('PH009','PO003','20'),
('PH010','PO002','35'),
('PH010','PO006','30'),
('PH011','PO007','10'),
('PH011','PO005','30'),
('PH012','PO004','15'),
('PH012','PO008','25'),
('PH012','PO006','45'),
('PH013','PO005','25'),
('PH014','PO003','25'),
('PH014','PO010','50'),
('PH015','PO006','25');

INSERT INTO SalesTransaction VALUES
('SH001', 'ST004', 'CU003', '2020-06-16'),
('SH002', 'ST005', 'CU002', '2020-03-20'),
('SH003', 'ST001', 'CU002', '2021-05-21'),
('SH004', 'ST009', 'CU005', '2020-11-19'),
('SH005', 'ST004', 'CU001', '2021-04-02'),
('SH006', 'ST007', 'CU006', '2021-04-22'),
('SH007', 'ST002', 'CU008', '2021-11-11'),
('SH008', 'ST010', 'CU009', '2021-02-15'),
('SH009', 'ST006', 'CU004', '2021-05-14'),
('SH010', 'ST003', 'CU010', '2021-01-24'),
('SH011', 'ST008', 'CU005', '2021-07-21'),
('SH012', 'ST006', 'CU002', '2021-08-18'),
('SH013', 'ST004', 'CU003', '2021-05-19'),
('SH014', 'ST002', 'CU005', '2021-04-20'),
('SH015', 'ST010', 'CU010', '2021-02-06'),
('SH016', 'ST004', 'CU002', '2021-03-19');

INSERT INTO SalesTransactionDetails VALUES
('SH001','PO003','4'),
('SH001','PO001','1'),
('SH002','PO002','3'),
('SH003','PO007','2'),
('SH003','PO010','1'),
('SH004','PO006','2'),
('SH005','PO008','1'),
('SH005','PO009','2'),
('SH006','PO003','3'),
('SH007','PO001','2'),
('SH007','PO002','4'),
('SH008','PO007','5'),
('SH008','PO005','3'),
('SH009','PO003','2'),
('SH010','PO002','4'),
('SH010','PO006','3'),
('SH011','PO007','1'),
('SH011','PO005','3'),
('SH012','PO004','1'),
('SH012','PO008','2'),
('SH012','PO006','3'),
('SH013','PO005','2'),
('SH014','PO003','2'),
('SH014','PO010','3'),
('SH015','PO006','2'),
('SH016','PO006','1'),
('SH016','PO009','3');
