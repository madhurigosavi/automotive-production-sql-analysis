-- Show all records: 
SELECT * FROM production_data; 
SELECT * FROM plant_details;
SELECT * FROM product_details;
SELECT * FROM quality_inspection;



-- Pune plant records: 
SELECT * FROM production_data 
WHERE plant_location = 'Pune';

--Total production for Pune: 
SELECT SUM(quantity_produced) AS Total_Prod_Pune 
FROM production_data WHERE plant_location = 'Pune'; 

--Rejection percentage: 
SELECT production_id, ROUND(rejected_quantity * 100.0 / quantity_produced, 2) AS Rejection_Percentage 
FROM production_data; 

SELECT production_id, ROUND(rejected_quantity * 100.0 / quantity_produced, 2) AS Rejection_Percentage 
FROM production_data 
ORDER BY Rejection_Percentage DESC;

--Days where rejection > 6% : 
SELECT *, ROUND((rejected_quantity * 100.0 / quantity_produced), 2) AS Rejection_Percentage 
FROM production_data
WHERE (rejected_quantity * 100.0 / quantity_produced) > 6; 

--total production by plant: 
SELECT plant_location, SUM(quantity_produced) AS total_prod 
FROM production_data
GROUP BY plant_location;


-- Average rejection % per plant:

SELECT plant_location, AVG((rejected_quantity * 100.0 / quantity_produced)) AS Rejection_Percentage_by_Plant
FROM production_data
GROUP BY plant_location;


SELECT 
    plant_location,
    ROUND(
        (SUM(rejected_quantity) * 100.0 / SUM(quantity_produced)), 
        2
    ) AS rejection_percentage
FROM production_data
GROUP BY plant_location;


-- Which product model produced the most units?
SELECT product_model, SUM(quantity_produced) AS total_production
FROM production_data
GROUP BY product_model 
ORDER BY total_production DESC
LIMIT 1;


-- Rejection Rate by Model

SELECT product_model, ROUND(SUM(rejected_quantity) * 100.0 / SUM(quantity_produced),2) AS Rejection_rate
FROM production_data
GROUP BY product_model
ORDER BY Rejection_rate DESC;

-- Which plant produces the most vehicles?

SELECT plant_location, SUM(quantity_produced) AS total_production
FROM production_data
GROUP BY plant_location
ORDER BY total_production DESC
LIMIT 1;


-- Which plant has highest rejection rate?

SELECT plant_location, ROUND(SUM(rejected_quantity) * 100.0 / SUM(quantity_produced),2) AS Rejection_rate
FROM production_data
GROUP BY plant_location
ORDER BY Rejection_rate DESC;

-- Daily Production Trend

SELECT production_date, SUM(quantity_produced) AS daily_production
FROM production_data
GROUP BY production_date
ORDER BY production_date;


-- Plants with High Defect Rate

SELECT plant_location, ROUND(SUM(rejected_quantity) * 100.0 / SUM(quantity_produced),2)
FROM production_data
GROUP BY plant_location
HAVING ROUND(SUM(rejected_quantity) * 100.0 / SUM(quantity_produced),2) > 5;

-- top 3 days with highest rejection percentage

SELECT production_date, ROUND(SUM(rejected_quantity) * 100.0 / SUM(quantity_produced),2) AS rejection_rate
FROM production_data
GROUP BY production_date
ORDER BY rejection_rate DESC
LIMIT 3;

-- total rejected units for each model

SELECT product_model, SUM(rejected_quantity) AS total_rejected_units
FROM production_data
GROUP BY product_model
ORDER BY total_rejected_units DESC;

-- average daily production per plant

SELECT plant_location, ROUND(AVG(quantity_produced),2) AS average_daily_production
FROM production_data
GROUP BY plant_location;

-- Find the product model with the highest rejection rate.

SELECT product_model, ROUND(SUM(rejected_quantity) * 100.0 / SUM(quantity_produced),2) AS Rejection_rate
FROM production_data
GROUP BY product_model
ORDER BY Rejection_rate DESC
LIMIT 1;

-- Find the top 2 models with highest rejection rate.

SELECT product_model, ROUND(SUM(rejected_quantity) * 100.0 / SUM(quantity_produced),2) AS Rejection_rate
FROM production_data
GROUP BY product_model
ORDER BY Rejection_rate DESC
LIMIT 2;

-- Production with Plant Manager

SELECT p.production_id, p.product_model, p.quantity_produced, pd.plant_manager
FROM production_data p JOIN plant_details pd
ON p.plant_location = pd.plant_location;

-- Production with Vehicle Type

SELECT p.production_id, p.product_model, prd.vehicle_type, p.quantity_produced
FROM production_data p JOIN product_details prd
ON p.product_model = prd.product_model;


-- Plant producing above its capacity ratio
SELECT p.plant_location,
SUM(p.quantity_produced) AS total_production, pd.plant_capacity,
ROUND(SUM(p.quantity_produced) * 100.0 / pd.plant_capacity,2) AS capacity_utilization
FROM production_data p
JOIN plant_details pd
ON p.plant_location = pd.plant_location
GROUP BY p.plant_location, pd.plant_capacity;

-- Production records above average production

SELECT *
FROM production_data
WHERE quantity_produced >(
SELECT AVG(quantity_produced)
FROM production_data);

-- Running Production Total

SELECT production_date,
SUM(quantity_produced) AS daily_production,
SUM(SUM(quantity_produced)) OVER (ORDER BY production_date) AS running_total
FROM production_data
GROUP BY production_date
ORDER BY production_date;

-- Rank each plant by total production

SELECT plant_location, SUM(quantity_produced) AS total_production,
RANK() OVER (ORDER BY SUM(quantity_produced) DESC) AS production_rank
FROM production_data
GROUP BY plant_location;

-- Rank production within each plant

SELECT plant_location,product_model,quantity_produced,
RANK() OVER(PARTITION BY plant_location
ORDER BY quantity_produced DESC) AS plant_rank
FROM production_data;

-- Top production record for each plant

SELECT *
FROM (SELECT 
plant_location, product_model, quantity_produced,
ROW_NUMBER() OVER( PARTITION BY plant_location
ORDER BY quantity_produced DESC) AS rn
FROM production_data) t
WHERE rn = 1;

-- Production Category

SELECT product_model, quantity_produced,
CASE WHEN quantity_produced > 600 THEN 'High Production'
WHEN quantity_produced BETWEEN 500 AND 600 THEN 'Medium Production'
ELSE 'Low Production'
END AS production_category
FROM production_data;
