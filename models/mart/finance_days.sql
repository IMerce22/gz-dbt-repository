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
    orders.date_date
    , SUM (orders.orders_id) AS Total_transactions
    , SUM (orders.revenue) AS Total_revenue
    , (orders.revenue/COUNT(orders.orders_id))  AS Average_Basket
    , orders.operational_margin
    , orders.purchase_cost
    , ROUND (SUM (ship.shipping_fee), 2) AS Total_shipping_fees
    , ROUND (SUM (ship.logCost), 2) AS Total_log_costs
    , ROUND (SUM (orders.quantity), 0) AS qty_products_sold
 
FROM {{ ref('int_orders_operational') }} AS orders
JOIN {{ ref('stg_raw__ship') }} AS ship
USING(orders_id)
GROUP BY 
    orders.date_date
    , orders.revenue
    , orders.operational_margin
    , orders.purchase_cost