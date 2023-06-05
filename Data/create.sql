-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-06-05 16:43:22.858

-- tables
-- Table: Category
CREATE TABLE Category (
    Id int  NOT NULL IDENTITY,
    Name nvarchar(255)  NOT NULL,
    CONSTRAINT Category_pk PRIMARY KEY  (Id)
);

-- Table: Customer
CREATE TABLE Customer (
    Id int  NOT NULL IDENTITY,
    FirstName nvarchar(255)  NOT NULL,
    LastName nvarchar(255)  NOT NULL,
    CONSTRAINT Customer_pk PRIMARY KEY  (Id)
);

-- Table: CustomerOrder
CREATE TABLE CustomerOrder (
    Id int  NOT NULL IDENTITY,
    Customer_Id int  NOT NULL,
    SubmissionDate datetime  NOT NULL,
    CONSTRAINT CustomerOrder_pk PRIMARY KEY  (Id)
);

-- Table: Product
CREATE TABLE Product (
    Id int  NOT NULL IDENTITY,
    Name nvarchar(255)  NOT NULL,
    Price int  NOT NULL,
    Category_Id int  NOT NULL,
    CONSTRAINT Product_pk PRIMARY KEY  (Id)
);

-- Table: ProductOrder
CREATE TABLE ProductOrder (
    Product_Id int  NOT NULL,
    CustomerOrder_Id int  NOT NULL,
    Amount int  NOT NULL,
    CONSTRAINT ProductOrder_pk PRIMARY KEY  (Product_Id,CustomerOrder_Id)
);

-- foreign keys
-- Reference: Order_Customer (table: CustomerOrder)
ALTER TABLE CustomerOrder ADD CONSTRAINT Order_Customer
    FOREIGN KEY (Customer_Id)
    REFERENCES Customer (Id);

-- Reference: ProductOrder_CustomerOrder (table: ProductOrder)
ALTER TABLE ProductOrder ADD CONSTRAINT ProductOrder_CustomerOrder
    FOREIGN KEY (CustomerOrder_Id)
    REFERENCES CustomerOrder (Id);

-- Reference: ProductOrder_Product (table: ProductOrder)
ALTER TABLE ProductOrder ADD CONSTRAINT ProductOrder_Product
    FOREIGN KEY (Product_Id)
    REFERENCES Product (Id);

-- Reference: Product_Category (table: Product)
ALTER TABLE Product ADD CONSTRAINT Product_Category
    FOREIGN KEY (Category_Id)
    REFERENCES Category (Id);

-- End of file.

GO


INSERT INTO Category (Name) VALUES
('Electronics'),
('Clothing'),
('Books'),
('Home Appliances');

INSERT INTO Customer (FirstName, LastName) VALUES
('John', 'Doe'),
('Jane', 'Smith'),
('Michael', 'Johnson');

INSERT INTO CustomerOrder (Customer_Id, SubmissionDate) VALUES
(1, '2023-06-01 10:00:00'),
(1, '2023-06-02 14:30:00'),
(2, '2023-06-02 09:15:00'),
(3, '2023-06-03 16:45:00'),
(3, '2023-06-04 11:30:00');

INSERT INTO Product (Name, Price, Category_Id) VALUES
('Smartphone', 800, 1),
('Laptop', 1200, 1),
('T-Shirt', 20, 2),
('Jeans', 50, 2),
('Novel', 15, 3),
('Cookbook', 25, 3),
('Microwave', 150, 4),
('Refrigerator', 800, 4);

INSERT INTO ProductOrder (Product_Id, CustomerOrder_Id, Amount) VALUES
(1, 1, 2),
(2, 1, 1),
(3, 2, 3),
(4, 2, 2),
(5, 3, 1),
(6, 3, 1),
(7, 4, 1),
(8, 5, 1);