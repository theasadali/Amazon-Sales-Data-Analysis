USE SalesDataAnalysis;

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

--analysing what payment method most customers prefer
SELECT Payment_Method, COUNT(*) FROM sales_data GROUP BY Payment_Method;