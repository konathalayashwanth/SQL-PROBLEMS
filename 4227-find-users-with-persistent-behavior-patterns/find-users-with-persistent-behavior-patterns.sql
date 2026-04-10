
WITH consecutivedays AS
(
SELECT 
     user_id,
     action_date,
     action,
     ROW_NUMBER() OVER(PARTITION BY user_id,action ORDER BY action_date)  as rn
FROM activity
)
SELECT 
    user_id,
    action,
    MAX(rn) as streak_length,
    MIN(action_date)  as start_date,
    MAX(action_date)  as end_date
FROM consecutivedays
GROUP BY user_id,action
HAVING MAX(rn) >= 5
ORDER BY streak_length DESC,user_id;