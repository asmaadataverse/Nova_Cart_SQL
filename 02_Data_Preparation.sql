-- 1. Customer with more than one order
SELECT CustomerID, COUNT(*) AS OrderCount
FROM [Order]
GROUP BY CustomerID
HAVING COUNT(*) > 1;


-- 2. Customer with no orders
SELECT c.CustomerID, c.FullName
FROM Customer c
LEFT JOIN [Order] o
    ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;


-- 3. Order containing more than one product
SELECT OrderID, COUNT(*) AS ProductCount
FROM OrderItem
GROUP BY OrderID
HAVING COUNT(*) > 1;


-- 4. Product appearing in more than one order
SELECT ProductID, COUNT(*) AS OrderCount
FROM OrderItem
GROUP BY ProductID
HAVING COUNT(*) > 1;


-- 5. Product never ordered
SELECT p.ProductID, p.ProductName
FROM Product p
LEFT JOIN OrderItem oi
    ON p.ProductID = oi.ProductID
WHERE oi.ProductID IS NULL;


-- 6. Product never reviewed
-- Review currently has no ProductID in our design,
-- so this specific rule cannot be checked with the current schema.


-- 7. Different order statuses
SELECT Status, COUNT(*) AS OrderCount
FROM [Order]
GROUP BY Status;


-- 8. All supported payment methods
SELECT PaymentMethod, COUNT(*) AS PaymentCount
FROM Payment
GROUP BY PaymentMethod;


-- 9. Different review ratings
SELECT Rating, COUNT(*) AS ReviewCount
FROM Review
GROUP BY Rating;


-- 10. Customer with more than one review
SELECT CustomerID, COUNT(*) AS ReviewCount
FROM Review
GROUP BY CustomerID
HAVING COUNT(*) > 1;


-- 11. Date range
SELECT 
    MIN(OrderDate) AS EarliestOrder,
    MAX(OrderDate) AS LatestOrder
FROM [Order];


-- 12. Payment amount range
SELECT 
    MIN(PaymentAmount) AS MinimumPayment,
    MAX(PaymentAmount) AS
SELECT COUNT(*) AS ProductsNeverOrdered
FROM Product
WHERE ProductID NOT IN (
    SELECT ProductID
    FROM OrderItem
);

SELECT ProductID, ProductName
FROM Product
WHERE ProductID = 50;

SELECT *
FROM OrderItem
WHERE ProductID = 50;

SELECT 
    OrderID,
    COUNT(*) AS ProductCount
FROM OrderItem
WHERE OrderID IN (
    SELECT OrderID
    FROM OrderItem
    WHERE ProductID = 50
)
GROUP BY OrderID
ORDER BY ProductCount;

DELETE FROM OrderItem
WHERE ProductID = 50;

SELECT COUNT(*) AS ProductsNeverOrdered
FROM Product
WHERE ProductID NOT IN (
    SELECT ProductID
    FROM OrderItem
);

SELECT COUNT(*) AS ProductsNeverOrdered
FROM Product
WHERE ProductID NOT IN (
    SELECT ProductID
    FROM OrderItem
);

SELECT Status, COUNT(*) AS OrderCount
FROM [Order]
GROUP BY Status;

SELECT PaymentMethod, COUNT(*) AS PaymentCount
FROM Payment
GROUP BY PaymentMethod;

SELECT Rating, COUNT(*) AS ReviewCount
FROM Review
GROUP BY Rating
ORDER BY Rating;

SELECT CustomerID, COUNT(*) AS ReviewCount
FROM Review
GROUP BY CustomerID
HAVING COUNT(*) > 1;

SELECT 
    MIN(OrderDate) AS EarliestOrder,
    MAX(OrderDate) AS LatestOrder
FROM [Order];

SELECT 
    MIN(PaymentAmount) AS MinimumPayment,
    MAX(PaymentAmount) AS MaximumPayment
FROM Payment;
