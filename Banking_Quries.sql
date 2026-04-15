SELECT * FROM loan_data;

SELECT branch, 
       SUM(transaction_amount::numeric) AS total_transaction, 
       SUM(account_balance::numeric) AS total_balance
FROM loan_data
GROUP BY branch;


SELECT account_type, 
       SUM(transaction_amount::numeric) AS total_transaction, 
       SUM(account_balance::numeric) AS total_balance
FROM loan_data
GROUP BY account_type;

SELECT transaction_type, 
       SUM(transaction_amount::numeric) AS total_transaction, 
       SUM(account_balance::numeric) AS total_balance
FROM loan_data
GROUP BY transaction_type;

SELECT SUM(transaction_amount::numeric) AS grand_total_transaction, 
       SUM(account_balance::numeric) AS grand_total_balance
FROM loan_data;

SELECT ROUND(AVG(transaction_amount::numeric), 2) AS avg_transaction_amount
FROM loan_data;

SELECT branch, transaction_type, 
       SUM(transaction_amount::numeric) AS total_transaction, 
       SUM(account_balance::numeric) AS total_balance
FROM loan_data
GROUP BY branch, transaction_type
ORDER BY branch;

SELECT transaction_type, COUNT(account_id) AS total_persons
FROM loan_data
GROUP BY transaction_type;

SELECT transaction_type, 
       ROUND(AVG(transaction_amount::numeric), 2) AS avg_transaction
FROM loan_data
GROUP BY transaction_type;

SELECT customer_name, account_balance, branch
FROM loan_data
ORDER BY account_balance DESC
LIMIT 10;

SELECT currency, 
       SUM(transaction_amount::numeric) AS total_transaction, 
       SUM(account_balance::numeric) AS total_balance
FROM loan_data
GROUP BY currency;

SELECT customer_name, transaction_amount, account_balance
FROM loan_data
WHERE transaction_amount > account_balance;

SELECT branch, 
    COUNT(*) AS total_customers,
    MAX(account_balance) AS max_balance, 
    MIN(account_balance) AS min_balance,
    ROUND(AVG(account_balance::numeric), 2) AS avg_balance,
    MAX(transaction_amount) AS max_transaction, 
    MIN(transaction_amount) AS min_transaction,
    SUM(transaction_amount::numeric) AS total_transaction_volume
FROM loan_data
GROUP BY branch
ORDER BY total_transaction_volume DESC;

SELECT account_type, COUNT(DISTINCT currency) AS unique_currencies
FROM loan_data
GROUP BY account_type;

SELECT branch, COUNT(*) AS low_balance_customers
FROM loan_data
WHERE account_balance < 5000
GROUP BY branch;

SELECT 
    branch,
    COUNT(*) FILTER (WHERE account_type = 'Fixed Deposit') AS fixed_deposit_count,
    COUNT(*) FILTER (WHERE account_type = 'Recurring Deposit') AS recurring_deposit_count,
    COUNT(*) FILTER (WHERE account_type = 'Savings') AS savings_count,
    COUNT(*) FILTER (WHERE account_type = 'Currency') AS currency_count,
    COUNT(*) AS total_accounts
FROM loan_data
GROUP BY branch
ORDER BY total_accounts DESC;

SELECT 
    ROUND(SUM(account_balance::numeric) / SUM(transaction_amount::numeric), 2) AS liquidity_ratio
FROM loan_data;

SELECT customer_name, transaction_amount, branch
FROM loan_data
WHERE transaction_amount > 4000
ORDER BY transaction_amount DESC;

SELECT branch, 
       (MAX(account_balance) - MIN(account_balance)) AS balance_range
FROM loan_data
GROUP BY branch
ORDER BY balance_range DESC;

SELECT customer_name, account_balance,
CASE 
    WHEN account_balance < 20000 THEN 'Silver'
    WHEN account_balance BETWEEN 20000 AND 70000 THEN 'Gold'
    ELSE 'Platinum'
END AS customer_category
FROM loan_data;

SELECT customer_name, branch, account_balance, transaction_amount
FROM loan_data
WHERE account_balance < 1000 AND transaction_amount < 500;

SELECT currency, 
       ROUND(AVG(transaction_amount::numeric), 2) AS avg_trans_vol
FROM loan_data
GROUP BY currency
ORDER BY avg_trans_vol DESC;

SELECT branch,
       COUNT(*) FILTER (WHERE transaction_type = 'Debit') AS debit_count,
       COUNT(*) FILTER (WHERE transaction_type = 'Credit') AS credit_count
FROM loan_data
GROUP BY branch;

SELECT * FROM loan_data;