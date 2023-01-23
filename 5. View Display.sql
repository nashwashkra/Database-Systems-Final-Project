--1
SELECT 'Customer' + RIGHT(mc.Customer_ID, 1)[ID], mc.Customer_Name, mc.Customer_Gender, SUM(mp.Phone_Price*sd.Quantity)[Total Amount of Spending]
FROM MsCustomer mc
JOIN SalesTransaction st ON st.Customer_ID = mc.Customer_ID
JOIN SalesTransactionDetails sd ON sd.Sales_ID = st.Sales_ID
JOIN MsPhone mp ON mp.Phone_ID = sd.Phone_ID
GROUP BY mc.Customer_ID, mc.Customer_Name, mc.Customer_Gender

--2
SELECT ms.Staff_ID, SUBSTRING(ms.Staff_Name, 1, CHARINDEX(' ', ms.Staff_Name))[Name], COUNT(*)[Customer Count]
FROM MsStaff ms
JOIN SalesTransaction st ON st.Staff_ID = ms.Staff_ID
JOIN MsCustomer mc ON mc.Customer_ID = st.Customer_ID
WHERE ms.Staff_Name LIKE '% %'
GROUP BY  ms.Staff_ID, ms.Staff_Name

--3
SELECT 'Customer' + RIGHT(mc.Customer_ID, 1)[Customer ID], mc.Customer_Name, mpb.PhoneBrand_Name, SUM(mp.Phone_Price*sd.Quantity)[Total Spending]
FROM MsCustomer mc
JOIN SalesTransaction st ON st.Customer_ID = mc.Customer_ID
JOIN SalesTransactionDetails sd ON st.Sales_ID = sd.Sales_ID
JOIN MsPhone mp ON mp.Phone_ID = sd.Phone_ID
JOIN MsPhoneBrand mpb ON mpb.PhoneBrand_ID = mp.PhoneBrand_ID
WHERE mc.Customer_Name LIKE '% %'
GROUP BY mc.Customer_ID, mc.Customer_Name, mpb.PhoneBrand_Name
HAVING COUNT(*) > 3

--4
SELECT ms.Staff_ID, REPLACE(REPLACE(ms.Staff_Email, 'bluejack.com', 'sunib.edu'), 'sunib.edu', 'Ymail.com')[Email], mpb.PhoneBrand_Name, [Total Selling] = SUM(Phone_Price*Quantity)
FROM MsStaff ms
JOIN SalesTransaction st ON st.Staff_ID = ms.Staff_ID
JOIN SalesTransactionDetails sd ON st.Sales_ID = sd.Sales_ID
JOIN MsPhone mp ON mp.Phone_ID = sd.Phone_ID
JOIN MsPhoneBrand mpb ON mpb.PhoneBrand_ID = mp.PhoneBrand_ID
--WHERE ms.Staff_Email like '@Ymail.com'
GROUP BY ms.Staff_ID, ms.Staff_Email, mpb.PhoneBrand_Name
HAVING COUNT(*) > 2
ORDER BY ms.Staff_ID ASC

--5
SELECT ms.Staff_Email, ms.Staff_Gender, CONVERT(VARCHAR, ms.Staff_DOB, 106)[Date of Birth], 'Rp.' + CONVERT(VARCHAR, ms.Staff_Salary) + ',00.'[Salary]
FROM MsStaff ms, (
	SELECT AVG(ms.Staff_Salary)[Salary]
	FROM MsStaff ms
) x
WHERE ms.Staff_Salary > x.Salary AND DATEDIFF(YEAR, ms.Staff_DOB, GETDATE()) > 30
GROUP BY ms.Staff_Email, ms.Staff_Gender, ms.Staff_DOB, ms.Staff_Salary

--6
SELECT ms.Staff_ID, ms.Staff_Name, REPLACE(ms.Staff_Phone, '+62','0')[Staff_Phone], 'Rp.' + CONVERT(VARCHAR, SUM(mp.Phone_Price*sd.Quantity)) + ',00.'[Total Selling]
FROM MsStaff ms
JOIN SalesTransaction st ON st.Staff_ID = ms.Staff_ID
JOIN SalesTransactionDetails sd ON sd.Sales_ID = st.Sales_ID
JOIN MsPhone mp ON mp.Phone_ID = sd.Phone_ID, (
	SELECT sd.Sales_ID, SUM(mp.Phone_Price*sd.Quantity)[purchase]
	FROM SalesTransactionDetails sd, MsPhone mp
	WHERE sd.Phone_ID = mp.Phone_ID
	GROUP BY sd.Sales_ID
) x
WHERE ms.Staff_Gender = 'Male' AND x.purchase BETWEEN 10000000 AND 100000000 AND st.Sales_ID = x.Sales_ID
GROUP BY ms.Staff_ID, ms.Staff_Name, ms.Staff_Phone

