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