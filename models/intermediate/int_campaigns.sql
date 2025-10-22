/*JUNTAR AS 4 TABELAS DAS CAMPANHAS*/

SELECT  *
FROM {{ ref('stg_raw__facebook') }}

UNION ALL

SELECT *
FROM {{ ref('stg_raw__bing') }}

UNION ALL

SELECT *
FROM {{ ref('stg_raw__criteo') }}

UNION ALL

SELECT *
FROM {{ ref('stg_raw__adwords') }}