CREATE DATABASE ZStalk_Shop
GO
USE ZStalk_Shop
-- T?o b?ng Brands
CREATE TABLE Brands (
	BrandsID INT NOT NULL PRIMARY KEY,
	BrandsName VARCHAR(100),
	Contacts VARCHAR(255),
	Region VARCHAR(30),
	Address NVARCHAR(100)
);

-- T?o b?ng Admin
CREATE TABLE Manager (
    ManagerID INT NOT NULL PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(50),
	Managername VARCHAR(50),
	Phone VARCHAR(20),
	Address NVARCHAR(100),
    Email VARCHAR(100)
);

-- T?o b?ng Category
CREATE TABLE Category (
    CategoryID INT NOT NULL PRIMARY KEY,
    CategoryName VARCHAR(100),
	Img VARCHAR(500),
	Descriptions TEXT,
);

-- T?o b?ng Customers
CREATE TABLE Customers (
    CustomerID INT NOT NULL PRIMARY KEY,
    username VARCHAR(100),
	password VARCHAR(100),
	CustomerName VARCHAR(50),
    PhoneNumber VARCHAR(20),
    Address NVARCHAR(255),
    Gender VARCHAR(10),
	Email VARCHAR(255),
);

-- T?o b?ng Discount
CREATE TABLE Discount (
    DiscountID VARCHAR(20) NOT NULL PRIMARY KEY,
	DiscountName NVARCHAR(100),
	DiscountPersent DECIMAL(5,2)
);

-- T?o b?ng Storage
CREATE TABLE Storage (
    StorageID INT NOT NULL PRIMARY KEY,
	AvailableQuantity INT
);

-- T?o b?ng Payment
CREATE TABLE Payment (
	PaymentID INT NOT NULL PRIMARY KEY,
	PaymentName VARCHAR(100)
);

-- T?o b?ng Products
CREATE TABLE Products (
	ProductsID INT NOT NULL PRIMARY KEY,
	ProductsName NVARCHAR(150),
	Gender NVARCHAR(30),
	Collections NVARCHAR(70),
	Size VARCHAR(10),
	Color VARCHAR(20),
	ProductPrice FLOAT,
	--FOREIGN KEY
	StorageId INT FOREIGN KEY REFERENCES Storage(StorageID),
	CategoryId INT FOREIGN KEY REFERENCES Category(CategoryID),
	BrandsId INT FOREIGN KEY REFERENCES Brands(BrandsID),
);

-- T?o b?ng Order
CREATE TABLE Orders (
	OrdersID INT NOT NULL PRIMARY KEY,
	OrdersDate DATE,
	Price FLOAT,
	Quantity INT,
	Address VARCHAR(255),
	Status VARCHAR(255),
	Freight VARCHAR(255),
	--FOREIGN KEY
	CustomerId INT FOREIGN KEY REFERENCES Customers(CustomerID),
	DiscountId VARCHAR(20) FOREIGN KEY REFERENCES Discount(DiscountID),
);

-- T?o b?ng Feedback
CREATE TABLE Feedback (
	FeedbackID INT IDENTITY(1,1) PRIMARY KEY,
	detail NVARCHAR(255),
	Rating INT,
	feedbackDate DATETIME,
	--FOREIGN KEY
	ProId INT FOREIGN KEY REFERENCES Products(ProductsID),
	CustomerId INT FOREIGN KEY REFERENCES Customers(CustomerID)
);

-- T?o b?ng OrderDetail(weak)
CREATE TABLE OrderDetail (
	Amount FLOAT,
	TotalQuantity INT,
	OrdersId INT FOREIGN KEY REFERENCES Orders(OrdersID),
	PaysId INT FOREIGN KEY REFERENCES Payment(PaymentID),
	ProId INT FOREIGN KEY REFERENCES Products(ProductsID),
	--Ta?o kho?a chi?nh
	PRIMARY KEY(OrdersId, PaysId, ProId)
);

CREATE TABLE Check_Order (
    ManagerId INT FOREIGN KEY REFERENCES Manager(ManagerID),
    OrdersId INT FOREIGN KEY REFERENCES Orders(OrdersID),
	PRIMARY KEY (ManagerId, OrdersId)
);

-- Insert data
-- Thêm d? li?u vào b?ng Admins OK
INSERT INTO Manager (ManagerID, username, password, Managername, Phone, Address, Email)
VALUES 
(01, 'minh', 'minh123', 'ADMIN MINH DO', '123456789', 'Binh Thanh District', 'minhdtse172130@fpt.edu.vn'),
(02, 'duy', 'duy123', 'ADMIN DUY TRAN', '987654321', '9 District', 'duytnse172106@fpt.edu.vn'),
(03, 'duc', 'duc123', 'ADMIN DUC PHAM', '987654321', '9 District', 'ducpvse172131@fpt.edu.vn');

