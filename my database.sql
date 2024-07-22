-- Create Database
CREATE DATABASE IF NOT EXISTS ExampleDB;
USE ExampleDB;

-- Create Tables

-- Users Table
CREATE TABLE IF NOT EXISTS Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Products Table
CREATE TABLE IF NOT EXISTS Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2),
    Stock INT,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Orders Table
CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- OrderDetails Table
CREATE TABLE IF NOT EXISTS OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert Dummy Data

-- Insert Users
INSERT INTO Users (FirstName, LastName, Email) VALUES 
('John', 'Doe', 'john.doe@example.com'),
('Jane', 'Smith', 'jane.smith@example.com'),
('Alice', 'Johnson', 'alice.johnson@example.com');

-- Insert Products
INSERT INTO Products (ProductName, Price, Stock) VALUES 
('Laptop', 999.99, 50),
('Smartphone', 499.99, 100),
('Headphones', 79.99, 200);

-- Insert Orders
INSERT INTO Orders (UserID) VALUES 
(1),
(2),
(1);

-- Insert OrderDetails
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES 
(1, 1, 1),
(1, 2, 2),
(2, 3, 1),
(3, 1, 1);

-- Verify the data
SELECT * FROM Users;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;
