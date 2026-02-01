WITH CONTENTS AS (
    SELECT 
        user_id,
        COUNT(DISTINCT content_id) AS distinctcontents
    FROM REACTIONS
    GROUP BY user_id
    HAVING COUNT(DISTINCT content_id) >= 5
),
REACTION_COUNTS AS (
    SELECT 
        user_id,
        reaction,
        COUNT(*) AS total_reactions
    FROM REACTIONS 
    GROUP BY user_id, reaction
)
select 
     user_id,
     reaction as dominant_reaction,
     reaction_ratio
FROM
(
SELECT
    R.user_id,
    R.reaction,
    -- We cast to FLOAT to avoid integer division issues in some SQL dialects
    ROUND(CAST(R.total_reactions AS FLOAT) / C.distinctcontents, 2) as reaction_ratio
FROM REACTION_COUNTS R
INNER JOIN CONTENTS C ON R.user_id = C.user_id
) AS K
WHERE reaction_ratio > 0.6
ORDER BY reaction_ratio DESC,user_id;