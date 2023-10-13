CREATE TABLE customer_data (
                               id SERIAL PRIMARY KEY,
                               last_name VARCHAR(50) NOT NULL,
                               registration_date DATE NOT NULL,
                               spent_amount DECIMAL(10, 2) DEFAULT 0.0
);
---------------------------------
INSERT INTO customer_data (last_name, registration_date, spent_amount)
VALUES
    ('Ivanoff', '2023-10-13', 100.50),
    ('Petroff', '2023-10-14', 200.75),
    ('Trump', '2023-10-15', 50.00);
