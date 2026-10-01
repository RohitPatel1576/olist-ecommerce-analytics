SELECT
    c.customer_state,
    COUNT(*)                                  AS delivered_orders,
    SUM(o.is_late)                            AS late_orders,
    ROUND(SUM(o.is_late) * 100 / COUNT(*), 2) AS late_pct
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.is_late IS NOT NULL
GROUP BY c.customer_state
HAVING COUNT(*) >= 100
ORDER BY late_pct DESC;