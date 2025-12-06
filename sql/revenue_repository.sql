CREATE VIEW reports.revenue_report as 
SELECT
SUM(transaction_amount) as total _revenue,
COUNT(transaction_sk) as total_transactions,
FROM fact.transactions,
WHERE status = 'Success'
