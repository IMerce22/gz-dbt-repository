/* MODEL para a tabela sales */

with source AS 
(
    SELECT * 
    FROM {{ source('raw', 'sales') }}  /* source("dataset do BigQuery", "nome da tabela")*/

),

 renamed AS 
(
    SELECT
        date_date
        , orders_id
        , pdt_id AS products_id
        , CONCAT(orders_id, "-", pdt_id) AS orders_products_id
        , revenue
        , quantity

    FROM source
)

SELECT * 

FROM renamed