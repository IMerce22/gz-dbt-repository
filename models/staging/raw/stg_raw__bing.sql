with 

source as (

    select * from {{ source('raw', 'bing') }}

),

renamed as (

    select
        CONCAT(paid_source, '_', CAST(date_date AS STRING), '_', campaign_key) AS campaign_id
        , date_date
        , paid_source
        , campaign_key
        , campgn_name AS campaign_name
        , CAST(ads_cost AS FLOAT64) AS ads_cost
        , impression
        , click

    from source

)

select * from renamed