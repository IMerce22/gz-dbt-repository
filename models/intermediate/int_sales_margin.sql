/* juntar tabelas para conseguir calcular:
    --> margin = revenue - purchase_cost
    --> purchase_cost = quantity * purchase_price
*/

SELECT
    products_id
    , date_date
    , orders_id
    , revenue
    , quantity
    , purchase_price
    , sales.quantity * product.purchase_price AS purchase_cost
    , sales.revenue - (sales.quantity * product.purchase_price) AS margin
FROM {{ ref('stg_raw__sales') }} AS sales
JOIN {{ ref('stg_raw__product') }} AS product
USING(products_id)
