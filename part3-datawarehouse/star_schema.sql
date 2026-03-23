-- FACT TABLE
CREATE TABLE fact_sales (
    transaction_id INT PRIMARY KEY,
    date_id INT,
    store_id INT,
    product_id INT,
    quantity INT,
    total_amount FLOAT,
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

-- DIMENSION TABLES

CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE,
    month INT,
    year INT
);

CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name TEXT,
    location TEXT
);

CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name TEXT,
    category TEXT
);

-- SAMPLE INSERTS (cleaned data)

INSERT INTO dim_date VALUES
(1, '2023-01-01', 1, 2023),
(2, '2023-02-01', 2, 2023);

INSERT INTO dim_store VALUES
(1, 'Store A', 'Mumbai'),
(2, 'Store B', 'Delhi');

INSERT INTO dim_product VALUES
(1, 'Shirt', 'Clothing'),
(2, 'Shoes', 'Footwear');

INSERT INTO fact_sales VALUES
(101, 1, 1, 1, 2, 1000),
(102, 1, 2, 2, 1, 1500),
(103, 2, 1, 2, 3, 4500),
(104, 2, 2, 1, 1, 500),
(105, 1, 1, 2, 2, 3000),
(106, 2, 2, 2, 1, 1500),
(107, 1, 2, 1, 4, 2000),
(108, 2, 1, 1, 2, 1000),
(109, 1, 1, 1, 3, 1500),
(110, 2, 2, 2, 2, 3000);
