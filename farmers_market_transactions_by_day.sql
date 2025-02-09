#Total customers, transactions, and revenue grouped by market date in order to see
#the busiest times of the season
SELECT 
    m.market_date,
    COUNT(DISTINCT cp.customer_id) AS total_customers,
    COUNT(cp.customer_id) AS total_purchases,
    SUM(cp.quantity * cp.cost_to_customer_per_qty) AS total_revenue
FROM
    farmers_market.market_date_info m
        LEFT JOIN
    farmers_market.customer_purchases cp ON m.market_date = cp.market_date
GROUP BY m.market_date