/*
Operational_margin = margin + shipping_fee - log_cost - ship_cost

Shipping fee o que o cliente pagou para o shipping
Shipping cost quanto custou à empresa para organizar o shipping

*/


SELECT
    orders.orders_id
    , orders.date_date
    , ROUND (SUM (orders.margin + ship.shipping_fee - ship.logCost - ship.ship_cost), 2) AS operational_margin
    , orders.revenue
    , orders.quantity
    , orders.purchase_cost
    , ship.ship_cost
    , ship.shipping_fee
    , ship.logCost
FROM {{ ref('int_orders_margin') }} AS orders
JOIN {{ ref('stg_raw__ship') }} AS ship
USING (orders_id)
GROUP BY
    orders.orders_id
    , orders.date_date
    , orders.revenue
    , orders.quantity
    , orders.purchase_cost
    , orders.margin
    , ship.ship_cost
    , ship.shipping_fee
    , ship.logCost
ORDER BY 
    orders.orders_id DESC
