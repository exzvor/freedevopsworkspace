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
-- 11
SELECT customer_id, address FROM customers WHERE city IN ('Rio de Janeiro', 'México D.F.') AND postal_code BETWEEN '05020' AND '05030';
-- 12
SELECT customer_id, address FROM customers WHERE city = 'México D.F.' AND postal_code NOT BETWEEN '05020' AND '05030';
-- 13
SELECT order_id, FROM orders WHERE shipped_date IS NULL;
-- 14
SELECT employee_id, last_name, first_name FROM employees WHERE reports_to IS NOT NULL ORDER BY last_name ASC;
-- 15
SELECT order_id, customer_id, EXTRACT(MONTH FROM order_date) FROM orders WHERE EXTRACT(YEAR FROM order_date) = 1996 ORDER BY EXTRACT(MONTH FROM order_date);
-- 16
SELECT first_name, last_name FROM employees WHERE EXTRACT(YEAR FROM hire_date) = 1992;
-- 17
SELECT company_name, contact_name FROM customers UNION SELECT company_name, contact_name FROM suppliers ORDER BY company_name;
-- 18
SELECT company_name, contact_name, 'Customer' AS Type FROM customers UNION SELECT company_name, contact_name, 'Supplier' AS Type FROM suppliers ORDER BY company_name;
-- 19
SELECT order_id, unit_price * quantity AS original_price, (unit_price + 5) * quantity AS increase_euro, (unit_price * 1.05) * quantity AS increase_percentege FROM order_details;
-- 20
SELECT product_id, unit_price FROM products ORDER BY unit_price DESC LIMIT 1;
-- 21
SELECT product_id, unit_price FROM products WHERE unit_price = (SELECT MIN(unit_price) FROM products);
-- 22
SELECT COUNT(product_id), AVG(unit_price) FROM products;
-- 23
SELECT COUNT(product_name), category_name FROM products LEFT JOIN categories ON products.category_id = categories.category_id GROUP BY category_name;
-- 24
SELECT product_id, AVG(quantity), MAX(quantity), MIN(quantity) FROM order_details GROUP BY product_id ORDER BY AVG(quantity) DESC;
-- 25
SELECT product_id, AVG(quantity), MAX(quantity), MIN(quantity) FROM order_details GROUP BY product_id HAVING COUNT(order_id) >= 50 ORDER BY AVG(quantity) DESC;
-- 26
SELECT order_details.product_id, AVG(quantity), MAX(quantity), MIN(quantity) FROM order_details JOIN products ON order_details.product_id = products.product_id JOIN categories ON products.category_id = categories.category_id WHERE category_name = 'Beverages' GROUP BY order_details.product_id HAVING COUNT(order_id) >= 50 ORDER BY AVG(quantity) DESC;
-- 27
SELECT customers.contact_name, orders.order_id, orders.order_date FROM customers JOIN orders ON customers.customer_id = orders.customer_id WHERE order_idbetween 10600 AND 10620;