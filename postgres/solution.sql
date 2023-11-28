-- 01
SELECT * FROM products;
-- 02
SELECT product_name, category_id, unit_price FROM products;
-- 03
SELECT product_name, quantity_per_unit FROM products;
-- 04
SELECT DISTINCT(quantity_per_unit) FROM products;
-- 05
SELECT product_name, unit_price * units_in_stock as product_in_warehouse FROM products ORDER BY product_in_warehouse DESC;
-- 06
SELECT product_name FROM products WHERE quantity_per_unit LIKE '%bottle%';
-- 07
SELECT product_name, unit_price * units_in_stock as product_in_warehouse FROM products WHERE product_in_warehouse >= 100;
-- 08
SELECT product_name, unit_price FROM products WHERE unit_price > 50 ORDER BY product_name ASC;
-- 09
SELECT CONCAT(first_name, ' ', last_name) as employee FROM employees where city = 'London';
-- 10
SELECT CONCAT(first_name, ' ', last_name) as employee FROM employees where city <> 'London';