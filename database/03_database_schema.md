# Hotel Management System — Database Schema

## Database

`HotelSalesDB`

## Tables

### 1. Customers

Stores customer information.

| Column | Data Type | Description |
| --- | --- | --- |
| CustomerID | INT | Primary key |
| FirstName | VARCHAR(50) | Customer first name |
| LastName | VARCHAR(50) | Customer last name |
| Email | VARCHAR(100) | Unique email |
| Phone | VARCHAR(15) | Customer phone |
| City | VARCHAR(50) | Customer city |

### 2. Rooms

Stores hotel room information.

| Column | Data Type | Description |
| --- | --- | --- |
| RoomID | INT | Primary key |
| RoomType | VARCHAR(50) | Type of room |
| PricePerNight | DECIMAL(10,2) | Room price per night |
| Capacity | INT | Maximum room capacity |

### 3. Staff

Stores hotel staff information.

| Column | Data Type | Description |
| --- | --- | --- |
| StaffID | INT | Primary key |
| FirstName | VARCHAR(50) | Staff first name |
| LastName | VARCHAR(50) | Staff last name |
| Role | VARCHAR(50) | Staff role |
| Phone | VARCHAR(15) | Staff phone |
| Email | VARCHAR(100) | Staff email |

### 4. Bookings

Stores customer room booking information.

| Column | Data Type | Description |
| --- | --- | --- |
| BookingID | INT | Primary key |
| CustomerID | INT | References Customers |
| RoomID | INT | References Rooms |
| StaffID | INT | References Staff |
| CheckInDate | DATE | Check-in date |
| CheckOutDate | DATE | Check-out date |
| TotalAmount | DECIMAL(10,2) | Total booking amount |

### 5. Payments

Stores payment information for bookings.

| Column | Data Type | Description |
| --- | --- | --- |
| PaymentID | INT | Primary key |
| BookingID | INT | References Bookings |
| PaymentDate | DATE | Payment date |
| PaymentMethod | VARCHAR(50) | Method of payment |
| Amount | DECIMAL(10,2) | Payment amount |

## Relationships

- `Customers` → `Bookings` through `CustomerID`
- `Rooms` → `Bookings` through `RoomID`
- `Staff` → `Bookings` through `StaffID`
- `Bookings` → `Payments` through `BookingID`

## Project Notes

## Project

Hotel Management System

## Database Name

HotelSalesDB

## Database Tables

- Customers
- Rooms
- Staff
- Bookings
- Payments

## Project Goal

Analyze hotel management data using SQL and solve a set of analytical and business-related questions.

## SQL Concepts Covered

- SELECT
- WHERE
- ORDER BY
- GROUP BY
- HAVING
- Aggregate Functions
- JOINs
- Subqueries
- CTEs
- Window Functions
- Date Functions
- String Functions

## Learning Approach

Questions will be solved one by one with a focus on understanding the SQL logic and concepts behind each query.
