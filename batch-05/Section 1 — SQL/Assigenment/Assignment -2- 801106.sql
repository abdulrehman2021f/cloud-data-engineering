-- ============================================================
--  ASSIGNMENT 02 — Joins
--  Database : BikeStores
-- ============================================================

-- ============================================================
--  Question 1
--  Retrieve the product_name, list_price, and category_name
--  for every product.
-- ============================================================

SELECT 
    p.product_name, 
    p.list_price, 
    c.category_name
FROM production.products AS p
INNER JOIN production.categories AS c 
    ON p.category_id = c.category_id
ORDER BY p.product_name ASC;



-- ============================================================
--  Question 2
--  Show the customer full name (as full_name), order_id,
--  and order_date for all customers who have placed an order.
-- ============================================================

SELECT 
    c.first_name + ' ' + c.last_name AS full_name, 
    o.order_id, 
    o.order_date
FROM sales.customers AS c
INNER JOIN sales.orders AS o 
    ON c.customer_id = o.customer_id
ORDER BY o.order_date DESC;


-- ============================================================
--  Question 3
--  Retrieve product_name, list_price, category_name, and
--  brand_name for every product.
-- ============================================================

SELECT 
    p.product_name, 
    p.list_price, 
    c.category_name, 
    b.brand_name
FROM production.products AS p
INNER JOIN production.categories AS c ON p.category_id = c.category_id
INNER JOIN production.brands AS b ON p.brand_id = b.brand_id
ORDER BY b.brand_name ASC, p.product_name ASC;


-- ============================================================
--  Question 4
--  List all products along with their order_id and item_id.
--  Include products that have NEVER been ordered (Left Join).
-- ============================================================

SELECT 
    p.product_name, 
    oi.order_id, 
    oi.item_id
FROM production.products AS p
LEFT JOIN sales.order_items AS oi 
    ON p.product_id = oi.product_id
ORDER BY oi.order_id ASC;


-- ============================================================
--  Question 5
--  Filter Question 4 to show ONLY products never ordered.
-- ============================================================

SELECT 
    p.product_id, 
    p.product_name
FROM production.products AS p
LEFT JOIN sales.order_items AS oi 
    ON p.product_id = oi.product_id
WHERE oi.order_id IS NULL;


-- ============================================================
--  Question 6
--  Show all stores along with any orders placed at each store.
--  Every store must appear (Left Join).
-- ============================================================

SELECT 
    s.store_name, 
    s.store_id, 
    o.order_id, 
    o.order_date
FROM sales.stores AS s
LEFT JOIN sales.orders AS o 
    ON s.store_id = o.store_id;


-- ============================================================
--  Question 7
--  List every staff member alongside their manager's name.
-- ============================================================

SELECT 
    s.first_name + ' ' + s.last_name AS staff_name,
    m.first_name + ' ' + m.last_name AS manager_name
FROM sales.staffs AS s
INNER JOIN sales.staffs AS m 
    ON s.manager_id = m.staff_id;


-- ============================================================
--  Question 8
--  Every possible combination of store name and brand name.
-- ============================================================

SELECT 
    s.store_name, 
    b.brand_name
FROM sales.stores AS s
CROSS JOIN production.brands AS b;


-- ============================================================
--  Question 9
--  Retrieve customer name, order details, and product name.
-- ============================================================

SELECT 
    c.first_name + ' ' + c.last_name AS full_name, 
    o.order_id, 
    o.order_date, 
    p.product_name, 
    oi.list_price
FROM sales.customers AS c
INNER JOIN sales.orders AS o ON c.customer_id = o.customer_id
INNER JOIN sales.order_items AS oi ON o.order_id = oi.order_id
INNER JOIN production.products AS p ON oi.product_id = p.product_id
ORDER BY o.order_date ASC, full_name ASC;