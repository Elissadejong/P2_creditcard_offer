# P2_creditcard_offer

## TAKING ON THE ROLE OF A RISK ANALYST AT THE BIG BANK OF THE PEOPLE
Far away, in a country with lots of sunshine, there is a bank in a town called Big: The Big Bank of the People. 
Currently i am working there as a risk analyst. 
Apart from the other banking and loan services, the bank also provides credit card services which are a very important source of revenue for the bank. The bank wants to understand the demographics and other characteristics of those customers accepting a credit card offer and those not accepting a credit card offer. Usually the observational data for these kind of problems is limited in that often the company sees only those who respond to an offer. To tackle this, the bank designed a focused-marketing study, with a sample of 18,000 current bank customers. This focused-marketing approach allows the bank to gain information on who does and who does not respond to the offer, and to use existing demographic data already available on each customer.

## OBJECTIVES
The main task was to build a model that provides insight into why bank customers accept credit card offers. There are also other potential areas of opportunities that the bank wanted to understand from the data. The senior management also posed these other questions to help them better understand their customers.

## THE DATA
The dataset of the study consisted of information on 18,000 current bank customers. These are the definitions of data points provided:

- Customer Number: A sequential number assigned to the customers (this column is hidden and excluded – this unique identifier will not be used directly)
- Offer Accepted: Did the customer accept (Yes) or reject (No) the offer
- Reward: The type of reward program offered for the card
- Mailer Type: Letter or postcard
- Income Level: Low, Medium or High
- #Bank Accounts Open: How many non-credit-card accounts are held by the customer
- Overdraft Protection: Does the customer have overdraft protection on their checking account(s) (Yes or No)
- Credit Rating: Low, Medium or High
- #Credit Cards Held: The number of credit cards held at the bank
- #Homes Owned: The number of homes owned by the customer
- Household Size: Number of individuals in the family
- Own Your Home: Does the customer own their home? (Yes or No)
- Average Balance: Average account balance (across all accounts over time)
- Q1, Q2, Q3 and Q4 Balance: Average balance for each quarter in the last year

## THE WORKFLOW
To obtain the objectives, the questions of the senior management were researched using both Python (using Jupyter Notebook), as well as SQL (using MySQLWorkbench) and Tableau (for visualization purposes). 

### 1. Importing the needed libraries
For this research, the following libraries were used:
Pandas, Numpy, Matplotlib, Seaborn, Sklearn, Scipy & Statsmodels.

### 2. Importing the data
Using Pandas, the data was imported into Python as a dataframe. 

### 3. Taking a peek at the data
A sneak peek at the data revealed its columns, its size/shape, the different types of data in the dataset and whether there were any duplicated values among the data (this turned out to not be the case).

### 4. Getting the data into SQL
In MySQLWorkbench, a new database was made, named "credit_card_classification". In order to use the Table Data Import Wizard, a tool to import data in bulk into MySQLWorkbench, it was essential to standardize the headers of the columns. In order to obtain the so-called snake_case, all characters were converted to lower case and each space was replaced with a _ using a for loop. After, the hashtags from the headers were deleted using the same type of for loop. 
Again using Pandas, a copy of the data was generated into a CSV file(creditcardmarketing_sql.csv) and imported into SQL, using the aforementioned Table Data Import Wizard. The table was named "credit_card_data". With a query selecting everything from the table "credit_card_data" it was apparent that the data was imported in a correct manner. The senior management requested that the column "q4_balance" was dropped from the table, as it wouldn't be used in the analysis in SQL. To drop "q4_balance" a query was executed and the colmun was deleted from the table (the query to check if it worked was set to return a limit of 10 rows, as per request). However, the IF EXISTS syntax did not work, hence this query is only visible in the file(sql_queries.sql) as a comment (line 5 & 6). Finally, a query was executed to count the number of rows in the data. The result showed that the number of rows imported into SQL was 17,976 instead of 18,000. The reason for this is unknown, but the loss of data of the 24 rows was deemed acceptable, because of its proportion to the dataset. 

### 5. Answering the posed questions in SQL
Senior management wanted to have answers to the following questions:
- What are the unique values in the column `offer_accepted`?
- What are the unique values in the column `reward`?
- What are the unique values in the column `mailer_type`?
- What are the unique values in the column `credit_cards_held`?
- What are the unique values in the column `household_size`?
            For each of these questions, the DISTINCT syntax was used.

- Arrange the data in a decreasing order by the average_balance of the house. Return only the customer_number of the top 10 customers with the highest average_balances in your data.
            A query was made using the ORDER BY syntax and limiting the returning results to 10. 

- What is the average balance of all the customers in your data?
            The questions was answered by querying the average of the average_balance column using the AVG syntax.

- What is the average balance of the customers grouped by `income_level`? The returned result should have only two columns, income level and `Average balance` of the customers. Use an alias to change the name of the second column.
- What is the average balance of the customers grouped by `number_of_bank_accounts_open`? The returned result should have only two columns, `number_of_bank_accounts_open` and `Average balance` of the customers. Use an alias to change the name of the second column.
- What is the average number of credit cards held by customers for each of the credit card ratings? The returned result should have only two columns, rating and average number of credit cards held. Use an alias to change the name of the second column.
            Using a combination of 

- Is there any correlation between the columns `credit_cards_held` and `number_of_bank_accounts_open`? You can analyse this by grouping the data by one of the variables and then aggregating the results of the other column. Visually check if there is a positive correlation or negative correlation or no correlation between the variables.
You might also have to check the number of customers in each category (ie number of credit cards held) to assess if that category is well represented in the dataset to include it in your analysis. For eg. If the category is under-represented as compared to other categories, ignore that category in this analysis
- Our managers are only interested in the customers with the following properties:
    - Credit rating medium or high
    - Credit cards held 2 or less
    - Owns their own home
    - Household size 3 or more
Write a simple query to find what are the options available for them? Can you filter the customers who accepted the offers here?

- Your managers want to find out the list of customers whose average balance is less than the average balance of all the customers in the database. Write a query to show them the list of such customers. You might need to use a subquery for this problem.

- Since this is something that the senior management is regularly interested in, create a view called Customers__Balance_View1 of the same query.

- What is the number of people who accepted the offer vs number of people who did not?

- Your managers are more interested in customers with a credit rating of high or medium. What is the difference in average balances of the customers with high credit card rating and low credit card rating?

- In the database, which all types of communication (mailer_type) were used and with how many customers?

- Provide the details of the customer that is the 11th least Q1_balance in your database.



