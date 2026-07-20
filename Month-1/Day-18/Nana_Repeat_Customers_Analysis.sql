-- مشروع تحليل بيانات تطبيق نعناع
-- الهدف: استخراج قائمة بالعملاء الأوفياء الذين كرروا الشراء في خلال 30 يومًا
select * from dbo.nana_Sales
select min(Purchase_Date) as First_Date , max(Purchase_Date) as Last_Date From dbo.nana_Sales
select  Customer_ID , Customer_Name , count(Transaction_ID) as Total_Purchases from  dbo.nana_Sales
Group by  Customer_ID ,  Customer_Name
order by Total_Purchases Desc
SELECT Transaction_ID, Customer_ID, Customer_Name, Purchase_Date,
    LAG(Purchase_Date) OVER (PARTITION BY Customer_ID ORDER BY Purchase_Date) AS Previous_Purchase,
    DATEDIFF(day, LAG(Purchase_Date) OVER (PARTITION BY Customer_ID ORDER BY Purchase_Date), Purchase_Date) AS Days_Between
FROM dbo.nana_Sales;
WITH Customer_Journey AS (
    SELECT 
        Transaction_ID,
        Customer_ID,
        Customer_Name,
        Purchase_Date,
        LAG(Purchase_Date) OVER (PARTITION BY Customer_ID ORDER BY Purchase_Date) AS Previous_Purchase,
        DATEDIFF(day, LAG(Purchase_Date) OVER (PARTITION BY Customer_ID ORDER BY Purchase_Date), Purchase_Date) AS Days_Between
    FROM dbo.nana_Sales
)
SELECT * 
FROM Customer_Journey
WHERE Days_Between <= 30;