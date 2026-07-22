select * from stores_cleaned
select count( * ) from stores_cleaned

alter table stores_cleaned add avg_Price Decimal(10,2) , Total_Sales Decimal(12,2)
update stores_cleaned set avg_Price = 150.00
update stores_cleaned set Total_Sales = total_reviews * avg_Price
select name_ar , total_reviews , FORMAT( avg_Price , 'N2' ) + ' SAR ' as avg_price_formatted , FORMAT( Total_Sales , 'N2' ) + ' SAR ' as  total_sales_formatted from stores_cleaned

select * from stores_cleaned where avg_Price is NULL
select * from stores_cleaned where Total_Sales is NULL

select business_type_ar , count ( * ) as total_Stores , sum ( total_reviews ) as total_orders , FORMAT(sum(Total_Sales) , 'N0' ) + ' SAR ' as total_revenue , FORMAT(sum(Total_Sales) / count( * ) , 'N0' ) + ' SAR ' as avg_sales_per_store  from stores_cleaned
group by  business_type_ar
order by sum(Total_Sales) DESC

select top 10 name_ar , business_type_ar , total_reviews as total_orders , FORMAT(Total_Sales , 'N0' ) + ' SAR ' as total_revenue from stores_cleaned
order by Total_Sales desc
