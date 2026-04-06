CREATE TABLE Brand (
    brand_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE Model (
    model_id INT PRIMARY KEY AUTO_INCREMENT,
    brand_id INT,
    name VARCHAR(50),
    body_style VARCHAR(50),
    FOREIGN KEY (brand_id) REFERENCES Brand(brand_id)
);

CREATE TABLE Vehicle (
    vin VARCHAR(20) PRIMARY KEY,
    model_id INT,
    color VARCHAR(30),
    engine VARCHAR(50),
    transmission VARCHAR(50),
    manufacture_date DATE,
    FOREIGN KEY (model_id) REFERENCES Model(model_id)
);

CREATE TABLE Dealer (
    dealer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    location VARCHAR(100)
);

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    address VARCHAR(200),
    phone VARCHAR(20),
    gender VARCHAR(10),
    income INT
);

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    vin VARCHAR(20),
    dealer_id INT,
    customer_id INT,
    sale_date DATE,
    price DECIMAL(10,2),
    FOREIGN KEY (vin) REFERENCES Vehicle(vin),
    FOREIGN KEY (dealer_id) REFERENCES Dealer(dealer_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE Inventory (
    inventory_id INT PRIMARY KEY AUTO_INCREMENT,
    vin VARCHAR(20),
    dealer_id INT,
    arrival_date DATE,
    sold BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (vin) REFERENCES Vehicle(vin),
    FOREIGN KEY (dealer_id) REFERENCES Dealer(dealer_id)
);

CREATE TABLE Supplier (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100)
);

CREATE TABLE Part (
    part_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100)
);

CREATE TABLE Supplies (
    supplier_id INT,
    part_id INT,
    model_id INT,
    PRIMARY KEY (supplier_id, part_id, model_id),
    FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id),
    FOREIGN KEY (part_id) REFERENCES Part(part_id),
    FOREIGN KEY (model_id) REFERENCES Model(model_id)
);

CREATE TABLE Plant (
    plant_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    location VARCHAR(100)
);

CREATE TABLE Manufactures (
    plant_id INT,
    part_id INT,
    model_id INT,
    PRIMARY KEY (plant_id, part_id, model_id),
    FOREIGN KEY (plant_id) REFERENCES Plant(plant_id),
    FOREIGN KEY (part_id) REFERENCES Part(part_id),
    FOREIGN KEY (model_id) REFERENCES Model(model_id)
);

CREATE INDEX idx_sales_date ON Sales(sale_date);
CREATE INDEX idx_vehicle_model ON Vehicle(model_id);
CREATE INDEX idx_inventory_dealer ON Inventory(dealer_id);
CREATE INDEX idx_customer_income ON Customer(income);