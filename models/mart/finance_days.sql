/*
The finance team has communicated that they want the following data at a daily granularity:
Date
Total number of transactions
Total revenue
Average Basket = Total Revenue​ / Nº Orders 
Operational Margin = Margin + Shipping_Fee − Log_Cost − Ship_Cost
Total purchase cost
Total shipping fees
Total log costs
Total quantity of products sold.
*/

SELECT
    date_date
    , SUM (orders_id) AS Total_transactions
    , SUM (revenue) AS Total_revenue
    , (revenue/COUNT(orders_id))  AS Average_Basket
    , operational_margin
    , purchase_cost
    , ROUND (SUM (shipping_fee), 2) AS Total_shipping_fees
    , ROUND (SUM (logCost), 2) AS Total_log_costs
    , ROUND (SUM (quantity), 0) AS qty_products_sold
FROM {{ ref('int_orders_operational') }}
GROUP BY 
    date_date
    , revenue
    , operational_margin
    , purchase_cost