-- Thêm d? li?u vào b?ng Customers OK
INSERT INTO Customers (CustomerID, username, password, CustomerName, PhoneNumber, Address, Gender, Email)
VALUES 
(001, 'cacon', 'duy', 'Duy ca con', '111222333', '75, 265 Street, 9 District, HCM', 'Male', 'duycacon3@gmail.com'),
(002, 'duyga', 'cacon', 'Duy Tran', '444555666', '273, Nguyen Van Linh Street, 8 District, HCM', 'Male', 'duytran11@gmail.com'),
(003, 'mink', 'minh', 'Minh Mink', '111222333', '31, Tran Quy Cap Street, Binh Thanh District, HCM', 'Male', 'minkcute2@gmail.com'),
(004, 'youngboiz', 'duc', 'Young boiz Duc', '444555666', '75, 265 Street, 9 District, HCM', 'Male', 'youngboizseetinh12@gmail.com'),
(005, 'duc123', 'duc', 'Duc Duc', '111222333', '72, Pham Hung Streer, 8 District, HCM', 'Male', 'ducpham25@gmail.com'),
(006, 'duy234', 'duy', 'Duy Duy', '444555666', '10, Ong Ren ward, Can Duoc District, Long An City', 'Male', 'duytn87889@gmail.com'),
(007, 'trinh', 'trinh', 'Nico Lan Trinh', '111222333', '12, Nguyen Thoi Street, Nguyen An Ninh ward, Vung Tau City', 'Female', 'trinhhotgirl3@gmail.com'),
(008, 'ly246', 'lyly', 'Angela Ly', '444555666', '273, Man Thien Street, 9 District, HCM', 'Female', 'lylycute22@gmail.com');

-- Thêm d? li?u vào b?ng Category OK
INSERT INTO Category (CategoryID, CategoryName, Img, Descriptions)
VALUES 
(31001, 'Bomber1', 'images\shirt\Bomber\Bomber1.jpg', 'Various types of shirts'),
(31002, 'Bomber2', 'images\shirt\Bomber\Bomber2.jpg', 'Different styles of clothing'),
(31003, 'Bomber3', 'images\shirt\Bomber\Bomber3.jpg', 'Various designs of t-shirts'),
(31004, 'Bomber4', 'images\shirt\Bomber\Bomber4.jpg', 'Different cuts and washes of jeans'),
(31005, 'Bomber5', 'images\shirt\Bomber\Bomber5.jpg', 'Various colors and designs of hoodies'),
--M
(31006, 'Bomber6', 'images\shirt\Bomber\Bomber6.jpg', 'Different types of jackets for all seasons'),
(31007, 'Bomber7', 'images\shirt\Bomber\Bomber7.jpg', 'Various styles of dresses for different occasions'),
(31008, 'Bomber8', 'images\shirt\Bomber\Bomber8.jpg', 'Different lengths and styles of skirts'),
(31009, 'Bomber9', 'images\shirt\Bomber\Bomber9.jpg', 'Elegant and casual blouses for women'),
(31010, 'Bomber10','images\shirt\Bomber\Bomber10.jpg', 'Cozy sweaters for chilly weather'),
--F
(31011, 'Hoodie1', 'images\shirt\Hoodie\Hoodie1.jpg', 'Different lengths and styles of shorts'),
(31012, 'Hoodie2', 'images\shirt\Hoodie\Hoodie2.jpg', 'Formal suits for men and women'),
(31013, 'Hoodie3', 'images\shirt\Hoodie\Hoodie3.jpg', 'Various types of trousers for everyday wear'),
(31014, 'Hoodie4', 'images\shirt\Hoodie\Hoodie4.jpg', 'Stylish swimwear for the beach or pool'),
(31015, 'Hoodie5', 'images\shirt\Hoodie\Hoodie5.jpg', 'High-performance sportswear for athletes'),
--M
(31016, 'Hoodie6', 'images\shirt\Hoodie\Hoodie6.jpg', 'Warm and stylish outerwear options'),
(31017, 'Hoodie7', 'images\shirt\Hoodie\Hoodie7.jpg', 'Comfortable and functional activewear'),
(31018, 'Hoodie8', 'images\shirt\Hoodie\Hoodie8.jpg', 'Comfortable and supportive underwear options'),
(31019, 'Hoodie9', 'images\shirt\Hoodie\Hoodie9.jpg', 'Cozy and comfortable sleepwear options'),
(31020, 'Hoodie10', 'images\shirt\Hoodie\Hoodie10.jpg', 'Various accessories to complement your outfit'),
--F
(31021, 'Sweaters1', 'images\shirt\Sweaters\Sweatear1.jpg', 'Stylish and comfortable footwear options'),
(31022, 'Sweaters2', 'images\shirt\Sweaters\Sweatear2.jpg', 'Elegant formalwear for special occasions'),
(31023, 'Sweaters3', 'images\shirt\Sweaters\Sweatear3.jpg', 'Traditional clothing from different cultures'),
(31024, 'Sweaters4', 'images\shirt\Sweaters\Sweatear4.jpg', 'Comfortable and stylish maternity clothing'),
(31025, 'Sweaters5', 'images\shirt\Sweaters\Sweatear5.jpg', 'Fashionable clothing for plus-size individuals'),
--M
(31026, 'Sweaters6', 'images\shirt\Sweaters\Sweatear6.jpg', 'Adorable outfits for your furry friends'),
(31027, 'Sweaters7', 'images\shirt\Sweaters\Sweatear7.jpg', 'Professional uniforms for various industries'),
(31028, 'Sweaters8', 'images\shirt\Sweaters\Sweatear8.jpg', 'Creative costumes for parties and events'),
(31029, 'Sweaters9', 'images\shirt\Sweaters\Sweatear9.jpg', 'Unique vintage clothing pieces'),
(31030, 'Sweaters10', 'images\shirt\Sweaters\Sweatear10.jpg', 'Durable and functional workwear options'),
--F
(31031, 'T-Shirt1', 'images\shirt\T-Shirt\T-Shirt1.jpg', 'Trendy streetwear styles for urban fashionistas'),
(31032, 'T-Shirt2', 'images\shirt\T-Shirt\T-Shirt2.jpg', 'Stylish outfits for parties and celebrations'),
(31033, 'T-Shirt3', 'images\shirt\T-Shirt\T-Shirt3.jpg', 'Fashionable beachwear for sunny days'),
(31034, 'T-Shirt4', 'images\shirt\T-Shirt\T-Shirt4.jpg', 'Elegant attire for weddings and ceremonies'),
(31035, 'T-Shirt5', 'images\shirt\T-Shirt\T-Shirt5.jpg', 'Smart and relaxed business casual outfits'),
--M
(31036, 'T-Shirt6', 'images\shirt\T-Shirt\T-Shirt6.jpg', 'Comfortable and breathable gym wear'),
(31037, 'T-Shirt7', 'images\shirt\T-Shirt\T-Shirt7.jpg', 'Relaxing loungewear for lazy days at home'),
(31038, 'T-Shirt8', 'images\shirt\T-Shirt\T-Shirt8.jpg', 'Functional clothing for outdoor adventures'),
(31039, 'T-Shirt9', 'images\shirt\T-Shirt\T-Shirt9.jpg', 'Stylish outfits for nights out on the town'),
(31040, 'T-Shirt10', 'images\shirt\T-Shirt\T-Shirt10.jpg', 'Sophisticated yet relaxed formal casual attire');
--F
-- Thêm d? li?u vào b?ng Brands OK
INSERT INTO Brands (BrandsID, BrandsName, Contacts, Region, Address)
VALUES 
(100, 'Nike', '111222333', 'North America', '123 Nike Street'),
(101, 'Adidas', '444555666', 'Europe', '456 Adidas Avenue'),
(102, 'Louis Vuitton', '444511122', 'North America', '123 Tran Phu Street'),
(103, 'Balenciaga', '2233344455', 'Europe', '456 Hai ba trung Street'),
(104, 'Zstalk', '0938221081', 'Viet Nam', '265 Street');

