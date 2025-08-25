# Amazon Sales Report Analysis

## Project Overview
- This project analyzes e-commerce sales and logistics performance using raw order data. The goal was to evaluate key metrics such as revenue, cancellations, returns, delivery failures, and state-wise sales performance. Based on the findings, recommendations were provided to optimize sales strategy, improve logistics efficiency, and enhance customer experience.

## Assumptions & Data Considerations

1. Revenue Calculation – Total Revenue includes only orders with status Delivered, In Transit, or Pending. Orders with status Cancelled, Returned to Seller, or Delivery Failed were excluded.
2. Analysis Period – Only data from April to June was considered, since other months contained incomplete dates (4, 5, 6).
3. Order Value – The column Amount was treated as the total order value per row, representing the transaction value of each order.

## Key Objectives
1. **Sales Overview** – Understand monthly sales trends and performance.
2. **Product Analysis** – Identify top categories, sizes, and demand drivers.
3. **Fulfillment Analysis** – Evaluate cancellations, lost revenue, and shipping service performance.
4. **Geographical Insights** – Explore state-wise sales performance and cancellations.
5. **Business Insights** – Recommend strategies for growth and operational efficiency.

## Tools Used
- **Excel / Power Query** – Data cleaning  
- **SQL** – Analysis queries  
- **Power BI** – Interactive dashboards & insights

## Dashboard Preview

![Dashboard Screenshot](https://github.com/prachisaladiya/Amazon-sales-analysis/blob/main/Sales%20Dashboard.png)

## Insights
1. Expedited shipping shows lower cancellation rates (6.64%) compared to standard shipping (13.72%), suggesting faster delivery reduces churn.
2. A significant portion of revenue loss is tied to cancelled and returned orders, highlighting gaps in logistics or product quality.
3. Certain states exhibit higher sales volumes, making them priority markets for marketing and inventory stocking.
4. Delivery failures, although a smaller percentage, contribute to avoidable revenue leakage.

## Recommendations
- Improve **Standard shipping logistics** to reduce cancellations.  
- Focus inventory on **high-demand categories (T-shirts, Shirts, Blazers)**.  
- Target **top-performing states** with personalized offers.  
- Explore growth opportunities in **underperforming states** with moderate revenue but high cancellation.  
- Prioritize **Amazon-fulfilled orders** to minimize lost revenue.
- Optimize Shipping Strategy – Encourage expedited delivery options to lower cancellations.
- Enhance Customer Communication – Notify customers proactively about delays to reduce cancellations.
- Address Return Causes – Investigate frequent return categories to improve product quality or descriptions.
  
