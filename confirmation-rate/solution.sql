WITH ConfirmationCounts AS (
    SELECT
        s.user_id,
        COUNT(CASE WHEN c.action = 'confirmed' THEN 1 END) AS confirmed_count,
        COUNT(c.user_id) AS total_count
    FROM
        Signups s
    LEFT JOIN 
        Confirmations c ON s.user_id = c.user_id
    GROUP BY
        s.user_id
)

SELECT 
    user_id,
    ROUND(
        CASE 
        WHEN total_count = 0 THEN 0
        ELSE confirmed_count * 1.0/ total_count
        END,
    2)AS confirmation_rate
FROM 
    ConfirmationCounts;