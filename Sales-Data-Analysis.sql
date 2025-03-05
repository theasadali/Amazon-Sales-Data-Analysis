USE SalesDataAnalysis;

--retrieving total number of sales transactions
SELECT COUNT(*) AS 'TOTAL SALES TRANSACTION' FROM sales_data;

--identifying unique product categories and counting
SELECT DISTINCT Product_Category AS 'Product Categories'
FROM sales_data;

SELECT COUNT(DISTINCT Product_Category) AS 'Number of Categories'
FROM sales_data

--listing distinct sales representative and their assigned regions
SELECT DISTINCT Sales_Rep, Region 
FROM sales_data
GROUP BY Sales_Rep, Region
ORDER BY Sales_Rep;

--calculating total sales per region
SELECT Region, ROUND(SUM(Sales_Amount),2) AS 'Total Sales'
FROM sales_data
GROUP BY REGION
ORDER BY 'Total Sales';

--determine top 5 sales representatives based on total sales.
SELECT TOP 5 Sales_Rep, COUNT(*) AS 'Total Sales' FROM sales_data
GROUP BY Sales_Rep
ORDER BY 'Total Sales' DESC

--computing average sales amount per transaction
SELECT ROUND(AVG(Sales_Amount),2) AS 'Avg Sales Amount' 
FROM sales_data;

--finding the best-selling product category in terms of quantity sold. 
SELECT Product_Category, SUM(Quantity_Sold) AS 'Sold Product'
FROM sales_data
GROUP BY Product_Category
ORDER BY 'Sold Product' DESC

--Determine the highest revenue-generating product category
SELECT Product_Category, ROUND(SUM(Sales_Amount),2) AS 'Total Revenue'
FROM sales_data
GROUP BY Product_Category
ORDER BY 'Total Revenue' DESC

--Calculate the profit margin (Unit Price - Unit Cost) for each product.
SELECT Product_ID, ROUND((Unit_Price - Unit_Cost),2) 
AS 'Profit Margin' 
FROM sales_data
ORDER BY 'Profit Margin' DESC;

--count the number of transactions for new vs. returning customers
SELECT Customer_Type, COUNT(*) AS 'Total Transactions'
FROM sales_data
GROUP BY Customer_Type

--Identify the average discount percentage applied across all sales
SELECT AVG(Discount) as 'Average Discount' 
FROM sales_data

--analysing what payment method most customers prefer
SELECT Payment_Method, COUNT(*) AS 'No. of Transactions'
FROM sales_data 
GROUP BY Payment_Method
ORDER BY [No. of Transactions] DESC;

--finding the month with the highest total sales amount
SELECT TOP 1 FORMAT(Sale_Date, 'MMMM') AS [Month with higest total sales], 
ROUND(SUM(Sales_Amount),2) AS [Total Sales]
FROM sales_data
GROUP BY FORMAT(Sale_Date, 'MMMM')
ORDER BY [Total Sales] DESC


























--EXTRAS
--fetching everything from sales_data table to analyze columns
SELECT * FROM sales_data;

--seeing the total sales
SELECT COUNT(*) FROM sales_data;

--calculating profit
SELECT ROUND(Unit_Cost,2) AS 'Unit Cost', 
ROUND(Unit_Price,2) as 'Selling Price', 
ROUND((Unit_Price - Unit_Cost),2) AS Profit
FROM sales_data;

--calculating total cost and total profit from sales grouped by categories
--we can see that Furniture category is the most profited category and in constrast to food which is least profitable category
--we can also group by region to see the sale and profit of different categories in different regions
SELECT Product_Category, SUM(ROUND(Unit_Cost,2)) AS 'Total Unit Cost', 
SUM(ROUND(Unit_Price,2)) as 'Total Selling Price', 
SUM(ROUND((Unit_Price - Unit_Cost),2)) AS 'Total Profit'
FROM sales_data
GROUP BY Product_Category
ORDER BY 'Total Profit' DESC;

--checking the number of sales between specifice dates
SELECT COUNT(*) FROM sales_data
WHERE Sale_Date BETWEEN '2023-02-03' AND '2023-04-11';

--checking the sum of sales between specifice dates
SELECT SUM(Sales_Amount) AS 'Total Sales' FROM sales_data
WHERE Sale_Date BETWEEN '2023-02-03' AND '2024-03-04';

--checking total quantiy sold w.r.t category in all regions
SELECT Product_Category, SUM(Quantity_Sold) as 'Total Quantity Sold'
FROM sales_data
GROUP BY Product_Category;

--checking total quantiy sold w.r.t category in specific regions
SELECT Product_Category, Region, SUM(Quantity_Sold) as 'Total Quantity Sold'
FROM sales_data
GROUP BY Product_Category, Region
ORDER BY Region;

--understanding the type of customers new/returning
SELECT Customer_Type, COUNT(*) FROM sales_data
GROUP BY Customer_Type;

