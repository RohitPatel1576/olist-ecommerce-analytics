SELECT
    COUNT(*)                                  AS delivered_orders,
    SUM(is_late)                              AS late_orders,
    ROUND(SUM(is_late) * 100 / COUNT(*), 2)   AS late_pct
FROM orders
WHERE is_late IS NOT NULL;