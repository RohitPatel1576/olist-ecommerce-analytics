SELECT
    COUNT(DISTINCT o.order_id)                                   AS delivered_orders,
    ROUND(SUM(oi.price), 2)                                      AS total_revenue,
    ROUND(SUM(oi.price) / COUNT(DISTINCT o.order_id), 2)         AS avg_order_value
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered';