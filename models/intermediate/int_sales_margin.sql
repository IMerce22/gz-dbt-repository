/* juntar tabelas para conseguir calcular:
    --> margin = revenue - purchase_cost
    --> purchase_cost = quantity * purchase_price
*/


WITH base AS (
  SELECT
    s.products_id,
    s.date_date,
    s.orders_id,
    s.revenue,
    s.quantity,
    p.purchase_price,
    s.quantity * p.purchase_price AS purchase_cost,
    s.revenue - (s.quantity * p.purchase_price) AS margin
  FROM {{ ref('stg_raw__sales') }} AS s
  JOIN {{ ref('stg_raw__product') }} AS p
  USING (products_id)
)

SELECT
  products_id,
  date_date,
  orders_id,
  revenue,
  quantity,
  purchase_price,
  purchase_cost,
  margin,
  {{ margin_percent('revenue', 'purchase_cost', 2) }} AS margin_percent
FROM base
