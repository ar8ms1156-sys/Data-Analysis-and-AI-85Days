-- 1. إنشاء جدول المنتجات
CREATE TABLE kingdom_dates_products (
    product_id INT PRIMARY KEY,
    product_name NVARCHAR(100),
    price DECIMAL(10, 2)
);

-- 2. إدخال بيانات 20 منتج من منتجات تمور المملكة
INSERT INTO kingdom_dates_products (product_id, product_name, price) VALUES
(1, N'تمر عجوة المدينة فاخر (1)كجم', 85.00),
(2, N'تمر صقعي ملكي (1)كجم', 50.00),
(3, N'تمر مجدول ممتاز (1)كجم', 95.00),
(4, N'تمر خلاص القصيم (1)كجم', 35.00),
(5, N'تمر سكري مفتخر (1)كجم', 65.00),
(6, N'تمر رشودية (1)كجم', 28.00),
(7, N'تمر صفري بيشة (1)كجم', 40.00),
(8, N'تمر عنبرة المدينة (1)كجم', 110.00),
(9, N'تمر ونانة (1)كجم', 30.00),
(10, N'تمر نبتة علي (1)كجم', 42.00),
(11, N'تمر برحي طازج (1)كجم', 25.00),
(12, N'تمر خضري (1)كجم', 38.00),
(13, N'تمر مجدول محشي لوز (1)كجم', 125.00),
(14, N'تمر عجوة محشي فستق (1)كجم', 140.00),
(15, N'تمر خلاص الملكي (1)كجم', 55.00),
(16, N'تمر سكري رطب (1)كجم', 48.00),
(17, N'تمر شلبي (1)كجم', 60.00),
(18, N'تمر حلوة الجوف (1)كجم', 32.00),
(19, N'دبس تمر خلاص (1)كجم', 20.00),
(20, N'معجون تمر فاخر (1)كجم', 18.00);

drop table kingdom_dates_products 
-- عرض كل البيانات الموجودة في الجدول
select * from kingdom_dates_products 

-- حساب متوسط أسعار جميع المنتجات في الجدول
select cast ( AVG (Price) as decimal(10,2)) as Average_Price from kingdom_dates_products 

-- استخراج المنتجات التي يتجاوز سعرها متوسط الأسعار
select  product_name , concat (  price , '  SAR ' ) Price_in_SAR from kingdom_dates_products 
where Price > ( select cast ( AVG (Price) as decimal(10,2)) as Average_Price from kingdom_dates_products ) 
order by Price asc
