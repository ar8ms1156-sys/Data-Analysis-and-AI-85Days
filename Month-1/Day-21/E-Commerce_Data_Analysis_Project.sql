

-- 1. إنشاء جدول العملاء (Customers)
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FullName NVARCHAR(100) NOT NULL,
    City NVARCHAR(50) NOT NULL,
    Phone VARCHAR(20)
);

--2. إنشاء جدول المنتجات (Products)
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100) NOT NULL,
    Category NVARCHAR(50) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    StockQuantity INT NOT NULL
);

--3. إنشاء جدول الطلبات (Orders)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE NOT NULL,
    PaymentMethod VARCHAR(30) NOT NULL,
    OrderStatus VARCHAR(20) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- 4. إنشاء جدول تفاصيل الطلبات (OrderDetails)
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- 1. إدخال بيانات العملاء (Customers)
INSERT INTO Customers VALUES
(1, N'أحمد العتيبي', N'الرياض', '0501234567'),
(2, N'سارة الشمري', N'جدة', '0559876543'),
(3, N'محمد الغامدي', N'الدمام', '0541122334'),
(4, N'نورة القحطاني', N'الرياض', '0569988776'),
(5, N'خالد الدوسري', N'المدينة المنورة', '0534455667'),
(6, N'فاطمة الزهراني', N'مكة المكرمة', '0587766554'),
(7, N'عبدالله الشهري', N'أبها', '0512233445'),
(8, N'ريم المطيري', N'القصيم', '0576655443'),
(9, N'سعود العنزي', N'تبوك', '0523344556'),
(10, N'مها السبيعي', N'الخبر', '0598877665'),
(11, N'عمر الحربي', N'جدة', '0505544332'),
(12, N'لطيفة العسيري', N'الرياض', '0554433221'),
(13, N'فيصل المالكي', N'الدمام', '0533322110'),
(14, N'جواهر البقمي', N'الطائف', '0544455667'),
(15, N'بدر الخالدي', N'الأحساء', '0511122334');

-- 2. إدخال بيانات المنتجات والمخزون (Products)
INSERT INTO Products VALUES
(1, N'آيفون 15 برو ماكس 256 جيجا', N'إلكترونيات', 4800.00, 25),
(2, N'سامسونج جالكسي S24 ألترا', N'إلكترونيات', 4200.00, 18),
(3, N'ساعة أبل سيريوس 9', N'إلكترونيات', 1800.00, 40),
(4, N'عطر عود ملكي فاخر 100 مل', N'عطور وتجميل', 450.00, 60),
(5, N'شماغ مايسترو كلاسيك', N'أزياء ومستلزمات', 220.00, 100),
(6, N'عباية سوداء مطرزة فاخرة', N'أزياء ومستلزمات', 350.00, 50),
(7, N'ماكينة قهوة ديلونجي ديديكا', N'أجهزة منزلية', 850.00, 15),
(8, N'قلاية هوائية فيليبس 1.2 كجم', N'أجهزة منزلية', 550.00, 30),
(9, N'سماعات أبل إيربودز برو 2', N'إلكترونيات', 950.00, 45),
(10, N'بخور مروكي طبيعي ممتاز', N'عطور وتجميل', 300.00, 80),
(11, N'تلفزيون سوني 65 بوصة 4K', N'إلكترونيات', 3400.00, 10),
(12, N'طقم أواني طهي سيراميك', N'أجهزة منزلية', 620.00, 22),
(13, N'حذاء رياضي نايكي كلاسيك', N'أزياء ومستلزمات', 410.00, 35),
(14, N'شاحن متنقل أنكر 20,000 أمبير', N'إلكترونيات', 190.00, 90),
(15, N'مجموعة عناية بالبشرة متكاملة', N'عطور وتجميل', 280.00, 40);

-- 3. إدخال بيانات الطلبات (Orders)
INSERT INTO Orders VALUES
(101, 1, '2026-07-01', 'Mada', 'Completed'),
(102, 2, '2026-07-02', 'Apple Pay', 'Completed'),
(103, 3, '2026-07-03', 'STC Pay', 'Completed'),
(104, 4, '2026-07-04', 'Credit Card', 'Pending'),
(105, 5, '2026-07-05', 'Mada', 'Completed'),
(106, 6, '2026-07-06', 'Apple Pay', 'Cancelled'),
(107, 7, '2026-07-07', 'STC Pay', 'Completed'),
(108, 8, '2026-07-08', 'Mada', 'Completed'),
(109, 9, '2026-07-09', 'Credit Card', 'Completed'),
(110, 10, '2026-07-10', 'Apple Pay', 'Completed'),
(111, 11, '2026-07-11', 'Mada', 'Pending'),
(112, 12, '2026-07-12', 'STC Pay', 'Completed'),
(113, 13, '2026-07-13', 'Mada', 'Cancelled'),
(114, 14, '2026-07-14', 'Apple Pay', 'Completed'),
(115, 15, '2026-07-15', 'STC Pay', 'Completed'),
(116, 1, '2026-07-16', 'STC Pay', 'Completed'),
(117, 3, '2026-07-17', 'Mada', 'Completed'),
(118, 5, '2026-07-18', 'Apple Pay', 'Completed'),
(119, 7, '2026-07-19', 'Credit Card', 'Completed'),
(120, 9, '2026-07-20', 'Mada', 'Completed');

