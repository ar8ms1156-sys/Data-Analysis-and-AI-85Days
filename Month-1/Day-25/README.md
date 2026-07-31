<div dir="rtl">

# 🚚 Mrsool Platform: Customer Journey & Advanced Regional Analytics (SQL Server)

<p align="center">
  <img src="https://img.shields.io/badge/Database-SQL%20Server%20(SSMS)-cc2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white" />
  <img src="https://img.shields.io/badge/Analysis-CTEs%20%26%20Statistical%20Averages-00758f?style=for-the-badge&logo=databricks&logoColor=white" />
  <img src="https://img.shields.io/badge/Market-Saudi%20Arabia%20(KSA)-006C35?style=for-the-badge&logo=saudi-arabia&logoColor=white" />
  <img src="https://img.shields.io/badge/Status-Completed-success?style=for-the-badge" />
</p>

---

### 📊 مشروع تحليل مسار رحلة العميل واستخراج المدن المتفوقة باستخدام الـ CTEs والتحليل الإحصائي

---

## 📌 1. الملخص التنفيذي (Executive Summary)

تُعد **متابعة مسار رحلة العميل (Customer Journey Tracking)** وتقييم كفاءة التشغيل الميداني في منصات التوصيل الرقمية (مثل منصة **مرسول**) أحد أهم محركات النجاح للعمليات اللوجستية في السوق السعودي. يهدف هذا المشروع إلى معالجة وتحليل بيانات التفاعل اليومي للمستخدمين عبر **9 مدن رئيسية** (الرياض، جدة، الدمام، مكة المكرمة، المدينة المنورة، الخبر، تبوك، أبها، بريدة).

تم بناء استعلام تحليلي ذكي ببيئة **SQL Server** لتتبع حركة العملاء، وحساب إجمالي الرحلات الناجحة والمكتملة، ثم تطبيق تصفية إحصائية متقدمة باستخدام **الدوال المؤقتة (CTEs)** ومقارنة أداء كل مدينة بالمتوسط العام للمملكة، لتزويد فريق العمليات والتشغيل برؤى دقيقة تساهم في توجيه أسطول الكباتن وتوزيع الموارد التشغيلية.

---

## 🛠️ 2. هندسة البيانات وصياغة الاستعلام (SQL Architecture & Pipeline)

تم تصميم جدول `Customer_Journey` يدعم الترميز الدولي `NVARCHAR` لضمان سلامة النصوص العربية والتفاعل الدقيق مع بيانات السوق السعودي، مع إدراج 15 حركية تمثل مختلف حالات الطلب (بحث، إضافة للسلة، إتمام طلب، إلغاء، إلخ).

### ⚡ تنظيف وتجميع البيانات وإنشاء الاستعلام التحليلي المتقدم:
تم استخدام **Common Table Expression (CTE)** لتجميع الرحلات الناجحة أولاً، ثم حساب المتوسط العام بدقة متناهية عبر تحويل نوع البيانات إلى `DECIMAL(10,2)` لمنع تقريب الأرقام الحسابية.

```sql
-- 1. إنشاء جدول رحلة العميل وتتبع الحركات (Customer Journey)
CREATE TABLE Customer_Journey (
    Journey_ID INT PRIMARY KEY,
    Customer_ID INT,
    Action_Type NVARCHAR(100),   -- نوع الحركة (بحث، إضافة للسلة، إلخ)
    City NVARCHAR(50),           -- المدينة في السعودية
    Journey_Status NVARCHAR(50), -- حالة الرحلة
    Action_Date DATE             -- تاريخ الحركة
);

-- 2. إدخال بيانات موسعة (15 صفاً لعمل تحليل قوي)
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
(13, 109, N'إتمام الطلب', N'أبها', N'معلقة', '2026-07-07'),
(14, 105, N'إلغاء الطلب', N'المدينة المنورة', N'ملغاة', '2026-07-08'),
(15, 110, N'إضافة للسلة', N'بريدة', N'معلقة', '2026-07-08');

-- 3. استعلام الـ CTE المتقدم لتحديد المدن المتفوقة أعلى من المتوسط العام
WITH City_Success_Summary AS (
    SELECT 
        City, 
        COUNT(Journey_ID) AS Successful_Count
    FROM Customer_Journey
    WHERE Journey_Status IN (N'مكتملة', N'ناجحة')
    GROUP BY City
)
SELECT 
    City, 
    Successful_Count 
FROM City_Success_Summary
WHERE Successful_Count > (
    SELECT AVG(CAST(Successful_Count AS DECIMAL(10,2))) 
    FROM City_Success_Summary
)
ORDER BY Successful_Count DESC;
```

