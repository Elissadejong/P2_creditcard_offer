# P2_creditcard_offer

![card](/Users/elissadejong/P2_creditcard_offer/UZoH.gif)

## TAKING ON THE ROLE OF A RISK ANALYST AT THE BIG BANK OF THE PEOPLE
Far away, in a country with lots of sunshine, there is a bank in a town called Big: The Big Bank of the People. 
Currently i am working there as a risk analyst. 
Apart from the other banking and loan services, the bank also provides credit card services which are a very important source of revenue for the bank. The focused-marketing approach at hand allows the bank to gain information on who does and who does not respond to a creditcard offer, and to use existing demographic data already available on each customer.

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

### 4.1 Answering the posed questions in SQL
Senior management gained some more knowledgde through the SQL queries which were executed. Please refer to the .sql file in the repo for the questions & results. 

### 5. Data prep
In this chapter the dataset was checked for non-alphanumerical characters, null values, correlations, type of distribution and outliers. The correlations of the numerical variables were checked using the corr() method, heatmapping & the Variance Inflation Factor. The correlations of the categorical variables were checked by executing Chi-Square tests. BoxCox transformation was applied to the continuous variables (average balance and the average balances per quarter) in order to reach a bit more normal of a distribution. Outliers were removed using a function for the continuous variables and capped for the count variables.
In the final part of this chapter, using ColumnTransformer, the data is prepared for fitting a model. The categorical variables were either OneHotEncoded or OrdinalEncoded and the continuous variables were standardized. 

### 6. - 11.
Fitting & training models using different techniques and combinations:
- Logistic regression vs. KNN
- Entire dataset vs. less features 
- UpSampling (SMOTE) vs. DownSampling (class_weight)
- Standardizing continuous variables vs. standardizing all independent variables

### 12. - 13.
In this section you will find the tentative conclusion, as more work and time still need to be invested.

### 14. 
Please refer to the Tableau file for some interesting insights about the dataset.  




