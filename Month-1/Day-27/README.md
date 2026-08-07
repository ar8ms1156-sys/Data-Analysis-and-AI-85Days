# 🛒 مشروع تحليل إلغاء الطلبات والخسائر المالية (Delivery Cancellation Analysis)
### إستراتيجيات تقليل نسبة الإلغاء وحماية الإيرادات باستعمال T-SQL ووسائل العرض البياني

---

## 📌 1. الملخص التنفيذي (Executive Summary)
يقدم هذا المشروع تحليلاً شاملاً لبيانات عمليات التوصيل لمتجر إلكتروني سعودي عبر قاعدة البيانات التشغيلية، بهدف تحديد الأسباب الجوهرية لارتفاع معدلات إلغاء الطلبات وترجمة هذه الإلغاءات إلى خسائر مالية فعلية ودراسة أثرها على الاستدامة التشغيلية.

تم الاعتماد على لغة T-SQL لبناء استعلامات متقدمة تقيم 5 محاور تحليليّة رئيسية:
1. الأداء الكلي ومعدلات الإلغاء والخسائر المالية المباشرة.
2. التوزيع الجغرافي الخاسر ومعدلات الإلغاء حسب المدن.
3. المطاعم الأكثر تسبباً في إلغاء الطلبات والخسائر المرتبطة بها.
4. أداء السائقين (الكباتن) ونسب الإلغاء الناتجة عنهم حسب نوع المركبة.
5. تحليل الشكاوى المرفوعة وحالات المعالجة وتأثيرها على القيمة المادية للطلبات.

---

## 💾 2. معمارية وهيكلية البيانات (Database Schema)
تتكون قاعدة البيانات Relational Database من 5 جداول رئيسية مع ربط كامل لسلامة البيانات (Referential Integrity):

* جدول العملاء customers: يتضمن البيانات الديموغرافية (معرف العميل customer_id كـ Primary Key، الاسم، المدينة، تاريخ الانضمام).
* جدول المطاعم restaurants: يتضمن تفاصيل المطاعم (restaurant_id كـ Primary Key، اسم المطعم، نوع المطبخ cuisine_type، والمدينة).
* جدول السائقين drivers: يتضمن بيانات الكباتن (driver_id كـ Primary Key، اسم السائق، نوع المركبة vehicle_type، المدينة، والتقييم rating).
* جدول الطلبات orders: يتضمن المعاملات المباشرة (order_id كـ Primary Key، المفاتيح الأجنبية customer_id, restaurant_id, driver_id كـ Foreign Keys، تاريخ الطلب، المبلغ الإجمالي order_amount، حالة الطلب status [مكتمل/ملغي]، سبب الإلغاء، والجهة المتسببة cancelled_by).
* جدول الشكاوى complaints: يتضمن سجلات الشكاوى المرفوعة (complaint_id كـ Primary Key، order_id كـ Foreign Key، وحالة الشكوى complaint_status [مغلقة/قيد المعالجة/مفتوحة]).

---

## 📊 3. المحرك التحليلي ولوحات القيادة (Analytical Engine & Results)

### 📈 المحور الأول: حساب نسبة الإلغاء الكلية، ومعدل نجاح الطلبات، وإجمالي الخسائر المالية
يهدف هذا الاستعلام إلى استخراج مؤشرات الأداء الرئيسية (KPIs) لتقييم الصحة التشغيلية للمتجر.

كود الاستعلام (T-SQL):
SELECT 
    COUNT(*) AS total_orders,
    SUM(CASE WHEN status = N'مكتمل' THEN 1 ELSE 0 END) AS completed_orders,
    SUM(CASE WHEN status = N'ملغي' THEN 1 ELSE 0 END) AS cancelled_orders,
    CONCAT(SUM(CASE WHEN status = N'ملغي' THEN order_amount ELSE 0 END), ' SAR') AS total_lost_revenue,
    CONCAT(CAST(SUM(CASE WHEN status = N'ملغي' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2)), ' %') AS cancellation_rate
FROM orders;

* النتائج الأسبوعية/الشهرية:
  - إجمالي الطلبات: 100 طلب.
  - الطلبات المكتملة: 65 طلب.
  - الطلبات الملغاة: 35 طلب.
  - نسبة الإلغاء (Cancellation Rate): 35.00%.
  - إجمالي الخسائر المالية (Total Lost Revenue): 3,630.00 SAR.

💡 إضاءة تحليليّة استراتيجية: تسجل العمليات نسبة إلغاء مرتفعة جداً تصل إلى 35%، مما يعني فقدان أكثر من ثلث الطلبات التشغيلية، وتسرب مالي مباشر يتجاوز 3,630 ريال سعودي. يتطلب هذا التدخل السريع لتقليل هذه النسبة إلى الحد الطبيعي للقطاع (أقل من 5-8%).

