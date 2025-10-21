/* MODEL para a tabela ship */

with source AS 
(
    SELECT * 
    FROM {{ source('raw', 'ship') }}
),

 renamed AS 
(
    SELECT
        orders_id
        , shipping_fee
        , logCost
        , CAST(ship_cost AS FLOAT64) AS ship_cost

    FROM source
)

SELECT * 

FROM renamed

/*  ##############  NOTES  ################

Para escolher qual shipping_fee escolhia usei este query num query no BigQuery:

SELECT
  ship_cost,
  shipping_fee,
  shipping_fee_1
FROM `wired-office-473608-g9.gz_raw_data.raw_gz_ship`
WHERE shipping_fee <> shipping_fee_1


A resposta a este query foi: "There is no data to display."
O que revela que ambas tabelas SAO IGUAIS!!!!

*/