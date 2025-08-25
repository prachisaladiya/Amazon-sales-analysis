-- Key Business Questions answered:


-- 1) Sales Performance & Trend
--    What are the monthly sales trends, and are there any seasonal patterns that can guide inventory planning and promotional strategies?

SELECT 
    DATE_FORMAT(Order_date, '%Y-%m') AS YearMonth,
    ROUND(SUM(Amount),2) AS Total_Sales
FROM sales
WHERE status in ("Delivered", "In Transit", "Pending")
GROUP BY YearMonth
ORDER BY YearMonth;


-- 2)Revenue Drivers
-- Which product categories contribute the highest revenue and order volume, and how has their performance changed over time?

SELECT 
      Category,
      sum(Quantity) as Total_quantity,
      Round(sum(Case when Month(order_date) = 04 then Amount end),2) as April_Revenue,
      Round(sum(Case when Month(order_date) = 05 then Amount end),2) as May_Revenue,
      Round(sum(Case when Month(order_date) = 06 then Amount end),2) as June_Revenue,
      sum(Amount) as Total_Revenue
FROM sales
WHERE status in ("Delivered", "In Transit", "Pending")
GROUP BY Category
ORDER BY Total_Revenue desc;


-- 3)Product Size & Demand Analysis
-- Which product sizes are most frequently ordered within each category, and are there any emerging preferences that can inform stock planning?

With cte as(
SELECT Category, Size, 
                 sum(quantity) as Total_quantity,
				 row_number() over(Partition by Category order by sum(quantity) desc) as rn
FROM sales
GROUP BY Category, Size
)
SELECT Category, size
FROM cte 
Where rn <= 2;


-- 4)Geographical Insights
-- Which states and cities generate the most sales and highest order volume, and are there underperforming regions with growth potential?

SELECT ship_state, 
       sum(Quantity) as Total_quantity,
       sum(Amount) as Total_sales
FROM sales
WHERE status in ("Delivered", "In Transit", "Pending")
GROUP BY ship_state
ORDER BY Total_sales desc;


-- 5)Cancellation & Returns Analysis
-- Which categories experience the highest cancellation/return rates, and what financial impact do they create?

SELECT category,
        sum(case when status = 'Cancelled' then 1 end) as order_cancelled,
        sum(case when status = 'Returned to Seller' then 1 end) as order_returned
FROM sales
GROUP BY Category
ORDER BY order_cancelled desc;


-- 6) Logistics Analysis
--  Which shipping service levels are associated with the highest number of cancellations and the greatest value of lost sales?

SELECT ship_service_level,
       round(count(case when status = 'Cancelled' then 1 end) * 100 / count(*),2) as cancel_rate,
       round(sum(case when status = 'Cancelled' then Amount else 0 end),2) as lost_sales
FROM sales
GROUP BY ship_service_level
ORDER BY lost_sales desc;

select count(case when status = "Cancelled" then 1 end)* 100 / count(*) as total_cancel_rate
from sales



