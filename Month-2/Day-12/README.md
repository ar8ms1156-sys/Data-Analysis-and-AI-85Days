# 🏢 Saudi Real Estate Performance & Investment Intelligence
### 🇸🇦 منصة تحليلات الأداء والاستثمار العقاري في المملكة العربية السعودية
![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![Power Query](https://img.shields.io/badge/Power_Query-008080?style=for-the-badge&logo=microsoft&logoColor=white)
![DAX Measures](https://img.shields.io/badge/DAX_Measures-0078D4?style=for-the-badge&logo=microsoft&logoColor=white)
![KSA Vision 2030](https://img.shields.io/badge/KSA_Vision_2030-006C35?style=for-the-badge&logo=saudi-arabia&logoColor=white)
![Project Status](https://img.shields.io/badge/Project_Status-Completed-brightgreen?style=for-the-badge)
---
## 📌 1. الملخص التنفيذي (Executive Summary)
انسجاماً مع المستهدفات الاستراتيجية **لرؤية المملكة العربية السعودية 2030** لتعزيز الاستثمار العقاري وتوفير حلول سكنية واستثمارية مستدامة، يقدم مشروع **Saudi Real Estate Analytics** منصة تحليلية تفاعلية لمتابعة مؤشرات أداء السوق العقاري، وتحليل أسعار العقارات ومتوسط سعر المتر المربع عبر أبرز المدن السعودية (الرياض، جدة، الخبر، الدمام).
يهدف المشروع إلى دعم صناع القرار في شركات الاستثمار العقاري والمطورين من خلال تقديم تحليلات دقيقة تعكس توزيع الأسعار، ونسب التأثيث، وتوزيع العقارات بحسب عدد الغرف والتقييمات.
---
## 📊 2. معاينة اللوحة التفاعلية (Interactive Dashboard Preview)
> **ملاحظة:** اللوحة مدعومة بتصفية تفاعلية كاملة عبر شرائح التصفية (`City` & `Property Size Slicers`) مع تحديث لحظي لجميع المؤشرات والخرائط والرسوم البيانية.
![Saudi Real Estate Dashboard](./WhatsApp%20Image%202026-09-08%20at%2012.26.36%20PM.jpeg)
---
## 📈 3. ملخص مؤشرات الأداء الرئيسية (KPIs Summary)
جدول تحليلي للمؤشرات الرئيسية المستخرجة من النموذج التحليلي للبيانات:

| مؤشر الأداء (KPI) | القيمة الإجمالية | الدلالة الاستراتيجية والتشغيلية |
| :--- | :--- | :--- |
| **إجمالي المعروض (`Total Listings`)** | **4K+** | يعكس حجم المحفظة العقارية المتاحة للتحليل والتداول بالسوق. |
| **متوسط سعر العقار (`Avg Price`)** | **SAR 87.39K** | مؤشر لقياس القوة الشرائية والقيمة المتوسطة للوحدات المتاحة. |
| **متوسط سعر المتر (`Avg Price / SQM`)** | **SAR 295.87** | المعيار الأساسي لمقارنة التقييم العقاري بين المدن والأحياء. |
| **نسبة التأثيث (`Furnished Rate`)** | **12.35%** | يوضح الفجوة بين العقارات المفروشة والمجهزة للاستثمار الفوري. |

---
## 💡 4. التحليلات العميقة ورؤى السوق (Deep Real Estate Insights)
### أولاً: التحليل الجغرافي وتفاوت الأسعار (Geographic & Regional Performance)
* **منطقة جدة (Jeddah):** تصدرت قائمة القطاعات الأعلى متوسطاً لسعر المتر المربع (`SAR 504.02/SQM`)، مدفوعة بالإقبال على المشاريع الساحلية والسياحية.
* **منطقة الرياض (Riyadh Province):** هيمنت على نصيب الأسد في إجمالي المعروض بمتوسط سعر متر ممتاز (`SAR 267.01/SQM`) مع نمو قياسي متصاعد بقطاع الأعمال.
* **المنطقة الشرقية (Dammam & Khobar):** أظهرت نمواً متوازناً واستقراراً في متوسط الأسعار يتيح فرصاً استثمارية ممتازة للقطاع السكني العائلي.
### ثانياً: اتجاهات التوزيع وهيكل العقارات (Property Structure & Ratings)
* **توزيع الغرف:** هيمنت الوحدات ذات **5 غرف نوم** على أعلى معدل عرض بالسوق (1,507 عقار)، مما يعكس نمط الطلب العائلي بوضوح.
* **التقييمات والجودة:** تشكل العقارات ذات التقييم المرتفع (4 إلى 5 نجوم) النسبة الأكبر من المعروض، مما يدل على جودة البنية التحتية والتطوير العقاري الحديث.
---
## 🛠️ 5. هندسة البيانات والنمذجة (Data Pipeline & Modeling)
تم بناء نموذج البيانات وفق أحدث معايير هندسة البيانات لضمان سرعة الاستعلام والتحليل الدقيق:
### 1. معالجة البيانات (Power Query ETL)
* تنظيف وحذف القيم المفقودة والمتكررة.
* توحيد العملات وتعديل أنواع البيانات (`Data Types`).
* دمج وجلب البيانات الجغرافية لتحسين دقة خرائط الـ `Map Visuals`.
### 2. نمذجة البيانات (Star Schema Architecture)
تم ربط جدول الحقائق الرئيسي بجدول الأبعاد المخصصة:
* **`SA_Aqar1`**: يحتوي على أرقام الأسعار، المساحات، عدد الغرف، والمواصفات.
* **`City / Size Slicers`**: لتنظيم التوزيع الجغرافي والفئات الحجمية.
### 3. صيغ DAX المخصصة في المشروع (Project DAX Measures)
// 1. Total Listings Calculation (000)
Total Properties = COUNTROWS('SA_Aqar1')
// 2. Average Price Calculation (SAR)
Average Price = AVERAGE('SA_Aqar1'[price])
// 3. Average Price Per SQM Calculation (SAR)
Avg Price Per SQM = AVERAGE('SA_Aqar1'[Price_Per_SQM])
// 4. Furnished Properties Ratio (%)
Furnished Ratio = DIVIDE(CALCULATE(COUNTROWS('SA_Aqar1'), 'SA_Aqar1'[furnished] = 1), [Total Properties], 0)
---
## 🎯 6. التوصيات الاستراتيجية (Strategic Recommendations)
1. **استهداف زيادة إنفاق العقارات المفروشة (`Furnished Investment`):** نظراً لأن نسبة العقارات المفروشة حالياً هي 12.35% فقط، تتوفر فرصة استثمارية واعدة لزيادة عائدات الإيجار قصير الأجل بالرياض وجدة.
2. **استهداف شريحة الوحدات المتوسطة:** تركيز التطوير على فئات 4 إلى 5 غرف يلبي الكتلة الحيوية الأكبر من الطلب الاستهلاكي بالسوق السعودي.
---
## 🧰 7. أدوات العمل والتقنيات (Tech Stack)
* **Microsoft Power BI Desktop:** بناء لوحة القيادة والتصميم البصري التفاعلي.
* **Power Query (M-Code):** عمليات التنظيف (ETL Pipeline) وتحضير البيانات.
* **DAX Expressions:** تصميم الحسابات ومؤشرات الأداء المتقدمة.
* **GitHub:** توثيق المشروع وإدارة النسخ البرمجية.
---
## 🚀 8. كيفية تشغيل المشروع (How to Run)
1. قم بعمل Clone للمستودع عبر الأمر التالي:
git clone [https://github.com/ar8ms1156-sys/Data-Analysis-and-AI-85Days.git](https://github.com/ar8ms1156-sys/Data-Analysis-and-AI-85Days.git)
2. افتح ملف المشروع **`Saudi_Real_Estate_Performance_Analytics.pbix`** باستخدام برنامج **Power BI Desktop**.
3. قم بتحديث مصدر البيانات (**Data Source Settings**) في حال تغير المسار المحلي لديك.
