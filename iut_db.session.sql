--moyenne1
SELECT ROUND(AVG(subtotal),2) AS average FROM orders

--moyenne2
SELECT category, ROUND(AVG(subtotal),2) AS average FROM orders o, products p
WHERE o.product_id = p.product_id
GROUP BY category;

--super
WITH sousTotal(average)
    AS(SELECT ROUND(AVG(subtotal),2) AS average FROM orders)

SELECT order_id, date, name, category, subtotal FROM orders o, sousTotal st, products p
WHERE o.product_id = p.product_id
AND subtotal >= st.average

--mention
WITH sousTotal(average)
    AS(SELECT ROUND(AVG(subtotal),2) AS average FROM orders)

SELECT order_id, subtotal, CASE WHEN subtotal > st.average THEN 'Bonne' ELSE 'Mauvaise' END AS case FROM orders, sousTotal st;

--infra
WITH sousTotal(average)
    AS
    (SELECT ROUND(AVG(subtotal),2) AS average FROM orders),

noteMoyenne(average)
    AS
    (SELECT ROUND(AVG(rating),2) AS average FROM products)

SELECT order_id, date, name, category, subtotal, rating FROM orders o, products p, sousTotal st, noteMoyenne nm 
WHERE o.product_id = p.product_id
AND subtotal <= st.average
AND rating <= nm.average;

--mensuel
SELECT FORMAT('%s-%s',EXTRACT(year from date), EXTRACT(month from date)) AS month, SUM(subtotal) AS sum FROM orders
GROUP BY month
ORDER BY month;

--cumuls
WITH mensuel(month, sum)
    AS 
    (SELECT DISTINCT FORMAT('%s-%s',EXTRACT(year from date), EXTRACT(month from date)) AS month, SUM(subtotal) FROM orders
    GROUP BY month
    ORDER BY month)

SELECT month, SUM(sum) OVER(ORDER BY month) AS cumulative_revenue FROM orders, mensuel
GROUP BY month, sum
ORDER BY month;

--chers
SELECT name, MAX(price) AS price FROM products
GROUP BY name
ORDER BY MAX(price) DESc
LIMIT 1

--chiffre
WITH mensuel(month, sum)
    AS 
    (SELECT DISTINCT FORMAT('%s-%s',EXTRACT(year from date), EXTRACT(month from date)) AS month, SUM(subtotal) FROM orders
    GROUP BY month
    ORDER BY month)

SELECT DISTINCT name, month, Sum(subtotal) FROM clients c, mensuel, orders o
WHERE o.client_id = c.client_id
GROUP BY month, name 
ORDER BY name, month