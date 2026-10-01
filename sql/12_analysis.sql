SELECT
    p.payment_type,
    COUNT(DISTINCT p.order_id)                                       AS orders_count,
    ROUND(SUM(p.payment_value), 2)                                   AS total_payment_value,
    ROUND(SUM(p.payment_value) * 100 / SUM(SUM(p.payment_value)) OVER (), 2) AS value_share_pct
FROM payments p
JOIN orders o ON p.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY p.payment_type
ORDER BY total_payment_value DESC;