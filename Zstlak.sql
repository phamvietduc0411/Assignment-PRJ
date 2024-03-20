CREATE DATABASE ZStalk_Shop
GO
USE ZStalk_Shop

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
	Collections NVARCHAR(70),
	Descriptions TEXT,
);

-- T?o b?ng Customers
CREATE TABLE Customers (
    CustomerID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    username VARCHAR(100),
	password VARCHAR(100),
	CustomerName NVARCHAR(50),
    PhoneNumber VARCHAR(20),
    Address NVARCHAR(255),
    Gender VARCHAR(10),
	Email VARCHAR(255),
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
	Size VARCHAR(10),
	Color VARCHAR(20),
	ProductPrice FLOAT,
	Img VARCHAR(500),
	--FOREIGN KEY
	StorageId INT FOREIGN KEY REFERENCES Storage(StorageID),
	CategoryId INT FOREIGN KEY REFERENCES Category(CategoryID),
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

CREATE TABLE Cart(
	CartId INT IDENTITY(1,1) PRIMARY KEY,
	CustomerId INT FOREIGN KEY REFERENCES Customers(CustomerID),
	ProId INT FOREIGN KEY REFERENCES Products(ProductsID),
	Quantity INT,
)

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
INSERT INTO Customers (username, password, CustomerName, PhoneNumber, Address, Gender, Email)
VALUES 
('cacon', 'duy', 'Duy ca con', '111222333', '75, 265 Street, 9 District, HCM', 'Male', 'duycacon3@gmail.com'),
('duyga', 'cacon', 'Duy Tran', '444555666', '273, Nguyen Van Linh Street, 8 District, HCM', 'Male', 'duytran11@gmail.com'),
('mink', 'minh', 'Minh Mink', '111222333', '31, Tran Quy Cap Street, Binh Thanh District, HCM', 'Male', 'minkcute2@gmail.com'),
('youngboiz', 'duc', 'Young boiz Duc', '444555666', '75, 265 Street, 9 District, HCM', 'Male', 'youngboizseetinh12@gmail.com'),
('duc123', 'duc', 'Duc Duc', '111222333', '72, Pham Hung Streer, 8 District, HCM', 'Male', 'ducpham25@gmail.com'),
('duy234', 'duy', 'Duy Duy', '444555666', '10, Ong Ren ward, Can Duoc District, Long An City', 'Male', 'duytn87889@gmail.com'),
('trinh', 'trinh', 'Nico Lan Trinh', '111222333', '12, Nguyen Thoi Street, Nguyen An Ninh ward, Vung Tau City', 'Female', 'trinhhotgirl3@gmail.com'),
('ly246', 'lyly', 'Angela Ly', '444555666', '273, Man Thien Street, 9 District, HCM', 'Female', 'lylycute22@gmail.com');

-- Thêm d? li?u vào b?ng Category OK
INSERT INTO Category (CategoryID, CategoryName, Collections, Descriptions)
VALUES 
(31001, 'Bomber1', 'Summer', 'Various types of shirts'),
(31002, 'Bomber2', 'Summer', 'Different styles of clothing'),
(31003, 'Bomber3', 'Autumn', 'Various designs of t-shirts'),
(31004, 'Bomber4', 'Spring', 'Different cuts and washes of jeans'),
(31005, 'Bomber5', 'Winter', 'Various colors and designs of hoodies'),
--M
(31006, 'Bomber6', 'Summer', 'Different types of jackets for all seasons'),
(31007, 'Bomber7', 'Autumn', 'Various styles of dresses for different occasions'),
(31008, 'Bomber8', 'Summer', 'Different lengths and styles of skirts'),
(31009, 'Bomber9', 'Winter', 'Elegant and casual blouses for women'),
(31010, 'Bomber10','Spring', 'Cozy sweaters for chilly weather'),
--F
(31011, 'Hoodie1', 'Spring', 'Different lengths and styles of shorts'),
(31012, 'Hoodie2', 'Spring', 'Formal suits for men and women'),
(31013, 'Hoodie3', 'Autumn', 'Various types of trousers for everyday wear'),
(31014, 'Hoodie4', 'Winter', 'Stylish swimwear for the beach or pool'),
(31015, 'Hoodie5', 'Summer', 'High-performance sportswear for athletes'),
--M
(31016, 'Hoodie6', 'Spring', 'Warm and stylish outerwear options'),
(31017, 'Hoodie7', 'Autumn', 'Comfortable and functional activewear'),
(31018, 'Hoodie8', 'Winter', 'Comfortable and supportive underwear options'),
(31019, 'Hoodie9', 'Summer', 'Cozy and comfortable sleepwear options'),
(31020, 'Hoodie10', 'Spring', 'Various accessories to complement your outfit'),
--F
(31021, 'Sweaters1', 'Winter', 'Stylish and comfortable footwear options'),
(31022, 'Sweaters2', 'Summer', 'Elegant formalwear for special occasions'),
(31023, 'Sweaters3', 'Autumn', 'Traditional clothing from different cultures'),
(31024, 'Sweaters4', 'Autumn', 'Comfortable and stylish maternity clothing'),
(31025, 'Sweaters5', 'Spring', 'Fashionable clothing for plus-size individuals'),
--M
(31026, 'Sweaters6', 'Winter', 'Adorable outfits for your furry friends'),
(31027, 'Sweaters7', 'Summer', 'Professional uniforms for various industries'),
(31028, 'Sweaters8', 'Winter', 'Creative costumes for parties and events'),
(31029, 'Sweaters9', 'Autumn', 'Unique vintage clothing pieces'),
(31030, 'Sweaters10', 'Spring', 'Durable and functional workwear options'),
--F
(31031, 'T-Shirt1', 'Winter', 'Trendy streetwear styles for urban fashionistas'),
(31032, 'T-Shirt2', 'Summer', 'Stylish outfits for parties and celebrations'),
(31033, 'T-Shirt3', 'Autumn', 'Fashionable beachwear for sunny days'),
(31034, 'T-Shirt4', 'Winter', 'Elegant attire for weddings and ceremonies'),
(31035, 'T-Shirt5', 'Spring', 'Smart and relaxed business casual outfits'),
--M
(31036, 'T-Shirt6', 'Autumn', 'Comfortable and breathable gym wear'),
(31037, 'T-Shirt7', 'Autumn', 'Relaxing loungewear for lazy days at home'),
(31038, 'T-Shirt8', 'Summer', 'Functional clothing for outdoor adventures'),
(31039, 'T-Shirt9', 'Spring', 'Stylish outfits for nights out on the town'),
(31040, 'T-Shirt10', 'Winter', 'Sophisticated yet relaxed formal casual attire');
--F

-- Thêm d? li?u vào b?ng Storage OK
INSERT INTO Storage (StorageID, AvailableQuantity)
VALUES
(0111, 10), (0112, 10), (0113, 10), (0114, 10), (0115, 10),
(0116, 10), (0117, 10), (0118, 10), (0119, 10), (0120, 10),
(0121, 10), (0122, 10), (0123, 10), (0124, 10), (0125, 10),
(0126, 10), (0127, 10), (0128, 10), (0129, 10), (0130, 10),
(0131, 10), (0132, 10), (0133, 10), (0134, 10), (0135, 10),
(0136, 10), (0137, 10), (0138, 10), (0139, 10), (0140, 10),
(0141, 10), (0142, 10), (0143, 10), (0144, 10), (0145, 10),
(0146, 10), (0147, 10), (0148, 10), (0149, 10), (0150, 10),
(0151, 10), (0152, 10), (0153, 10), (0154, 10), (0155, 10),
(0156, 10), (0157, 10), (0158, 10), (0159, 10), (0160, 10),
(0161, 10), (0162, 10), (0163, 10), (0164, 10), (0165, 10),
(0166, 10), (0167, 10), (0168, 10), (0169, 10), (0170, 10),
(0171, 10), (0172, 10), (0173, 10), (0174, 10), (0175, 10),
(0176, 10), (0177, 10), (0178, 10), (0179, 10), (0180, 10),
(0181, 10), (0182, 10), (0183, 10), (0184, 10), (0185, 10),
(0186, 10), (0187, 10), (0188, 10), (0189, 10), (0190, 10),
(0191, 10), (0192, 10), (0193, 10), (0194, 10), (0195, 10),
(0196, 10), (0197, 10), (0198, 10), (0199, 10), (0200, 10),
(0201, 10), (0202, 10), (0203, 10), (0204, 10), (0205, 10),
(0206, 10), (0207, 10), (0208, 10), (0209, 10), (0210, 10),
(0211, 10), (0212, 10), (0213, 10), (0214, 10), (0215, 10),
(0216, 10), (0217, 10), (0218, 10), (0219, 10), (0220, 10),
(0221, 10), (0222, 10), (0223, 10), (0224, 10), (0225, 10),
(0226, 10), (0227, 10), (0228, 10), (0229, 10), (0230, 10),
(0231, 10), (0232, 10), (0233, 10), (0234, 10), (0235, 10),
(0236, 10), (0237, 10), (0238, 10), (0239, 10), (0240, 10),
(0241, 10), (0242, 10), (0243, 10), (0244, 10), (0245, 10),
(0246, 10), (0247, 10), (0248, 10), (0249, 10), (0250, 10),
(0251, 10), (0252, 10), (0253, 10), (0254, 10), (0255, 10),
(0256, 10), (0257, 10), (0258, 10), (0259, 10), (0260, 10),
(0261, 10), (0262, 10), (0263, 10), (0264, 10), (0265, 10),
(0266, 10), (0267, 10), (0268, 10), (0269, 10), (0270, 10),
(0271, 10), (0272, 10), (0273, 10), (0274, 10), (0275, 10),
(0276, 10), (0277, 10), (0278, 10), (0279, 10), (0280, 10),
(0281, 10), (0282, 10), (0283, 10), (0284, 10), (0285, 10),
(0286, 10), (0287, 10), (0288, 10), (0289, 10), (0290, 10),
(0291, 10), (0292, 10), (0293, 10), (0294, 10), (0295, 10),
(0296, 10), (0297, 10), (0298, 10), (0299, 10), (0300, 10),
(0301, 10), (0302, 10), (0303, 10), (0304, 10), (0305, 10),
(0306, 10), (0307, 10), (0308, 10), (0309, 10), (0310, 10);

-- Thêm d? li?u vào b?ng Payment OK
INSERT INTO Payment (PaymentID, PaymentName)
VALUES 
(111, 'Credit Card'),
(272, 'Payment on delivery');

-- Thêm d? li?u vào b?ng Products OK
INSERT INTO Products (ProductsID, ProductsName, Gender, Size, Color, ProductPrice, img, StorageId, CategoryId)
VALUES 
(711700, 'Bomber man bomber jacket with 2 pockets Masiduti', 'Men', 'S', 'Brownish-Green', 5.00, 'images\shirt\Bomber\Bomber1.jpg', 0111, 31001),
(711701, 'Bomber man bomber jacket with 2 pockets Masiduti', 'Men', 'M', 'Brownish-Green', 5.00, 'images\shirt\Bomber\Bomber1.jpg', 0112, 31001),
(711702, 'Bomber man bomber jacket with 2 pockets Masiduti', 'Men', 'L', 'Brownish-Green', 5.00, 'images\shirt\Bomber\Bomber1.jpg', 0113, 31001),
(711703, 'Bomber man bomber jacket with 2 pockets Masiduti', 'Men', 'XL', 'Brownish-Green', 5.00, 'images\shirt\Bomber\Bomber1.jpg', 0114, 31001),
(711704, 'Bomber man bomber jacket with 2 pockets Masiduti', 'Men', 'XXL', 'Brownish-Green', 5.00, 'images\shirt\Bomber\Bomber1.jpg', 0115, 31001),
--1
(711705, 'Plain black bomber jacket without pockets', 'Men', 'S', 'Black', 2.50, 'images\shirt\Bomber\Bomber2.jpg', 0116, 31002),
(711706, 'Plain black bomber jacket without pockets', 'Men', 'M', 'Black', 2.50, 'images\shirt\Bomber\Bomber2.jpg', 0117, 31002),
(711707, 'Plain black bomber jacket without pockets', 'Men', 'L', 'Black', 2.50, 'images\shirt\Bomber\Bomber2.jpg', 0118, 31002),
(711708, 'Plain black bomber jacket without pockets', 'Men', 'XL', 'Black', 2.50, 'images\shirt\Bomber\Bomber2.jpg', 0119, 31002),
(711709, 'Plain black bomber jacket without pockets', 'Men', 'XXL', 'Black', 2.50, 'images\shirt\Bomber\Bomber2.jpg', 0120, 31002),
--2
(711710, 'Bomber jacket A&A', 'Men', 'S', 'Cream-colored', 5.00, 'images\shirt\Bomber\Bomber3.jpg', 0121, 31003),
(711711, 'Bomber jacket A&A', 'Men', 'M', 'Cream-colored', 5.00, 'images\shirt\Bomber\Bomber3.jpg', 0122, 31003),
(711712, 'Bomber jacket A&A', 'Men', 'L', 'Cream-colored', 5.00, 'images\shirt\Bomber\Bomber3.jpg', 0123, 31003),
(711713, 'Bomber jacket A&A', 'Men', 'XL', 'Cream-colored', 5.00, 'images\shirt\Bomber\Bomber3.jpg', 0124, 31003),
(711714, 'Bomber jacket A&A', 'Men', 'XXL', 'Cream-colored', 5.00, 'images\shirt\Bomber\Bomber3.jpg', 0125, 31003),
--3
(711715, 'Bomber jacket ZARA', 'Men', 'S', 'Green-white', 35.00, 'images\shirt\Bomber\Bomber4.jpg', 0126, 31004),
(711716, 'Bomber jacket ZARA', 'Men', 'M', 'Green-white', 35.00, 'images\shirt\Bomber\Bomber4.jpg', 0127, 31004),
(711717, 'Bomber jacket ZARA', 'Men', 'L', 'Green-white', 35.00, 'images\shirt\Bomber\Bomber4.jpg', 0128, 31004),
(711718, 'Bomber jacket ZARA', 'Men', 'XL', 'Green-white', 35.00, 'images\shirt\Bomber\Bomber4.jpg', 0129, 31004),
(711719, 'Bomber jacket ZARA', 'Men', 'XXL', 'Green-white', 35.00, 'images\shirt\Bomber\Bomber4.jpg', 0130, 31004),
--4
(711720, 'Plain bomber jacket Basic', 'Men', 'S', 'Dark-Brown', 50.00, 'images\shirt\Bomber\Bomber5.jpg', 0131, 31005),
(711721, 'Plain bomber jacket Basic', 'Men', 'M', 'Dark-Brown', 50.00, 'images\shirt\Bomber\Bomber5.jpg', 0132, 31005),
(711722, 'Plain bomber jacket Basic', 'Men', 'L', 'Dark-Brown', 50.00, 'images\shirt\Bomber\Bomber5.jpg', 0133, 31005),
(711724, 'Plain bomber jacket Basic', 'Men', 'XXL', 'Dark-Brown', 50.00, 'images\shirt\Bomber\Bomber5.jpg', 0135, 31005),
--5
(711725, 'Black plain bomber jacket with waves', 'Women', 'S', 'Black', 12.99, 'images\shirt\Bomber\Bomber6.jpg', 0136, 31006),
(711726, 'Black plain bomber jacket with waves', 'Women', 'M', 'Black', 12.99, 'images\shirt\Bomber\Bomber6.jpg', 0137, 31006),
(711727, 'Black plain bomber jacket with waves', 'Women', 'L', 'Black', 12.99, 'images\shirt\Bomber\Bomber6.jpg', 0138, 31006),
(711728, 'Black plain bomber jacket with waves', 'Women', 'XL', 'Black', 12.99, 'images\shirt\Bomber\Bomber6.jpg', 0139, 31006),
(711729, 'Black plain bomber jacket with waves', 'Women', 'XXL', 'Black', 12.99, 'images\shirt\Bomber\Bomber6.jpg', 0140, 31006),
--6
(711730, 'Short bomber jacket for women', 'Women', 'S', 'Beige', 2.00, 'images\shirt\Bomber\Bomber7.jpg', 0141, 31007),
(711731, 'Short bomber jacket for women', 'Women', 'M', 'Beige', 2.00, 'images\shirt\Bomber\Bomber7.jpg', 0142, 31007),
(711732, 'Short bomber jacket for women', 'Women', 'L', 'Beige', 2.00, 'images\shirt\Bomber\Bomber7.jpg', 0143, 31007),
(711733, 'Short bomber jacket for women', 'Women', 'XL', 'Beige', 2.00, 'images\shirt\Bomber\Bomber7.jpg', 0144, 31007),
(711734, 'Short bomber jacket for women', 'Women', 'XXL', 'Beige', 2.00, 'images\shirt\Bomber\Bomber7.jpg', 0145, 31007),
--7
(711735, 'White denim bomber jacket with large pockets', 'Women', 'S', 'Black-Blue', 3.00, 'images\shirt\Bomber\Bomber8.jpg', 0146, 31008),
(711736, 'White denim bomber jacket with large pockets', 'Women', 'M', 'Black-Blue', 3.00, 'images\shirt\Bomber\Bomber8.jpg', 0147, 31008),
(711737, 'White denim bomber jacket with large pockets', 'Women', 'L', 'Black-Blue', 3.00, 'images\shirt\Bomber\Bomber8.jpg', 0148, 31008),
(711738, 'White denim bomber jacket with large pockets', 'Women', 'XL', 'Black-Blue', 3.00, 'images\shirt\Bomber\Bomber8.jpg', 0149, 31008),
(711739, 'White denim bomber jacket with large pockets', 'Women', 'XXL', 'Black-Blue', 3.00, 'images\shirt\Bomber\Bomber8.jpg', 0150, 31008),
--8
(711740, 'Plain leather bomber jacket', 'Women', 'S', 'Black', 10.00, 'images\shirt\Bomber\Bomber9.jpg', 0151, 31009),
(711741, 'Plain leather bomber jacket', 'Women', 'M', 'Black', 10.00, 'images\shirt\Bomber\Bomber9.jpg', 0152, 31009),
(711742, 'Plain leather bomber jacket', 'Women', 'L', 'Black', 10.00, 'images\shirt\Bomber\Bomber9.jpg', 0153, 31009),
(711743, 'Plain leather bomber jacket', 'Women', 'XL', 'Black', 10.00, 'images\shirt\Bomber\Bomber9.jpg', 0154, 31009),
(711744, 'Plain leather bomber jacket', 'Women', 'XXL', 'Black', 10.00, 'images\shirt\Bomber\Bomber9.jpg', 0155, 31009),
--9
(711745, 'Plain grey bomber jacket with snap buttons', 'Women', 'S', 'Gray', 10.00, 'images\shirt\Bomber\Bomber10.jpg', 0156, 31010),
(711746, 'Plain grey bomber jacket with snap buttons', 'Women', 'M', 'Gray', 10.00, 'images\shirt\Bomber\Bomber10.jpg', 0157, 31010),
(711747, 'Plain grey bomber jacket with snap buttons', 'Women', 'L', 'Gray', 10.00, 'images\shirt\Bomber\Bomber10.jpg', 0158, 31010),
(711748, 'Plain grey bomber jacket with snap buttons', 'Women', 'XL', 'Gray', 10.00, 'images\shirt\Bomber\Bomber10.jpg', 0159, 31010),
(711749, 'Plain grey bomber jacket with snap buttons', 'Women', 'XXL', 'Gray', 10.00, 'images\shirt\Bomber\Bomber10.jpg', 0160, 31010),
--10
(711750, 'Brown hoodie with a smiley face', 'Man', 'S', 'Brown', 5.99, 'images\shirt\Hoodie\Hoodie1.jpg', 0161, 31011),
(711751, 'Brown hoodie with a smiley face', 'Man', 'M', 'Brown', 5.99, 'images\shirt\Hoodie\Hoodie1.jpg', 0162, 31011),
(711752, 'Brown hoodie with a smiley face', 'Man', 'L', 'Brown', 5.99, 'images\shirt\Hoodie\Hoodie1.jpg', 0163, 31011),
(711753, 'Brown hoodie with a smiley face', 'Man', 'XL', 'Brown', 5.99, 'images\shirt\Hoodie\Hoodie1.jpg', 0164, 31011),
(711754, 'Brown hoodie with a smiley face', 'Man', 'XXL', 'Brown', 5.99, 'images\shirt\Hoodie\Hoodie1.jpg', 0165, 31011),
--11
(711755, 'Hoodie with cowboy logo', 'Men' , 'S', 'Black', 9.00, 'images\shirt\Hoodie\Hoodie2.jpg', 0166, 31012),
(711756, 'Hoodie with cowboy logo', 'Men' , 'M', 'Black', 9.00, 'images\shirt\Hoodie\Hoodie2.jpg', 0167, 31012),
(711757, 'Hoodie with cowboy logo', 'Men' , 'L', 'Black', 9.00, 'images\shirt\Hoodie\Hoodie2.jpg', 0168, 31012),
(711758, 'Hoodie with cowboy logo', 'Men' , 'XL', 'Black', 9.00, 'images\shirt\Hoodie\Hoodie2.jpg', 0169, 31012),
(711759, 'Hoodie with cowboy logo', 'Men' , 'XXL', 'Black', 9.00, 'images\shirt\Hoodie\Hoodie2.jpg', 0170, 31012),
--12
(711760, 'Hoodie with adorable anime illustration', 'Men' , 'S', 'Cream-colored', 5.00, 'images\shirt\Hoodie\Hoodie3.jpg', 0171, 31013),
(711761, 'Hoodie with adorable anime illustration', 'Men' , 'M', 'Cream-colored', 5.00, 'images\shirt\Hoodie\Hoodie3.jpg', 0172, 31013),
(711762, 'Hoodie with adorable anime illustration', 'Men' , 'L', 'Cream-colored', 5.00, 'images\shirt\Hoodie\Hoodie3.jpg', 0173, 31013),
(711763, 'Hoodie with adorable anime illustration', 'Men' , 'XL', 'Cream-colored', 5.00, 'images\shirt\Hoodie\Hoodie3.jpg', 0174, 31013),
(711764, 'Hoodie with adorable anime illustration', 'Men' , 'XXL', 'Cream-colored', 5.00, 'images\shirt\Hoodie\Hoodie3.jpg', 0175, 31013),
--13
(711765, 'A hoodie from Pull & Bear with a loose, comfortable fit', 'Men' , 'S', 'White', 2.00, 'images\shirt\Hoodie\Hoodie4.jpg', 0176, 31014),
(711766, 'A hoodie from Pull & Bear with a loose, comfortable fit', 'Men' , 'M', 'White', 2.00, 'images\shirt\Hoodie\Hoodie4.jpg', 0177, 31014),
(711767, 'A hoodie from Pull & Bear with a loose, comfortable fit', 'Men' , 'L', 'White', 2.00, 'images\shirt\Hoodie\Hoodie4.jpg', 0178, 31014),
(711768, 'A hoodie from Pull & Bear with a loose, comfortable fit', 'Men' , 'XL', 'White', 2.00, 'images\shirt\Hoodie\Hoodie4.jpg', 0179, 31014),
(711769, 'A hoodie from Pull & Bear with a loose, comfortable fit', 'Men' , 'XXL', 'White', 2.00, 'images\shirt\Hoodie\Hoodie4.jpg', 0180, 31014),
--14
(711770, 'A loose-fitting "COMMON STRENGTH" form hoodie', 'Men' , 'S', 'Dark-Blue', 4.79, 'images\shirt\Hoodie\Hoodie5.jpg', 0181, 31015),
(711771, 'A loose-fitting "COMMON STRENGTH" form hoodie', 'Men' , 'M', 'Dark-Blue', 4.79, 'images\shirt\Hoodie\Hoodie5.jpg', 0182, 31015),
(711772, 'A loose-fitting "COMMON STRENGTH" form hoodie', 'Men' , 'L', 'Dark-Blue', 4.79, 'images\shirt\Hoodie\Hoodie5.jpg', 0183, 31015),
(711773, 'A loose-fitting "COMMON STRENGTH" form hoodie', 'Men' , 'XL', 'Dark-Blue', 4.79, 'images\shirt\Hoodie\Hoodie5.jpg', 0184, 31015),
(711774, 'A loose-fitting "COMMON STRENGTH" form hoodie', 'Men' , 'XXL', 'Dark-Blue', 4.79, 'images\shirt\Hoodie\Hoodie5.jpg', 0185, 31015),
--15
(711775, 'A solid gray womens hoodie with two pockets', 'Women' , 'S', 'Grey', 5.99, 'images\shirt\Hoodie\Hoodie6.jpg', 0186, 31016),
(711776, 'A solid gray womens hoodie with two pockets', 'Women' , 'M', 'Grey', 5.99, 'images\shirt\Hoodie\Hoodie6.jpg', 0187, 31016),
(711777, 'A solid gray womens hoodie with two pockets', 'Women' , 'L', 'Grey', 5.99, 'images\shirt\Hoodie\Hoodie6.jpg', 0188, 31016),
(711778, 'A solid gray womens hoodie with two pockets', 'Women' , 'XL', 'Grey', 5.99, 'images\shirt\Hoodie\Hoodie6.jpg', 0189, 31016),
(711779, 'A solid gray womens hoodie with two pockets', 'Women' , 'XXl', 'Grey', 5.99, 'images\shirt\Hoodie\Hoodie6.jpg', 0190, 31016),
--16
(711780, 'A wide-fit, cute womens hoodie with the slogan Future or Reality', 'Women' , 'S', 'Pink', 6.00, 'images\shirt\Hoodie\Hoodie7.jpg', 0191, 31017),
(711781, 'A wide-fit, cute womens hoodie with the slogan Future or Reality', 'Women' , 'M', 'Pink', 6.00, 'images\shirt\Hoodie\Hoodie7.jpg', 0192, 31017),
(711782, 'A wide-fit, cute womens hoodie with the slogan Future or Reality', 'Women' , 'L', 'Pink', 6.00, 'images\shirt\Hoodie\Hoodie7.jpg', 0193, 31017),
(711783, 'A wide-fit, cute womens hoodie with the slogan Future or Reality', 'Women' , 'XL', 'Pink', 6.00, 'images\shirt\Hoodie\Hoodie7.jpg', 0194, 31017),
(711784, 'A wide-fit, cute womens hoodie with the slogan Future or Reality', 'Women' , 'XXL', 'Pink', 6.00, 'images\shirt\Hoodie\Hoodie7.jpg', 0195, 31017),
--17
(711785, 'A plain gray womens hoodie with drawstrings', 'Women' , 'S', 'Grey', 30.00, 'images\shirt\Hoodie\Hoodie8.jpg', 0196, 31018),
(711786, 'A plain gray womens hoodie with drawstrings', 'Women' , 'M', 'Grey', 30.00, 'images\shirt\Hoodie\Hoodie8.jpg', 0197, 31018),
(711787, 'A plain gray womens hoodie with drawstrings', 'Women' , 'L', 'Grey', 30.00, 'images\shirt\Hoodie\Hoodie8.jpg', 0198, 31018),
(711788, 'A plain gray womens hoodie with drawstrings', 'Women' , 'XL', 'Grey', 30.00, 'images\shirt\Hoodie\Hoodie8.jpg', 0199, 31018),
(711789, 'A plain gray womens hoodie with drawstrings', 'Women' , 'XXL', 'Grey', 30.00, 'images\shirt\Hoodie\Hoodie8.jpg', 0200, 31018),
--18
(711790, 'A super cute womens hoodie', 'Women' , 'S', 'Ocean', 19.00, 'images\shirt\Hoodie\Hoodie9.jpg', 0201, 31019),
(711791, 'A super cute womens hoodie', 'Women' , 'M', 'Ocean', 19.00, 'images\shirt\Hoodie\Hoodie9.jpg', 0202, 31019),
(711792, 'A super cute womens hoodie', 'Women' , 'L', 'Ocean', 19.00, 'images\shirt\Hoodie\Hoodie9.jpg', 0203, 31019),
(711793, 'A super cute womens hoodie', 'Women' , 'XL', 'Ocean', 19.00, 'images\shirt\Hoodie\Hoodie9.jpg', 0204, 31019),
(711794, 'A super cute womens hoodie', 'Women' , 'XXL', 'Ocean', 19.00, 'images\shirt\Hoodie\Hoodie9.jpg', 0205, 31019),
--19
(711795, 'A hoodie with unique and artistic graphic prints', 'Women' , 'S', 'White', 15.00, 'images\shirt\Hoodie\Hoodie10.jpg', 0206, 31020),
(711796, 'A hoodie with unique and artistic graphic prints', 'Women' , 'M', 'White', 15.00, 'images\shirt\Hoodie\Hoodie10.jpg', 0207, 31020),
(711797, 'A hoodie with unique and artistic graphic prints', 'Women' , 'L', 'White', 15.00, 'images\shirt\Hoodie\Hoodie10.jpg', 0208, 31020),
(711798, 'A hoodie with unique and artistic graphic prints', 'Women' , 'XL', 'White', 15.00, 'images\shirt\Hoodie\Hoodie10.jpg', 0209, 31020),
(711799, 'A hoodie with unique and artistic graphic prints', 'Women' , 'XXL', 'White', 15.00, 'images\shirt\Hoodie\Hoodie10.jpg', 0210, 31020),
--20
(711800, 'A plain, chunky-style sweater', 'Men' , 'S', 'Dark-Blue', 2.00, 'images\shirt\Sweaters\Sweatear1.jpg', 0211, 31021),
(711801, 'A plain, chunky-style sweater', 'Men' , 'M', 'Dark-Blue', 2.00, 'images\shirt\Sweaters\Sweatear1.jpg', 0212, 31021),
(711802, 'A plain, chunky-style sweater', 'Men' , 'L', 'Dark-Blue', 2.00, 'images\shirt\Sweaters\Sweatear1.jpg', 0213, 31021),
(711803, 'A plain, chunky-style sweater', 'Men' , 'XL', 'Dark-Blue', 2.00, 'images\shirt\Sweaters\Sweatear1.jpg', 0214, 31021),
(711804, 'A plain, chunky-style sweater', 'Men' , 'XXL', 'Dark-Blue', 2.00, 'images\shirt\Sweaters\Sweatear1.jpg', 0215, 31021),
--21
(711805, 'Seal Pocks sweater', 'Men' , 'S', 'Brass Bucket', 1.90, 'images\shirt\Sweaters\Sweatear2.jpg', 0216, 31022),
(711806, 'Seal Pocks sweater', 'Men' , 'M', 'Brass Bucket', 1.90, 'images\shirt\Sweaters\Sweatear2.jpg', 0217, 31022),
(711807, 'Seal Pocks sweater', 'Men' , 'L', 'Brass Bucket', 1.90, 'images\shirt\Sweaters\Sweatear2.jpg', 0218, 31022),
(711808, 'Seal Pocks sweater', 'Men' , 'XL', 'Brass Bucket', 1.90, 'images\shirt\Sweaters\Sweatear2.jpg', 0219, 31022),
(711809, 'Seal Pocks sweater', 'Men' , 'XXL', 'Brass Bucket', 1.90, 'images\shirt\Sweaters\Sweatear2.jpg', 0220, 31022),
--22
(711810, '"New Arigona" sweater', 'Men' , 'S', 'Beige', 10.00, 'images\shirt\Sweaters\Sweatear3.jpg', 0221, 31023),
(711811, '"New Arigona" sweater', 'Men' , 'M', 'Beige', 10.00, 'images\shirt\Sweaters\Sweatear3.jpg', 0222, 31023),
(711812, '"New Arigona" sweater', 'Men' , 'L', 'Beige', 10.00, 'images\shirt\Sweaters\Sweatear3.jpg', 0223, 31023),
(711813, '"New Arigona" sweater', 'Men' , 'XL', 'Beige', 10.00, 'images\shirt\Sweaters\Sweatear3.jpg', 0224, 31023),
(711814, '"New Arigona" sweater', 'Men' , 'XXL', 'Beige', 10.00, 'images\shirt\Sweaters\Sweatear3.jpg', 0225, 31023),
--23
(711815, 'A loose-fitting, comfortable sweater', 'Men' , 'S', 'Grey', 2.00, 'images\shirt\Sweaters\Sweatear4.jpg', 0226, 31024),
(711816, 'A loose-fitting, comfortable sweater', 'Men' , 'M', 'Grey', 2.00, 'images\shirt\Sweaters\Sweatear4.jpg', 0227, 31024),
(711817, 'A loose-fitting, comfortable sweater', 'Men' , 'L', 'Grey', 2.00, 'images\shirt\Sweaters\Sweatear4.jpg', 0228, 31024),
(711818, 'A loose-fitting, comfortable sweater', 'Men' , 'XL', 'Grey', 2.00, 'images\shirt\Sweaters\Sweatear4.jpg', 0229, 31024),
(711819, 'A loose-fitting, comfortable sweater', 'Men' , 'XXL', 'Grey', 2.00, 'images\shirt\Sweaters\Sweatear4.jpg', 0230, 31024),
--24
(711820, '"Studio Lab" white sweatear', 'Men' , 'S', 'White', 2.00, 'images\shirt\Sweaters\Sweatear5.jpg', 0231, 31025),
(711821, '"Studio Lab" white sweatear', 'Men' , 'M', 'White', 2.00, 'images\shirt\Sweaters\Sweatear5.jpg', 0232, 31025),
(711822, '"Studio Lab" white sweatear', 'Men' , 'L', 'White', 2.00, 'images\shirt\Sweaters\Sweatear5.jpg', 0233, 31025),
(711823, '"Studio Lab" white sweatear', 'Men' , 'XL', 'White', 2.00, 'images\shirt\Sweaters\Sweatear5.jpg', 0234, 31025),
(711824, '"Studio Lab" white sweatear', 'Men' , 'XXL', 'White', 2.00, 'images\shirt\Sweaters\Sweatear5.jpg', 0235, 31025),
--25
(711825, 'A sweater for women by the name of "Unique Way"', 'Women' , 'S', 'Blue', 25.00, 'images\shirt\Sweaters\Sweatear6.jpg', 0236, 31026),
(711826, 'A sweater for women by the name of "Unique Way"', 'Women' , 'M', 'Blue', 25.00, 'images\shirt\Sweaters\Sweatear6.jpg', 0237, 31026),
(711827, 'A sweater for women by the name of "Unique Way"', 'Women' , 'L', 'Blue', 25.00, 'images\shirt\Sweaters\Sweatear6.jpg', 0238, 31026),
(711828, 'A sweater for women by the name of "Unique Way"', 'Women' , 'XL', 'Blue', 25.00, 'images\shirt\Sweaters\Sweatear6.jpg', 0239, 31026),
(711829, 'A sweater for women by the name of "Unique Way"', 'Women' , 'XXL', 'Blue', 25.00, 'images\shirt\Sweaters\Sweatear6.jpg', 0240, 31026),
--26
(711830, 'A womens sweater made of breathable wool', 'Women' , 'S', 'Grey', 35.00, 'images\shirt\Sweaters\Sweatear7.jpg', 0241, 31027),
(711831, 'A womens sweater made of breathable wool', 'Women' , 'M', 'Grey', 35.00, 'images\shirt\Sweaters\Sweatear7.jpg', 0242, 31027),
(711832, 'A womens sweater made of breathable wool', 'Women' , 'L', 'Grey', 35.00, 'images\shirt\Sweaters\Sweatear7.jpg', 0243, 31027),
(711833, 'A womens sweater made of breathable wool', 'Women' , 'XL', 'Grey', 35.00, 'images\shirt\Sweaters\Sweatear7.jpg', 0244, 31027),
(711834, 'A womens sweater made of breathable wool', 'Women' , 'XXL', 'Grey', 35.00, 'images\shirt\Sweaters\Sweatear7.jpg', 0245, 31027),
--27
(711835, 'A plain white womens sweater with a zipper neckline', 'Women' , 'S', 'White', 12.00, 'images\shirt\Sweaters\Sweatear8.jpg', 0246, 31028),
(711836, 'A plain white womens sweater with a zipper neckline', 'Women' , 'M', 'White', 12.00, 'images\shirt\Sweaters\Sweatear8.jpg', 0247, 31028),
(711837, 'A plain white womens sweater with a zipper neckline', 'Women' , 'L', 'White', 12.00, 'images\shirt\Sweaters\Sweatear8.jpg', 0248, 31028),
(711838, 'A plain white womens sweater with a zipper neckline', 'Women' , 'XL', 'White', 12.00, 'images\shirt\Sweaters\Sweatear8.jpg', 0249, 31028),
(711839, 'A plain white womens sweater with a zipper neckline', 'Women' , 'XXL', 'White', 12.00, 'images\shirt\Sweaters\Sweatear8.jpg', 0250, 31028),
--28
(711840, 'A sweater with holes', 'Women' , 'S', 'Cream-colored', 10.99, 'images\shirt\Sweaters\Sweatear9.jpg', 0251, 31029),
(711841, 'A sweater with holes', 'Women' , 'M', 'Cream-colored', 10.99, 'images\shirt\Sweaters\Sweatear9.jpg', 0252, 31029),
(711842, 'A sweater with holes', 'Women' , 'L', 'Cream-colored', 10.99, 'images\shirt\Sweaters\Sweatear9.jpg', 0253, 31029),
(711843, 'A sweater with holes', 'Women' , 'XL', 'Cream-colored', 10.99, 'images\shirt\Sweaters\Sweatear9.jpg', 0254, 31029),
(711844, 'A sweater with holes', 'Women' , 'XXL', 'Cream-colored', 10.99, 'images\shirt\Sweaters\Sweatear9.jpg', 0255, 31029),
--29
(711845, 'A sweater with horizontal stripes', 'Women' , 'S', 'Beige', 9.00, 'images\shirt\Sweaters\Sweatear10.jpg', 0256, 31030),
(711846, 'A sweater with horizontal stripes', 'Women' , 'M', 'Beige', 9.00, 'images\shirt\Sweaters\Sweatear10.jpg', 0257, 31030),
(711847, 'A sweater with horizontal stripes', 'Women' , 'L', 'Beige', 9.00, 'images\shirt\Sweaters\Sweatear10.jpg', 0258, 31030),
(711848, 'A sweater with horizontal stripes', 'Women' , 'XL', 'Beige', 9.00, 'images\shirt\Sweaters\Sweatear10.jpg', 0259, 31030),
(711849, 'A sweater with horizontal stripes', 'Women' , 'XXL', 'Beige', 9.00, 'images\shirt\Sweaters\Sweatear10.jpg', 0260, 31030),
--30
(711850, 'T-Shirt-Bershika', 'Men' , 'S', 'Black', 50.00, 'images\shirt\T-Shirt\T-Shirt1.jpg', 0261, 31031),
(711851, 'T-Shirt-Bershika', 'Men' , 'M', 'Black', 50.00, 'images\shirt\T-Shirt\T-Shirt1.jpg', 0262, 31031),
(711852, 'T-Shirt-Bershika', 'Men' , 'L', 'Black', 50.00, 'images\shirt\T-Shirt\T-Shirt1.jpg', 0263, 31031),
(711853, 'T-Shirt-Bershika', 'Men' , 'XL', 'Black', 50.00, 'images\shirt\T-Shirt\T-Shirt1.jpg', 0264, 31031),
(711854, 'T-Shirt-Bershika', 'Men' , 'XXL', 'Black', 50.00, 'images\shirt\T-Shirt\T-Shirt1.jpg', 0265, 31031),
--31
(711855, 'T-Shirt-Bershika1', 'Men' , 'S', 'White', 25.00, 'images\shirt\T-Shirt\T-Shirt2.jpg', 0266, 31032),
(711856, 'T-Shirt-Bershika1', 'Men' , 'M', 'White', 25.00, 'images\shirt\T-Shirt\T-Shirt2.jpg', 0267, 31032),
(711857, 'T-Shirt-Bershika1', 'Men' , 'L', 'White', 25.00, 'images\shirt\T-Shirt\T-Shirt2.jpg', 0268, 31032),
(711858, 'T-Shirt-Bershika1', 'Men' , 'XL', 'White', 25.00, 'images\shirt\T-Shirt\T-Shirt2.jpg', 0269, 31032),
(711859, 'T-Shirt-Bershika1', 'Men' , 'XXL', 'White', 25.00, 'images\shirt\T-Shirt\T-Shirt2.jpg', 0270, 31032),
--32
(711860, 'T-Shirt-Bershika2', 'Men' , 'S', 'Grey', 50.00, 'images\shirt\T-Shirt\T-Shirt3.jpg', 0271, 31033),
(711861, 'T-Shirt-Bershika2', 'Men' , 'M', 'Grey', 50.00, 'images\shirt\T-Shirt\T-Shirt3.jpg', 0272, 31033),
(711862, 'T-Shirt-Bershika2', 'Men' , 'L', 'Grey', 50.00, 'images\shirt\T-Shirt\T-Shirt3.jpg', 0273, 31033),
(711863, 'T-Shirt-Bershika2', 'Men' , 'XL', 'Grey', 50.00, 'images\shirt\T-Shirt\T-Shirt3.jpg', 0274, 31033),
(711864, 'T-Shirt-Bershika2', 'Men' , 'XXL', 'Grey', 50.00, 'images\shirt\T-Shirt\T-Shirt3.jpg', 0275, 31033),
--33
(711866, 'T-Shirt-Bershika3', 'Men' , 'S', 'Brown', 25.00, 'images\shirt\T-Shirt\T-Shirt4.jpg', 0276, 31034),
(711867, 'T-Shirt-Bershika3', 'Men' , 'M', 'Brown', 25.00, 'images\shirt\T-Shirt\T-Shirt4.jpg', 0277, 31034),
(711868, 'T-Shirt-Bershika3', 'Men' , 'L', 'Brown', 25.00, 'images\shirt\T-Shirt\T-Shirt4.jpg', 0278, 31034),
(711869, 'T-Shirt-Bershika3', 'Men' , 'XL', 'Brown', 25.00, 'images\shirt\T-Shirt\T-Shirt4.jpg', 0279, 31034),
(711870, 'T-Shirt-Bershika3', 'Men' , 'XXL', 'Brown', 25.00, 'images\shirt\T-Shirt\T-Shirt4.jpg', 0280, 31034),
--34
(711871, 'T-Shirt-Bershika4', 'Men' , 'S', 'Dark-Green', 50.00, 'images\shirt\T-Shirt\T-Shirt5.jpg', 0281, 31035),
(711872, 'T-Shirt-Bershika4', 'Men' , 'M', 'Dark-Green', 50.00, 'images\shirt\T-Shirt\T-Shirt5.jpg', 0282, 31035),
(711873, 'T-Shirt-Bershika4', 'Men' , 'L', 'Dark-Green', 50.00, 'images\shirt\T-Shirt\T-Shirt5.jpg', 0283, 31035),
(711874, 'T-Shirt-Bershika4', 'Men' , 'XL', 'Dark-Green', 50.00, 'images\shirt\T-Shirt\T-Shirt5.jpg', 0284, 31035),
(711875, 'T-Shirt-Bershika4', 'Men' , 'XXL', 'Dark-Green', 50.00, 'images\shirt\T-Shirt\T-Shirt5.jpg', 0285, 31035),
--35
(711876, 'T-shirt-Bershika5', 'Women' , 'S', 'Black', 25.00, 'images\shirt\T-Shirt\T-Shirt6.jpg', 0286, 31036),
(711877, 'T-shirt-Bershika5', 'Women' , 'M', 'Black', 25.00, 'images\shirt\T-Shirt\T-Shirt6.jpg', 0287, 31036),
(711878, 'T-shirt-Bershika5', 'Women' , 'L', 'Black', 25.00, 'images\shirt\T-Shirt\T-Shirt6.jpg', 0288, 31036),
(711879, 'T-shirt-Bershika5', 'Women' , 'XL', 'Black', 25.00, 'images\shirt\T-Shirt\T-Shirt6.jpg', 0289, 31036),
(711880, 'T-shirt-Bershika5', 'Women' , 'XXL', 'Black', 25.00, 'images\shirt\T-Shirt\T-Shirt6.jpg', 0290, 31036),
--36
(711881, 'T-shirt-Bershika6', 'Women' , 'S', 'White', 50.00, 'images\shirt\T-Shirt\T-Shirt7.jpg', 0291, 31037),
(711882, 'T-shirt-Bershika6', 'Women' , 'M', 'White', 50.00, 'images\shirt\T-Shirt\T-Shirt7.jpg', 0292, 31037),
(711883, 'T-shirt-Bershika6', 'Women' , 'L', 'White', 50.00, 'images\shirt\T-Shirt\T-Shirt7.jpg', 0293, 31037),
(711884, 'T-shirt-Bershika6', 'Women' , 'XL', 'White', 50.00, 'images\shirt\T-Shirt\T-Shirt7.jpg', 0294, 31037),
(711885, 'T-shirt-Bershika6', 'Women' , 'XXL', 'White', 50.00, 'images\shirt\T-Shirt\T-Shirt7.jpg', 0295, 31037),
--37
(711886, 'T-shirt-Bershika7', 'Women' , 'S', 'White', 25.00, 'images\shirt\T-Shirt\T-Shirt8.jpg', 0296, 31038),
(711887, 'T-shirt-Bershika7', 'Women' , 'M', 'White', 25.00, 'images\shirt\T-Shirt\T-Shirt8.jpg', 0297, 31038),
(711888, 'T-shirt-Bershika7', 'Women' , 'L', 'White', 25.00, 'images\shirt\T-Shirt\T-Shirt8.jpg', 0298, 31038),
(711889, 'T-shirt-Bershika7', 'Women' , 'XL', 'White', 25.00, 'images\shirt\T-Shirt\T-Shirt8.jpg', 0299, 31038),
(711890, 'T-shirt-Bershika7', 'Women' , 'XXL', 'White', 25.00, 'images\shirt\T-Shirt\T-Shirt8.jpg', 0300, 31038),
--38
(711891, 'T-shirt-Bershika8', 'Women' , 'S', 'Black', 50.00, 'images\shirt\T-Shirt\T-Shirt9.jpg', 0301, 31039),
(711892, 'T-shirt-Bershika8', 'Women' , 'M', 'Black', 50.00, 'images\shirt\T-Shirt\T-Shirt9.jpg', 0302, 31039),
(711893, 'T-shirt-Bershika8', 'Women' , 'L', 'Black', 50.00, 'images\shirt\T-Shirt\T-Shirt9.jpg', 0303, 31039),
(711894, 'T-shirt-Bershika8', 'Women' , 'XL', 'Black', 50.00, 'images\shirt\T-Shirt\T-Shirt9.jpg', 0304, 31039),
(711895, 'T-shirt-Bershika8', 'Women' , 'XXL', 'Black', 50.00, 'images\shirt\T-Shirt\T-Shirt9.jpg', 0305, 31039),
--39
(711896, 'T-shirt-Bershika9', 'Women' , 'S', 'Black', 25.00, 'images\shirt\T-Shirt\T-Shirt10.jpg', 0306, 31040),
(711897, 'T-shirt-Bershika9', 'Women' , 'M', 'Black', 25.00, 'images\shirt\T-Shirt\T-Shirt10.jpg', 0307, 31040),
(711898, 'T-shirt-Bershika9', 'Women' , 'L', 'Black', 25.00, 'images\shirt\T-Shirt\T-Shirt10.jpg', 0308, 31040),
(711899, 'T-shirt-Bershika9', 'Women' , 'XL', 'Black', 25.00, 'images\shirt\T-Shirt\T-Shirt10.jpg', 0309, 31040),
(711900, 'T-shirt-Bershika9', 'Women' , 'XXL', 'Black', 25.00, 'images\shirt\T-Shirt\T-Shirt10.jpg', 0310, 31040);
--40 Product
(711901, 'shortPull&Bear1',	  'Men' ,   'S', 'Blue', 20.00, 'images\paint\Short\short1', 0311, 31041);
(711902, 'shortPull&Bear1',	  'Men' ,   'M', 'Blue', 20.00, 'images\paint\Short\short1', 0312, 31041);
(711903, 'shortPull&Bear1',	  'Men' ,   'L', 'Blue', 20.00, 'images\paint\Short\short1', 0313, 31041);
(711904, 'shortPull&Bear1',	  'Men' ,   'XL', 'Blue', 20.00, 'images\paint\Short\short1', 0314, 31041);
(711905, 'shortPull&Bear1',	  'Men' ,   'XXL', 'Blue', 20.00, 'images\paint\Short\short1', 0315, 31041);
--41
(711906, 'shortPull&Bear2',	  'Men' ,   'S',  'Gray', 20.00, 'images\paint\Short\short2', 0316, 31042);
(711907, 'shortPull&Bear2',	  'Men' ,   'M',  'Gray', 20.00, 'images\paint\Short\short2', 0317, 31042);
(711908, 'shortPull&Bear2',	  'Men' ,   'L',  'Gray', 20.00, 'images\paint\Short\short2', 0318, 31042);
(711909, 'shortPull&Bear2',	  'Men' ,   'XL', 'Gray', 20.00, 'images\paint\Short\short2', 0319, 31042);
(711910, 'shortPull&Bear2',	  'Men' ,   'XXL','Gray', 20.00, 'images\paint\Short\short2', 0320, 31042);
--42--
(711911, 'shortPull&Bear3',	  'Men' ,   'S',  'Red', 22.00, 'images\paint\Short\short3', 0321, 31043);
(711912, 'shortPull&Bear3',	  'Men' ,   'M',  'Red', 22.00, 'images\paint\Short\short3', 0322, 31043);
(711913, 'shortPull&Bear3',	  'Men' ,   'L',  'Red', 22.00, 'images\paint\Short\short3', 0323, 31043);
(711914, 'shortPull&Bear3',	  'Men' ,   'XL', 'Red', 22.00, 'images\paint\Short\short3', 0324, 31043);
(711915, 'shortPull&Bear3',	  'Men' ,   'XXL','Red', 22.00, 'images\paint\Short\short3', 0325, 31043);
--43--
(711916, 'shortPull&Bear4',	  'Men' ,   'S',  'Green', 22.00, 'images\paint\Short\short4', 0326, 31044);
(711917, 'shortPull&Bear4',	  'Men' ,   'M',  'Green', 22.00, 'images\paint\Short\short4', 0327, 31044);
(711918, 'shortPull&Bear4',	  'Men' ,   'L',  'Green', 22.00, 'images\paint\Short\short4', 0328, 31044);
(711919, 'shortPull&Bear4',	  'Men' ,   'XL', 'Green', 22.00, 'images\paint\Short\short4', 0329, 31044);
(711920, 'shortPull&Bear4',	  'Men' ,   'XXL','Green', 22.00, 'images\paint\Short\short4', 0330, 31044);
--44-
(711921, 'shortPull&Bear5',	  'Men' ,   'S',  'Yellow', 22.00, 'images\paint\Short\short5', 0331, 31045);
(711922, 'shortPull&Bear5',	  'Men' ,   'M',  'Yellow', 22.00, 'images\paint\Short\short5', 0332, 31045);
(711923, 'shortPull&Bear5',	  'Men' ,   'L',  'Yellow', 22.00, 'images\paint\Short\short5', 0333, 31045);
(711924, 'shortPull&Bear5',	  'Men' ,   'XL', 'Yellow', 22.00, 'images\paint\Short\short5', 0334, 31045);
(711925, 'shortPull&Bear5',	  'Men' ,   'XXL','Yellow', 22.00, 'images\paint\Short\short5', 0345, 31045);
--45--
(711926, 'shortPull&Bear6',	  'Men' ,   'S',  'Black', 21.00, 'images\paint\Short\short6', 0346, 31046);
(711927, 'shortPull&Bear6',	  'Men' ,   'M',  'Black', 21.00, 'images\paint\Short\short6', 0347, 31046);
(711928, 'shortPull&Bear6',	  'Men' ,   'L',  'Black', 21.00, 'images\paint\Short\short6', 0348, 31046);
(711929, 'shortPull&Bear6',	  'Men' ,   'XL', 'Black', 21.00, 'images\paint\Short\short6', 0349, 31046);
(711930, 'shortPull&Bear6',	  'Men' ,   'XXL','Black', 21.00, 'images\paint\Short\short6', 0350, 31046);
--46-
(711931, 'shortPull&Bear7',	  'Women' ,   'S',  'Purple', 20.00, 'images\paint\Short\short7', 0351, 31047);
(711932, 'shortPull&Bear7',	  'Women' ,   'M',  'Purple', 20.00, 'images\paint\Short\short7', 0352, 31047);
(711933, 'shortPull&Bear7',	  'Women' ,   'L',  'Purple', 20.00, 'images\paint\Short\short7', 0353, 31047);
(711934, 'shortPull&Bear7',	  'Women' ,   'XL', 'Purple', 20.00, 'images\paint\Short\short7', 0354, 31047);
(711935, 'shortPull&Bear7',	  'Women' ,   'XXL','Purple', 20.00, 'images\paint\Short\short7', 0355, 31047);
--47
(711936, 'shortPull&Bear8',	  'Women' ,   'S',  'Purple', 20.00, 'images\paint\Short\short8', 0356, 31048);
(711937, 'shortPull&Bear8',	  'Women' ,   'M',  'Purple', 20.00, 'images\paint\Short\short8', 0357, 31048);
(711938, 'shortPull&Bear8',	  'Women' ,   'L',  'Purple', 20.00, 'images\paint\Short\short8', 0358, 31048);
(711939, 'shortPull&Bear8',	  'Women' ,   'XL', 'Purple', 20.00, 'images\paint\Short\short8', 0359, 31048);
(711940, 'shortPull&Bear8',	  'Women' ,   'XXL','Purple', 20.00, 'images\paint\Short\short8', 0360, 31048);
--48--
(711941, 'shortPull&Bear9',	  'Women' ,   'S',  'Green', 20.00, 'images\paint\Short\short9', 0361, 31049);
(711942, 'shortPull&Bear9',	  'Women' ,   'M',  'Green', 20.00, 'images\paint\Short\short9', 0362, 31049);
(711943, 'shortPull&Bear9',	  'Women' ,   'L',  'Green', 20.00, 'images\paint\Short\short9', 0363, 31049);
(711944, 'shortPull&Bear9',	  'Women' ,   'XL', 'Green', 20.00, 'images\paint\Short\short9', 0363, 31049);
(711945, 'shortPull&Bear9',	  'Women' ,   'XXL','Green', 20.00, 'images\paint\Short\short9', 0365, 31049);
--49--
(711946, 'shortPull&Bear10',  'Women' ,   'S',  'Red', 20.00, 'images\paint\Short\short10', 0366, 31050);
(711947, 'shortPull&Bear10',  'Women' ,   'M',  'Red', 20.00, 'images\paint\Short\short10', 0367, 31050);
(711948, 'shortPull&Bear10',  'Women' ,   'L',  'Red', 20.00, 'images\paint\Short\short10', 0368, 31050);
(711949, 'shortPull&Bear10',  'Women' ,   'XL', 'Red', 20.00, 'images\paint\Short\short10', 0369, 31050);
(711950, 'shortPull&Bear10',  'Women' ,   'XXL','Red', 20.00, 'images\paint\Short\short10', 0370, 31050);
--50--
(711951, 'shortPull&Bear11',  'Women' ,   'S',  'Red', 20.00, 'images\paint\Short\short11', 0371, 31051);
(711952, 'shortPull&Bear11',  'Women' ,   'M',  'Red', 20.00, 'images\paint\Short\short11', 0372, 31051);
(711953, 'shortPull&Bear11',  'Women' ,   'L',  'Red', 20.00, 'images\paint\Short\short11', 0373, 31051);
(711954, 'shortPull&Bear11',  'Women' ,   'XL', 'Red', 20.00, 'images\paint\Short\short11', 0374, 31051);
(711955, 'shortPull&Bear11',  'Women' ,   'XXL','Red', 20.00, 'images\paint\Short\short11', 0375, 31051);
--51--
(711956, 'shortPull&Bear12',  'Women' ,   'S',  'Red', 20.00, 'images\paint\Short\short12', 0376, 31052);
(711957, 'shortPull&Bear12',  'Women' ,   'M',  'Red', 20.00, 'images\paint\Short\short12', 0377, 31052);
(711958, 'shortPull&Bear12',  'Women' ,   'L',  'Red', 20.00, 'images\paint\Short\short12', 0378, 31052);
(711959, 'shortPull&Bear12',  'Women' ,   'XL', 'Red', 20.00, 'images\paint\Short\short12', 0379, 31052);
(711960, 'shortPull&Bear12',  'Women' ,   'XXL','Red', 20.00, 'images\paint\Short\short12', 0380, 31052);
--52--
(711961, 'shortPull&Bear13',  'Women' ,   'S',  'Red', 20.00, 'images\paint\Short\short13', 0381, 31053);
(711962, 'shortPull&Bear13',  'Women' ,   'M',  'Red', 20.00, 'images\paint\Short\short13', 0382, 31053);
(711963, 'shortPull&Bear13',  'Women' ,   'L',  'Red', 20.00, 'images\paint\Short\short13', 0383, 31053);
(711964, 'shortPull&Bear13',  'Women' ,   'XL', 'Red', 20.00, 'images\paint\Short\short13', 0384, 31053);
(711965, 'shortPull&Bear13',  'Women' ,   'XXL','Red', 20.00, 'images\paint\Short\short13', 0385, 31053);
--53--
(711966, 'baggyPull&Bear1',  'Women' ,   'S',  'Blue', 20.00, 'images\paint\baggy\baggy1', 0386, 31054);
(711967, 'baggyPull&Bear1',  'Women' ,   'M',  'Blue', 20.00, 'images\paint\baggy\baggy1', 0387, 31054);
(711968, 'baggyPull&Bear1',  'Women' ,   'L',  'Blue', 20.00, 'images\paint\baggy\baggy1', 0388, 31054);
(711969, 'baggyPull&Bear1',  'Women' ,   'XL', 'Blue', 20.00, 'images\paint\baggy\baggy1', 0389, 31054);
(711970, 'baggyPull&Bear1',  'Women' ,   'XXL','Blue', 20.00, 'images\paint\baggy\baggy1', 0390, 31054);
--54--
(711971, 'baggyPull&Bear2',  'Women' ,   'S',  'Black', 20.00, 'images\paint\baggy\baggy2', 0391, 31055);
(711972, 'baggyPull&Bear2',  'Women' ,   'M',  'Black', 20.00, 'images\paint\baggy\baggy2', 0392, 31055);
(711973, 'baggyPull&Bear2',  'Women' ,   'L',  'Black', 20.00, 'images\paint\baggy\baggy2', 0393, 31055);
(711974, 'baggyPull&Bear2',  'Women' ,   'XL', 'Black', 20.00, 'images\paint\baggy\baggy2', 0394, 31055);
(711975, 'baggyPull&Bear2',  'Women' ,   'XXL','Black', 20.00, 'images\paint\baggy\baggy2', 0395, 31055);
--55
(711976, 'baggyPull&Bear3',  'Women' ,   'S',  'dark blue', 20.00, 'images\paint\baggy\baggy3', 0396, 31056);
(711977, 'baggyPull&Bear3',  'Women' ,   'M',  'dark blue', 20.00, 'images\paint\baggy\baggy3', 0397, 31056);
(711978, 'baggyPull&Bear3',  'Women' ,   'L',  'dark blue', 20.00, 'images\paint\baggy\baggy3', 0398, 31056);
(711979, 'baggyPull&Bear3',  'Women' ,   'XL', 'dark blue', 20.00, 'images\paint\baggy\baggy3', 0399, 31056);
(711980, 'baggyPull&Bear3',  'Women' ,   'XXL','dark blue', 20.00, 'images\paint\baggy\baggy3', 0400, 31056);
--56
(711981, 'baggyPull&Bear4',  'Men' ,   'S',  'Green', 20.00, 'images\paint\baggy\baggy4', 0401, 31057);
(711982, 'baggyPull&Bear4',  'Men' ,   'M',  'Green', 20.00, 'images\paint\baggy\baggy4', 0402, 31057);
(711983, 'baggyPull&Bear4',  'Men' ,   'L',  'Green', 20.00, 'images\paint\baggy\baggy4', 0403, 31057);
(711984, 'baggyPull&Bear4',  'Men' ,   'XL', 'Green', 20.00, 'images\paint\baggy\baggy4', 0404, 31057);
(711985, 'baggyPull&Bear4',  'Men' ,   'XXL','Green', 20.00, 'images\paint\baggy\baggy4', 0405, 31057);
--57--
(711986, 'baggyPull&Bear5',  'Men' ,   'S',  'Gray', 20.00, 'images\paint\baggy\baggy5', 0406, 31058);
(711987, 'baggyPull&Bear5',  'Men' ,   'M',  'Gray', 20.00, 'images\paint\baggy\baggy5', 0407, 31058);
(711988, 'baggyPull&Bear5',  'Men' ,   'L',  'Gray', 20.00, 'images\paint\baggy\baggy5', 0408, 31058);
(711989, 'baggyPull&Bear5',  'Men' ,   'XL', 'Gray', 20.00, 'images\paint\baggy\baggy5', 0409, 31058);
(711990, 'baggyPull&Bear5',  'Men' ,   'XXL','Gray', 20.00, 'images\paint\baggy\baggy5', 0410, 31058);
--58
(711991, 'baggyPull&Bear6',  'Men' ,   'S',  'White', 20.00, 'images\paint\baggy\baggy6', 0411, 31059);
(711992, 'baggyPull&Bear6',  'Men' ,   'M',  'White', 20.00, 'images\paint\baggy\baggy6', 0412, 31059);
(711993, 'baggyPull&Bear6',  'Men' ,   'L',  'White', 20.00, 'images\paint\baggy\baggy6', 0413, 31059);
(711994, 'baggyPull&Bear6',  'Men' ,   'XL', 'White', 20.00, 'images\paint\baggy\baggy6', 0414, 31059);
(711995, 'baggyPull&Bear6',  'Men' ,   'XXL','White', 20.00, 'images\paint\baggy\baggy6', 0415, 31059);
--59
(711996, 'baggyPull&Bear7',  'Men' ,   'S',  'brown', 20.00, 'images\paint\baggy\baggy7', 0416, 31060);
(711997, 'baggyPull&Bear7',  'Men' ,   'M',  'brown', 20.00, 'images\paint\baggy\baggy7', 0417, 31060);
(711998, 'baggyPull&Bear7',  'Men' ,   'L',  'brown', 20.00, 'images\paint\baggy\baggy7', 0418, 31060);
(711999, 'baggyPull&Bear7',  'Men' ,   'XL', 'brown', 20.00, 'images\paint\baggy\baggy7', 0419, 31060);
(712000, 'baggyPull&Bear7',  'Men' ,   'XXL','brown', 20.00, 'images\paint\baggy\baggy7', 0420, 31060);
--60
(712001, 'baggyPull&Bear8',  'Men' ,   'S',  'Black', 20.00, 'images\paint\baggy\baggy8', 0421, 31061);
(712002, 'baggyPull&Bear8',  'Men' ,   'M',  'Black', 20.00, 'images\paint\baggy\baggy8', 0422, 31061);
(712003, 'baggyPull&Bear8',  'Men' ,   'L',  'Black', 20.00, 'images\paint\baggy\baggy8', 0423, 31061);
(712004, 'baggyPull&Bear8',  'Men' ,   'XL', 'Black', 20.00, 'images\paint\baggy\baggy8', 0424, 31061);
(712005, 'baggyPull&Bear8',  'Men' ,   'XXL','Black', 20.00, 'images\paint\baggy\baggy8', 0425, 31061);
--61
(712006, 'baggyPull&Bear9',  'Men' ,   'S',  'Gray', 20.00, 'images\paint\baggy\baggy9', 0426, 31062));
(712007, 'baggyPull&Bear9',  'Men' ,   'M',  'Gray', 20.00, 'images\paint\baggy\baggy9', 0427, 31062));
(712008, 'baggyPull&Bear9',  'Men' ,   'L',  'Gray', 20.00, 'images\paint\baggy\baggy9', 0428, 31062));
(712009, 'baggyPull&Bear9',  'Men' ,   'XL', 'Gray', 20.00, 'images\paint\baggy\baggy9', 0429, 31062));
(712010, 'baggyPull&Bear9',  'Men' ,   'XXL','Gray', 20.00, 'images\paint\baggy\baggy9', 0430, 31062));
--62
(712011, 'baggyPull&Bear10', 'Women' ,   'S',  'White', 20.00, 'images\paint\baggy\baggy10', 0431, 31063);
(712012, 'baggyPull&Bear10', 'Women' ,   'M',  'White', 20.00, 'images\paint\baggy\baggy10', 0432, 31063);
(712013, 'baggyPull&Bear10', 'Women' ,   'L',  'White', 20.00, 'images\paint\baggy\baggy10', 0433, 31063);
(712014, 'baggyPull&Bear10', 'Women' ,   'XL', 'White', 20.00, 'images\paint\baggy\baggy10', 0434, 31063);
(712015, 'baggyPull&Bear10', 'Women' ,   'XXL','White', 20.00, 'images\paint\baggy\baggy10', 0435, 31063);
--63
(712016, 'baggyPull&Bear11', 'Women' ,   'S',  'Black', 20.00, 'images\paint\baggy\baggy11', 0436, 31064);
(712017, 'baggyPull&Bear11', 'Women' ,   'M',  'Black', 20.00, 'images\paint\baggy\baggy11', 0437, 31064);
(712018, 'baggyPull&Bear11', 'Women' ,   'L',  'Black', 20.00, 'images\paint\baggy\baggy11', 0438, 31064);
(712019, 'baggyPull&Bear11', 'Women' ,   'XL', 'Black', 20.00, 'images\paint\baggy\baggy11', 0439, 31064);
(712020, 'baggyPull&Bear11', 'Women' ,   'XXL','Black', 20.00, 'images\paint\baggy\baggy11', 0440, 31064);
--64
(712021, 'baggyPull&Bear12', 'Men' ,   'S',  'Gray', 20.00, 'images\paint\baggy\baggy12', 0441, 31065);
(712022, 'baggyPull&Bear12', 'Men' ,   'M',  'Gray', 20.00, 'images\paint\baggy\baggy12', 0442, 31065);
(712023, 'baggyPull&Bear12', 'Men' ,   'L',  'Gray', 20.00, 'images\paint\baggy\baggy12', 0443, 31065);
(712024, 'baggyPull&Bear12', 'Men' ,   'XL', 'Gray', 20.00, 'images\paint\baggy\baggy12', 0444, 31065);
(712025, 'baggyPull&Bear12', 'Men' ,   'XXL','Gray', 20.00, 'images\paint\baggy\baggy12', 0445, 31065);
--65
(712021, 'JeanPull&Bear1', 'Men' ,   'S',  'brown', 20.00, 'images\paint\jean\Jean1', 0441, 31066);
(712022, 'JeanPull&Bear1', 'Men' ,   'M',  'brown', 20.00, 'images\paint\jean\Jean1', 0442, 31066);
(712023, 'JeanPull&Bear1', 'Men' ,   'L',  'brown', 20.00, 'images\paint\jean\Jean1', 0443, 31066);
(712024, 'JeanPull&Bear1', 'Men' ,   'XL', 'brown', 20.00, 'images\paint\jean\Jean1', 0444, 31066);
(712025, 'JeanPull&Bear1', 'Men' ,   'XXL','brown', 20.00, 'images\paint\jean\Jean1', 0445, 31066);
--66
(712026, 'JeanPull&Bear2', 'Women' ,   'S',  'Blue', 20.00, 'images\paint\jean\Jean2', 0446, 31067);
(712027, 'JeanPull&Bear2', 'Women' ,   'M',  'Blue', 20.00, 'images\paint\jean\Jean2', 0447, 31067);
(712028, 'JeanPull&Bear2', 'Women' ,   'L',  'Blue', 20.00, 'images\paint\jean\Jean2', 0448, 31067);
(712029, 'JeanPull&Bear2', 'Women' ,   'XL', 'Blue', 20.00, 'images\paint\jean\Jean2', 0449, 31067);
(712030, 'JeanPull&Bear2', 'Women' ,   'XXL','Blue', 20.00, 'images\paint\jean\Jean2', 0450, 31067);
--67
(712031, 'JeanPull&Bear3', 'Women' ,   'S',  'White', 20.00, 'images\paint\jean\Jean3', 0451, 31068);
(712032, 'JeanPull&Bear3', 'Women' ,   'M',  'White', 20.00, 'images\paint\jean\Jean3', 0452, 31068);
(712033, 'JeanPull&Bear3', 'Women' ,   'L',  'White', 20.00, 'images\paint\jean\Jean3', 0453, 31068);
(712034, 'JeanPull&Bear3', 'Women' ,   'XL', 'White', 20.00, 'images\paint\jean\Jean3', 0454, 31068);
(712035, 'JeanPull&Bear3', 'Women' ,   'XXL','White', 20.00, 'images\paint\jean\Jean3', 0455, 31068);
--68
(712036, 'JeanPull&Bear4', 'Women' ,   'S',  'Blue', 20.00, 'images\paint\jean\Jean4', 0456, 31069);
(712037, 'JeanPull&Bear4', 'Women' ,   'M',  'Blue', 20.00, 'images\paint\jean\Jean4', 0457, 31069);
(712038, 'JeanPull&Bear4', 'Women' ,   'L',  'Blue', 20.00, 'images\paint\jean\Jean4', 0458, 31069);
(712039, 'JeanPull&Bear4', 'Women' ,   'XL', 'Blue', 20.00, 'images\paint\jean\Jean4', 0459, 31069);
(712040, 'JeanPull&Bear4', 'Women' ,   'XXL','Blue', 20.00, 'images\paint\jean\Jean4', 0460, 31069);
--69
(712041, 'JeanPull&Bear5', 'Women' ,   'S',  'Gray', 20.00, 'images\paint\jean\Jean5', 0461, 31070);
(712042, 'JeanPull&Bear5', 'Women' ,   'M',  'Gray', 20.00, 'images\paint\jean\Jean5', 0462, 31070);
(712043, 'JeanPull&Bear5', 'Women' ,   'L',  'Gray', 20.00, 'images\paint\jean\Jean5', 0463, 31070);
(712044, 'JeanPull&Bear5', 'Women' ,   'XL', 'Gray', 20.00, 'images\paint\jean\Jean5', 0464, 31070);
(712045, 'JeanPull&Bear5', 'Women' ,   'XXL','Gray', 20.00, 'images\paint\jean\Jean5', 0465, 31070);
--70
(712046, 'JeanPull&Bear6', 'Men' ,   'S',  'Black', 20.00, 'images\paint\jean\Jean6', 0466, 31071);
(712047, 'JeanPull&Bear6', 'Men' ,   'M',  'Black', 20.00, 'images\paint\jean\Jean6', 0467, 31071);
(712048, 'JeanPull&Bear6', 'Men' ,   'L',  'Black', 20.00, 'images\paint\jean\Jean6', 0468, 31071);
(712049, 'JeanPull&Bear6', 'Men' ,   'XL', 'Black', 20.00, 'images\paint\jean\Jean6', 0469, 31071);
(712050, 'JeanPull&Bear6', 'Men' ,   'XXL','Black', 20.00, 'images\paint\jean\Jean6', 0470, 31071);
--71
(712051, 'JeanPull&Bear7', 'Men' ,   'S',  'Black', 20.00, 'images\paint\jean\Jean7', 0471, 31072);
(712052, 'JeanPull&Bear7', 'Men' ,   'M',  'Black', 20.00, 'images\paint\jean\Jean7', 0472, 31072);
(712053, 'JeanPull&Bear7', 'Men' ,   'L',  'Black', 20.00, 'images\paint\jean\Jean7', 0473, 31072);
(712054, 'JeanPull&Bear7', 'Men' ,   'XL', 'Black', 20.00, 'images\paint\jean\Jean7', 0474, 31072);
(712055, 'JeanPull&Bear7', 'Men' ,   'XXL','Black', 20.00, 'images\paint\jean\Jean7', 0475, 31072);
--72
(712056, 'JeanPull&Bear8', 'Men' ,   'S',  'Black', 20.00, 'images\paint\jean\Jean8', 0476, 31073);
(712057, 'JeanPull&Bear8', 'Men' ,   'M',  'Black', 20.00, 'images\paint\jean\Jean8', 0477, 31073);
(712058, 'JeanPull&Bear8', 'Men' ,   'L',  'Black', 20.00, 'images\paint\jean\Jean8', 0478, 31073);
(712059, 'JeanPull&Bear8', 'Men' ,   'XL', 'Black', 20.00, 'images\paint\jean\Jean8', 0479, 31073);
(712060, 'JeanPull&Bear8', 'Men' ,   'XXL','Black', 20.00, 'images\paint\jean\Jean8', 0480, 31073);
--73
(712061, 'JeanPull&Bear9', 'Men' ,   'S',  'Gray', 20.00, 'images\paint\jean\Jean9', 0481, 31074);
(712062, 'JeanPull&Bear9', 'Men' ,   'M',  'Gray', 20.00, 'images\paint\jean\Jean9', 0482, 31074);
(712063, 'JeanPull&Bear9', 'Men' ,   'L',  'Gray', 20.00, 'images\paint\jean\Jean9', 0483, 31074);
(712064, 'JeanPull&Bear9', 'Men' ,   'XL', 'Gray', 20.00, 'images\paint\jean\Jean9', 0484, 31074);
(712065, 'JeanPull&Bear9', 'Men' ,   'XXL','Gray', 20.00, 'images\paint\jean\Jean9', 0485, 31074);
--75
(712066, 'JeanPull&Bear10', 'Men' ,   'S',  'Gray', 20.00, 'images\paint\jean\Jean10', 0486, 31075);
(712067, 'JeanPull&Bear10', 'Men' ,   'M',  'Gray', 20.00, 'images\paint\jean\Jean10', 0487, 31075);
(712068, 'JeanPull&Bear10', 'Men' ,   'L',  'Gray', 20.00, 'images\paint\jean\Jean10', 0488, 31075);
(712069, 'JeanPull&Bear10', 'Men' ,   'XL', 'Gray', 20.00, 'images\paint\jean\Jean10', 0489, 31075);
(712070, 'JeanPull&Bear10', 'Men' ,   'XXL','Gray', 20.00, 'images\paint\jean\Jean10', 0490, 31075);







