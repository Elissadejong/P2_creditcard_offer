USE credit_card_classification;

SELECT * FROM credit_card_data;

-- ALTER TABLE credit_card_data 
-- DROP COLUMN q4_balance;

SELECT * FROM credit_card_data
LIMIT 10;

SELECT COUNT(*) FROM credit_card_data;
-- for an unknown reason 24 rows were not imported into SQL.

-- What are the unique values in the column `offer_accepted`?
SELECT DISTINCT(offer_accepted) AS values_offer_accepted
FROM credit_card_data;

-- What are the unique values in the column `reward`?
SELECT DISTINCT(reward) AS values_reward
FROM credit_card_data;

-- What are the unique values in the column `mailer_type`?
SELECT DISTINCT(mailer_type) AS values_mailer_type
FROM credit_card_data;

-- What are the unique values in the column `credit_cards_held`?
SELECT DISTINCT(credit_cards_held) AS values_credit_cards_held
FROM credit_card_data;

-- What are the unique values in the column `household_size`?
SELECT DISTINCT(household_size) AS values_household_size
FROM credit_card_data;

-- Arrange the data in a decreasing order by the average_balance of the house. 
-- Return only the customer_number of the top 10 customers with the highest average_balances in your data.
SELECT customer_number, average_balance 
FROM credit_card_data
ORDER BY average_balance DESC
LIMIT 10;

-- What is the average balance of all the customers in your data?
SELECT AVG(average_balance) AS 'Average average_balance'
FROM credit_card_data;

-- What is the average balance of the customers grouped by `Income Level`? 
-- The returned result should have only two columns, income level and `Average balance` of the customers. 
-- Use an alias to change the name of the second column.
SELECT income_level, AVG(average_balance) AS 'Average balance'
FROM credit_card_data
GROUP BY income_level;

-- What is the average balance of the customers grouped by `number_of_bank_accounts_open`? 
-- The returned result should have only two columns, `number_of_bank_accounts_open` and `Average balance` of the customers. 
-- Use an alias to change the name of the second column.
SELECT bank_accounts_open, AVG(average_balance) AS 'Average balance'
FROM credit_card_data
GROUP BY bank_accounts_open;

-- What is the average number of credit cards held by customers for each of the credit card ratings? 
-- The returned result should have only two columns, rating and average number of credit cards held. 
-- Use an alias to change the name of the second column.
SELECT credit_rating, AVG(credit_cards_held) AS 'Average number of credit cards held'
FROM credit_card_data
GROUP BY credit_rating;

-- Is there any correlation between the columns `credit_cards_held` and `number_of_bank_accounts_open`? 
-- You can analyse this by grouping the data by one of the variables and then aggregating the results of the other column. 
-- Visually check if there is a positive correlation or negative correlation or no correlation between the variables.
-- You might also have to check the number of customers in each category (ie number of credit cards held) to assess if that category is well represented in the dataset to include it in your analysis. 
-- For eg. If the category is under-represented as compared to other categories, ignore that category in this analysis
SELECT credit_cards_held, COUNT(customer_number)
FROM credit_card_data
GROUP BY credit_cards_held;
-- holding 4 credit cards is a category very much under-represented in the dataset.
-- hence this category will be excluded from the analysis.
SELECT bank_accounts_open, AVG(credit_cards_held) AS 'Average credit cards held'
FROM credit_card_data
WHERE credit_cards_held <> 4
GROUP BY bank_accounts_open;
-- it seems there is no correlation, but using Python it will be checked again using correlational analysis and plotting to be sure.  

-- Managers only interested in customers having:
-- Credit rating medium or high
-- Credit cards held 2 or less
-- Owns their own home
-- Household size 3 or more
-- For the rest of the things, they are not too concerned. 
-- Write a simple query to find what are the options available for them? 
-- Can you filter the customers who accepted the offers here? 
SELECT * 
FROM credit_card_data
WHERE credit_rating <> 'Low'
AND credit_cards_held <= 2
AND homes_owned <> 0
AND household_size >= 3
AND offer_accepted = 'Yes';

-- Our managers want to find out the list of customers whose average balance is less than the average balance of all the customers in the database. 
-- Write a query to show them the list of such customers. You might need to use a subquery for this problem. 
SELECT * 
FROM credit_card_data
WHERE average_balance < 
(SELECT AVG(average_balance) AS 'Average average_balance'
FROM credit_card_data);

-- Since this is something that the senior management is regularly interested in, create a view called Customers__Balance_View1 of the same query.
CREATE OR REPLACE VIEW Customers_Balance_View1 AS
SELECT * 
FROM credit_card_data
WHERE average_balance < 
(SELECT AVG(average_balance) AS 'Average average_balance'
FROM credit_card_data);

-- What is the number of people who accepted the offer vs number of people who did not?
SELECT offer_accepted, COUNT(customer_number) AS 'Number of customers'
FROM credit_card_data
GROUP BY offer_accepted;

-- Your managers are more interested in customers with a credit rating of high or medium. 
-- What is the difference in average balances of the customers with high credit card rating and low credit card rating?
SELECT AVG(CASE WHEN credit_rating = 'High' THEN average_balance END) AS high_avg, AVG(CASE WHEN credit_rating = 'Low' THEN average_balance END) AS low_avg,
(AVG(CASE WHEN credit_rating = 'High' THEN average_balance END) - AVG(CASE WHEN credit_rating = 'Low' THEN average_balance END)
) AS difference
FROM credit_card_data;

-- In the database, which all types of communication (mailer_type) were used and with how many customers?
SELECT mailer_type, COUNT(customer_number) AS 'Used with number of customers'
FROM credit_card_data
GROUP BY mailer_type;

-- Provide the details of the customer that is the 11th least Q1_balance in your database.
WITH cte_q1 AS 
(SELECT *, 
ROW_NUMBER() OVER(ORDER BY q1_balance ASC) AS row_rank
FROM credit_card_data)
SELECT * FROM cte_q1
WHERE row_rank = 11;




