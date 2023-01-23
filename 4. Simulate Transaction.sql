-- 4
-- Simulasi Transasksi

-- Simulasi membeli handphone melalui vendor
INSERT INTO MsPhone VALUES
('PO011', 'PB001', 'iPhone 11 Pro Max', 16499000),
('PO012', 'PB001', 'iPhone 11 Pro', 15499000),
('PO013', 'PB001', 'iPhone 12 Mini', 8250000);

INSERT INTO PurchaseTransaction VALUES
('PH016', 'ST007', 'VE006', '2021-12-05');

INSERT INTO PurchaseTransactionDetails VALUES
('PH016', 'PO011', 5),
('PH016', 'PO012', 10),
('PH016', 'PO013', 7);

-- Simulasi menjual handphone kepada customer
INSERT INTO MsCustomer VALUES
('CU011', 'Daniel Reyz', 'danielrz@bluejack.com', '1990-08-17', 'Male', '087832445613', 'Rusa Street');

INSERT INTO SalesTransaction VALUES
('SH017', 'ST010', 'CU011', '2021-08-12');

INSERT INTO SalesTransactionDetails VALUES
('SH017', 'PO012', 1),
('SH017', 'PO011', 1),
('SH017', 'PO002', 1),
('SH017', 'PO013', 1);