--7
SELECT DISTINCT 'Staff No' + RIGHT(ms.Staff_ID, 1)[StaffNo], ms.Staff_Name, REPLACE(REPLACE(ms.Staff_Email, 'bluejack.com', 'sunib.edu'), 'sunib.edu', 'gmail.com')[Email], CONVERT(VARCHAR, ms.Staff_DOB, 105)[Date of Birth], x.[CustomerCount]
FROM MsStaff ms
JOIN SalesTransaction st ON st.Staff_ID = ms.Staff_ID, (
	SELECT st.Staff_ID, COUNT(mc.Customer_ID)[CustomerCount]
	FROM SalesTransaction st
	JOIN MsCustomer mc ON mc.Customer_ID = st.Customer_ID
	GROUP BY st.Staff_ID
) x, (
	SELECT MAX([CustomerCount]) [HighestCostumerCount]
	FROM (
		SELECT st.Staff_ID, COUNT(mc.Customer_ID)[CustomerCount]
		FROM SalesTransaction st
		JOIN MsCustomer mc ON mc.Customer_ID = st.Customer_ID
		GROUP BY st.Staff_ID
	) x
) y
WHERE x.[CustomerCount] = y.[HighestCostumerCount] AND st.Staff_ID = x.Staff_ID

--8
SELECT DISTINCT mpb.PhoneBrand_ID, mpb.PhoneBrand_Name, mc.Customer_ID, mc.Customer_Name, REPLACE(REPLACE(mc.Customer_Email, 'bluejack.com', 'sunib.edu'), 'sunib.edu', 'Gmail.com')[Email], SUM(sd.Quantity)[Qty]
FROM MsPhoneBrand mpb
JOIN MsPhone mp ON mp.PhoneBrand_ID = mpb.PhoneBrand_ID
JOIN SalesTransactionDetails sd ON sd.Phone_ID = mp.Phone_ID
JOIN SalesTransaction st ON st.Sales_ID = sd.Sales_ID
JOIN MsCustomer mc ON mc.Customer_ID = st.Customer_ID, (
	SELECT mpb.PhoneBrand_ID, COUNT(sd.Quantity)[QtyEachBrand]
	FROM SalesTransactionDetails sd
	JOIN MsPhone mp ON mp.Phone_ID = sd.Phone_ID
	JOIN MsPhoneBrand mpb ON mpb.PhoneBrand_ID = mp.PhoneBrand_ID
	GROUP BY mpb.PhoneBrand_ID
) x, (
	SELECT MAX(x.QtyEachBrand)[HighestQtyEachBrand] 
	FROM (
		SELECT mpb.PhoneBrand_ID, COUNT(sd.Quantity)[QtyEachBrand]
		FROM SalesTransactionDetails sd
		JOIN MsPhone mp ON mp.Phone_ID = sd.Phone_ID
		JOIN MsPhoneBrand mpb ON mpb.PhoneBrand_ID = mp.PhoneBrand_ID
		GROUP BY mpb.PhoneBrand_ID
	) x
) y
WHERE mc.Customer_Email LIKE '%@bluejack.com' AND RIGHT(mc.Customer_ID, 1) IN ('0','2','4','6','8') AND x.QtyEachBrand = y.HighestQtyEachBrand AND mp.PhoneBrand_ID = x.PhoneBrand_ID
GROUP BY mpb.PhoneBrand_ID, mpb.PhoneBrand_Name, mc.Customer_ID, mc.Customer_Name, mc.Customer_Email
ORDER BY mpb.PhoneBrand_ID ASC

--9
CREATE VIEW Vendor_Brand_Transaction_View AS
SELECT 'Vendor' + RIGHT(mv.Vendor_ID,1)[VendorID], mv.Vendor_Name, mv.Vendor_Phone, mpb.PhoneBrand_Name, COUNT(*)[Transaction Count], SUM(mp.Phone_Price*ptd.Quantity)[Total Transaction]
FROM MsVendor mv
JOIN PurchaseTransaction pt ON pt.Vendor_ID = mv.Vendor_ID
JOIN PurchaseTransactionDetails ptd ON ptd.Purchase_ID = pt.Purchase_ID
JOIN MsPhone mp ON mp.Phone_ID = ptd.Phone_ID
JOIN MsPhoneBrand mpb ON mpb.PhoneBrand_ID = mp.PhoneBrand_ID
GROUP BY mv.Vendor_ID, mv.Vendor_Name, mv.Vendor_Phone, mpb.PhoneBrand_Name

--10
CREATE VIEW Staff_Selling_View AS
SELECT ms.Staff_ID, ms.Staff_Name, CONVERT(VARCHAR, SUM(std.Quantity)) + 'pc(s)'[Sold Phone Count], 'Rp.' + CONVERT(VARCHAR, SUM(mp.Phone_Price*std.Quantity)) + ',00.'[Total Transaction], COUNT(*)[Count Brand]
FROM MsStaff ms
JOIN SalesTransaction st ON st.Staff_ID = ms.Staff_ID
JOIN SalesTransactionDetails std ON std.Sales_ID = st.Sales_ID
JOIN MsPhone mp ON mp.Phone_ID = std.Phone_ID
JOIN MsPhoneBrand mpb ON mpb.PhoneBrand_ID = mp.PhoneBrand_ID
WHERE ms.Staff_Email LIKE '%@bluejack.com'
GROUP BY ms.Staff_ID, ms.Staff_Name, std.Quantity