-- Thêm d? li?u vào b?ng Orders OK
INSERT INTO Orders (OrdersID, OrdersDate, Price, Quantity, Address, Status, Freight, CustomerId)
VALUES 
(4000301, '2024-03-14', 20.00, 2, '75, 265 Street, 9 District, HCM', 'Pending', 'Shopee Express', 001),
(4000302, '2024-03-15', 35.00, 1, '273, Man Thien Street, 9 District, HCM', 'Completed', 'J&T Express', 008),
(4000303, '2024-03-14', 11.98, 2, '31, Tran Quy Cap Street, Binh Thanh District, HCM', 'Pending', 'Shopee Express', 003),
(4000307, '2024-03-15', 35.00, 1, '75, 265 Street, 9 District, HCM', 'Failed', 'J&T Express', 004),
(4000309, '2024-03-15', 5.99, 1, '72, Pham Hung Streer, 8 District, HCM', 'Completed', 'J&T Express', 005),
(4000310, '2024-03-10', 75.00, 3, '273, Man Thien Street, 9 District, HCM', 'Pending', 'Shopee Express', 008),
(4000311, '2024-03-11', 9.58, 2, '10, Ong Ren ward, Can Duoc District, Long An City', 'Pending', 'Shopee Express', 006),
(4000313, '2024-03-14', 8.00, 4, '12, Nguyen Thoi Street, Nguyen An Ninh ward, Vung Tau City', 'Pending', 'Shopee Express', 007),
(4000322, '2024-03-15', 10.00, 1, '10, Ong Ren ward, Can Duoc District, Long An City', 'Failed', 'J&T Express', 006),
(4000328, '2024-03-15', 1.90, 1, '75, 265 Street, 9 District, HCM', 'Completed', 'J&T Express', 004);

-- Thêm d? li?u vào b?ng OrderDetail OK
INSERT INTO OrderDetail (Amount, TotalQuantity, OrdersId, PaysId, ProId)
VALUES 
(20.00, 2, 4000301, 111, 711748),
(35.00, 1, 4000302, 272, 711831),
(11.98, 2, 4000303, 111, 711777),
(35.00, 1, 4000307, 272, 711715),
(5.99, 1, 4000309, 111, 711750),
(75.00, 3, 4000310, 272, 711826),
(9.58, 2, 4000311, 272, 711771),
(8.00, 4, 4000313, 111, 711733),
(10.00, 1, 4000322, 111, 711741),
(1.90, 1, 4000328, 272, 711808);

-- Thêm d? li?u vào b?ng Check_Order OK
INSERT INTO Check_Order (ManagerId, OrdersId)
VALUES 
(01, 4000301),
(02, 4000303),
(01, 4000311),
(02, 4000310),
(03, 4000313);

-- test Query
SELECT *
FROM Products p INNER JOIN Category c ON p.CategoryId = c.CategoryID
				INNER JOIN Storage s ON p.StorageId = s.StorageID
WHERE c.CategoryID = 31001