---

### 🏙️ المحور الثاني: تحليل معدلات الإلغاء والخسائر المالية المترتبة عليها حسب كل مدينة
استعلام يحدد المدن الأكثر نزيفاً للإيرادات لتوجيه عمليات الدعم والرقابة اللوجستية.

كود الاستعلام (T-SQL):
SELECT 
    c.city,
    COUNT(o.order_id) AS Total_orders,
    CONCAT(SUM(CASE WHEN status = N'ملغي' THEN o.order_amount ELSE 0 END), ' SAR') AS city_lost_revenue,
    CONCAT(CAST(SUM(CASE WHEN status = N'ملغي' THEN 1 ELSE 0 END) * 100.0 / COUNT(o.order_id) AS DECIMAL(5,2)), ' %') AS city_cancellation_rate
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.city
ORDER BY city_cancellation_rate DESC;

* أبرز نتائج المدن:
  1. تبوك: نسبة إلغاء 66.00% (خسائر: 228.00 SAR من أصل 3 طلبات).
  2. حائل: نسبة إلغاء 50.00% (خسائر: 140.00 SAR من أصل 2 طلبين).
  3. الحمام: نسبة إلغاء 46.00% (خسائر: 770.00 SAR من أصل 13 طلب).
  4. الخبر: نسبة إلغاء 44.00% (خسائر: 423.00 SAR من أصل 9 طلبات).
  5. الرياض: أعلى قيمة خسائر مطلقة بـ 812.00 SAR (معدل إلغاء 29.00% من أصل 27 طلب).

💡 إضاءة تحليليّة استراتيجية: تظهر مدينة تبوك أعلى معدل مخاطرة تشغيلية بنسبة إلغاء 66%، بينما تشكل الرياض المصدر الأكبر لحجم الخسائر المالية المباشرة (812 ريال) نظراً لكثافة الطلبات بها.

---

### 🍽️ المحور الثالث: أكثر 5 مطاعم تسبباً في إلغاء الطلبات والخسائر المالية
استعلام لتحديد شركاء المطاعم الأكثر تسبباً في إلغاء العمليات بسبب التأخير أو نفاد الوجبات.

كود الاستعلام (T-SQL):
SELECT TOP 5
    r.restaurant_name,
    r.city,
    COUNT(o.order_id) AS total_cancelled_orders,
    CONCAT(SUM(o.order_amount), ' SAR') AS lost_revenue
FROM orders o
JOIN restaurants r ON o.restaurant_id = r.restaurant_id
WHERE o.status = N'ملغي'
GROUP BY r.restaurant_name, r.city
ORDER BY total_cancelled_orders DESC, SUM(o.order_amount) DESC;

* قائمة أعلى المطاعم تسبباً في الإلغاء:
  1. مطعم وحنيذ الجنوب (أبها): 2 طلبات ملغاة | خسائر: 310.00 SAR.
  2. مطعم الطازج (مكة): 2 طلبات ملغاة | خسائر: 120.00 SAR.
  3. مطعم عنوج (الدمام): 1 طلب ملغى | خسائر: 180.00 SAR.
  4. سلسلة المذاق الإيراني (الخبر): 1 طلب ملغى | خسائر: 175.00 SAR.
  5. مطعم المطبخ السعودي (الرياض): 1 طلب ملغى | خسائر: 165.00 SAR.

💡 إضاءة تحليليّة استراتيجية: يتصدر مطعم وحنيذ الجنوب قائمة المطاعم الأكثر تسبباً في الخسائر الإجمالية بمبلغ 310 ريال، مما يوجب وضع اتفاقية مستوى خدمة (SLA) صارمة على المطاعم المقصرة.

---

### 🛵 المحور الرابع: أكثر السائقين (الكباتن) تسبباً في إلغاء الطلبات والخسائر
استعلام يحلل سلوك التوصيل والتأخير الناتج عن السائقين حسب مركباتهم ومدنهم.

كود الاستعلام (T-SQL):
SELECT 
    d.driver_name,
    d.vehicle_type,
    d.city,
    COUNT(o.order_id) AS total_Cancelled_Orders,
    CONCAT(SUM(o.order_amount), ' SAR') AS lost_revenues
FROM orders o
JOIN drivers d ON o.driver_id = d.driver_id
WHERE o.status = N'ملغي' AND o.cancelled_by = N'السائق'
GROUP BY d.driver_name, d.vehicle_type, d.city
ORDER BY total_Cancelled_Orders DESC, SUM(o.order_amount) DESC;

