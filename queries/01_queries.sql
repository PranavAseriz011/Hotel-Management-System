-- ============================================
-- QUESTION 1
-- ============================================

-- The accounts team wants to check payments made via UPI
-- to measure digital adoption.

SELECT *
FROM Payments
WHERE PaymentMethod = 'UPI';


-- ============================================
-- QUESTION 2
-- ============================================

-- Show the Unique firstname of customers 

SELECT DISTINCT FirstName
FROM Customers;

-- ============================================
-- QUESTION 3
-- ============================================

-- Delete the all rooms of capacity 1 

SELECT * 
FROM Rooms        -- to check the all rooms where capacity is 1 
WHERE Capacity = 1;

DELETE FROM Rooms
WHERE Capacity = 1;

SET SQL_SAFE_UPDATES = 0;

-- ============================================
-- QUESTION 4
-- ============================================

-- Display each customer name and no 

SELECT CONCAT(FirstName,'-',Phone) AS NameAndNo
FROM Customers;

-- ============================================
-- QUESTION 5
-- ============================================

-- show the roomid 10 booking

SELECT *
FROM Bookings
WHERE RoomID = 10;

-- ============================================
-- QUESTION 6
-- ============================================

-- Identify rooms whose Capacity is greater than the average Capacity of all rooms.

SELECT *
FROM Rooms 
WHERE Capacity > (
     SELECT AVG(Capacity)
	 FROM Rooms 
);

-- ============================================
-- QUESTION 7
-- ============================================

-- Create a VIEW StaffContact showing Staff FirstName, LastName, Role, and Phone

CREATE VIEW StaffContact AS 
SELECT FirstName, LastName, Role, Phone
FROM Staff;

-- ============================================
-- QUESTION 8
-- ============================================

-- The receptionist wants to offer Suite rooms under ₹7000 to business travelers.

SELECT * 
FROM Rooms 
WHERE PricePerNight < 7000
AND 
RoomType = 'Suite';

-- ============================================
-- QUESTION 9
-- ============================================

-- The admin wants to see email addresses sorted by LastName from the Customers table.

SELECT Email
FROM Customers 
ORDER BY LastName;

-- ============================================
-- QUESTION 10
-- ============================================

-- Show staff full names combined into one column.

SELECT CONCAT(FirstName,' ',LastName) AS FullName
FROM Staff;

-- ============================================
-- QUESTION 11
-- ============================================

-- Display all payment details in one line using concat ws 

SELECT CONCAT_WS('-', PaymentID, PaymentDate, PaymentMethod)
AS PaymentInfo
FROM Payments;

-- ============================================
-- QUESTION 12
-- ============================================

-- The hotel wants to display the 2 most expensive rooms for VIP guests.

SELECT *
FROM Rooms 
ORDER BY PricePerNight DESC
LIMIT 2;

-- ============================================
-- QUESTION 13
-- ============================================

-- Show each BookingID with its CheckIn and CheckOut dates combined.

SELECT CONCAT_WS('-',BookingID,CheckInDate,CheckOutDate)
AS BookingInfo 
FROM bookings;

-- ============================================
-- QUESTION 14
-- ============================================

-- Finance wants to calculate the average Amount per PaymentMethod

SELECT PaymentMethod,AVG(Amount) AS AvgAmount
FROM Payments
GROUP BY PaymentMethod;

-- ============================================
-- QUESTION 15
-- ============================================

-- Find the city where average CustomerID is greater than 50

SELECT City,AVG(CustomerID) AS AvgCustomerID
FROM Customers 
GROUP BY City
HAVING AVG(CustomerID) > 50;

-- ============================================
-- QUESTION 16
-- ============================================

-- Find all bookings where TotalAmount is greater than the average TotalAmount of all bookings.

SELECT *
FROM Bookings
WHERE TotalAmount > (
SELECT AVG(TotalAmount)
FROM Bookings
);

-- ============================================
-- QUESTION 17
-- ============================================

-- Display the last 2 rooms 

SELECT *
FROM Rooms
ORDER BY RoomID DESC
LIMIT 2;

-- ============================================
-- QUESTION 18
-- ============================================

-- Find all payments where Amount is less than 1500

SELECT * 
FROM Payments
WHERE Amount < 1500;

-- ============================================
-- QUESTION 19
-- ============================================

-- Show the total revenue handled by each StaffID.

SELECT StaffID,SUM(TotalAmount) AS TotRev
FROM Bookings
GROUP BY StaffID;

-- ============================================
-- QUESTION 20
-- ============================================

