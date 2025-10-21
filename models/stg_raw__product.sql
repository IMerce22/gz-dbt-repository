/* MODEL para a tabela product */

with source AS 
(
    SELECT * 
    FROM {{ source('raw', 'product') }}

 ),

 renamed AS 
(
     SELECT
        products_id
        , purchSE_PRICE AS purchase_price

     FROM source
),

 cast_purchase AS
(
    SELECT
        products_id
        , CAST(purchase_price AS FLOAT64 ) AS purchase_price
    
    FROM renamed
)

SELECT * 

FROM cast_purchase