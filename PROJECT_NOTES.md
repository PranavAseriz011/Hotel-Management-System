# 🏨 Hotel Management System — Project Notes

## 📌 Project Information

**Project Name:** Hotel Management System  
**Database:** HotelSalesDB  
**Database Tool:** MySQL Workbench  
**Language:** SQL  
**Repository:** [Hotel Management System](https://github.com/PranavAseriz011/Hotel-Management-System)

---

## 🎯 Project Purpose

This project was created to practice SQL and relational database concepts through a real-world hotel management scenario.

The system manages:

- Customers
- Rooms
- Staff
- Bookings
- Payments

The project focuses on database creation, data manipulation, data retrieval, analysis, table relationships, joins, subqueries, views, indexes, stored procedures, and triggers.

---

## 🗄️ Database Design

The database used in this project is:

```sql
CREATE DATABASE HotelSalesDB;
USE HotelSalesDB;
```

### Main Tables

| Table | Purpose |
|---|---|
| `Customers` | Stores customer details |
| `Rooms` | Stores room types, prices, and capacity |
| `Staff` | Stores hotel staff information |
| `Bookings` | Stores customer booking information |
| `Payments` | Stores payment information related to bookings |

---

## 🔑 Primary Keys

Each main table contains a unique identifier:

- `Customers.CustomerID`
- `Rooms.RoomID`
- `Staff.StaffID`
- `Bookings.BookingID`
- `Payments.PaymentID`

These identifiers are used to uniquely identify records.

---

## 🔗 Foreign Key Relationships

The database uses foreign keys to connect related tables.

### Bookings

`Bookings.CustomerID` → `Customers.CustomerID`

`Bookings.RoomID` → `Rooms.RoomID`

`Bookings.StaffID` → `Staff.StaffID`

### Payments

`Payments.BookingID` → `Bookings.BookingID`

The overall relationship structure is:

```text
Customers ──────► Bookings ◄────── Staff
                     ▲
                     │
                   Rooms
                     │
                     ▼
                  Payments
```

---

## 🧱 Table Structure

### Customers

Stores information about hotel customers.

Important columns:

- `CustomerID`
- `FirstName`
- `LastName`
- `Email`
- `Phone`
- `City`

### Rooms

Stores information about available rooms.

Important columns:

- `RoomID`
- `RoomType`
- `PricePerNight`
- `Capacity`

### Staff

Stores information about hotel employees.

Important columns:

- `StaffID`
- `FirstName`
- `LastName`
- `Role`
- `Phone`
- `Email`

### Bookings

Stores customer booking information.

Important columns:

- `BookingID`
- `CustomerID`
- `RoomID`
- `StaffID`
- `CheckInDate`
- `CheckOutDate`
- `TotalAmount`

### Payments

Stores payment information.

Important columns:

- `PaymentID`
- `BookingID`
- `PaymentDate`
- `PaymentMethod`
- `Amount`

---

## 💻 SQL Concepts Practiced

### Basic SQL

- Database creation
- Table creation
- Data types
- Primary keys
- Foreign keys
- Constraints
- AUTO_INCREMENT
- UNIQUE

### DML

- INSERT
- UPDATE
- DELETE

### DQL

- SELECT
- DISTINCT

### Clauses

- WHERE
- ORDER BY
- GROUP BY
- HAVING
- LIMIT

### Operators

- Comparison operators
- Logical operators
- BETWEEN
- LIKE
- IN
- NOT
- AND
- OR

### Functions

- COUNT()
- SUM()
- AVG()
- MIN()
- MAX()
- CONCAT()
- CONCAT_WS()

### Advanced SQL

- Subqueries
- INNER JOIN
- SELF JOIN
- Multi-table JOINs
- Views
- Indexes
- Stored Procedures
- Triggers

---

## 🔍 Important Query Examples

### Filtering Data

```sql
SELECT *
FROM Rooms
WHERE Capacity > 2;
```

### Aggregation

```sql
SELECT PaymentMethod, AVG(Amount) AS AvgAmount
FROM Payments
GROUP BY PaymentMethod;
```

### GROUP BY with HAVING

```sql
SELECT CustomerID, SUM(TotalAmount) AS TotalSpent
FROM Bookings
GROUP BY CustomerID
HAVING TotalSpent > 50000;
```

### Subquery

```sql
SELECT *
FROM Rooms
WHERE Capacity > (
    SELECT AVG(Capacity)
    FROM Rooms
);
```

### Multi-table JOIN

```sql
SELECT CONCAT(C.FirstName, ' ', C.LastName) AS CustomerName,
       P.Amount
FROM Customers AS C
JOIN Bookings AS B
    ON C.CustomerID = B.CustomerID
JOIN Payments AS P
    ON B.BookingID = P.BookingID;
```

### SELF JOIN

```sql
SELECT *
FROM Customers AS C1
JOIN Customers AS C2
    ON C1.City = C2.City
WHERE C1.CustomerID < C2.CustomerID;
```

---

## 👁️ Views

Views were practiced to simplify frequently used queries.

### Staff Contact View

```sql
CREATE VIEW StaffContact AS
SELECT FirstName, LastName, Role, Phone
FROM Staff;
```

### Booking Summary View

```sql
CREATE VIEW BookingSummary AS
SELECT BookingID, CustomerID, RoomID, TotalAmount
FROM Bookings;
```

---

## ⚡ Triggers

Triggers were practiced to automate database actions and validate data.

### Delete Payment After Booking Deletion

```sql
CREATE TRIGGER DeletePaymentAfterBooking
AFTER DELETE ON Bookings
FOR EACH ROW
BEGIN
    DELETE FROM Payments
    WHERE BookingID = OLD.BookingID;
END;
```

### Prevent Invalid Booking Dates

A trigger was practiced to ensure that the checkout date is not earlier than the check-in date.

### Update Booking Total After Payment

A trigger was also practiced to update the booking total when a new payment is inserted.

---

## 📊 Query Categories Practiced

The project contains queries involving:

- Customer information
- Room information
- Staff information
- Booking analysis
- Payment analysis
- Filtering
- Sorting
- Aggregation
- String manipulation
- Subqueries
- SELF JOIN
- Multi-table JOINs
- Views
- Triggers
- Data modification

---

## 📸 Query Result Screenshots

Important query results are stored in:

```text
screenshots/query-results/
```

The documented examples include:

- Rooms SELF JOIN
- Staff SELF JOIN
- Customer & Payment JOIN
- Credit Card Payment JOIN
- Rooms Subquery
- Customers with Multiple Bookings
- Customers from Same City

---

## 📁 Project Structure

```text
Hotel-Management-System/
│
├── README.md
├── PROJECT_NOTES.md
├── .gitignore
│
├── database/
│   ├── 01_database_setup.sql
│   ├── 02_data_insert.sql
│   └── 03_database_schema.md
│
├── queries/
│   └── 01_queries.sql
│
└── screenshots/
    └── query-results/
```

---

## ▶️ Execution Workflow

### Step 1 — Create Database

Run:

```text
database/01_database_setup.sql
```

This creates the database and required tables.

### Step 2 — Insert Data

Run:

```text
database/02_data_insert.sql
```

This populates the tables with project data.

### Step 3 — Execute Queries

Run queries from:

```text
queries/01_queries.sql
```

### Step 4 — Review Results

Query result screenshots are stored in:

```text
screenshots/query-results/
```

---

## 🧠 Key Learning Outcomes

Through this project, I strengthened my understanding of:

- Relational database design
- Primary and foreign key relationships
- Data manipulation
- Data filtering and sorting
- Aggregation and grouping
- Subqueries
- Table joins
- SELF JOIN
- Multi-table JOINs
- Views
- Indexes
- Stored Procedures
- Triggers
- Real-world SQL problem solving

---

## 🚀 Project Progress

### Completed

- Database design
- Table creation
- Data insertion
- Basic SQL queries
- Filtering and sorting
- Aggregate functions
- GROUP BY and HAVING
- String functions
- Subqueries
- Views
- Indexes
- Stored Procedures
- INNER JOIN
- SELF JOIN
- Multi-table JOINs
- Triggers
- Query result screenshots
- GitHub documentation

---

## 👨‍💻 Author

**Pranav Aseri**

Data Analytics Enthusiast | SQL • Python • Power BI • Excel

[GitHub](https://github.com/PranavAseriz011)
