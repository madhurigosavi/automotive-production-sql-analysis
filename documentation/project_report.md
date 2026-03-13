Automotive Manufacturing Production Analysis
1 Problem Statement - 

Automotive manufacturing plants must monitor production efficiency and product quality to ensure optimal performance.
High rejection rates can indicate quality issues, machine faults, or operational inefficiencies. Identifying these issues early helps manufacturers reduce waste and improve productivity.

This project analyzes manufacturing production data to identify:

• Production trends
• Plants with high rejection rates
• Product models with quality issues
• Overall manufacturing efficiency
The goal is to use SQL queries to generate insights that help improve manufacturing operations.

2 Database Design - 
The database consists of four relational tables:

production_data : Stores daily production records including:
production_id
product_model
production_date
quantity_produced
rejected_quantity
plant_location

plant_details : Contains information about manufacturing plants including plant manager and capacity.

product_details: Stores product model information including vehicle type and launch year.

quality_inspection : Records quality inspection results for production batches.

These tables are connected through common fields such as plant_location, product_model, and production_id.

3 SQL Analysis Queries - 
Various SQL queries were used to analyze production performance.
Aggregation Queries : 
Used SUM and AVG functions to calculate production totals and rejection rates.

JOIN Queries : 
Joined production data with plant and product details to enrich analysis.

Window Functions : 
Used RANK and running totals to evaluate plant performance.

CASE Statements : 
Used CASE logic to categorize production levels into high, medium, and low categories.

Subqueries :
Used nested queries to identify production records above average production.

4 Key Insights - 
The SQL analysis revealed several important insights:

• Model Z produced the highest number of vehicles, indicating a strong production focus on electric vehicles.
• Certain plants showed higher rejection rates, suggesting potential quality control issues.
• Production output varied across different days, highlighting fluctuations in manufacturing activity.
• Plant ranking analysis identified top-performing plants, which can be used as performance benchmarks.
• Production classification helped categorize production batches, making it easier to identify high and low output periods.

These insights can help manufacturing managers improve efficiency and reduce product defects.