-- The manager wants to see all customers from Mumbai to check city-wise marketing campaigns. 

SELECT * 
FROM Customers 
WHERE City = 'Mumbai';

-- ============================================
-- QUESTION 21
-- ============================================

-- Display the 3 lowest booking amounts. 

SELECT TotalAmount
FROM Bookings 
ORDER BY TotalAmount ASC
LIMIT 3;

-- ============================================
-- QUESTION 22
-- ============================================

-- Insert 5 new room records with type, price, and capacity into the Rooms table.

INSERT INTO Rooms 
(RoomType, PricePerNight, Capacity)
VALUES 
('Double',7745,2),
('Single',6745,1),
('Deluxe',10000,2),
('VIP',20000,1),
('suite',6989,2);

-- ============================================
-- QUESTION 23
-- ============================================

-- Show all unique CustomerIDs from bookings. 

SELECT 
DISTINCT CustomerID
FROM Bookings;

-- ============================================
-- QUESTION 24
-- ============================================

-- The marketing team wants to update the FirstName of CustomerID = 30 to 'Rahul'

UPDATE Customers 
SET FirstName = 'Rahul'
WHERE CustomerID = 30;

-- ============================================
-- QUESTION 25
-- ============================================

-- List all bookings ordered by CheckInDate.

SELECT * 
FROM Bookings
ORDER BY CheckInDate ASC;

-- ============================================
-- QUESTION 26
-- ============================================

-- Show all rooms where capacity is greater than 2

SELECT * 
FROM Rooms 
WHERE Capacity > 2;

-- ============================================
-- QUESTION 27
-- ============================================

-- List staff emails ordered by their roles.

SELECT Email,Role
FROM Staff
ORDER BY Role;

-- ============================================
-- QUESTION 28
-- ============================================

-- Display each customer’s full name and city using CONCAT_WS. 

SELECT CONCAT_WS('-',FirstName,LastName,City) AS FullNameAndCity
FROM Customers;

-- ============================================
-- QUESTION 29
-- ============================================

-- Show the first 4 customers’ full names only

SELECT CONCAT(FirstName,' ',LastName) AS FullName
FROM Customers 
LIMIT 4;

-- ============================================
-- QUESTION 30
-- ============================================

-- Show each staff’s role with their full name

SELECT CONCAT_WS(' ',FirstName,LastName) AS FullName,
Role
FROM Staff;

-- ============================================
-- QUESTION 31
-- ============================================

-- Management wants to find the average StaffID per role.

 SELECT Role,AVG(StaffID) AS AvgStaffID
 FROM Staff
 GROUP BY Role;

-- ============================================
-- QUESTION 32
-- ============================================

  -- List all bookings handled by StaffID = 2. 
 
 SELECT * 
 FROM Bookings
 WHERE StaffID = 2;

-- ============================================
-- QUESTION 33
-- ============================================

  -- Display the first 3 staff alphabetically by their first names.
 
 SELECT *
 FROM Staff
 ORDER BY FirstName ASC 
 LIMIT 3;

-- ============================================
-- QUESTION 34
-- ============================================

  --  The front desk manager wants to see customers where FirstName = 'Anirudh' AND City = 'Nagpur' for personal attention.

SELECT *
FROM Customers 
WHERE FirstName = 'Anirudh'
AND City = 'Nagpur';

-- ============================================
-- QUESTION 35
-- ============================================

--  Show all unique payment methods in descending order.

SELECT DISTINCT PaymentMethod
FROM Payments 
ORDER BY PaymentMethod DESC;

-- ============================================
-- QUESTION 36
-- ============================================

-- Insert 5 staff members into the Staff table with their role, phone, and email. 

INSERT INTO Staff (FirstName, LastName, Role, Phone, Email)
VALUES 
('Ankush','More','Chef',9762444934,'ankush@gmail.com'),
('Rohit','Sharma','Manager',9876543210,'rohit@gmail.com'),
('Sneha','Patil','Receptionist',9765432109,'sneha@gmail.com'),
('Vikas','Jadhav','Housekeeper',9654321098,'vikas@gmail.com'),
('Priya','Deshmukh','Accountant',9543210987,'priya@gmail.com');

-- ============================================
-- QUESTION 37
-- ============================================

-- The hotel manager wants to review bookings where CheckInDate is after '2024 01-01' to analyze recent occupancy.

SELECT * 
FROM Bookings 
WHERE CheckInDate > '2024-01-01';

-- ============================================
-- QUESTION 38
-- ============================================

--  List all customers whose FirstName is 'Rahul' for a loyalty program.

SELECT *
FROM Customers 
WHERE FirstName = 'Rahul';

