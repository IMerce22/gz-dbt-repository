/*ads_margin = operational_margin - ads_cost*/


SELECT
    coalesce(f.date_date, c.date_date) AS date_date
    , ROUND (f.operational_margin - c.ads_cost, 2) AS ads_margin 
    , f.Average_Basket
    , f.operational_margin
    , c.ads_cost
    , c.ads_impression
    , c.ads_clicks
    , CAST(c.ads_quantity AS INT64) AS ads_quantity
    , f.Total_revenue
    , f.purchase_cost
    , f.Total_shipping_fees
    , f.Total_log_costs

FROM {{ ref('finance_days') }} AS f
LEFT JOIN {{ ref('int_campaigns_day') }} AS c
USING (date_date)
GROUP BY 
    date_date
    , f.Average_Basket
    , f.operational_margin
    , c.ads_cost
    , c.ads_impression
    , c.ads_clicks
    , c.ads_quantity
    , f.Total_revenue
    , f.purchase_cost
    , f.Total_shipping_fees
    , f.Total_log_costs
ORDER BY date_date DESC
