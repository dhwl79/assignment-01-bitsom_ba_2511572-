USE demodb;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL
);
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);
CREATE TABLE sales_reps (
    rep_id INT PRIMARY KEY,
    rep_name VARCHAR(100) NOT NULL
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    rep_id INT NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (rep_id) REFERENCES sales_reps(rep_id)
);
CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers VALUES
(1, 'Amit', 'Mumbai'),
(2, 'Riya', 'Delhi');

INSERT INTO products VALUES
(101, 'Laptop', 50000),
(102, 'Mouse', 500);

INSERT INTO sales_reps VALUES
(1, 'Raj'),
(2, 'Neha');

INSERT INTO orders VALUES
(1001, 1, 1, '2023-01-01'),
(1002, 2, 2, '2023-01-02');

INSERT INTO order_items (order_id, product_id, quantity)
VALUES
(1001, 101, 1),
(1001, 102, 2);