> 💡 **ملاحظة هندسية:** تم تطبيق `CAST(... AS DECIMAL(10,2))` داخل دالة `AVG` لمنع السيرفر من إجراء قسمة أعداد صحيحة (Integer Division) مما يضمن دقة الحسابات الإحصائية. كما تم وضع `ORDER BY` في الاستعلام الرئيسي الخارجي احتراماً لقواعد T-SQL في التعامل مع الجداول المؤقتة كـ (Unordered Sets).

---

## 📊 3. تحليل النتائج ومؤشرات الأداء (Data Insights & Performance Metrics)

بعد تشغيل الاستعلام التحليلي المتقدم، تم استخراج مؤشرات الأداء الرئيسية وتحديد العواصم التشغيلية الأكثر نجاحاً:

### 🏆 ملخص مؤشرات الأداء التشغيلية (KPIs Overview)

| إجمالي الرحلات المسجلة | عدد المدن المغطاة | المتوسط العام للرحلات الناجحة/مدينة | المدينة الأكثر تفوقاً (Top Hub) |
| :---: | :---: | :---: | :---: |
| **15 رحلة** | **9 مدن سعودية** | **1.14 رحلة** | **مكة المكرمة (2 رحلة)** |

---

### 📋 التقرير التفصيلي للمدن المتفوقة (Above Average Performers)

| المدينة (City) | إجمالي الرحلات الناجحة (Successful Count) | تقييم الأداء مقارنة بالمتوسط | حالة التميز |
| :--- | :---: | :---: | :---: |
| **مكة المكرمة** | **2** | 🚀 يتجاوز المتوسط العام (1.14) | 🥇 Top Regional Hub |

---

### 🖥️ لوحة المتابعة والتحليل (Executive Dashboard)

![Mrsool Analytics Dashboard](./WhatsApp%20Image%202026-08-01%20at%2012.50.45%20AM.jpeg)

---

## 🎯 4. التوصيات الاستراتيجية المبنية على البيانات (Data-Driven Recommendations)

1. **دعم التغطية الميدانية في مكة المكرمة (Regional Fleet Expansion):** أظهرت البيانات أن مكة المكرمة هي المركز الوحيد الذي كسر حاجز المتوسط العام للرحلات الناجحة، مما يتطلب زيادة أسطول الكباتن وتوسيع نطاق التغطية لتلبية الطلب المتزايد.
2. **معالجة تعثر الطلبات المعلقة (Reducing Friction in Pending Trips):** إجمالي الرحلات المعلقة والملغاة يمثل نسبة ملحوظة في مدن مثل الرياض وجدة؛ يُوصى بتحسين تجربة التطبيق للعميل وتقليل وقت استجابة الكباتن لتنسيق الطلبات.
3. **حملات تحفيزية للمدن الواعدة (Targeted Promotions):** إطلاق عروض وتخفيضات على رسوم التوصيل في مدن مثل الدمام والخبر وتبوك لرفع معدل استكمال الرحلات وتخطي النسبة المتوسطة.

---

## 💻 5. التقنيات والأدوات المستخدمة (Tech Stack)

* **Database Engine:** SQL Server (SSMS / T-SQL)
* **SQL Concepts:** Common Table Expressions (CTEs), Aggregations (`COUNT`, `AVG`), Dynamic Casting (`DECIMAL`), Filter Logic (`IN`, `WHERE`), Unicode Localization (`N''`).
* **Data Presentation:** Visual Dashboards, Markdown & HTML Styled RTL Layouts.

---

</div>
