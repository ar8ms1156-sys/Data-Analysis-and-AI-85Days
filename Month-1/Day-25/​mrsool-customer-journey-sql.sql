

-- 1. إنشاء جدول رحلة العميل وتتبع الحركات (Customer Journey)
CREATE TABLE Customer_Journey (
    Journey_ID INT PRIMARY KEY,
    Customer_ID INT,
    Action_Type NVARCHAR(100),   -- نوع الحركة (بحث، إضافة للسلة، إلخ)
    City NVARCHAR(50),           -- المدينة في السعودية
    Journey_Status NVARCHAR(50), -- حالة الرحلة
    Action_Date DATE             -- تاريخ الحركة
);


-- 2 . إدخال بيانات موسعة (15 صفاً لعمل تحليلات قوية
INSERT INTO Customer_Journey (Journey_ID, Customer_ID, Action_Type, City, Journey_Status, Action_Date)
VALUES 
(1, 101, N'بحث عن مطعم', N'الرياض', N'مكتملة', '2026-07-01'),
(2, 102, N'إضافة للسلة', N'جدة', N'معلقة', '2026-07-01'),
(3, 103, N'إتمام الطلب', N'الدمام', N'ناجحة', '2026-07-02'),
(4, 101, N'إلغاء الطلب', N'الرياض', N'ملغاة', '2026-07-03'),
(5, 104, N'بحث عن بقالة', N'مكة المكرمة', N'مكتملة', '2026-07-03'),
(6, 105, N'إضافة للسلة', N'المدينة المنورة', N'معلقة', '2026-07-04'),
(7, 102, N'إتمام الطلب', N'جدة', N'ناجحة', '2026-07-04'),
(8, 106, N'بحث عن صيدلية', N'الخبر', N'مكتملة', '2026-07-05'),
(9, 107, N'إلغاء الطلب', N'الرياض', N'ملغاة', '2026-07-05'),
(10, 103, N'إضافة للسلة', N'الدمام', N'معلقة', '2026-07-06'),
(11, 108, N'إتمام الطلب', N'تبوك', N'ناجحة', '2026-07-06'),
(12, 104, N'بحث عن مطعم', N'مكة المكرمة', N'مكتملة', '2026-07-07'),
(13, 109, N'إتمام الطلب', N'أبها', N'ناجحة', '2026-07-07'),
(14, 105, N'إلغاء الطلب', N'المدينة المنورة', N'ملغاة', '2026-07-08'),
(15, 110, N'إضافة للسلة', N'بريدة', N'معلقة', '2026-07-08');

-- الخطوة التالية: استخدام الـ CTE لتحليل رحلات مرسول الناجحة حسب المدن
with City_Success_Summary as (
select city , count( Journey_ID ) as Successful_Count from Customer_Journey 
where  Journey_Status in ( N'مكتملة' , N'ناجحة' ) 
group by  City 
)
select  City , Successful_Count from  City_Success_Summary 
where Successful_Count > ( SELECT AVG(CAST(Successful_Count AS Decimal (10 ,2 ) ) ) from City_Success_Summary )
order by Successful_Count desc
