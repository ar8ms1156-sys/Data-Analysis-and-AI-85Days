# 🛒 Tamimi Markets Retail Analytics | Executive Power BI Dashboard

![Power BI](https://img.shields.io/badge/Power_BI-F2C94C?style=for-the-badge&logo=powerbi&logoColor=black)
![Power Query](https://img.shields.io/badge/Power_Query-0078D4?style=for-the-badge&logo=microsoft&logoColor=white)
![DAX Expressions](https://img.shields.io/badge/DAX_Expressions-005B96?style=for-the-badge)
![KSA Retail](https://img.shields.io/badge/KSA_Retail-006C35?style=for-the-badge&logo=saudi-arabia)

---

## 📌 1. الملخص التنفيذي (Executive Summary)

في إطار التحول الرقمي والتوسع المتسارع لقطاع التجزئة بالمملكة العربية السعودية واستهدفات رؤية **2030**، يقدم هذا المشروع تحليلاً استراتيجياً شاملاً لأداء **أسواق التميمي (Tamimi Markets)**. يركز المشروع على قياس كفاءة المبيعات والإيرادات الإجمالية، وتقييم أثر ضريبة القيمة المضافة (**15% VAT**)، وتحليل أداء المحافظ السلعية (SKUs) عبر مختلف الفروع الإقليمية.

يهدف المشروع إلى معالجة وتحليل بيانات العمليات التجارية برأس مال معاملاتي يتجاوز **8.45 مليون ريال سعودي** قبل الضريبة (**9.72 مليون ريال سعودي** بعد الضريبة)، مع ربط سلاسل الإمداد ومعدل دوران المخزون بقرارات تسعيرية وتسويقية تدعم متخذي القرار والمدراء التنفيذيين.

---

## 🖼️ 2. معاينة اللوحة التفاعلية (Interactive Dashboard Preview)

> **ملاحظة:** اللوحة مدعومة بتصفية تفاعلية كاملة (**Dynamic Cross-Filtering**)، حيث يتيح اختيار أي فرع أو فئة منتجات تحديث كافة كروت الأداء والتوزيعات الجغرافية والتحليلات فوراً.

![Interactive Dashboard Preview](Screenshot%202026-08-27%20031626.png)

---

## 📊 3. ملخص مؤشرات الأداء الرئيسية (KPIs Summary)

| مؤشر الأداء (KPI) | القيمة الحالية | الدلالة الاستراتيجية والتشغيلية |
| :--- | :--- | :--- |
| **إجمالي المبيعات قبل الضريبة (Gross Sales)** | **SAR 8.45M** | يعكس إجمالي الإيرادات المباشرة المحققة من جميع منافذ البيع. |
| **المبيعات شاملة الضريبة (Net Sales - 15% VAT)** | **SAR 9.72M** | التدفق النقدي الفعلي المحصل شاملاً ضريبة القيمة المضافة المطبقة بالمملكة. |
| **تنوع المحفظة السلعية (Total Product SKUs)** | **1,240 SKU** | مدى تنوع المنتجات المتاحة وتطبيقه على القوة الشرائية للمستهلكين. |
| **متوسط سعر القطعة (Avg Unit Price)** | **SAR 68.15** | مؤشر كفاءة التسعير والقيمة المتوسطة للوحدة المباعة داخل السلة. |
| **إجمالي الكميات المباعة (Total Volume Sold)** | **124K Units** | قياس حجم الحركة التشغيلية ومعدل دوران البضائع داخل الفروع. |

---

## 💡 4. التحليلات العميقة ورؤى السوق (Deep Market Insights)

### أولاً: التحليل الجغرافي وتوزيع الفروع (Geographic & Regional Performance)
* **الفروع الأكثر إيراداً:** تصدرت منطقة **الرياض** قائمة المبيعات بإجمالي **3.10M SAR**، تليها **جدة** بـ **2.45M SAR**، ثم **الدمام والخبر**، مما يعكس كفاءة التشغيل والتغطية في المناطق الرئيسية.
* **الأسواق الواعدة:** أظهرت الفروع الشمالية والجنوبية (مثل تبوك وأبها) نمواً مستقراً وفرصاً واعدة للتوجه نحو تعزيز العروض الموجهة.

### ثانياً: أداء الفئات والأقسام السلعية (Category & Product Analytics)
* **الأغذية الطازجة والاستهلاكية:** سجلت أعلى معدل دوران مخزون، واستحوذت على **45%** من حجم الإيرادات الكلي.
* **المنتجات المستوردة والخاصة (Exclusive Brands):** حققت أعلى هامش ربحية ومتوسط سعر وحدة (**Avg Unit Price**) يصل إلى **SAR 112.00**.

### ثالثاً: التتبع المالي والضريبي (Tax & Financial Breakdown)
* تم بناء آلية حسابية تفصل بوضوح بين صافي المبيعات والالتزامات الضريبية (**15% VAT**) لتقديم تقارير دقيقة ومتوافقة تماماً مع متطلبات الهيئة الزكوية والضريبية (ZATCA).

---

## 🛠️ 5. هندسة البيانات والنمذجة (Data Pipeline & Modeling)

تم بناء نموذج البيانات وفق أفضل ممارسات هندسة البيانات الحديثة لضمان سرعة معالجة الاستعلامات:

1. **الاستيراد والتنظيف (Power Query Editor):**
   * ضبط أنواع البيانات (Data Types)، وتحويل العملات إلى الريال السعودي (SAR).
   * معالجة القيم المفقودة وإزالة السجلات المكررة في حقول المنتجات والفروع.

2. **نمذجة البيانات (Data Modeling - Star Schema):**
   * ربط جدول الحقائق الرئيسي (`Fact_Sales`) بمخطط النجمة مع جداول الأبعاد:
     * `Dim_Products`
     * `Dim_Stores`
     * `Dim_Date`

3. **صيغ DAX المخصصة (Key DAX Measures):**

```dax
// 1. Total Gross Sales Calculation (Pre-VAT)
Total Sales Pre-VAT = SUM(Fact_Sales[SalesAmount])

// 2. Net Sales Calculation (Including 15% KSA VAT)
Total Sales Post-VAT = [Total Sales Pre-VAT] * 1.15

// 3. Average Price Per Unit Sold
Avg Unit Price = DIVIDE([Total Sales Pre-VAT], SUM(Fact_Sales[Quantity]), 0)

// 4. Total VAT Amount Collected
Total VAT 15% = [Total Sales Post-VAT] - [Total Sales Pre-VAT]
```

---

## 🎯 6. التوصيات الاستراتيجية (Strategic Recommendations)

1. **تحسين المزيج البيعي (Product Mix Optimization):** زيادة الاعتماد على المنتجات ذات التنافسية العالية لرفع متوسط قيمة السلة الشرائية بنسبة **6%**.
2. **إدارة المخزون والتوريد:** توجيه المخزون ذو الدوران العالي إلى فروع الرياض وجدة لتفادي نفاد المنتجات خلال أوقات الذروة.
3. **التكامل الضريبي الآلي:** الاعتماد التام على المؤشرات الحسابية المباشرة لحساب الضريبة الزكوية والضريبية دورياً وتسهيل إعداد التقارير الماليّة.

---

## ⚙️ 7. أدوات العمل والتقنيات (Tech Stack)

* **Microsoft Power BI Desktop:** بناء واجهة لوحة القيادة والتصميم البصري (UI/UX Design).
* **Power Query (M-Code):** معالجة البيانات وبناء أنبوب المعتمد (ETL Pipeline).
* **DAX Expressions:** حساب المؤشرات والمعادلات الديناميكية.
* **GitHub:** توثيق وحفظ النسخ البرمجية للمشروع.

---

## 🚀 8. كيفية تشغيل المشروع (How to Run)

1. قم بعمل `Clone` للمستودع عبر الأمر التالي:
   ```bash
   git clone [https://github.com/YourUsername/Tamimi_Markets_Saudi_Retail_Analytics.git](https://github.com/YourUsername/Tamimi_Markets_Saudi_Retail_Analytics.git)
   ```
2. افتح ملف `Tamimi_Markets_Saudi_Retail_Analytics.pbix` باستخدام برنامج **Power BI Desktop**.
3. قم بتحديث مصدر البيانات (Data Source) في حال تغير المسار المحلي لديك.
٤.
