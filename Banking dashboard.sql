CREATE DATABASE banking_case;
USE banking_case;
show tables;
select * from customer;
SELECT
    COUNT(DISTINCT client_id) AS total_clients
    

SELECT * FROM banking_case LIMIT 10;

DESCRIBE banking_case;

ALTER TABLE banking_case
ADD COLUMN client_id INT AUTO_INCREMENT PRIMARY KEY FIRST;

ALTER TABLE banking_case
ADD COLUMN client_id VARCHAR(20);



SELECT 
    SUM(deposit_amount) AS total_deposits
FROM banking_case;

SELECT 
    COUNT(DISTINCT client_id) AS total_clients
FROM banking_case;

SELECT 
    SUM(`Bank Deposits`) AS total_deposits
FROM banking_case;

SELECT 
    SUM(`Bank Loans`) AS total_loans
FROM banking_case;
SELECT 
    AVG(`Credit Card Balance`) AS avg_credit_balance
FROM banking_case;

SELECT 
    AVG(`Checking Accounts` + `Saving Accounts` + `Foreign Currency Account`) AS avg_total_balance
FROM banking_case;

SELECT 
    CASE 
        WHEN `Bank Deposits` > 0 OR `Bank Loans` > 0 THEN 'Active'
        ELSE 'Inactive'
    END AS client_status,
    COUNT(*) AS total_clients
FROM banking_case
GROUP BY client_status;

SELECT
    CASE 
        WHEN DATEDIFF(CURDATE(), STR_TO_DATE(`Joined Bank`, '%d-%m-%Y')) < 365 THEN '< 1 Year'
        WHEN DATEDIFF(CURDATE(), STR_TO_DATE(`Joined Bank`, '%d-%m-%Y')) < 1825 THEN '< 5 Years'
        WHEN DATEDIFF(CURDATE(), STR_TO_DATE(`Joined Bank`, '%d-%m-%Y')) < 3650 THEN '< 10 Years'
        ELSE '> 10 Years'
    END AS engagement_duration,
    COUNT(*) AS client_count
FROM banking_case
GROUP BY engagement_duration;

SELECT 
    BRId,
    SUM(`Bank Deposits`) AS total_deposits
FROM banking_case
GROUP BY BRId
ORDER BY total_deposits DESC
LIMIT 5;

SELECT 
    BRId,
    ROUND(SUM(`Bank Loans`) / NULLIF(SUM(`Bank Deposits`), 0), 2) AS loan_to_deposit_ratio
FROM banking_case
GROUP BY BRId;

SELECT 
    `Risk Weighting`,
    COUNT(*) AS total_clients
FROM banking_case
GROUP BY `Risk Weighting`
ORDER BY `Risk Weighting`;

SELECT 
    SUM(`Bank Deposits`) AS total_deposits,
    SUM(`Bank Loans`) AS total_loans,
    SUM(`Business Lending`) AS total_business_lending
FROM banking_case;

SELECT 
    AVG(`Checking Accounts`) AS avg_checking,
    AVG(`Saving Accounts`) AS avg_saving,
    AVG(`Foreign Currency Account`) AS avg_foreign_currency
FROM banking_case;

SELECT 
    `Loyalty Classification`,
    COUNT(*) AS total_clients
FROM banking_case
GROUP BY `Loyalty Classification`
ORDER BY total_clients DESC;

SELECT 
    BRId,
    SUM(`Bank Deposits`) AS branch_total_deposits
FROM banking_case
GROUP BY BRId
ORDER BY branch_total_deposits DESC;

SELECT 
    AVG(`Credit Card Balance`) AS avg_credit_card_balance,
    AVG(`Amount of Credit Cards`) AS avg_credit_card_count
FROM banking_case;

























