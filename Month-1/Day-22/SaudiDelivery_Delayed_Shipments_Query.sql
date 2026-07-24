
-- 1. إنشاء جدول الكباتن بنوع NVARCHAR
CREATE TABLE Drivers (
    driver_id INT PRIMARY KEY,
    driver_name NVARCHAR(50),
    phone_number VARCHAR(20)
);

-- 2. إدخال بيانات الكباتن
INSERT INTO Drivers (driver_id, driver_name, phone_number) VALUES
(101, N'فهد العتيبي', '0501111111'),
(102, N'سلمان الشمري', '0502222222'),
(103, N'محمد القحطاني', '0503333333'),
(104, N'عبدالله الدوسري', '0504444444'),
(105, N'خالد المطيري', '0505555555'),
(106, N'عمر الغامدي', '0506666666'),
(107, N'ياسر الزهراني', '0507777777'),
(108, N'سعود الحربي', '0508888888');

-- 3. إنشاء جدول الطلبات بنوع NVARCHAR
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    city NVARCHAR(30),
    order_status NVARCHAR(30),
    driver_id INT
);

-- 4. إدخال بيانات الشحنات بحرف N المظبوط
INSERT INTO Orders (order_id, city, order_status, driver_id) VALUES
(5001, N'الرياض', N'متأخرة', 101),
(5002, N'جدة', N'تم التوصيل', 102),
(5003, N'الرياض', N'تم التوصيل', 103),
(5004, N'الرياض', N'متأخرة', 104),
(5005, N'الدمام', N'متأخرة', 105),
(5006, N'مكة', N'قيد التوصيل', 106),
(5007, N'الرياض', N'متأخرة', 107),
(5008, N'جدة', N'قيد التوصيل', 108),
(5009, N'الرياض', N'تم التوصيل', 101),
(5010, N'الخبر', N'متأخرة', 102),
(5011, N'الرياض', N'متأخرة', 105),
(5012, N'جدة', N'متأخرة', 103),
(5013, N'الرياض', N'قيد التوصيل', 106),
(5014, N'الدمام', N'تم التوصيل', 104),
(5015, N'الرياض', N'متأخرة', 108);

-- 5. استعلام الحل وتوليد التقرير
SELECT 
    o.order_id AS [رقم الشحنة], 
    o.city AS [المدينة], 
    o.order_status AS [حالة الشحنة], 
    d.driver_name AS [اسم السائق], 
    d.phone_number AS [رقم الجوال] 
FROM Orders o
JOIN Drivers d ON o.driver_id = d.driver_id
WHERE o.city = N'الرياض' 
  AND o.order_status = N'متأخرة';