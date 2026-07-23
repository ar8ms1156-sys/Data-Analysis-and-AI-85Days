<div dir="rtl" align="right">

<!-- HEADER SECTION -->
<div align="center">

# 📦 Low Stock & Inventory Reorder Analysis Pipeline
### 🇸🇦 نظام أتمتة مراقبة المخزون وتحديد المنتجات الحرجة المعتمدة على استعلامات SQL Server

![SQL Server](https://img.shields.io/badge/SQL%20Server-CC292B?style=for-the-badge&logo=microsoftsqlserver&logoColor=white)
![Inventory Management](https://img.shields.io/badge/Inventory-Optimization-0078D4?style=for-the-badge)
![Data Analytics](https://img.shields.io/badge/Data%20Analytics-Retail%20&%20E--Commerce-00C48C?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Completed-success?style=for-the-badge)

</div>

---

## 📌 1. الملخص التنفيذي (Executive Summary)

تُعد إدارة المخزون حجر الزاوية في نجاح عمليات التجزئة والتجارة الإلكترونية بالسوق السعودي. يهدف هذا المشروع إلى بناء **استعلام تحليلي (SQL Analytical Pipeline)** لفحص قاعدة بيانات المنتجات وتحديد الأصناف التي وصلت إلى **حد إعادة الطلب (Low Stock Threshold)**. يساهم هذا النظام في منع انقطاع المنتجات الأكثر مبيعاً، وتنسيق تدفقات التوريد، وتحسين إدارة رأس المال العامل بدقة عالية.

---

## 📊 2. مؤشرات حالة المخزون (Inventory KPIs Summary)

<table align="center" width="100%">
  <tr>
    <td align="center" width="25%">
      <b>⚠️ المنتجات الحرجة (إعادة طلب)</b><br>
      <code>6 منتجات</code>
    </td>
    <td align="center" width="25%">
      <b>📉 أدنى كمية مخزون متوفرة</b><br>
      <code>10 قطع (تلفزيون سوني)</code>
    </td>
    <td align="center" width="25%">
      <b>💎 أعلى سعر منتج حرج</b><br>
      <code>4,800.00 SAR (آيفون 15)</code>
    </td>
    <td align="center" width="25%">
      <b>🏷️ الفئات الأكثر تأثراً</b><br>
      <code>إلكترونيات / أجهزة منزلية</code>
    </td>
  </tr>
</table>

---

## 🛠️ 3. استعلام SQL المتقدم (SQL Reorder Pipeline Query)

تم صياغة الاستعلام داخل **SQL Server** لتصفية المنتجات التي تقل كمياتها عن الحد الآمن ورصدهم حسب أولوية النفاد:

```sql
SELECT 
    ProductID,
    ProductName,
    Category,
    StockQuantity,
    Price
FROM Products
WHERE StockQuantity <= 30
ORDER BY StockQuantity ASC;
```

---

## 📈 4. تقرير المنتجات التي تتطلب إعادة طلب (Low Stock Report)

بعد تشغيل الاستعلام بنجاح، تم استخراج التقرير التشغيلي الدقيق للأنشطة الحرجة كالتالي:

| # | رقم المنتج | اسم المنتج | الفئة | الكمية المتاحة | السعر (SAR) | حالة المخزون (Alert Status) |
| :-: | :-: | :--- | :--- | :-: | :-: | :--- |
| **1** | **11** | تلفزيون سوني 65 بوصة 4K | إلكترونيات | **10** | 3400.00 SAR | 🚨 حرج جداً (إعادة طلب فورية) |
| **2** | **7** | ماكينة قهوة ديلونجي ديديكا | أجهزة منزلية | **15** | 850.00 SAR | 🚨 حرج جداً (إعادة طلب فورية) |
| **3** | **2** | ألترا S24 سامسونج جالكسي | إلكترونيات | **18** | 4200.00 SAR | ⚠️ قريب من حد الخطر |
| **4** | **12** | طقم أواني طهي سيراميك | أجهزة منزلية | **22** | 620.00 SAR | ⚠️ قريب من حد الخطر |
| **5** | **1** | آيفون 15 بروماكس 256 جيجا | إلكترونيات | **25** | 4800.00 SAR | 🟡 تحت المتابعة |
| **6** | **8** | قلاية هوائية فيليبس 1.2 كجم | أجهزة منزلية | **30** | 550.00 SAR | 🟡 تحت المتابعة |

---

## 💡 5. التوصيات والتحليلات التشغيلية (Actionable Insights)

1. 🚨 **أولوية التوريد العاجل (Critical Reorder):**
   منتجا **تلفزيون سوني (10 قطع)** و **ماكينة ديلونجي (15 قطعة)** يسجلان أدنى كمية مخزون. يجب إصدار أذونات شراء فورية للموردين لتفادي خسارة المبيعات.

2. 💰 **إدارة التدفقات النقدية والأصناف عالية القيمة:**
   الأجهزة ذات القيمة العالية مثل **آيفون 15 بروماكس (4,800 SAR)** و **سامسونج S24 (4,200 SAR)** تمثل نسبة كبيرة من القيمة المادية للمخزون، مما يستوجب ضبط طلبات السيولة بدقة دون تكديس.

3. 🔄 **توازن الفئات التجارية:**
   يُظهر التقرير تساوياً بين قطاعي **الإلكترونيات** و **الأجهزة المنزلية** في معدل استهلاك المخزون، مما يتطلب تنسيق خطط المشتريات بشكل متوازٍ بين خطي الإمداد.

---

## 💻 6. الأدوات والتقنيات المستخدمة (Tech Stack)

* **Database Engine:** Microsoft SQL Server (SSMS)
* **SQL Concepts:** Data Filtering (`WHERE`), Sorting (`ORDER BY`), Relational Querying.
* **Domain:** E-Commerce Inventory Control & Supply Chain Analytics.

---

<div align="center">

**Developed with 💡 for Supply Chain & Data Analytics Excellence**

</div>

</div>
