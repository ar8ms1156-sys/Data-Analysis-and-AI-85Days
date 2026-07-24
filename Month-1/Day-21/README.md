<div dir="rtl">

# 🛒 E-Commerce Data Analysis Project (SQL Server)

### 📊 مشروع تحليل بيانات متجر إلكتروني: استخراج وتحليل الأداء التجاري، سلوك العملاء، وطرق الدفع عبر الـ T-SQL

---

## 📌 1. الملخص التنفيذي (Executive Summary)

في متجر التجارة الإلكترونية، يُعد قياس كفاءة الأنشطة التجارية وتكرار المبيعات هو المحرك الأساسي للنمو واستدامة الأرباح.

يهدف هذا المشروع إلى بناء خط استعلام ذكي (**SQL Analytical Pipeline**) لفحص قاعدة بيانات المتجر، وتتبع أداء الأنشطة التجارية المختلفة، وحساب إجمالي الإيرادات، ومتوسط قيمة الطلب (**Avg Order Value - AOV**) بدقة، إضافة إلى تحليل سلوك الدفع والمخزون الحرج لتوجيه القرارات الاستراتيجية.

---

## 🛠️ 2. بنية قاعدة البيانات والعلاقات (Database Schema)

تم إنشاء قاعدة البيانات وتصميم الهيكل على **SQL Server** مع الاعتماد على العلاقات المباشرة (**Foreign Keys**) لضمان سلامة البيانات:

* **جدول العملاء (`Customers`):** CustomerID, FullName, City, Phone
* **جدول المنتجات (`Products`):** ProductID, ProductName, Category, Price, StockQuantity
* **جدول الطلبات (`Orders`):** OrderID, CustomerID, OrderDate, PaymentMethod, OrderStatus
* **جدول تفاصيل الطلبات (`OrderDetails`):** OrderDetailID, OrderID, ProductID, Quantity, UnitPrice

<details>
<summary><b>إظهار كود إنشاء الجداول (DDL Code)</b></summary>

```sql
-- 1. إنشاء جدول العملاء (Customers)
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FullName NVARCHAR(100) NOT NULL,
    City NVARCHAR(50) NOT NULL,
    Phone VARCHAR(20)
);

-- 2. إنشاء جدول المنتجات (Products)
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100) NOT NULL,
    Category NVARCHAR(50) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    StockQuantity INT NOT NULL
);

-- 3. إنشاء جدول الطلبات (Orders)
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
```
</details>

---

## 📈 3. الاستعلامات التحليلية والنتائج المصورة (Analytical Queries & Results)

### 📊 الاستعلام 1: إجمالي المبيعات والإيرادات ومتوسط الطلب للطلبات المكتملة

**الهدف:** حساب المؤشرات الرئيسية للأداء (KPIs) شاملة عدد الطلبات المكتملة، إجمالي الإيرادات، ومتوسط قيمة الطلب (AOV).

```sql
SELECT 
    COUNT(DISTINCT Orders.OrderID) AS Completed_Orders,
    CONCAT(SUM(OrderDetails.Quantity * OrderDetails.UnitPrice), ' SAR ') AS Total_Revenue,
    CONCAT(CAST(SUM(OrderDetails.Quantity * OrderDetails.UnitPrice) * 1.0 / COUNT(DISTINCT Orders.OrderID) AS DECIMAL(10,2)), ' SAR') AS Avg_Order_Value
FROM Orders
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
WHERE Orders.OrderStatus = 'Completed';
```

<p align="center">
  <img src="images/01_kpi_summary.png" alt="إجمالي المبيعات والإيرادات ومتوسط الطلب" width="85%"/>
</p>

> **💡 إضاءة تحليلية:** بلغ إجمالي الطلبات الناجحة 16 طلباً بمتوسط قيمة طلب ينعكس بشكل إيجابي على متوسط السلة الشراء للمتجر.

---

### 💳 الاستعلام 2: تحليل المبيعات وعدد الطلبات حسب طريقة الدفع

**الهدف:** تحديد طرق الدفع الأكثر استخداماً وتحقيقاً للإيرادات لتوجيه اتفاقيات بوابة الدفع وتحسين تجربة المستخدم.