-- ============================================
-- QUESTION 39
-- ============================================

--  Show all unique room types offered by the hotel.

SELECT DISTINCT 
RoomType
FROM Rooms;

-- ============================================
-- QUESTION 40
-- ============================================

-- Identify customers who spent more than 50,000 in total. 

SELECT CustomerID,SUM(TotalAmount) AS TotSpent
FROM Bookings
GROUP BY CustomerID
HAVING TotSpent > 50000; 

-- ============================================
-- QUESTION 41
-- ============================================

-- Delete all customers from the city 'TestCity'.

SET SQL_SAFE_UPDATES = 0;

DELETE FROM Customers 
WHERE City = 'TestCity';

-- ============================================
-- QUESTION 42
-- ============================================

-- The manager wants to see staff whose Email ends with '@tcs.in' for corporate tie-ups

SELECT *
FROM Staff
WHERE Email LIKE '%@tcs.in';

-- ============================================
-- QUESTION 43
-- ============================================

-- The analytics team wants to list all cities where maximum CustomerID is more than 100

SELECT City,MAX(CustomerID) AS MaxCusId
FROM Customers 
GROUP BY City
HAVING MaxCusId > 100;

-- ============================================
-- QUESTION 44
-- ============================================

-- Show all unique capacities in descending order.

SELECT DISTINCT Capacity 
FROM Rooms
ORDER BY Capacity DESC;

-- ============================================
-- QUESTION 45
-- ============================================

--  List staff working as Managers. 

SELECT *
FROM Staff
WHERE Role = 'Manager';

-- ============================================
-- QUESTION 46
-- ============================================

-- Display each payment’s ID, Method, Amount in one line.

SELECT CONCAT_WS('-',PaymentID,PaymentMethod,Amount)
AS PaymentInfo
FROM Payments;

-- ============================================
-- QUESTION 47
-- ============================================

--  Show the first 4 payments only. 

SELECT *
FROM Payments
LIMIT 4;

-- ============================================
-- QUESTION 48
-- ============================================

--  The hotel manager wants to review rooms where PricePerNight is between ₹2000 and ₹4000 to offer discounts. 

SELECT *
FROM Rooms 
WHERE PricePerNight BETWEEN 2000 AND 4000;

-- ============================================
-- QUESTION 49
-- ============================================

--  List all bookings ordered by CheckInDate.

SELECT *
FROM Bookings 
ORDER BY CheckInDate;

-- ============================================
-- QUESTION 50
-- ============================================

-- Display all unique CustomerIDs from bookings.

SELECT DISTINCT CustomerID
FROM Bookings;

-- ============================================
-- QUESTION 51
-- ============================================

-- The hotel manager wants to add new customer details. Insert 5 records with full details into the Customers table.

INSERT INTO Customers
(FirstName, LastName, Email, Phone, City)
VALUES 
('Pranav','Aseri','aseripranav@gmail.com',7620441825,'Ahmednagar'),
('Aarav','Patil','aaravpatil@gmail.com',9876543210,'Pune'),
('Riya','Shinde','riyashinde@gmail.com',9765432109,'Mumbai'),
('Aditya','Jadhav','adityajadhav@gmail.com',9654321098,'Nashik'),
('Sneha','More','snehamore@gmail.com',9543210987,'Nagpur');

-- ============================================
-- QUESTION 51
-- ============================================

-- Show the last 2 staff hired.

SELECT *
FROM Staff 
ORDER BY StaffID DESC
LIMIT 2;

-- ============================================
-- QUESTION 52
-- ============================================

--  Identify rooms with PricePerNight higher than the maximum PricePerNight of rooms with Capacity = 2. (Rooms subquery) 

SELECT *
FROM Rooms
WHERE PricePerNight > (
      SELECT MAX(PricePerNight)
	    FROM Rooms 
      WHERE Capacity = 2
      );

-- ============================================
-- QUESTION 53
-- ============================================

-- The HR team wants to see staff whose Role is not 'Chef' for role reallocation. 

SELECT *
FROM Staff 
WHERE Role <> 'Chef';

-- ============================================
-- QUESTION 54
-- ============================================

--  Show all unique cities in descending order from the Customers table. 

SELECT DISTINCT City
FROM Customers
ORDER BY City DESC;

-- ============================================
-- QUESTION 55
-- ============================================

-- Display the phone number of the Waiter only. 

SELECT Phone
FROM Staff
WHERE Role = 'Waiter';

-- ============================================
-- QUESTION 56
-- ============================================

-- Display the last 2 bookings in the table.

