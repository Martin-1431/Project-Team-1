# Project-Team#1

Project-Team#1 is our group project. It is a command-line Java application that connects to a MySQL database for a car dealership domain.

It lets you:
- Search unsold inventory by brand and color
- View a sales report grouped by year
- View the top 2 brands by total sales

The project includes:
- Java application logic in src/AutoDBApp.java
- Database schema in schema.sql
- Sample seed data in data.sql
- Build helpers in Makefile

## What You Need To Run This

Install these first:
- Java JDK 17 or newer
- MySQL Server 8.x
- GNU Make (if you want to use `make compile` and `make run`)

Already included in this repo:
- MySQL JDBC driver jar at `lib/mysql-connector-j-9.6.0.jar`

Optional but recommended:
- PowerShell (Windows) or a terminal where `javac`, `java`, and `mysql` commands are available

Quick checks:
- `java -version`
- `javac -version`
- `mysql --version`
- `make --version` (optional if you use manual commands)

## What This Program Does

When you run the app, it:
1. Loads the MySQL JDBC driver
2. Opens a JDBC connection to database autodb on localhost:3306
3. Displays a text menu in a loop
4. Runs SQL queries based on your menu choice
5. Prints results in the terminal

Menu options:
- 1 Search Inventory
- 2 Sales Report
- 3 Top Brands
- 4 Exit

## How It Works Internally

### Database Connection
The app uses:
- DriverManager.getConnection with URL jdbc:mysql://localhost:3306/autodb
- Username and password values defined as constants in AutoDBApp

It explicitly loads driver class com.mysql.cj.jdbc.Driver before connecting.

### Query 1: Search Inventory
Method: searchInventory

Input:
- Brand name
- Vehicle color

Behavior:
- Uses a prepared statement with parameter placeholders
- Joins Inventory, Vehicle, Model, Brand, Dealer
- Filters for brand, color, and sold = FALSE
- Prints available matching vehicles and dealership

Why this is good:
- PreparedStatement protects against SQL injection for user input

### Query 2: Sales Report
Method: salesReport

Behavior:
- Groups rows in Sales by YEAR(sale_date)
- Counts sales per year
- Prints output like Year: 2024 Sales: 3

### Query 3: Top Brands
Method: topBrands

Behavior:
- Joins Sales -> Vehicle -> Model -> Brand
- Counts sales per brand
- Orders descending by count
- Limits to the top 2 brands

## Prerequisites

Install these before running:
- Java JDK (17 or newer recommended)
- MySQL Server (8.x recommended)
- MySQL JDBC driver jar (already included in lib folder as mysql-connector-j-9.6.0.jar)

## Step-By-Step Setup (First Time)

1. Clone/download this project.
2. Open a terminal in the project root folder (same folder as `README.md` and `Makefile`).
3. Make sure MySQL service is running.
4. Create and populate the database using the commands below.
5. Update DB credentials in `src/AutoDBApp.java`.
6. Compile and run with Make or manual commands.

## Database Setup

### 1. Create database
In MySQL:

CREATE DATABASE autodb;

### 2. Load schema
From project root:

mysql -u root -p autodb < schema.sql

### 3. Load sample data
From project root:

mysql -u root -p autodb < data.sql

After import, you can verify tables loaded:

SHOW TABLES;

## Configure Credentials

Open src/AutoDBApp.java and update:
- USER
- PASS
- DB_URL (if your host/port/database name differ)

Important security note:
- Do not commit real passwords into source code in production projects.

## Build And Run

### Option A: Using Makefile
From project root:

make compile
make run

Other target:

make clean

### Option B: Manual compile and run (PowerShell on Windows)
From project root:

javac -cp "lib/mysql-connector-j-9.6.0.jar" src/*.java -d bin
java -cp "bin;lib/mysql-connector-j-9.6.0.jar" AutoDBApp

## Teammate Quick Start

If someone in our group is running this for the first time, these are the minimum steps:
1. Install Java 17+ and MySQL.
2. Start MySQL.
3. Run:
	- `mysql -u root -p -e "CREATE DATABASE IF NOT EXISTS autodb;"`
	- `mysql -u root -p autodb < schema.sql`
	- `mysql -u root -p autodb < data.sql`
4. Update `USER` and `PASS` in `src/AutoDBApp.java`.
5. Run `make run`.

## Expected Run Flow

1. App prints Connected to database!
2. Menu appears
3. Enter an integer from 1 to 4
4. App executes selected query
5. App returns to menu until you choose Exit

## Common Issues

### No suitable driver found
Cause:
- MySQL JDBC jar is not on classpath

Fix:
- Ensure run command includes lib/mysql-connector-j-9.6.0.jar in -cp

### InputMismatchException after Choose prompt
Cause:
- Non-numeric value entered when app expects menu number

Fix:
- Enter only integers 1, 2, 3, or 4 for menu selection

### Access denied for user
Cause:
- Wrong USER or PASS

Fix:
- Update credentials in AutoDBApp.java
- Confirm MySQL account has access to autodb

### Unknown database autodb
Cause:
- Database not created

Fix:
- Run CREATE DATABASE autodb; then import schema.sql and data.sql

### make: command not found
Cause:
- GNU Make is not installed.

Fix:
- Install Make, or use the manual compile/run commands above.

### Error: Could not find or load main class AutoDBApp
Cause:
- Runtime classpath is incorrect or compile step did not succeed.

Fix:
- Run `make compile` first, then `make run`.
- Confirm `bin/AutoDBApp.class` exists.

## Project Structure

Project-Team#1/
- src/AutoDBApp.java
- schema.sql
- data.sql
- lib/mysql-connector-j-9.6.0.jar
- bin/
- Makefile
- README.md