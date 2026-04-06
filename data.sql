-- Brands
INSERT INTO Brand (name) VALUES
('Toyota'), ('Ford'), ('BMW'), ('Honda');

-- Models
INSERT INTO Model (brand_id, name, body_style) VALUES
(1, 'Camry', 'Sedan'),
(1, 'Corolla', 'Sedan'),
(2, 'Mustang', 'Convertible'),
(2, 'F-150', 'Truck'),
(3, 'X5', 'SUV'),
(3, '3 Series', 'Sedan'),
(4, 'Civic', 'Sedan'),
(4, 'Accord', 'Sedan');

-- Vehicles (20+)
INSERT INTO Vehicle VALUES
('VIN100',1,'Red','V4','Auto','2023-01-01'),
('VIN101',1,'Blue','V4','Auto','2023-01-02'),
('VIN102',2,'Black','V4','Manual','2023-01-03'),
('VIN103',3,'Red','V8','Manual','2023-01-04'),
('VIN104',3,'Blue','V8','Auto','2023-01-05'),
('VIN105',4,'White','V6','Auto','2023-01-06'),
('VIN106',5,'Black','V6','Auto','2023-01-07'),
('VIN107',6,'Silver','V4','Auto','2023-01-08'),
('VIN108',7,'Red','V4','Auto','2023-01-09'),
('VIN109',8,'Blue','V4','Auto','2023-01-10'),
('VIN110',1,'White','V4','Auto','2023-01-11'),
('VIN111',2,'Gray','V4','Manual','2023-01-12'),
('VIN112',3,'Yellow','V8','Manual','2023-01-13'),
('VIN113',4,'Black','V6','Auto','2023-01-14'),
('VIN114',5,'Blue','V6','Auto','2023-01-15'),
('VIN115',6,'Red','V4','Auto','2023-01-16'),
('VIN116',7,'Silver','V4','Auto','2023-01-17'),
('VIN117',8,'White','V4','Auto','2023-01-18');

-- Dealers
INSERT INTO Dealer (name, location) VALUES
('Dallas Auto','Dallas'),
('Fort Worth Cars','Fort Worth'),
('Austin Motors','Austin');

-- Customers (more variety)
INSERT INTO Customer (name, address, phone, gender, income) VALUES
('John Doe','123 St','111','Male',60000),
('Jane Smith','456 Ave','222','Female',85000),
('Mike Brown','789 Rd','333','Male',45000),
('Sara White','321 Blvd','444','Female',95000),
('Chris Green','654 Ln','555','Male',72000);

-- Inventory
INSERT INTO Inventory (vin, dealer_id, arrival_date, sold) VALUES
('VIN100',1,'2023-12-01',FALSE),
('VIN101',1,'2023-12-02',TRUE),
('VIN102',2,'2023-12-03',FALSE),
('VIN103',2,'2023-12-04',TRUE),
('VIN104',3,'2023-12-05',FALSE),
('VIN105',3,'2023-12-06',TRUE);

-- Sales (spread across years)
INSERT INTO Sales (vin, dealer_id, customer_id, sale_date, price) VALUES
('VIN101',1,1,'2023-02-01',24000),
('VIN103',2,2,'2023-03-15',55000),
('VIN105',3,3,'2023-04-10',40000),
('VIN111',1,4,'2024-01-10',22000),
('VIN112',2,5,'2024-02-20',60000),
('VIN113',3,1,'2024-03-25',35000),
('VIN114',1,2,'2025-01-15',50000),
('VIN115',2,3,'2025-02-10',27000),
('VIN116',3,4,'2025-03-05',30000);