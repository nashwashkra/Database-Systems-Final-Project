CREATE DATABASE FlexPhone

USE FlexPhone

CREATE TABLE MsStaff (
	Staff_ID CHAR(5) PRIMARY KEY CHECK(Staff_ID LIKE 'ST[0-9][0-9][0-9]') NOT NULL,
	Staff_Name VARCHAR(50) NOT NULL,
	Staff_Email VARCHAR(100) NOT NULL,
	Staff_DOB DATE NOT NULL,
	Staff_Gender VARCHAR(10) NOT NULL,
	Staff_Phone VARCHAR(15) NOT NULL,
	Staff_Address VARCHAR(150) NOT NULL,
	Staff_Salary INT NOT NULL,
	CONSTRAINT StaffDOB_Check CHECK(YEAR(Staff_DOB) >= 1960),
	CONSTRAINT StaffEmail_Check CHECK(Staff_Email LIKE '%@bluejack.com' OR Staff_Email LIKE '%@sunib.edu'),
	CONSTRAINT StaffGender_Check CHECK (Staff_Gender LIKE 'Male' OR Staff_Gender LIKE 'Female')
)

CREATE TABLE MsVendor (
	Vendor_ID CHAR(5) PRIMARY KEY CHECK(Vendor_ID LIKE 'VE[0-9][0-9][0-9]') NOT NULL,
	Vendor_Name VARCHAR(50) NOT NULL,
	Vendor_Email VARCHAR(100) NOT NULL,
	Vendor_Phone VARCHAR(15) NOT NULL,
	Vendor_Address VARCHAR(150) NOT NULL,
	CONSTRAINT VendorEmail_Check CHECK (Vendor_Email LIKE '%@bluejack.com' OR Vendor_Email LIKE '%@sunib.edu')
)

CREATE TABLE MsCustomer (
	Customer_ID CHAR(5) PRIMARY KEY CHECK(Customer_ID LIKE 'CU[0-9][0-9][0-9]') NOT NULL,
	Customer_Name VARCHAR(50) NOT NULL,
	Customer_Email VARCHAR(100) NOT NULL,
	Customer_DOB DATE NOT NULL,
	Customer_Gender VARCHAR(10) NOT NULL,
	Customer_Phone VARCHAR(15) NOT NULL,
	Customer_Address VARCHAR(150) NOT NULL,
	CONSTRAINT CustomerName_Check CHECK(LEN(Customer_Name) >= 3),
	CONSTRAINT CustomerEmail_Check CHECK(Customer_Email LIKE '%@bluejack.com' OR Customer_Email LIKE '%@sunib.edu'),
	CONSTRAINT CustomerGender_Check CHECK(Customer_Gender LIKE 'Male' OR Customer_Gender LIKE 'Female')
)

CREATE TABLE MsPhoneBrand (
	PhoneBrand_ID CHAR(5) PRIMARY KEY CHECK(PhoneBrand_ID LIKE 'PB[0-9][0-9][0-9]'),
	PhoneBrand_Name VARCHAR(50) NOT NULL,
)

CREATE TABLE MsPhone (
	Phone_ID CHAR(5) PRIMARY KEY CHECK(Phone_ID LIKE 'PO[0-9][0-9][0-9]'),
	PhoneBrand_ID CHAR(5) FOREIGN KEY REFERENCES MsPhoneBrand(PhoneBrand_ID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	Phone_Name VARCHAR(50) NOT NULL,
	Phone_Price INT NOT NULL,
	CONSTRAINT PhonePrice_Check CHECK(Phone_Price BETWEEN 100000 AND 40000000)
)

CREATE TABLE PurchaseTransaction (
	Purchase_ID CHAR(5) PRIMARY KEY CHECK(Purchase_ID LIKE 'PH[0-9][0-9][0-9]') NOT NULL,
	Staff_ID CHAR(5) FOREIGN KEY REFERENCES MsStaff(Staff_ID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	Vendor_ID CHAR(5) FOREIGN KEY REFERENCES MsVendor(Vendor_ID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	Transaction_Date DATE NOT NULL
)

CREATE TABLE PurchaseTransactionDetails (
	Purchase_ID CHAR(5) FOREIGN KEY REFERENCES PurchaseTransaction(Purchase_ID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL CHECK(Purchase_ID LIKE 'PH[0-9][0-9][0-9]'),
	Phone_ID CHAR(5) FOREIGN KEY REFERENCES MsPhone(Phone_ID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	Quantity INT NOT NULL,
	PRIMARY KEY(Purchase_ID,Phone_ID)
)

CREATE TABLE SalesTransaction (
	Sales_ID CHAR(5) PRIMARY KEY CHECK(Sales_ID LIKE 'SH[0-9][0-9][0-9]') NOT NULL,
	Staff_ID CHAR(5) FOREIGN KEY REFERENCES MsStaff(Staff_ID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	Customer_ID CHAR(5) FOREIGN KEY REFERENCES MsCustomer(Customer_ID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	Transaction_Date DATE NOT NULL
)

CREATE TABLE SalesTransactionDetails (
	Sales_ID CHAR(5) FOREIGN KEY REFERENCES SalesTransaction(Sales_ID) ON UPDATE CASCADE ON DELETE CASCADE CHECK(Sales_ID LIKE 'SH[0-9][0-9][0-9]') NOT NULL,
	Phone_ID CHAR(5) FOREIGN KEY REFERENCES MsPhone(Phone_ID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	Quantity INT NOT NULL,
	PRIMARY KEY (Sales_ID,Phone_ID)
)