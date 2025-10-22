/*JUNTAR AS 4 TABELAS DAS CAMPANHAS*/

{{ config(materialized='table') }}

{{ dbt_utils.union_relations(
    relations=[
        ref('stg_raw__facebook'),
        ref('stg_raw__bing'),
        ref('stg_raw__criteo'),
        ref('stg_raw__adwords')
    ],
    include='all',
) }}
