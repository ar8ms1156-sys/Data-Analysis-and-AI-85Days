# 🛒 KSA E-Commerce Performance & Customer Behavior Analytics | Executive Power BI Dashboard

![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![Power Query](https://img.shields.io/badge/Power_Query-0078D4?style=for-the-badge&logo=microsoft&logoColor=white)
![DAX](https://img.shields.io/badge/DAX_Expressions-008080?style=for-the-badge&logo=datadog&logoColor=white)
![Market](https://img.shields.io/badge/Market-E--Commerce-green?style=for-the-badge)
![Location](https://img.shields.io/badge/Region-Saudi_Arabia-006C35?style=for-the-badge)

---

## 📌 1. الملخص التنفيذي (Executive Summary)

في ظل النمو المتسارع لقطاع التجارة الإلكترونية داخل المملكة العربية السعودية واستهداف رؤية 2030 للتحول الرقمي، يقدم هذا المشروع تحليلاً استراتيجياً شاملاً لأداء منصة تجارة إلكترونية تغطي المدن الرئيسية في المملكة (جدة، الدمام، الرياض، مكة، الخبر، أبها، وتبوك).

يهدف المشروع إلى معالجة وتحليل بيانات المبيعات والسلوك الرقمي للمستخدمين برأس مال معاملات يتجاوز **6 مليون ريال سعودي** وإجمالي **8,000 طلب مكتمل**. تم بناء اللوحة باستخدام **Star Schema Architecture** داخل **Power BI** واقتباس الهوية الوطنية السعودية الداكنة (**Executive Emerald Theme**) لتقديم رؤى تفاعلية تدعم اتخاذ القرارات التكتيكية والاستراتيجية.

---

## 🖼️ 2. معاينة اللوحة التفاعلية (Interactive Dashboard Preview)

> **ملاحظة:** اللوحة مدعومة بتصفية تفاعلية كاملة (Dynamic Cross-Filtering)، حيث يتيح اختيار أي مدينة من شريط التصفية الجانبي تحديث كافة كروت الأداء والخريطة الجغرافية وتوزيع الأجهزة فوراً.

![KSA E-Commerce Dashboard Preview](./WhatsApp%20Image%202026-08-25%20at%207.14.02%20PM.jpeg)

---

## 📊 3. ملخص مؤشرات الأداء الرئيسية (KPIs Summary)

| مؤشر الأداء (KPI) | القيمة الحالية | الدلالة الاستراتيجية |
| :--- | :---: | :--- |
| **إجمالي المبيعات (Total Sales)** | **6.00M SAR** | يعكس إجمالي الإيرادات المحققة عبر كافة المنصات والمدن. |
| **الطلبات المكتملة (Completed Orders)** | **8K Orders** | حجم العمليات التشغيلية المكتملة بنجاح. |
| **معدل التحويل (Conversion Rate)** | **97.84%** | كفاءة مسار الشراء (Funnel Efficiency) وإتمام العمليات. |
| **متوسط الوقت بالموقع (Avg Time on Site)** | **15.80 Min** | مستوى تفاعل واحتفاظ المستخدمين بالمنصة (User Engagement). |
| **معدل الارتداد (Avg Bounce Rate)** | **50.73%** | نسبة الزوار المغادرين بعد صفحة واحدة (يحتاج تحسين تكتيكي). |

---

## 💡 4. التحليلات العميقة ورؤى السوق (Deep Market Insights)

### أولاً: التحليل الجغرافي وسلوك المناطق (Geographic Analysis)
* **المدن الأكثر إيراداً:** تتصدر مدينة **جدة (Jeddah)** القائمة بإجمالي مبيعات **1.00M SAR** وعدد طلبات **2K**، تليها **الدمام (Dammam)** بـ **975K SAR**، ثم **الرياض (Riyadh)** بـ **840K SAR**، و**مكة المكرمة (Makkah)** بـ **796K SAR**.
* **الأسواق الواعدة:** أظهرت مدن مثل **الخبر (742K SAR)** و**أبها (597K SAR)** و**تبوك (448K SAR)** أداءً استهلاكياً متزناً يعكس فرصاً واعدة للتوسع الترويجي.

### ثانياً: تفضيلات الأجهزة (Sales by Device Type)
* **سيطرة الهواتف المحمولة (Mobile Dominance):** يستحوذ الهاتف المحمول على النسبة الأكبر من المبيعات بقيمة **3.63M SAR (60.5%)**، مما يؤكد أن المستهلك السعودي يتجه نحو التسوق عبر الموبايل بشكل أساسي.
* **أجهزة أسطح المكتب (Desktop):** جاءت في المرتبة الثانية بقيمة **1.76M SAR (29.39%)**.
* **الأجهزة اللوحية (Tablet):** سجلت أضعف مشاركة بقيمة **606K SAR (10.11%)**.

### ثالثاً: التوزيع الديموغرافي (Sales by Gender)
* **توازن القوى الشرائية:** أظهر التحليل توازناً استثنائياً بين الجنسين في حجم الإنفاق، حيث بلغت مبيعات الإناث **2.82M SAR** مقابل **2.78M SAR** للذكور، مما يتطلب استراتيجيات تسويقية متوازنة لا تستهدف فئة دون الأخرى.

---

## 🛠️ 5. هندسة البيانات والمعالجة (Data Pipeline & Modeling)

تم بناء نموذج البيانات وفق أفضل ممارسات هندسة البيانات الحديثة:

1. **الاستيراد والتنظيف (Power Query Editor):**
   * ضبط أنواع البيانات (Data Types) وتحويل العملات إلى الريال السعودي (SAR).
   * إزالة السجلات المكررة ومعالجة القيم المفقودة في حقول المدن والأجهزة.
2. **نمذجة البيانات (Data Modeling - Star Schema):**
   * ربط جدول الحقائق الرئيسي (`Fact_Sales`) بمخطط النجمة مع جداول الأبعاد (`Dim_City`, `Dim_Device`, `Dim_Customer`).
3. **صيغ DAX المخصصة (Key DAX Measures):**

```dax
// Total Sales Calculation
Total Sales = SUM(Fact_Sales[Sales_Amount])

// Conversion Rate Optimization Measure
Conversion Rate % = DIVIDE(COUNTROWS(FILTER(Fact_Sales, Fact_Sales[Status] = "Completed")), COUNTROWS(Fact_Sales), 0) * 100

// Average Bounce Rate
Avg Bounce Rate = AVERAGE(Fact_Sales[Bounce_Rate])
```

---

## 🎯 6. التوصيات الاستراتيجية (Strategic Recommendations)

1. **التركيز على تجربة الموبايل (Mobile-First Approach):** نظراً لأن 60.5% من الإيرادات قادمة من الموبايل، يجب تحسين سرعة تطبيق الموبايل وسلاسة بوابة الدفع (Checkout Process).
2. **استراتيجية التسويق الجغرافي (Regional Targeting):** ضخ استثمارات إعلانية مكثفة في مدينتي جدة والدمام لتعزيز الصدارة، مع تقديم عروض شحن مجاني لمدينة تبوك لرفع معدل السلة الشرائية.
3. **خفض معدل الارتداد (Reduce Bounce Rate):** معدل الارتداد الحالي (50.73%) يتطلب إعادة تحسين صفحات الهبوط (Landing Pages) وتفعيل أداة التوصيات الذكية بالمقترحات الشبيهة.

---

## ⚙️ 7. أدوات العمل والتقنيات (Tech Stack)

* **Microsoft Power BI Desktop:** بناء واجهة لوحة القيادة (UI/UX Design).
* **Power Query (M-Code):** معالجة البيانات وبناء أنبوب المعالجة (ETL Pipeline).
* **DAX Expressions:** بناء الحسابات والمؤشرات الديناميكية.
* **GitHub:** توثيق وحفظ النسخ البرمجية للمشروع.

---

## 🚀 8. كيفية تشغيل المشروع (How to Run)

1. قم بعمل `Clone` للمستودع عبر الأمر التالي:
   ```bash
   git clone [https://github.com/YourUsername/KSA_ECommerce_Performance_Analytics.git](https://github.com/YourUsername/KSA_ECommerce_Performance_Analytics.git)
   ```
2. افتح ملف `KSA E-Commerce Performance & Customer Behavior Analytics.pbix` باستخدام برنامج **Power BI Desktop**.
3. قم بتحديث مصدر البيانات (Data Source) في حال تغير المسار المحوّل.
٤.
