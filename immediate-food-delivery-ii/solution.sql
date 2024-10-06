SELECT 
    ROUND(SUM(CASE WHEN D1.order_date = D1.customer_pref_delivery_date THEN 1 ELSE 0 END) * 100.0 /
    COUNT(D1.order_date), 2) AS immediate_percentage
FROM
    Delivery D1
WHERE
    D1.order_date = (
        SELECT MIN(D2.order_date)
        FROM Delivery D2
        WHERE D1.customer_id = D2.customer_id
    )