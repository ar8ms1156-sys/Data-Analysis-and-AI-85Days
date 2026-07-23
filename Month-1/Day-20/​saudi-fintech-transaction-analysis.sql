select * from MOCK_DATA

select Status , COUNT (*) as Total_Transaction , CONCAT(round(avg(amount),2), '  SAR ') as Avg_Amount from MOCK_DATA
GROUP BY Status

select Payment_Method ,Status, COUNT (*) as Total_Transaction , CONCAT(round(avg(amount),2), '  SAR ') as Avg_Amount from MOCK_DATA
GROUP BY Status,Payment_Method
ORDER BY avg(amount) desc