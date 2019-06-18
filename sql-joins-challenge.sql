SQL-Join-Challenge

-- 1.Get all customers and their addresses.
SELECT "first_name","last_name","street","city","state","zip"
FROM "customers"
JOIN "addresses" ON "customers"."id"="addresses"."customer_id";

--2. Get all orders and their line items (orders, quantity and product).
SELECT * 
FROM "orders"
JOIN "line_items" ON "orders"."id"="line_items"."order_id";

--3. Which warehouses have cheetos?
Just the Delta warehouse. 
SELECT "products"."description","warehouse"."warehouse"
FROM "warehouse_product"
JOIN "products" ON "warehouse_product"."product_id"="products"."id"
JOIN "warehouse" ON "warehouse_product"."warehouse_id"="warehouse"."id"
WHERE "products"."description"='cheetos';

--4. Which warehouses have diet pepsi?
Alpha, Delta, and Gamma warehouses all have Diet Pepsi. 
SELECT "products"."description","warehouse"."warehouse"
FROM "warehouse_product"
JOIN "products" ON "warehouse_product"."product_id"="products"."id"
JOIN "warehouse" ON "warehouse_product"."warehouse_id"="warehouse"."id"
WHERE "products"."description"='diet pepsi';

--5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT   COUNT("orders"."id"), "first_name"
FROM "customers"
LEFT JOIN "addresses" ON "customers"."id"="addresses"."customer_id"
LEFT JOIN "orders" ON "addresses"."id"="orders"."address_id"
GROUP BY "customers"."first_name";

--6. How many customers do we have?
SELECT COUNT(*)
FROM "customers";

--7. How many products do we carry?
SELECT COUNT(*)
FROM "products";

--8. What is the total available on-hand quantity of diet pepsi?
SELECT SUM("on_hand")
FROM "warehouse_product"
JOIN "products" ON "warehouse_product"."product_id"="products"."id"
WHERE "products"."description" = 'diet pepsi';