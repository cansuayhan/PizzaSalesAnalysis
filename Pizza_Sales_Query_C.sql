select *
from pizza_sales;

-- KPI's Requirement --


-- 1. Total Revenue:

Select Sum(total_price) as Total_Revenue
from pizza_sales;

-- 2. Average Order Value -- average amount spent per order,
--  calculates by dividing the total revenue by the total number of order.


Select count(distinct order_id) as total_order, Sum(total_price) as Total_Revenue, 
(Sum(total_price)/count(distinct order_id)) as Average_Order_value
from pizza_sales;

-- 3. Total pizzas Sold -- the sum of the quantities of all pizzas sold

select sum(quantity) as total_pizzas_sold
from pizza_sales;

-- 4.Total Orders -- the total number of orders placed

select Count(distinct order_id) as total_orders
from pizza_sales;

-- 5. Average Pizzas Per Order -- the average number of pizzas sold per order, 
-- calculated by dividing the total number of pizzas sold by the the total number of orders

select sum(quantity)/count(distinct order_id) as Average_Pizzas_Per_Order
from pizza_sales;

-- Charts Requirement --

-- 1. Daily Trend For Total Orders 

Select dayname(STR_TO_DATE(order_date, '%d-%m-%Y')) as days, count(distinct order_id) as total_orders
From pizza_sales
group by days;

-- 2. Hourly trend for total orders 

Select hour(order_time) as hours, count(distinct order_id) as total_orders
from pizza_sales
group by hours;

-- 3. Percentage of sales by Pizza Category

select pizza_category, sum(total_price) as sales,
sum(total_price)/(select sum(total_price) from pizza_sales)*100 as perc
from pizza_sales
group by pizza_category;

-- 4. Percentage of pizza sales by pizza size 

select pizza_size, sum(total_price) as sales, sum(total_price)/(select sum(total_price) from pizza_sales)*100 as perc
from pizza_sales
group by pizza_size;

-- 5. Total pizzas sold by pizza category -- number of pizzas 

select pizza_category, sum(quantity) as total_pizzas
from pizza_sales
group by pizza_category;

-- 6. top 5 best sellers by total pizzas sold -- based on the total number of pizzas sold


select pizza_name, sum(quantity) as total_pizzas_sold
from pizza_sales
group by pizza_name
order by total_pizzas_sold desc
limit 5;

-- 7. Bottom 5 worst Sellers by total pizzas sol -- based on the ttal number of pizzas sold


select pizza_name, sum(quantity) as total_sales
from pizza_sales
group by pizza_name
order by total_sales asc
limit 5;