SELECT *
FROM Bookings
ORDER BY BookingID DESC
LIMIT 2;

-- ============================================
-- QUESTION 57
-- ============================================

-- The marketing team wants to see customers living in Delhi or Chennai for targeted promotions 

SELECT *
FROM Customers
WHERE City = 'Chennai'
OR City = 'Delhi';

-- ============================================
-- QUESTION 58
-- ============================================

-- Show all rooms where RoomType != 'Family' to plan renovations.

SELECT *
FROM Rooms
WHERE RoomType != 'Family';

-- ============================================
-- QUESTION 59
-- ============================================

-- List staff emails ordered by their roles.

SELECT Email
FROM Staff
ORDER BY Role;

-- ============================================
-- QUESTION 60
-- ============================================

-- Display all unique payment methods.

SELECT DISTINCT PaymentMethod
FROM Payments;

-- ============================================
-- QUESTION 61
-- ============================================

-- The receptionist wants a list of customers whose Phone starts with '98' for mobile offers

SELECT *
FROM Customers
WHERE Phone LIKE "98%";

-- ============================================
-- QUESTION 62
-- ============================================

-- Show the 3 cheapest rooms available for budget travelers. 

SELECT *
FROM Rooms 
ORDER BY PricePerNight 
LIMIT 3;

-- ============================================
-- QUESTION 63
-- ============================================

-- Display the last 2 payments. 

SELECT *
FROM Payments
ORDER BY PaymentID DESC 
LIMIT 2;

-- ============================================
-- QUESTION 64
-- ============================================

-- Management wants to know which unique cities customers come from.

SELECT DISTINCT City
FROM Customers;

-- ============================================
-- QUESTION 65
-- ============================================

-- List all bookings where TotalAmount > 5000

SELECT *
FROM Bookings
WHERE TotalAmount > 5000;

-- ============================================
-- QUESTION 66
-- ============================================

-- Display each staff’s Role with their Email in one column.

SELECT CONCAT_WS('-',Role,Email) AS StaffEmail
FROM Staff;

-- ============================================
-- QUESTION 67
-- ============================================

-- Show the first 4 staff full names. 

SELECT CONCAT(FirstName,' ',LastName) AS FullName
FROM Staff
ORDER BY StaffID 
LIMIT 4;

-- ============================================
-- QUESTION 68
-- ============================================

-- Find bookings where TotalAmount is greater than all bookings made by CustomerID = 10. (Bookings subquery) 

SELECT *
FROM Bookings
WHERE TotalAmount > (
       SELECT MAX(TotalAmount)
       FROM Bookings 
       WHERE CustomerID = 10
       );

-- ============================================
-- QUESTION 69
-- ============================================

-- List rooms with capacity >= 3 for family bookings. 

SELECT *
FROM Rooms
WHERE Capacity  >= 3;

-- ============================================
-- QUESTION 70
-- ============================================

-- Display the RoomType and Price of only Suite rooms. 

SELECT Roomtype,PricePerNight
FROM Rooms
WHERE RoomType = 'Suite';

-- ============================================
-- QUESTION 71
-- ============================================

-- The cashier wants to see payments with Amount between ₹2000 and ₹7000 for mid-range billing checks. 

SELECT *
FROM Payments 
WHERE Amount BETWEEN 2000 AND 7000;

-- ============================================
-- QUESTION 72
-- ============================================

-- Insert 5 booking records into the Bookings table with all details.

INSERT INTO Bookings
(CustomerID, RoomID, StaffID, CheckInDate, CheckOutDate, TotalAmount)
VALUES 
(1, 5, 2, '2024-06-01', '2024-06-03', 6000),
(2, 8, 3, '2024-06-05', '2024-06-07', 7500),
(3, 2, 1, '2024-06-10', '2024-06-12', 4500),
(4, 10, 4, '2024-06-15', '2024-06-18', 9000),
(5, 7, 2, '2024-06-20', '2024-06-22', 5500);

-- ============================================
-- QUESTION 73
-- ============================================

-- Display the 3 lowest payments made by customers.

SELECT *
FROM Payments
ORDER BY Amount
LIMIT 3;

-- ============================================
-- QUESTION 74
-- ============================================

-- Show each booking’s BookingID with TotalAmount using CONCAT

SELECT CONCAT_WS('-',BookingID,TotalAmount) AS BookingInfo
FROM Bookings;

-- ============================================
-- QUESTION 75
-- ============================================

-- Show all unique RoomIDs in descending order.

SELECT DISTINCT RoomID 
FROM Rooms
ORDER BY RoomID DESC;