-- 4. إدخال بيانات تفاصيل الطلبات (OrderDetails)
INSERT INTO OrderDetails VALUES
(1, 101, 1, 1, 4800.00),
(2, 101, 9, 1, 950.00),
(3, 102, 2, 1, 4200.00),
(4, 103, 4, 2, 450.00),
(5, 104, 7, 1, 850.00),
(6, 105, 5, 3, 220.00),
(7, 106, 3, 1, 1800.00),
(8, 107, 10, 2, 300.00),
(9, 108, 8, 1, 550.00),
(10, 109, 11, 1, 3400.00),
(11, 110, 6, 1, 350.00),
(12, 111, 14, 2, 190.00),
(13, 112, 1, 1, 4800.00),
(14, 113, 13, 1, 410.00),
(15, 114, 15, 2, 280.00),
(16, 115, 2, 1, 4200.00),
(17, 116, 4, 1, 450.00),
(18, 116, 10, 1, 300.00),
(19, 117, 5, 2, 220.00),
(20, 118, 9, 1, 950.00),
(21, 119, 12, 1, 620.00),
(22, 120, 3, 1, 1800.00);

-- الاستعلام 1: إجمالي المبيعات والإيرادات ومتوسط الطلب للطلبات المكتملة
SELECT 
    COUNT(DISTINCT Orders.OrderID) AS Completed_Orders,
    CONCAT(SUM(OrderDetails.Quantity * OrderDetails.UnitPrice), '  SAR  ') AS Total_Revenue,
    CONCAT(CAST(SUM(OrderDetails.Quantity * OrderDetails.UnitPrice) * 1.0 / COUNT(DISTINCT Orders.OrderID) AS DECIMAL(10,2)), ' SAR') AS Avg_Order_Value
FROM Orders
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
WHERE Orders.OrderStatus = 'Completed';

-- الاستعلام 2: تحليل المبيعات وعدد الطلبات حسب طريقة الدفع
SELECT 
    Orders.PaymentMethod,
    COUNT(DISTINCT Orders.OrderID) AS Total_Orders,
    CONCAT(SUM(OrderDetails.Quantity * OrderDetails.UnitPrice), ' SAR') AS Total_Sales_SAR
FROM Orders
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
WHERE Orders.OrderStatus = 'Completed'
GROUP BY Orders.PaymentMethod
ORDER BY Total_Sales_SAR DESC;

-- الاستعلام 3: أفضل 5 منتجات مبيعاً وتحقيقاً للإيرادات
SELECT TOP 5
    Products.ProductName,
    Products.Category,
    SUM(OrderDetails.Quantity) AS Total_Units_Sold,
    CONCAT(SUM(OrderDetails.Quantity * OrderDetails.UnitPrice), ' SAR') AS Total_Revenue
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
WHERE Orders.OrderStatus = 'Completed'
GROUP BY Products.ProductName, Products.Category
ORDER BY Total_Units_Sold DESC;

-- الاستعلام 4: المنتجات التي تتطلب إعادة طلب (المخزون المنخفض)
SELECT 
    Products.ProductID,
    Products.ProductName,
    Products.Category,
    Products.StockQuantity,
    Products.Price
FROM Products
WHERE Products.StockQuantity <= 30
ORDER BY Products.StockQuantity ASC;

-- الاستعلام 5: تحليل كبار العملاء من حيث إجمالي المشتريات
SELECT TOP 5
    Customers.FullName,
    Customers.City,
    COUNT(DISTINCT Orders.OrderID) AS Total_Orders,
    CONCAT(SUM(OrderDetails.Quantity * OrderDetails.UnitPrice), ' SAR') AS Total_Spent
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
WHERE Orders.OrderStatus = 'Completed'
GROUP BY Customers.FullName, Customers.City
ORDER BY SUM(OrderDetails.Quantity * OrderDetails.UnitPrice) DESC;