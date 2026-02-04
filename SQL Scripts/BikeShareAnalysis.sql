WITH cte AS (
    SELECT * FROM bike_share_yr_0
    UNION ALL
    SELECT * FROM bike_share_yr_1
)

SELECT 
    dteday,
    season,
    a.yr,
    weekday,
    hr,
    rider_type,
    riders,
    price,
    COGS,
    riders * price AS revenue,
    (riders * price) - (riders * COGS) AS profit -- Total profit calculation
FROM cte a
LEFT JOIN cost_table b
    ON a.yr = b.yr;
