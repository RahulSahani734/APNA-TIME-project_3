-- creating the data base
CREATE DATABASE supply_chain;
USE supply_chain;

-- creating table 
CREATE TABLE supply_chain_data (
    Warehouse_ID VARCHAR(10),
    Location VARCHAR(100),
    Current_Stock INT,
    Demand_Forecast INT,
    Lead_Time_Days INT,
    Shipping_Time_Days INT,
    Stockout_Risk INT,
    Operational_Cost INT,
    Supplier_ID VARCHAR(10),
    Product_Category VARCHAR(100),
    Monthly_Sales INT,
    Order_Processing_Time FLOAT,
    Return_Rate FLOAT,
    Customer_Rating FLOAT,
    Warehouse_Capacity INT,
    Storage_Cost INT,
    Transportation_Cost INT,
    Backorder_Quantity INT,
    Damaged_Goods INT,
    Employee_Count INT
);
-- checking out the secure file paths 
SHOW VARIABLES LIKE "secure_file_priv";

-- loading the data into the created table
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/supply_chain_extended_data.csv"
INTO TABLE supply_chain_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- now we do analysis  
-- Top 5 Warehouses by Monthly Sales
SELECT Warehouse_ID, Location, Monthly_Sales
FROM supply_chain_data
ORDER BY Monthly_Sales DESC
LIMIT 5;

-- Total Operational Cost per Location
SELECT Location, SUM(Operational_Cost) AS Total_Operational_Cost
FROM supply_chain_data
GROUP BY Location
ORDER BY Total_Operational_Cost DESC;

-- Warehouses with High Stockout Risk (>20)
SELECT Warehouse_ID, Location, Stockout_Risk
FROM supply_chain_data
WHERE Stockout_Risk > 20
ORDER BY Stockout_Risk DESC;

-- Average Return Rate by Product Category
SELECT Product_Category, AVG(Return_Rate) AS Avg_Return_Rate
FROM supply_chain_data
GROUP BY Product_Category
ORDER BY Avg_Return_Rate DESC;

