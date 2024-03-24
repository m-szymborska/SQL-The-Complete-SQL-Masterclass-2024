SELECT
SUM(amount),
DATE(payment_date) as day,
LAG(SUM(amount)) OVER(ORDER BY DATE(payment_date)) as prev_day,
SUM(amount)-LAG(SUM(amount)) OVER(ORDER BY DATE(payment_date)) as dif_day,
ROUND((SUM(amount)-LAG(SUM(amount)) OVER(ORDER BY DATE(payment_date)))
/LAG(SUM(amount)) OVER(ORDER BY DATE(payment_date))*100,2) as percentage
FROM payment
GROUP BY DATE(payment_date)
ORDER BY DATE(payment_date)