```sql
SELECT 
    Orders.PaymentMethod,
    COUNT(DISTINCT Orders.OrderID) AS Total_Orders,
    CONCAT(SUM(OrderDetails.Quantity * OrderDetails.UnitPrice), ' SAR') AS Total_Sales_SAR
FROM Orders
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
WHERE Orders.OrderStatus = 'Completed'
GROUP BY Orders.PaymentMethod
ORDER BY Total_Sales_SAR DESC;
```

<p align="center">
  <img src="images/02_payment_methods.png" alt="تحليل المبيعات حسب طريقة الدفع" width="85%"/>
</p>

> **💡 إضاءة تحليلية:** تُظهر البيانات تفضيل العميل للحلول المحلية والذكية مثل **STC Pay** و **مدى (Mada)** كأعلى حصة مبيعات.

---

### 🏆 الاستعلام 3: أفضل 5 منتجات مبيعاً وتحقيقاً للإيرادات

**الهدف:** تحديد المنتجات القيادية (Best-Sellers) لدعم الحملات التسويقية وإدارة المخزون بشكل فعّال.

```sql
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
```

<p align="center">
  <img src="images/03_top_products.png" alt="أفضل 5 منتجات مبيعاً" width="85%"/>
</p>

> **💡 إضاءة تحليلية:** تتصدر فئة الإلكترونيات المبيعات من حيث قيمة الإيراد، بينما تسجل العطور والأزياء حجماً ممتازاً في عدد الوحدات المباعة.

---

### ⚠️ الاستعلام 4: المنتجات التي تتطلب إعادة طلب (تحذير المخزون المنخفض <= 30)

**الهدف:** التنبؤ بنقص المخزون وتحديد المنتجات الحرجة لمنع انقطاع السلع المباعة.

```sql
SELECT 
    Products.ProductID,
    Products.ProductName,
    Products.Category,
    Products.StockQuantity,
    Products.Price
FROM Products
WHERE Products.StockQuantity <= 30
ORDER BY Products.StockQuantity ASC;
```

<p align="center">
  <img src="images/04_low_stock_alerts.png" alt="المنتجات التي تتطلب إعادة طلب" width="85%"/>
</p>

> **💡 إضاءة تحليلية:** أظهر الاستعلام تنبيهاً لعدة منتجات وصلت للحد الحرج (مثل التلفزيونات والأجهزة المنزلية) مما يستدعي طلب توريد عاجل.

---

### 👑 الاستعلام 5: تحليل كبار العملاء من حيث إجمالي المشتريات (VIP Customers)

**الهدف:** التعرف على شريحة العملاء الأكثر ربحية لتقديم برنامج ولاء مخصص وتجربة استثنائية.

```sql
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
```

<p align="center">
  <img src="images/05_top_vip_customers.png" alt="تحليل كبار العملاء" width="85%"/>
</p>

> **💡 إضاءة تحليلية:** تركز الجهد الشرائي الأكبر في المدن الرئيسية (الرياض، تبوك، جدة) مما يدعم توجه تخصيص حملات استهداف جغرافية.

---

## 🎯 4. التوصيات الإستراتيجية المبنية على البيانات (Data-Driven Recommendations)

1. **التركيز على وسائل الدفع الأكثر شيوعاً:** استمرار دعم وتسهيل خيارات **STC Pay** و **مدى** وتجهيز خصومات حصريّة لمستخدميها.
2. **إدارة المخزون والتنبيه الآلي:** تفعيل تنبيه آلي عند انخفاض الكمية عن 30 قطعة لمنع خسارة أي فرص مبيعات.
3. **برامج ولاء لكبار العملاء (VIP Retention):** تقديم عروض خاصة ومخصصة لأعلى العملاء إنفاقاً للحفاظ على استمرارية الشراء.

---

## 💻 5. التقنيات والأدوات المستخدمة (Tech Stack)

* **Database Engine:** SQL Server (SSMS / T-SQL)
* **SQL Concepts Used:** DDL/DML, Relational Integrity, `JOINs`, Aggregate Functions (`SUM`, `COUNT`), Grouping & Sorting (`GROUP BY`, `ORDER BY`), Data Formatting (`CONCAT`, `CAST`).
* **Documentation & Presentation:** GitHub Markdown with HTML Embedded Visuals.

</div>