-- Thêm d? li?u vào b?ng Discount OK
INSERT INTO Discount (DiscountID, DiscountName, DiscountPersent)
VALUES 
('DISC0010', '10% off', 10.00),
('DISC0020', '20% off', 20.00),
('DISC0015', '15% off', 15.00),
('DISC0005', '5% off', 5.00),
('DISC0025', '25% off', 25.00),
('DISC0030', '30% off', 30.00);

-- Thêm d? li?u vào b?ng Storage OK
INSERT INTO Storage (StorageID, AvailableQuantity)
VALUES
(0111, 10),(0112, 10),(0113, 10),(0114, 10),(0115, 10),
(0116, 10),(0117, 10),(0118, 10),(0119, 10),(0120, 10),
(0121, 10),(0122, 10),(0123, 10),(0124, 10),(0125, 10),
(0126, 10),(0127, 10),(0128, 10),(0129, 10),(0130, 10),
(0131, 10),(0132, 10),(0133, 10),(0134, 10),(0135, 10),
(0136, 10),(0137, 10),(0138, 10),(0139, 10),(0140, 10),
(0141, 10),(0142, 10),(0143, 10),(0144, 10),(0145, 10),
(0146, 10),(0147, 10),(0148, 10),(0149, 10),(0150, 10),
(0151, 10),(0152, 10),(0153, 10),(0154, 10),(0155, 10),
(0156, 10),(0157, 10),(0158, 10),(0159, 10),(0160, 10),
(0161, 10),(0162, 10),(0163, 10),(0164, 10),(0165, 10),(0166, 10),
(0167, 10),(0168, 10),(0169, 10),(0170, 10),(0171, 10),
(0172, 10),(0173, 10),(0174, 10),(0175, 10),(0176, 10),
(0177, 10),(0178, 10),(0179, 10),(0180, 10),(0181, 10),
(0182, 10),(0183, 10),(0184, 10),(0185, 10),(0186, 10),
(0187, 10),(0188, 10),(0189, 10),(0190, 10),(0191, 10),
(0192, 10),(0193, 10),(0194, 10),(0195, 10),(0196, 10),
(0197, 10),(0198, 10),(0199, 10),(0200, 10),(0201, 10),
(0202, 10),(0203, 10),(0204, 10),(0205, 10),(0206, 10),
(0207, 10),(0208, 10),(0209, 10),(0210, 10),(0211, 10),
(0212, 10),(0213, 10),(0214, 10),(0215, 10),(0216, 10),
(0217, 10),(0218, 10),(0219, 10),(0220, 10),(0221, 10),
(0222, 10),(0223, 10),(0224, 10),(0225, 10),(0226, 10),
(0227, 10),(0228, 10),(0229, 10),(0230, 10),(0231, 10),
(0232, 10),(0233, 10),(0234, 10),(0235, 10),(0236, 10),
(0237, 10),(0238, 10),(0239, 10),(0240, 10),(0241, 10),
(0242, 10),(0243, 10),(0244, 10),(0245, 10),(0246, 10),
(0247, 10),(0248, 10),(0249, 10),(0250, 10),(0251, 10),
(0252, 10),(0253, 10),(0254, 10),(0255, 10);