* جدول السائقين الأكثر تسبباً في الإلغاء المباشر:
  1. حسام التميمي (سيارة - الرياض): 1 طلب ملغى | خسارة: 115.00 SAR.
  2. عبدالله القحطاني (دراجة نارية - الرياض): 1 طلب ملغى | خسارة: 75.00 SAR.
  3. تركي الزهراني (سيارة - الخبر): 1 طلب ملغى | خسارة: 62.00 SAR.
  4. سامي القحطاني (سيارة - الخبر): 1 طلب ملغى | خسارة: 55.00 SAR.

💡 إضاءة تحليليّة استراتيجية: تتركز إلغاءات السائقين في مدينتي الرياض والخبر، وتتطلب مراجعة آلية إسناد الطلبات وإعادة تقييم الكباتن ذوي التقييم المنخفض أو كثرة اعتذارات الاستلام.

---

### 📑 المحور الخامس: تحليل حالات الشكاوى المرفوعة على الطلبات وحجم الخسائر
استعلام لحصر الشكاوى المترتبة على الطلبات ونسب توزيع حالات معالجتها.

كود الاستعلام (T-SQL):
SELECT 
    c.complaint_status,
    COUNT(c.complaint_id) AS total_complaints,
    CONCAT(SUM(o.order_amount), ' SAR') AS total_complaint_orders_value,
    CONCAT(CAST(COUNT(c.complaint_id) * 100.0 / (SELECT COUNT(*) FROM complaints) AS DECIMAL(5,2)), ' %') AS percentage_of_total_complaints
FROM complaints c
JOIN orders o ON c.order_id = o.order_id
GROUP BY c.complaint_status
ORDER BY total_complaints DESC;

* تفاصيل حالات الشكاوى:
  1. مغلقة (Closed): 71 شكوى | نسبة: 71.00% | قيمة الطلبات المرتبطة: 7,193.00 SAR.
  2. قيد المعالجة (In Progress): 16 شكوى | نسبة: 16.00% | قيمة الطلبات المرتبطة: 1,790.00 SAR.
  3. مفتوحة (Open): 13 شكوى | نسبة: 13.00% | قيمة الطلبات المرتبطة: 1,475.00 SAR.

💡 إضاءة تحليليّة استراتيجية: إغلاق 71% من الشكاوى يعكس كفاءة فريق الدعم، ولكن وجود 29% من الشكاوى المعلقة (مفتوحة وقيد المعالجة) بقيمة تتجاوز 3,265 ريال يهدد بولاء العملاء ويتطلب تسريع دورتها المستندية.

---

## 🚀 4. التوصيات الاستراتيجية للأعمال (Strategic Business Recommendations)

1. إعادة هيكلة نظام العقوبات والشركاء (SLA Enforcement):
   - فرض غرامات تشغيلية على المطاعم ذات معدلات الإلغاء العالية (مثل مطعم وحنيذ الجنوب ومطعم الطازج) لتخفيض الخسائر البالغة 950 ريال بمقدار 50% خلال الربع القادم.
2. تحسين بروتوكول الكباتن وسرعة التوصيل:
   - إعادة توزيع السائقين في المدن ذات الكثافة (الرياض والخبر) وتفعيل نظام الحظر الموقت للكباتن المكتفية بالاعتذار لتخفيض إلغاءات السائقين.
3. التدخل اللوجستي الإقليمي الموجه:
   - التركيز على تحسين التغطية في مدينة تبوك لمعالجة معدل الإلغاء القياسي (66%)، وتعيين مشرف عمليات مخصص لمدينة الرياض لحماية إيرادات قدرها 812 ريال.
4. أتمتة وتسريع إغلاق الشكاوى:
   - وضع حد أقصى (SLA) لا يتجاوز 24 ساعة للبت في الشكاوى "المفتوحة" و"قيد المعالجة" لحماية مبالغ معلقة قيمتها 3,265.00 SAR.

---

## 🛠️ 5. التقنيات والأدوات المستخدمة (Tech Stack)

* Engine & Queries: Microsoft SQL Server Management Studio (SSMS) / T-SQL.
* SQL Capabilities Applied: Advanced Joins (INNER JOIN), Aggregations (SUM, COUNT), Conditional Logic (CASE WHEN), Subqueries, Grouping & Filtering (GROUP BY, HAVING, WHERE), Sorting (ORDER BY), and Formatting functions (CONCAT, CAST).
* Design & Dashboarding: Custom Dark-Gold Visual Analytics Dashboard Layouts.
