# 🍲 Riyadh Restaurant Sales Forecasting & Waste Reduction
### نظام التنبؤ بالطلب اليومي وتقليل الهدر الغذائي لسلسلة مطاعم بالرياض
![Python](https://img.shields.io/badge/Python-3.10+-blue?style=for-the-badge&logo=python)
![Domain](https://img.shields.io/badge/Industry-Restaurant_&_Food_Tech-green?style=for-the-badge)
![Location](https://img.shields.io/badge/Market-Riyadh_KSA-Objective-red?style=for-the-badge)
![Status](https://img.shields.io/badge/Project_Status-Completed-success?style=for-the-badge)
---
## 📌 1. الملخص التنفيذي (Executive Summary)
تزامناً مع التوسع السريع لقطاع الضيافة والأغذية في مدينة الرياض وضمن أهداف **رؤية المملكة 2030** لتقليل الهدر والاستدامة المالية، يقدم هذا المشروع نموذجاً تحليلياً برمجياً بـ **Python** لتنبؤ كميات الوجبات اليومية المطلوبة لسلسلة مطاعم تجارية.
يهدف المشروع إلى حل المعادلة الصعبة بين **تجنب نفاد الوجبات (Out-of-Stock)** خلال أوقات الذروة، و**تقليل الهدر الغذائي (Food Waste)** في الأيام الهادئة عبر إدراج هامش أمان متوازن (Safety Stock) يعتمد على تحليل السلاسل الزمنية لمبيعات الوجبات.
---
## 📊 2. ملخص مؤشرات الأداء الرئيسية (KPIs Summary)
جدول تحليلي يوضح توزيع مبيعات الأسبوع ومؤشرات الأداء المستخرجة عبر خوارزمية بايثون:

| المؤشر التحليلي (Metric) | القيمة الرقمية | الوصف والتأثير التجاري |
| :--- | :--- | :--- |
| **إجمالي الوجبات المباعة (Total Volume)** | **387 وجبة** | مجموع أطباق الكبسة المباعة خلال 7 أيام |
| **إجمالي الإيرادات (Total Revenue)** | **11,610 SAR** | إجمالي المبيعات بالريال (بسعر 30 ريال/وجبة) |
| **المتوسط اليومي (Daily Average)** | **55.28 وجبة** | معدل الطلب الفعلي اليومي بدون هامش |
| **هامش الأمان (Safety Stock Buffer)** | **10%** | نسبة حماية إضافية لمواجهة التذبذب في الطلب |
| **الهدف اليومي الموصى به (Prep Target)** | **61 وجبة/يوم** | الكمية المحسوبة بعد التقريب السقفي `math.ceil` |

---
## 💡 3. التحليلات ورؤى السوق (Deep Market Insights)
* **سلوك الطلب الأسبوعي:** تظهر البيانات ذروة المبيعات في يومي الخميس والجمعة (تسجيل 70 و 85 وجبة) مقارنة بباقي أيام الأسبوع، مما يعكس نمط القوة الشرائية في عطلة نهاية الأسبوع بمدينة الرياض.
* **كفاءة التكلفة:** الاعتماد على المتوسط اليومي فقط (55 وجبة) كان سيتسبب في خسارة مبيعات مؤكدة نهاية الأسبوع، بينما الاعتماد على الذروة (85 وجبة) كان سيؤدي لهدر 30% من الطعام أيام الثلاثاء والأحد.
* **جدوى هامش الأمان (10% Buffer):** تحقيق رقم **61 وجبة يومياً** يغطي الاستهلاك المستقر ويقلل مخاطر التشغيل بنسبة عالية جداً.
---
## 🛠️ 4. البنية البرمجية والهيكلية (Python Implementation & Logic)
تم بناء المشروع باستخدام **أساسيات Python البحتة (Core Python)** لضمان أقصى سرعة تنفيذ وفهم دقيق للخوارزمية الحسابية:
### الأسطر البرمجية الرئيسية (Core Script):
# 1. Dataset Setup (Sales Data in Riyadh)
sales_data = [
    {"day": "Sunday", "sales_sar": 1200, "meals_sold": 40},
    {"day": "Monday", "sales_sar": 1350, "meals_sold": 45},
    {"day": "Tuesday", "sales_sar": 1100, "meals_sold": 37},
    {"day": "Wednesday", "sales_sar": 1500, "meals_sold": 50},
    {"day": "Thursday", "sales_sar": 2100, "meals_sold": 70},
    {"day": "Friday", "sales_sar": 2550, "meals_sold": 85},
    {"day": "Saturday", "sales_sar": 1800, "meals_sold": 60}
]
# 2. Calculate Total Volume & Daily Average
total_meals = sum(day["meals_sold"] for day in sales_data)
avg_daily_meals = total_meals / len(sales_data)
# 3. Apply Newsvendor Logic (10% Safety Buffer & Ceiling Rounding)
import math
recommended_prep = avg_daily_meals * 1.10
final_prepared_meals = math.ceil(recommended_prep)
print(f"Recommended Daily Preparation Target: {final_prepared_meals} Meals")
---
## 🎯 5. التوصيات الاستراتيجية (Strategic Recommendations)
1. **تطبيق Dynamic Safety Stock:** رفع هامش الأمان إلى **25%** يومي الخميس والجمعة، وخفضه إلى **5%** في أيام وسط الأسبوع (الأحد والثلاثاء) لرفع كفاءة الأرباح.
2. **الأتمتة البرمجية (Automation):** ربط كود بايثون بنظام الكاشير (POS) لسحب المبيعات تلقائياً وتحديث التوصية اليومية بدون تدخل بشري.
3. **التوسع المتقدم:** تحويل النموذج في المرحلة القادمة لاستخدام مكتبة `Pandas` و `Scikit-Learn` لبناء نموذج تنبؤ يعتمد على حالة الطقس والمواسم.
---
## 🛠️ 6. أدوات العمل والتقنيات (Tech Stack)
* **Language:** Python 3.10+
* **Environment:** Jupyter Notebook / Anaconda
* **Key Libraries:** Built-in `math` module
* **Version Control:** Git & GitHub
---
## 🚀 7. كيفية تشغيل المشروع (How to Run)
1. **قم بعمل Clone للمستودع عبر الأمر التالي:**
git clone https://github.com/YourUsername/Data-Analysis-and-AI-85Days.git
2. **افتح ملف Jupyter Notebook:**
انتقل إلى المجلد `Month-2/Day-13` وافتح الملف `Daily Meal Demand Analytics - Riyadh Chain.ipynb`.
3. **قم بتشغيل الخانات (Run All Cells).**
