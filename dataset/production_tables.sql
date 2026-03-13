-- Table: production_data

CREATE TABLE production_data (
    production_id INT PRIMARY KEY,
    product_model VARCHAR(50),
    production_date DATE,
    quantity_produced INT,
    rejected_quantity INT,
    plant_location VARCHAR(50)
);

CREATE TABLE production_data (
    production_id INT PRIMARY KEY,
    product_model VARCHAR(50),
    production_date DATE,
    quantity_produced INT,
    rejected_quantity INT,
    plant_location VARCHAR(50)
);

INSERT INTO production_data VALUES
(1, 'Model X', '2025-01-01', 500, 20, 'Pune'),
(2, 'Model Y', '2025-01-01', 450, 18, 'Chakan'),
(3, 'Model Z', '2025-01-02', 600, 25, 'Pune'),
(4, 'Model X', '2025-01-02', 520, 30, 'Pimpri'),
(5, 'Model Y', '2025-01-03', 480, 15, 'Chakan'),
(6, 'Model Z', '2025-01-03', 610, 40, 'Pune'),
(7, 'Model X', '2025-01-04', 530, 22, 'Pimpri'),
(8, 'Model Y', '2025-01-04', 490, 35, 'Chakan'),
(9, 'Model Z', '2025-01-05', 620, 28, 'Pune'),
(10, 'Model X', '2025-01-05', 510, 45, 'Pimpri'),
(11, 'Model Y', '2025-01-06', 470, 12, 'Chakan'),
(12, 'Model Z', '2025-01-06', 630, 50, 'Pune'),
(13, 'Model X', '2025-01-07', 540, 18, 'Pimpri'),
(14, 'Model Y', '2025-01-07', 460, 20, 'Chakan'),
(15, 'Model Z', '2025-01-08', 640, 55, 'Pune'),
(16, 'Model X', '2025-01-08', 550, 16, 'Pimpri'),
(17, 'Model Y', '2025-01-09', 500, 27, 'Chakan'),
(18, 'Model Z', '2025-01-09', 650, 38, 'Pune'),
(19, 'Model X', '2025-01-10', 560, 21, 'Pimpri'),
(20, 'Model Y', '2025-01-10', 520, 33, 'Chakan');


-- This gives extra information about each plant.

CREATE TABLE plant_details (
    plant_location VARCHAR(50) PRIMARY KEY,
    plant_manager VARCHAR(50),
    plant_capacity INT,
    city VARCHAR(50)
);

INSERT INTO plant_details VALUES
('Pune', 'Rajesh Sharma', 1000, 'Pune'),
('Chakan', 'Anita Kulkarni', 900, 'Pune'),
('Pimpri', 'Suresh Patil', 850, 'Pune');

-- This describes each product model.

CREATE TABLE product_details (
    product_model VARCHAR(50) PRIMARY KEY,
    vehicle_type VARCHAR(50),
    launch_year INT
);

INSERT INTO product_details VALUES
('Model X', 'SUV', 2022),
('Model Y', 'Sedan', 2023),
('Model Z', 'Electric', 2024);

-- This shows inspection results done by quality teams.

CREATE TABLE quality_inspection (
    inspection_id INT PRIMARY KEY,
    production_id INT,
    inspector_name VARCHAR(50),
    inspection_result VARCHAR(20),
    inspection_date DATE
);

INSERT INTO quality_inspection VALUES
(1,1,'Amit','Pass','2025-01-01'),
(2,2,'Riya','Pass','2025-01-01'),
(3,3,'Vikas','Fail','2025-01-02'),
(4,4,'Neha','Pass','2025-01-02'),
(5,5,'Amit','Pass','2025-01-03'),
(6,6,'Riya','Fail','2025-01-03'),
(7,7,'Vikas','Pass','2025-01-04'),
(8,8,'Neha','Pass','2025-01-04'),
(9,9,'Amit','Fail','2025-01-05'),
(10,10,'Riya','Pass','2025-01-05');
