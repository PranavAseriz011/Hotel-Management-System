# 🏨 Hotel Management System

A SQL-based Hotel Management System designed to manage customers, rooms, staff, bookings, and payments while practicing real-world SQL database operations and analytical queries.

## 📌 Project Overview

This project is a relational database system developed using MySQL for managing core hotel operations.

The database stores and manages information related to:

- Customers
- Rooms
- Staff
- Bookings
- Payments

The project also includes SQL queries covering data retrieval, filtering, aggregation, subqueries, views, joins, self joins, and triggers.

## 🎯 Project Objectives

- Design a relational database for hotel management.
- Create and manage tables using SQL.
- Store customer, room, staff, booking, and payment data.
- Perform data analysis using SQL queries.
- Practice advanced SQL concepts such as joins, subqueries, views, and triggers.
- Understand relationships between multiple database tables.

## 🛠️ Technologies Used

- **MySQL**
- **MySQL Workbench**
- **SQL**
- **Git & GitHub**

## 🗄️ Database Structure

The project contains five main tables:

| Table | Description |
|---|---|
| `Customers` | Stores customer information |
| `Rooms` | Stores room details and pricing |
| `Staff` | Stores hotel staff information |
| `Bookings` | Stores customer room bookings |
| `Payments` | Stores booking payment information |

## 🔗 Table Relationships

```text
Customers
    │
    │ CustomerID
    ▼
Bookings
    │
    │ BookingID
    ▼
Payments

Staff ──────► Bookings
Room ───────► Bookings