-- Thêm d? li?u vào b?ng Payment OK
INSERT INTO Payment (PaymentID, PaymentName)
VALUES 
(111, 'Credit Card'),
(272, 'Payment on delivery');

-- Thêm d? li?u vào b?ng Products OK
INSERT INTO Products (ProductsID, ProductsName, Gender, Collections, Size, Color, ProductPrice, StorageId, CategoryId, BrandsId)
VALUES 
(711700, 'Bomber man bomber jacket with 2 pockets Masiduti', 'Men', 'Summer ', 'S', 'Brownish-Green', 5.00, 0111, 31001, 100),
(711701, 'Bomber man bomber jacket with 2 pockets Masiduti', 'Men', 'Summer ', 'M', 'Brownish-Green', 5.00, 0112, 31001, 100),
(711702, 'Bomber man bomber jacket with 2 pockets Masiduti', 'Men', 'Summer ', 'L', 'Brownish-Green', 5.00, 0113, 31001, 100),
(711703, 'Bomber man bomber jacket with 2 pockets Masiduti', 'Men', 'Summer ', 'XL', 'Brownish-Green', 5.00, 0114, 31001, 100),
(711704, 'Bomber man bomber jacket with 2 pockets Masiduti', 'Men', 'Summer ', 'XXL', 'Brownish-Green', 5.00, 0115, 31001, 100),
--1
(711705, 'Plain black bomber jacket without pockets', 'Men', 'Spring', 'S', 'Black', 2.50, 0116, 31002, 102),
(711706, 'Plain black bomber jacket without pockets', 'Men', 'Spring', 'M', 'Black', 2.50, 0117, 31002, 102),
(711707, 'Plain black bomber jacket without pockets', 'Men', 'Spring', 'L', 'Black', 2.50, 0118, 31002, 102),
(711708, 'Plain black bomber jacket without pockets', 'Men', 'Spring', 'XL', 'Black', 2.50, 0119, 31002, 102),
(711709, 'Plain black bomber jacket without pockets', 'Men', 'Spring', 'XXL', 'Black', 2.50, 0120, 31002, 102),
--2
(711710, 'Bomber jacket A&A', 'Men', 'Winter ', 'S', 'Cream-colored', 5.00, 0121, 31003, 101),
(711711, 'Bomber jacket A&A', 'Men', 'Winter ', 'M', 'Cream-colored', 5.00, 0122, 31003, 101),
(711712, 'Bomber jacket A&A', 'Men', 'Winter ', 'L', 'Cream-colored', 5.00, 0123, 31003, 101),
(711713, 'Bomber jacket A&A', 'Men', 'Winter ', 'XL', 'Cream-colored', 5.00, 0124, 31003, 101),
(711714, 'Bomber jacket A&A', 'Men', 'Winter ', 'XXL', 'Cream-colored', 5.00, 0125, 31003, 101),
--3
(711715, 'Bomber jacket ZARA', 'Men', 'Autumn ', 'Freesize', 'Green-white', 35.00, 0126, 31004, 102),
--4
(711716, 'Plain bomber jacket Basic', 'Men', 'Summer ', 'S', 'Dark-Brown', 50.00, 0127, 31005, 101),
(711717, 'Plain bomber jacket Basic', 'Men', 'Summer ', 'M', 'Dark-Brown', 50.00, 0128, 31005, 101),
(711718, 'Plain bomber jacket Basic', 'Men', 'Summer ', 'L', 'Dark-Brown', 50.00, 0129, 31005, 101),
(711719, 'Plain bomber jacket Basic', 'Men', 'Summer ', 'XL', 'Dark-Brown', 50.00, 0130, 31005, 101),
(711720, 'Plain bomber jacket Basic', 'Men', 'Summer ', 'XXL', 'Dark-Brown', 50.00, 0131, 31005, 101),
--5
(711721, 'Black plain bomber jacket with waves', 'Women', 'Summer', 'S', 'Black', 12.99, 0132, 31006, 102),
(711722, 'Black plain bomber jacket with waves', 'Women', 'Summer', 'M', 'Black', 12.99, 0133, 31006, 102),
(711723, 'Black plain bomber jacket with waves', 'Women', 'Summer', 'L', 'Black', 12.99, 0134, 31006, 102),
(711724, 'Black plain bomber jacket with waves', 'Women', 'Summer', 'XL', 'Black', 12.99, 0135, 31006, 102),
(711725, 'Black plain bomber jacket with waves', 'Women', 'Summer', 'XXL', 'Black', 12.99, 0136, 31006, 102),
--6
(711726, 'Short bomber jacket for women', 'Women', 'Winter ', 'S', 'Beige', 2.00, 0137, 31007, 101),
(711727, 'Short bomber jacket for women', 'Women', 'Winter ', 'M', 'Beige', 2.00, 0138, 31007, 101),
(711728, 'Short bomber jacket for women', 'Women', 'Winter ', 'L', 'Beige', 2.00, 0139, 31007, 101),
(711729, 'Short bomber jacket for women', 'Women', 'Winter ', 'XL', 'Beige', 2.00, 0140, 31007, 101),
(711730, 'Short bomber jacket for women', 'Women', 'Winter ', 'XXL', 'Beige', 2.00, 0141, 31007, 101),
--7
(711731, 'White denim bomber jacket with large pockets', 'Women', 'Summer ', 'S', 'Black-Blue', 3.00, 0142, 31008, 100),
(711732, 'White denim bomber jacket with large pockets', 'Women', 'Summer ', 'M', 'Black-Blue', 3.00, 0143, 31008, 100),
(711733, 'White denim bomber jacket with large pockets', 'Women', 'Summer ', 'L', 'Black-Blue', 3.00, 0144, 31008, 100),
(711734, 'White denim bomber jacket with large pockets', 'Women', 'Summer ', 'XL', 'Black-Blue', 3.00, 0145, 31008, 100),
(711735, 'White denim bomber jacket with large pockets', 'Women', 'Summer ', 'XXL', 'Black-Blue', 3.00, 0146, 31008, 100),
--8
(711736, 'Plain leather bomber jacket', 'Women', 'Spring', 'Freesize', 'Black', 10.00, 0147, 31009, 103),
--9
(711737, 'Plain grey bomber jacket with snap buttons', 'Women', 'Autumn', 'Freesize', 'Gray', 10.00, 0148, 31010, 104),
--10
(711738, 'Brown hoodie with a smiley face', 'Man', 'Summer ', 'S', 'Brown', 5.99, 0149, 31011, 100),
(711739, 'Brown hoodie with a smiley face', 'Man', 'Summer ', 'M', 'Brown', 5.99, 0150, 31011, 100),
(711740, 'Brown hoodie with a smiley face', 'Man', 'Summer ', 'L', 'Brown', 5.99, 0151, 31011, 100),
(711741, 'Brown hoodie with a smiley face', 'Man', 'Summer ', 'XL', 'Brown', 5.99, 0152, 31011, 100),
(711742, 'Brown hoodie with a smiley face', 'Man', 'Summer ', 'XXL', 'Brown', 5.99, 0153, 31011, 100),
--11
(711743, 'Hoodie with cowboy logo', 'Man', 'Autumn ', 'S', 'Black', 9.00, 0154, 31012, 102),
(711744, 'Hoodie with cowboy logo', 'Man', 'Autumn ', 'M', 'Black', 9.00, 0155, 31012, 102),
(711745, 'Hoodie with cowboy logo', 'Man', 'Autumn ', 'L', 'Black', 9.00, 0156, 31012, 102),
(711746, 'Hoodie with cowboy logo', 'Man', 'Autumn ', 'XL', 'Black', 9.00, 0157, 31012, 102),
(711747, 'Hoodie with cowboy logo', 'Man', 'Autumn ', 'XXL', 'Black', 9.00, 0158, 31012, 102),
--12
(711748, 'Hoodie with adorable anime illustration', 'Man', 'Spring', 'Freesize', 'Cream-colored', 5.00, 0159, 31013, 101),
--13
(711749, 'A hoodie from Pull & Bear with a loose, comfortable fit', 'Man', 'Autumn ', 'Freesize', 'White', 2.00, 0160, 31014, 102),
--14
(711750, 'A loose-fitting "COMMON STRENGTH" form hoodie', 'Man', 'Summer ', 'Freesize', 'Dark-Blue', 4.79, 0161, 31015, 103),
--15
(711751, 'A solid gray womens hoodie with two pockets', 'Woman', 'Spring', 'S', 'Grey', 5.99, 0162, 31016, 104),
(711752, 'A solid gray womens hoodie with two pockets', 'Woman', 'Spring', 'M', 'Grey', 5.99, 0163, 31016, 104),
(711753, 'A solid gray womens hoodie with two pockets', 'Woman', 'Spring', 'L', 'Grey', 5.99, 0164, 31016, 104),
(711754, 'A solid gray womens hoodie with two pockets', 'Woman', 'Spring', 'XL', 'Grey', 5.99, 0165, 31016, 104),
(711755, 'A solid gray womens hoodie with two pockets', 'Woman', 'Spring', 'XXL', 'Grey', 5.99, 0166, 31016, 104),
--16
(711756, 'A wide-fit, cute womens hoodie with the slogan Future or Reality', 'Women', 'Summer ', 'Freesize', 'Pink', 6.00, 0167, 31017, 104),
--17
(711757, 'A plain gray womens hoodie with drawstrings', 'Women', 'Autumn ', 'S', 'Grey', 30.00, 0168, 31018, 103),
(711758, 'A plain gray womens hoodie with drawstrings', 'Women', 'Autumn ', 'M', 'Grey', 30.00, 0169, 31018, 103),
(711759, 'A plain gray womens hoodie with drawstrings', 'Women', 'Autumn ', 'L', 'Grey', 30.00, 0170, 31018, 103),
(711760, 'A plain gray womens hoodie with drawstrings', 'Women', 'Autumn ', 'XL', 'Grey', 30.00, 0171, 31018, 103),
(711761, 'A plain gray womens hoodie with drawstrings', 'Women', 'Autumn ', 'XXL', 'Grey', 30.00, 0172, 31018, 103),
--18
(711762, 'A super cute womens hoodie', 'Women', 'Summer ', 'S', 'Ocean', 19.00, 0173, 31019, 101),
(711763, 'A super cute womens hoodie', 'Women', 'Summer ', 'M', 'Ocean', 19.00, 0174, 31019, 101),
(711764, 'A super cute womens hoodie', 'Women', 'Summer ', 'L', 'Ocean', 19.00, 0175, 31019, 101),
(711765, 'A super cute womens hoodie', 'Women', 'Summer ', 'XL', 'Ocean', 19.00, 0176, 31019, 101),
(711766, 'A super cute womens hoodie', 'Women', 'Summer ', 'XXL', 'Ocean', 19.00, 0177, 31019, 101),
--19
(711767, 'A hoodie with unique and artistic graphic prints', 'Women', 'Winter ', 'S', 'White', 15.00, 0178, 31020, 102),
(711768, 'A hoodie with unique and artistic graphic prints', 'Women', 'Winter ', 'M', 'White', 15.00, 0179, 31020, 102),
(711769, 'A hoodie with unique and artistic graphic prints', 'Women', 'Winter ', 'L', 'White', 15.00, 0180, 31020, 102),
(711770, 'A hoodie with unique and artistic graphic prints', 'Women', 'Winter ', 'XL', 'White', 15.00, 0181, 31020, 102),
(711771, 'A hoodie with unique and artistic graphic prints', 'Women', 'Winter ', 'XXL', 'White', 15.00, 0182, 31020, 102),
--20
(711772, 'A plain, chunky-style sweater', 'Man', 'Spring', 'Freesize', 'Dark-Blue', 2.00, 0183, 31021, 103),
--21
(711773, 'Seal Pocks sweater', 'Man', 'Winter ', 'S', 'Brass Bucket', 1.90, 0184, 31022, 100),
(711774, 'Seal Pocks sweater', 'Man', 'Winter ', 'M', 'Brass Bucket', 1.90, 0185, 31022, 100),
(711775, 'Seal Pocks sweater', 'Man', 'Winter ', 'L', 'Brass Bucket', 1.90, 0186, 31022, 100),
(711776, 'Seal Pocks sweater', 'Man', 'Winter ', 'XL', 'Brass Bucket', 1.90, 0187, 31022, 100),
(711777, 'Seal Pocks sweater', 'Man', 'Winter ', 'XXL', 'Brass Bucket', 1.90, 0188, 31022, 100),
--22
(711778, '"New Arigona" sweater', 'Man', 'Autumn ', 'FreeSize', 'Beige', 10.00, 0189, 31023, 101),
--23
(711779, 'A loose-fitting, comfortable sweater', 'Man', 'Autumn ', 'L', 'Grey', 2.00, 0190, 31024, 100),
(711780, 'A loose-fitting, comfortable sweater', 'Man', 'Autumn ', 'XL', 'Grey', 2.00, 0191, 31024, 100),
--24
(711781, '"Studio Lab" white sweatear', 'Man', 'Summer ', 'Freesize', 'White', 2.00, 0192, 31025, 100),
--25
(711782, 'A sweater for women by the name of "Unique Way"', 'Women', 'Summer ', 'S', 'Blue', 25.00, 0193, 31026, 102),
(711783, 'A sweater for women by the name of "Unique Way"', 'Women', 'Summer ', 'M', 'Blue', 25.00, 0194, 31026, 102),
(711784, 'A sweater for women by the name of "Unique Way"', 'Women', 'Summer ', 'L', 'Blue', 25.00, 0195, 31026, 102),
(711785, 'A sweater for women by the name of "Unique Way"', 'Women', 'Summer ', 'XL', 'Blue', 25.00, 0196, 31026, 102),
(711786, 'A sweater for women by the name of "Unique Way"', 'Women', 'Summer ', 'XXL', 'Blue', 25.00, 0197, 31026, 102),
--26
(711787, 'A womens sweater made of breathable wool', 'Women', 'Autumn ', 'FreeSize', 'Grey', 35.00, 0198, 31027, 104),
--27
(711788, 'A plain white womens sweater with a zipper neckline', 'Women', 'Spring', 'S', 'White', 12.00, 0199, 31028, 103),
(711789, 'A plain white womens sweater with a zipper neckline', 'Women', 'Spring', 'M', 'White', 12.00, 0200, 31028, 103),
(711790, 'A plain white womens sweater with a zipper neckline', 'Women', 'Spring', 'L', 'White', 12.00, 0201, 31028, 103),
--28
(711791, 'A sweater with holes', 'Women', 'Spring', 'Freesize', 'Cream-colored', 10.99, 0202, 31029, 100),
--29
(711792, 'A sweater with horizontal stripes', 'Women', 'Winter ', 'S', 'Beige', 9.00, 0203, 31030, 101),
(711793, 'A sweater with horizontal stripes', 'Women', 'Winter ', 'M', 'Beige', 9.00, 0204, 31030, 101),
(711794, 'A sweater with horizontal stripes', 'Women', 'Winter ', 'L', 'Beige', 9.00, 0205, 31030, 101),
--30
(711795, 'T-Shirt-Bershika', 'Man', 'Summer ', 'S', 'Black', 50.00, 0206, 31031, 100),
(711796, 'T-Shirt-Bershika', 'Man', 'Summer ', 'M', 'Black', 50.00, 0207, 31031, 100),
(711797, 'T-Shirt-Bershika', 'Man', 'Summer ', 'L', 'Black', 50.00, 0208, 31031, 100),
(711798, 'T-Shirt-Bershika', 'Man', 'Summer ', 'XL', 'Black', 50.00, 0209, 31031, 100),
(711799, 'T-Shirt-Bershika', 'Man', 'Summer ', 'XXL', 'Black', 50.00, 0210, 31031, 100),
--31
(711800, 'T-Shirt-Bershika1', 'Man', 'Winter ', 'S', 'White', 25.00, 0211, 31032, 101),
(711801, 'T-Shirt-Bershika1', 'Man', 'Winter ', 'M', 'White', 25.00, 0212, 31032, 101),
(711802, 'T-Shirt-Bershika1', 'Man', 'Winter ', 'L', 'White', 25.00, 0213, 31032, 101),
(711803, 'T-Shirt-Bershika1', 'Man', 'Winter ', 'XL', 'White', 25.00, 0214, 31032, 101),
(711804, 'T-Shirt-Bershika1', 'Man', 'Winter ', 'XXL', 'White', 25.00, 0215, 31032, 101),
--32
(711805, 'T-Shirt-Bershika2', 'Man', 'Summer ', 'S', 'Grey', 50.00, 0216, 31033, 102),
(711806, 'T-Shirt-Bershika2', 'Man', 'Summer ', 'M', 'Grey', 50.00, 0217, 31033, 102),
(711807, 'T-Shirt-Bershika2', 'Man', 'Summer ', 'L', 'Grey', 50.00, 0218, 31033, 102),
(711808, 'T-Shirt-Bershika2', 'Man', 'Summer ', 'XL', 'Grey', 50.00, 0219, 31033, 102),
(711809, 'T-Shirt-Bershika2', 'Man', 'Summer ', 'XXL', 'Grey', 50.00, 0220, 31033, 102),
--33
(711810, 'T-Shirt-Bershika3', 'Man', 'Spring', 'S', 'Brown', 25.00, 0221, 31034, 103),
(711811, 'T-Shirt-Bershika3', 'Man', 'Spring', 'M', 'Brown', 25.00, 0222, 31034, 103),
(711812, 'T-Shirt-Bershika3', 'Man', 'Spring', 'L', 'Brown', 25.00, 0223, 31034, 103),
(711813, 'T-Shirt-Bershika3', 'Man', 'Spring', 'XL', 'Brown', 25.00, 0224, 31034, 103),
(711814, 'T-Shirt-Bershika3', 'Man', 'Spring', 'XXL', 'Brown', 25.00, 0225, 31034, 103),
--34
(711815, 'T-Shirt-Bershika4', 'Man', 'Summer ', 'S', 'Dark-Green', 50.00, 0226, 31035, 104),
(711816, 'T-Shirt-Bershika4', 'Man', 'Summer ', 'M', 'Dark-Green', 50.00, 0227, 31035, 104),
(711817, 'T-Shirt-Bershika4', 'Man', 'Summer ', 'L', 'Dark-Green', 50.00, 0228, 31035, 104),
(711818, 'T-Shirt-Bershika4', 'Man', 'Summer ', 'XL', 'Dark-Green', 50.00, 0229, 31035, 104),
(711819, 'T-Shirt-Bershika4', 'Man', 'Summer ', 'XXL', 'Dark-Green', 50.00, 0230, 31035, 104),
--35
(711820, 'T-shirt-Bershika5', 'Female', 'Spring', 'S', 'Black', 25.00, 0231, 31036, 100),
(711821, 'T-shirt-Bershika5', 'Female', 'Spring', 'M', 'Black', 25.00, 0232, 31036, 100),
(711822, 'T-shirt-Bershika5', 'Female', 'Spring', 'L', 'Black', 25.00, 0233, 31036, 100),
(711823, 'T-shirt-Bershika5', 'Female', 'Spring', 'XL', 'Black', 25.00, 0234, 31036, 100),
(711824, 'T-shirt-Bershika5', 'Female', 'Spring', 'XXL', 'Black', 25.00, 0235, 31036, 100),
--36
(711825, 'T-shirt-Bershika6', 'Female', 'Spring', 'S', 'White', 50.00, 0236, 31037, 101),
(711826, 'T-shirt-Bershika6', 'Female', 'Spring', 'M', 'White', 50.00, 0237, 31037, 101),
(711827, 'T-shirt-Bershika6', 'Female', 'Spring', 'L', 'White', 50.00, 0238, 31037, 101),
(711828, 'T-shirt-Bershika6', 'Female', 'Spring', 'XL', 'White', 50.00, 0239, 31037, 101),
(711829, 'T-shirt-Bershika6', 'Female', 'Spring', 'XXL', 'White', 50.00, 0240, 31037, 101),
--37
(711830, 'T-shirt-Bershika7', 'Female', 'Autumn ', 'S', 'White', 25.00, 0241, 31038, 103),
(711831, 'T-shirt-Bershika7', 'Female', 'Autumn ', 'M', 'White', 25.00, 0242, 31038, 103),
(711832, 'T-shirt-Bershika7', 'Female', 'Autumn ', 'L', 'White', 25.00, 0243, 31038, 103),
(711833, 'T-shirt-Bershika7', 'Female', 'Autumn ', 'XL', 'White', 25.00, 0244, 31038, 103),
(711834, 'T-shirt-Bershika7', 'Female', 'Autumn ', 'XXL', 'White', 25.00, 0245, 31038, 103),
--38
(711835, 'T-shirt-Bershika8', 'Female', 'Autumn ', 'S', 'Black', 50.00, 0246, 31039, 102),
(711836, 'T-shirt-Bershika8', 'Female', 'Autumn ', 'M', 'Black', 50.00, 0247, 31039, 102),
(711837, 'T-shirt-Bershika8', 'Female', 'Autumn ', 'L', 'Black', 50.00, 0248, 31039, 102),
(711838, 'T-shirt-Bershika8', 'Female', 'Autumn ', 'XL', 'Black', 50.00, 0249, 31039, 102),
(711839, 'T-shirt-Bershika8', 'Female', 'Autumn ', 'XXL', 'Black', 50.00, 0250, 31039, 102),
--39
(711840, 'T-shirt-Bershika9', 'Female', 'Winter ', 'S', 'Black', 25.00, 0251, 31040, 104),
(711841, 'T-shirt-Bershika9', 'Female', 'Winter ', 'M', 'Black', 25.00, 0252, 31040, 104),
(711842, 'T-shirt-Bershika9', 'Female', 'Winter ', 'L', 'Black', 25.00, 0253, 31040, 104),
(711843, 'T-shirt-Bershika9', 'Female', 'Winter ', 'XL', 'Black', 25.00, 0254, 31040, 104),
(711844, 'T-shirt-Bershika9', 'Female', 'Winter ', 'XXL', 'Black', 25.00, 0255, 31040, 104);
--40 Product
-- Thêm d? li?u vào b?ng Orders OK
INSERT INTO Orders (OrdersID, OrdersDate, Price, Quantity, Address, Status, Freight, CustomerId, DiscountId)
VALUES 
(4000301, '2024-03-14', 10.00, 2, '75, 265 Street, 9 District, HCM', 'Pending', 'Shopee Express', 001, 'DISC0010'),
(4000302, '2024-03-15', 25.00, 1, '273, Man Thien Street, 9 District, HCM', 'Completed', 'J&T Express', 008, 'DISC0025'),
(4000303, '2024-03-14', 3.80, 2, '31, Tran Quy Cap Street, Binh Thanh District, HCM', 'Pending', 'Shopee Express', 003, 'DISC0005'),
(4000307, '2024-03-15', 35.00, 1, '75, 265 Street, 9 District, HCM', 'Failed', 'J&T Express', 004, 'DISC0010'),
(4000309, '2024-03-15', 4.79, 1, '72, Pham Hung Streer, 8 District, HCM', 'Completed', 'J&T Express', 005, 'DISC0030'),
(4000310, '2024-03-10', 150.00, 3, '273, Man Thien Street, 9 District, HCM', 'Pending', 'Shopee Express', 008, 'DISC0015'),
(4000311, '2024-03-11', 3.80, 2, '10, Ong Ren ward, Can Duoc District, Long An City', 'Pending', 'Shopee Express', 006, 'DISC0025'),
(4000313, '2024-03-14', 12.00, 4, '12, Nguyen Thoi Street, Nguyen An Ninh ward, Vung Tau City', 'Pending', 'Shopee Express', 007, 'DISC0020'),
(4000322, '2024-03-15', 5.99, 1, '10, Ong Ren ward, Can Duoc District, Long An City', 'Failed', 'J&T Express', 006, 'DISC0020'),
(4000328, '2024-03-15', 50.00, 1, '75, 265 Street, 9 District, HCM', 'Completed', 'J&T Express', 004, 'DISC0005');

