--Nore I add number to each task for better 
-- 2.create user table

CREATE TABLE [User](
	UserID INT PRIMARY KEY IDENTITY(1,1),
	UserName NVARCHAR(50) NOT NULL,
);

-- 3 + 4 ALTER USER TABLE TO ADD Email COLUMN AND MAKE IT UNIQUE AND NOT NULL
ALTER TABLE [User]
ADD Email NVARCHAR(255) NOT NULL UNIQUE;

-- 5 + 6 Create a product table With price is not null (not missing) 
CREATE TABLE Product(
	ProductID INT PRIMARY KEY IDENTITY(1,1),
	ProductName NVARCHAR(100) NOT NULL,
	Price DECIMAL(10, 2) NOT NULL
);

-- 7 + 8 + 9  Create a table for orders.order_date should be automatically filled if no value is provided. 

CREATE TABLE orders (
    id INT PRIMARY KEY IDENTITY(1,1),
    order_date DATETIME DEFAULT GETDATE(),
    total_amount DECIMAL(18, 2) NOT NULL,
    user_id INT NOT NULL, -- This stores the ID of the user
    
    -- This line enforces the relationship
    CONSTRAINT FK_OrderUser FOREIGN KEY (user_id) 
    REFERENCES [User](UserID)
);

-- 10 Create a table to represent products inside orders. Each product should not appear twice in the same order.

CREATE TABLE order_items (
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    -- This stores the price AT THE TIME of the order good practice to store price at the time of purchase in case it changes later
    price_at_purchase DECIMAL(18, 2) NOT NULL, 

    PRIMARY KEY (order_id, product_id),

    CONSTRAINT FK_OrderItem_Order FOREIGN KEY (order_id) 
    REFERENCES orders(id),

    CONSTRAINT FK_OrderItem_Product FOREIGN KEY (product_id) 
    REFERENCES [Product](ProductID)
);
