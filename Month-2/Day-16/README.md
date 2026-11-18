# 🚚 Saudi Supply Chain & Logistics Delay Analytics (SAL & SPL) | Executive Excel Dashboard

![Excel](https://img.shields.io/badge/Microsoft_Excel-217346?style=for-the-badge&logo=microsoft-excel&logoColor=white)
![Copilot](https://img.shields.io/badge/Microsoft_Copilot-0078D4?style=for-the-badge&logo=microsoft&logoColor=white)
![Data Cleaning](https://img.shields.io/badge/Data_Cleaning-100%25_Accuracy-004D3D?style=for-the-badge)
![Logistics](https://img.shields.io/badge/Supply_Chain-SAL_%26_SPL-D4AF37?style=for-the-badge)
![Saudi Arabia](https://img.shields.io/badge/Market-Saudi_Arabia-006C35?style=for-the-badge)

---

## 📌 1. الملخص التنفيذي (Executive Summary)

تماشياً مع مستهدفات **رؤية المملكة 2030** لترسيخ مكانة السعودية كمركز لوجستي عالمي يربط القارات الثلاث، يقدم هذا المشروع نموذجاً تحليلياً متكاملاً لتتبع حركة الشحنات وتقييم كفاءة سلاسل الإمداد بين المراكز اللوجستية الرئيسية في المملكة (**الرياض، جدة، والدمام**).

يركز التحليل على مقارنة الأداء التشغيلي والتكلفة المالية بين أكبر ناقلين في السوق السعودي: **شركة سال للخدمات اللوجستية (SAL Logistics)** و**البريد السعودي سُبل (SPL Express)** عبر **30 شحنة** بإجمالي أوزان **27,930 كجم** وتكلفة تشغيلية بلغت **118,520 ريال سعودي**، وذلك بالاعتماد على أدوات **Microsoft Copilot** والتنسيق الشرطي الذكي لتحديد اختناقات التأخير بدقة 100%.

---

## 🖥️ 2. معاينة اللوحة التنفيذية (Executive Dashboard Preview)

> **ملاحظة تصميمية:** تم بناء اللوحة بهوية **Saudi Executive Emerald & Gold**، مع تفعيل نظام إشارات المرور (`Traffic-Light Conditional Formatting`) لفرز الشحنات المنضبطة والمتأخرة والحرجة فوراً، مدعومة بأشرطة تقدم بصرية (`Data Bars`) للأوزان والتكاليف.

### أولاً: سجل تتبع الشحنات الرئيسي (Main Shipment Tracking Log)
![Saudi Supply Chain & Logistics Dashboard](Pictures/Screenshot%202026-11-18%20124136.png)

### ثانياً: بطاقة مقارنة أداء الناقلين (Carrier Performance Benchmark)
![Carrier Performance Benchmark](Pictures/Screenshot%202026-11-18%20122934.png)

---

## 📊 3. ملخص مؤشرات الأداء الرئيسية (KPIs Summary)

| مؤشر الأداء (KPI) | SAL Logistics | SPL Express | الإجمالي / المتوسط العام | الدلالة التشغيلية |
| :--- | :---: | :---: | :---: | :--- |
| **إجمالي الشحنات (Total Shipments)** | 15 شحنة | 15 شحنة | **30 شحنة** | توزيع متساوٍ لحجم الطلبات بين الناقلين. |
| **الشحنات المنضبطة (On-Time Count)** | 13 شحنة | 6 شحنات | **19 شحنة** | تفوق تشغيلي واضح لشركة SAL في الالتزام بالوقت. |
| **نسبة الالتزام (SLA Compliance %)** | **87%** | **40%** | **63.3%** | فجوة التزام تبلغ **47%** تتطلب إعادة هيكلة التوزيع. |
| **متوسط التأخير (Avg Delay Days)** | **0.4 يوم** | **1.4 يوم** | **0.9 يوم** | معدل التأخير لدى SPL يعادل **3.5 أضعاف** SAL. |
| **إجمالي الأوزان (Total Weight)** | 8,260 KG | 19,670 KG | **27,930 KG** | استحواذ SPL على الشحنات الصناعية والتجارية الثقيلة. |
| **إجمالي التكلفة (Total Cost)** | 58,800 SAR | 59,720 SAR | **118,520 SAR** | تقارب التكلفة الإجمالية رغم اختلاف طبيعة الأوزان. |

---

## 💡 4. التحليلات العميقة ورؤى السوق (Deep Logistics Insights)

* **فجوة الالتزام باتفاقية مستوى الخدمة (SLA Gap):** حققت **SAL Logistics** معدل انضباط مرتفعاً بلغ **87%** بمتوسط تأخير شبه معدوم (**0.4 يوم**)، مما يجعلها الخيار الأمثل للشحنات الحساسة للوقت.
* **تأثير الحمولة الثقيلة على التأخير:** انخفضت نسبة التزام **SPL Express** إلى **40%** بمتوسط تأخير **1.4 يوم** نتيجة تركز الشحنات الثقيلة (`Heavy Industrial` و`Commercial Freight`) ضمن أسطولها بإجمالي أوزان **19,670 كجم** (أكثر من ضعف أوزان SAL).
* **كفاءة التكلفة مقابل الوزن (Cost-per-KG Efficiency):** سجلت **SPL Express** تكلفة نقل اقتصادية بلغت **3.04 ريال/كجم** مقارنة بـ **7.12 ريال/كجم** لدى **SAL Logistics** المخصصة للشحن الجوي السريع وسلاسل الإمداد الدوائية المبردة (`Cold Chain Pharma`).

---

## 🛠️ 5. هندسة البيانات والمعالجة (Data Pipeline & Formulas)

تم تطبيق منهجية تنظيف وهندسة بيانات صارمة للانتقال من البيانات الخام إلى لوحة قيادة خالية من الأخطاء:

1. **تنظيف وتوحيد البيانات (Data Hygiene):**
   * إزالة السجلات المكررة (`Remove Duplicates`) لتصفية الجدول من 32 إلى **30 شحنة فريدة**.
   * توحيد صيغ التواريخ القياسية (`YYYY/MM/DD`)، توحيد مسميات المدن، وتنظيف عمود التكلفة من النصوص والقيم السالبة لاعتماد عملة الريال السعودي (**﷼**).
2. **الهيكلة الذكية وتكامل Copilot:**
   * تحويل النطاق إلى جدول ديناميكي (`Excel Table`)، واستخدام **Microsoft Copilot** لتوليد وتدقيق معادلات حساب المدد الزمنية وتصنيف حالات التأخير ومقارنة الناقلين:

```excel
// حساب مدة التوصيل الفعلية (Actual Days)
=[@[Delivery_Date]]-[@[Dispatch_Date]]

// حساب أيام التأخير الفعلية (Delay Days)
=MAX(0, [@[Actual_Days]]-[@[Promised_Days]])

// تصنيف حالة الشحنة تلقائياً (Shipment Status Classification)
=IF([@[Delay_Days]]=0, "On-Time", IF([@[Delay_Days]]<=2, "Delayed", "Critical Delay"))

// حساب نسبة الالتزام بالموعد لكل ناقل (Carrier SLA Compliance %)
=COUNTIFS(Table1[Carrier], $B42, $N$4:$N$33, "On-Time") / COUNTIF(Table1[Carrier], $B42)
```

---

## 🎯 6. التوصيات الاستراتيجية (Strategic Recommendations)

1. **إعادة توجيه الشحنات الحساسة (Priority Routing):** حصر إسناد شحنات الأدوية المبردة (`Cold Chain Pharma`) والشحن الجوي العاجل (`Air Express`) لشركة **SAL Logistics** لضمان الحفاظ على معدل التزام يتجاوز **85%** وتفادي تلف البضائع أو غرامات التأخير.
2. **تخصيص الشحنات السائبة والثقيلة للناقل الاقتصادي:** الاستمرار في توجيه الشحنات الصناعية والتجارية كبيرة الوزن إلى **SPL Express** للاستفادة من انخفاض تكلفة الكيلوجرام (**3.04 SAR/KG**)، مع تعديل مدة التسليم المتفق عليها (`Promised_Days`) لتتناسب واقعياً مع مسارات النقل البري بين الرياض وجدة والدمام.
3. **تفعيل التنبيه المبكر للتأخير الحرج:** ربط مؤشر `Critical Delay` (أكثر من يومي تأخير) بتنبيهات آلية لفرق خدمة العملاء للتواصل الاستباقي مع المستلمين في المدن الرئيسية قبل تفاقم الشكاوى.

---

## ⚙️ 7. أدوات العمل والتقنيات (Tech Stack)

* **Microsoft Excel (365):** بناء الجداول الديناميكية، المعادلات الشرطية (`COUNTIFS`, `AVERAGEIF`, `SUMIF`)، والتنسيق الشرطي (`Conditional Formatting`).
* **Microsoft Copilot in Excel:** تسريع تحليل البيانات، صياغة معادلات التصنيف، ومراجعة دقة المخرجات التحليلية.
* **Git & GitHub:** إدارة الإصدارات وتوثيق المشروع وعرض النتائج التنفيذية.

---

## 🚀 8. كيفية تشغيل المشروع (How to Run)

1. قم بنسخ المستودع (`Clone`) عبر الطرفية:
   ```bash
   git clone [https://github.com/ar8ms1156-sys/Data-Analysis-and-AI-85Days.git](https://github.com/ar8ms1156-sys/Data-Analysis-and-AI-85Days.git)
   ```
2. انتقل إلى مسار المشروع: `Month-2/Day-16`.
3. افتح ملف **`Saudi_Logistics_Delay_Analytics_SAL_SPL.xlsx`** باستخدام **Microsoft Excel** لاستعراض البيانات المنظفة والمعادلات الديناميكية.
٤.