-- Thêm d? li?u vào b?ng OrderDetail OK
INSERT INTO OrderDetail (Amount, TotalQuantity, OrdersId, PaysId, ProId)
VALUES 
(10.00, 2, 4000301, 111, 711748),
(25.00, 1, 4000302, 272, 711831),
(3.80, 2, 4000303, 111, 711777),
(35.00, 1, 4000307, 272, 711715),
(4.79, 1, 4000309, 111, 711750),
(150.00, 3, 4000310, 272, 711826),
(3.80, 2, 4000311, 272, 711771),
(12.00, 4, 4000313, 111, 711733),
(5.99, 1, 4000322, 111, 711741),
(50.00, 1, 4000328, 272, 711808);

-- Thêm d? li?u vào b?ng Feedback OK
INSERT INTO Feedback (detail, Rating, feedbackDate, ProId, CustomerId)
VALUES 
('Great product!', 5, '2024-02-14', 711808, 001),
('Excellent service!', 4, '2024-02-15', 711748, 008),
('Good!', 3, '2024-02-02', 711826, 004),
('Ok', 2, '2024-01-1', 711777, 005),
('Not satisfied with product quality!', 1, '2023-12-07', 711826, 005),
('Great product!', 4, '2024-01-03', 711831, 003);

-- Thêm d? li?u vào b?ng Check_Order OK
INSERT INTO Check_Order (ManagerId, OrdersId)
VALUES 
(01, 4000301),
(02, 4000303),
(01, 4000311),
(02, 4000310),
(03, 4000313);
