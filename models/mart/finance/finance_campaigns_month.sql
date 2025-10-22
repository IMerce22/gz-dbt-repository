/* The finance team ask you to deliver the same table but aggregated for each month.*/

SELECT
    DATE_TRUNC(date_date, MONTH) AS month_date
    , ROUND (SUM (ads_margin ), 2) AS ads_margin
    , ROUND (SUM (Average_Basket), 2) AS Average_Basket
    , ROUND (SUM (operational_margin), 2) AS operational_margin
    , ROUND (SUM (ads_cost), 2) AS ads_cost
    , ROUND (SUM (ads_impression)) AS ads_impression
    , ROUND (SUM (ads_clicks), 2) AS ads_clicks
    , COUNT (ads_quantity) AS ads_quantity
    , ROUND (SUM (Total_revenue), 2) AS Total_revenue
    , ROUND (SUM (purchase_cost), 2) AS purchase_cost
    , ROUND (SUM (Total_shipping_fees), 2) AS Total_shipping_fees
    , ROUND (SUM (Total_log_costs), 2) AS Total_log_costs

FROM {{ ref('finance_campaigns_day') }}
GROUP BY month_date
ORDER BY month_date ASC
