/* Write your T-SQL query statement below */

WITH cte AS (
    SELECT 
        user_id,
        MIN(event_date) AS mindate,
        MAX(event_date) AS maxdate,
        SUM(
            CASE 
                WHEN event_type = 'downgrade' THEN 1
                ELSE 0
            END
        ) AS dow,
        MIN(monthly_amount) AS mins,
        MAX(monthly_amount) AS maxs
    FROM subscription_events 
    GROUP BY user_id
),
cte2 AS (
    SELECT 
        user_id,
        LAST_VALUE(event_type) OVER (
            PARTITION BY user_id 
            ORDER BY event_date  
            ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
        ) AS lasts,
        LAST_VALUE(plan_name) OVER (
            PARTITION BY user_id 
            ORDER BY event_date  
            ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
        ) AS plans,
        LAST_VALUE(monthly_amount) OVER (
            PARTITION BY user_id 
            ORDER BY event_date  
            ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
        ) AS current_monthly_amount
    FROM subscription_events
)
SELECT DISTINCT 
    c.user_id,
    s.plans AS current_plan,
    s.current_monthly_amount,
    c.maxs AS max_historical_amount,
    DATEDIFF(DAY, c.mindate, c.maxdate) AS days_as_subscriber
FROM cte c
JOIN cte2 s
    ON c.user_id = s.user_id
WHERE 
    s.lasts != 'cancel'
    AND c.dow > 0
    AND DATEDIFF(DAY, c.mindate, c.maxdate) >= 60
    AND (c.mins * 1.0 / c.maxs) <= 0.5
ORDER BY 
    DATEDIFF(DAY, c.mindate, c.maxdate) DESC, 
    c.user_id ASC;