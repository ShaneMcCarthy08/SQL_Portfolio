/*Protfolio Project 1: SQL queries on supermarket data, description of
query will be in comment above each block of code. 

Data set used: https://www.kaggle.com/datasets/aungpyaeap/supermarket-sales

Code by: Shane McCarthy
*/

/*Find which city has the most supermarket members*/
SELECT City, COUNT(*) as Member_Count_by_City FROM supermarket_sales
WHERE Customer_type like '%Member%'
GROUP BY City
ORDER BY Member_Count_by_City desc;

/*Find which branch of the supermarket has the largest gross income
in the past three months */
SELECT Branch, CONCAT('$', ROUND(SUM(gross_income), 2)) AS Gross_income_by_branch
FROM supermarket_sales
GROUP BY Branch
ORDER BY Gross_income_by_branch desc;

/*Find which branch has the overall highest customer satisfaction rating */
SELECT BRANCH, ROUND(SUM(Rating), 2) AS Satisfaction_Rating_by_branch 
FROM supermarket_sales
GROUP BY Branch
ORDER BY Satisfaction_Rating_by_branch desc;

/*Find the top hours in a day that are most profitable */
SELECT CONCAT(SUBSTRING(Time, 1, 2), ':00') AS Time_hour, CONCAT('$', ROUND(SUM(gross_income), 2)) AS Gross_income_by_hour 
FROM supermarket_sales
GROUP BY Time_hour
ORDER BY Gross_income_by_hour desc;

/*Find which product line had the highest revenue from the last three months */
SELECT Product_line, CONCAT('$', ROUND(SUM(Unit_price * Quantity), 2)) as Sales_per_product_line 
From supermarket_sales
GROUP BY Product_line
ORDER BY Sales_per_product_line desc; 






