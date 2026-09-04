# 🏢 Riyadh Real Estate | AI Valuation & Predictive Analytics
> **منصة تحليلات التقييم العقاري والتنبؤ الذكي بأسعار العقارات في مدينة الرياض**

![Power BI](https://img.shields.io/badge/Power_BI-F2C94C?style=for-the-badge&logo=powerbi&logoColor=black)
![Power Query](https://img.shields.io/badge/Power_Query-0078D4?style=for-the-badge&logo=microsoft&logoColor=white)
![DAX Measures](https://img.shields.io/badge/DAX_Measures-217346?style=for-the-badge&logo=microsoft-excel&logoColor=white)
![PropTech ML](https://img.shields.io/badge/PropTech_ML-00A4EF?style=for-the-badge&logo=microsoft&logoColor=white)
![KSA Vision 2030](https://img.shields.io/badge/KSA_Vision_2030-006C35?style=for-the-badge&logoColor=white)
![Status](https://img.shields.io/badge/Project_Status-Completed-success?style=for-the-badge)

---

## 📌 1. الملخص التنفيذي (Executive Summary)

تزامناً مع مستهدفات **رؤية المملكة 2030** وبرنامج الإسكان لتطوير القطاع العقاري ورفع شفافية السوق اعتماداً على تقنيات **PropTech**، يقدم هذا المشروع لوحة تحكم استراتيجية لتحليل وتنبؤ أسعار صفقات العقارات في مدينة الرياض عبر تحليل **4,069 صفقة عقارية** خلال الربع الأول.

يهدف المشروع إلى دعم صناع القرار والمستثمرين العقاريين من خلال دمج نماذج التنبؤ بالذكاء الاصطناعي ($R^2 = 34.50\%$) لمقارنة الأسعار الفعلية بالقيم العادلة المتوقعة، وتحديد الفرص العقارية المقومة بأقل من قيمتها (Undervalued) أو المبالغ في تقييمها (Overvalued).

---

## 📸 2. معاينة اللوحة التفاعلية (Interactive Dashboard Preview)

> **ملاحظة:** اللوحة مدعومة بتصفية تفاعلية كاملة (**Dynamic Cross-Filtering**) عبر شرائح التصفية (**Slicers**) لتخصيص التحليل حسب المساحة (صغيرة، متوسطة، كبيرة) أو الأشهر (يناير، فبراير، مارس).

![Riyadh Real Estate Dashboard](./Screenshot%202026-09-04%20201251.png)

---

## 📊 3. ملخص مؤشرات الأداء الرئيسية (KPIs Summary)

جدول تحليلي مقارن يوضح توزيع الصفقات ونماذج التقييم وفق شريحة المساحة (Space Category):

| فئة العقار (Space Category) | عدد الصفقات (Transactions) | متوسط السعر الفعلي (Avg Actual) | متوسط السعر المتوقع (Avg Predicted) | حالة التقييم (Valuation Status) | الدلالة الاستثمارية |
| :--- | :---: | :---: | :---: | :---: | :--- |
| **عقارات صغيرة (Small)** | 383 | 314.67K SAR | 314.67K SAR | **Fair Value (عادل)** | تسعير متطابق مع قيم السوق العادلة. |
| **عقارات متوسطة (Medium)** | 2,296 | 560.68K SAR | 615.75K SAR | **Undervalued (أقل من القيمة)** | فرصة استثمارية واعدة للتوسع والشرائ. |
| **عقارات كبيرة (Large)** | 1,390 | 910.87K SAR | 855.55K SAR | **Overvalued (أعلى من القيمة)** | تتطلب حذراً واستراتيجيات تفاوض لتقليل المخاطر. |
| **الإجمالي (Total Market)** | **4,069** | **657.15K SAR** | **669.33K SAR** | **Fair Value (عادل)** | توازن عام في حركة السوق العقاري. |

---

## 🎯 4. التحليلات العملاقة ورؤى السوق (Deep Market Insights)

* **هيمنة العقارات المتوسطة:** تشكل الشريحة المتوسطة النسبة الأكبر بـ **2,296 صفقة**، وتظهر فجوة إيجابية لصالح المستثمر حيث إن سعرها الفعلي ($560.68K$) أقل من قيمتها العادلة التنبؤية ($615.75K$).
* **مخاطر الشريحة الكبيرة:** بلغت الصفقات الكبيرة **1,390 صفقة** بمتوسط سعر فعلي ($910.87K$) يتجاوز التقييم التنبؤي ($855.55K$)، مما يشير إلى وجود علاوة مخاطرة (Premium) في الأسعار.
* **الاتجاه الزمني للتقييم:** أظهر التحليل الزمني (يناير - مارس) استقرار دقة النموذج وتطابق الاتجاه العام بين الأسعار الفعلية والمتوقعة، مع تسجيل أعلى حركة صفقات في شهري يناير (1,406) وفبراير (1,419).

---

## 🛠️ 5. هندسة البيانات والنمذجة (Data Pipeline & Modeling)

تم بناء نموذج البيانات وفق أحدث معايير هندسة البيانات لضمان السرعة والدقة:

1. **معالجة البيانات (Power Query ETL):**
   * تنظيف وتدقيق بيانات الصفقات العقارية وإزالة القيم الشاذة.
   * ضبط معايير أنواع البيانات والعملات (SAR).
2. **نمذجة البيانات (Star Schema Architecture):**
   * ربط جدول الحقائق الرئيسي (`Fact_RealEstate_Transactions`) بجدول الأبعاد المخصص للتاريخ والشرائح.
3. **التنبؤ بالذكاء الاصطناعي:**
   * دمج مخرجات نموذج التنبؤ بسعر العقار ومتابعة نسبة الدقة ($R^2 = 34.50\%$).

---

## 🧮 6. صيغ DAX المخصصة في المشروع (Project DAX Measures)

```dax
// 1. Average Actual Price Calculation
Avg Actual Price = AVERAGE(Fact_RealEstate[Actual_Price])

// 2. Average Predicted Price Calculation
Avg Predicted Price = AVERAGE(Fact_RealEstate[Predicted_Price])

// 3. Model Accuracy Metric (R²)
Model Accuracy R2 = 0.3450

// 4. Valuation Status Dynamic Logic
Valuation Status = 
VAR Actual = [Avg Actual Price]
VAR Predicted = [Avg Predicted Price]
RETURN
    SWITCH(
        TRUE(),
        Actual < Predicted * 0.95, "Undervalued (أقل من القيمة)",
        Actual > Predicted * 1.05, "Overvalued (أعلى من القيمة)",
        "Fair Value (عادل)"
    )
