-- A. KPI’s
-- 1.Total Revenue:
select round(sum(unit_price * quantity),0) as Total_Revenue from pizza_sales -- % 817860
---------------------------------------------------------------
-- 2.Average Order Value
select sum(unit_price * quantity)/max(order_id) as Avg_Order_Value from pizza_sales -- 38.31
select sum(unit_price * quantity)/count(distinct order_id) as Avg_Order_Value  from pizza_sales -- 38.31
---------------------------------------------------------------
-- 3.Total Pizzas Sold
select sum(quantity) as Total_Pizza_Sold from pizza_sales -- 49574
---------------------------------------------------------------
-- 4.Total Orders
select max(order_id) as Total_Order from pizza_sales -- 21350
select count(distinct order_id) as Total_Order from pizza_sales -- 21350
---------------------------------------------------------------
-- 5.Average Pizzas Per Order
select cast(cast(sum(quantity)as decimal(10,2))/cast(max(order_id)as decimal(10,2)) as decimal(10,2)) as Average_Pizzas_Per_Order from pizza_sales
---------------------------------------------------------------
select round(sum(unit_price * quantity),0) as Total_Revenue  ,
sum(unit_price * quantity)/max(order_id) as Avg_Order_Value,
sum(quantity) as Total_Pizza_Sold ,
count(distinct order_id) as Total_Order,
cast(cast(sum(quantity)as decimal(10,2))/cast(max(order_id)as decimal(10,2)) as decimal(10,2)) as Average_Pizzas_Per_Order
from pizza_sales
-----------------------------------------------------------------
-- B.Daily Trend for Total Orders
select DATENAME(DW, order_date) as day_of_week , count(distinct order_id) as total_order  from pizza_sales group by DATENAME(DW, order_date) 
---------------------------------------------------------------
-- C.Hourly Trend for Orders
select datepart(hour,order_time) as time_order , count(distinct order_id) as total_order from pizza_sales group by datepart(hour,order_time) order by datepart(hour,order_time) 
--------------------------------------------------------------
-- D.% of Sales by Pizza Category
select pizza_category , round((sum(total_price)*100.0/(select sum(total_price) from pizza_sales)),2) from pizza_sales group by pizza_category 
---------------------------------------------------------------
-- E.% of Sales by Pizza Size
select pizza_size , ROUND((sum(total_price)*100.0)/(select sum(total_price) from pizza_sales) , 2) from pizza_sales group by pizza_size
---------------------------------------------------------------
-- F.Total Pizzas Sold by Pizza Category
select pizza_category , sum(quantity) as quantity from pizza_sales group by pizza_category order by sum(quantity) desc
---------------------------------------------------------------
-- G.Top 5 Best Sellers by Total Pizzas Sold
select top 5 pizza_name , sum(quantity) as quantity from pizza_sales group by  pizza_name order by sum(quantity) desc
---------------------------------------------------------------
-- H.Bottom 5 Best Sellers by Total Pizzas Sold
select top 5 pizza_name , sum(quantity) as quantity from pizza_sales group by  pizza_name order by sum(quantity)
---------------------------------------------------------------



-- for month 1 
SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
WHERE MONTH(order_date) = 1
GROUP BY DATENAME(DW, order_date)
---------------------------------------------------------------
-- for quarter 1 
SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
WHERE DATEPART(QUARTER, order_date) = 1
GROUP BY DATENAME(DW, order_date)
