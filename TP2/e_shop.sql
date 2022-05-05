DROP TABLE IF EXISTS products;
CREATE TABLE products (
    product_id INTEGER,
    name TEXT,
    category TEXT,
    price NUMERIC,
    rating NUMERIC
);
DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
    order_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    subtotal NUMERIC,
    date DATE,
    client_id INTEGER
);
DROP TABLE IF EXISTS clients;
CREATE TABLE clients (client_id INT, name TEXT);
INSERT INTO orders(
        order_id,
        product_id,
        quantity,
        subtotal,
        date,
        client_id
    )
VALUES (1, 1, 1, 99, '2021-10-04', 48),
    (2, 5, 2, 20, '2021-10-05', 47),
    (3, 4, 4, 56, '2021-11-06', 47),
    (4, 1, 2, 198, '2021-12-11', 48),
    (5, 3, 4, 28, '2021-12-31', 48),
    (6, 3, 20, 140, '2021-12-31', 48),
    (7, 1, 1, 99, '2022-01-01', 47);
INSERT INTO products(product_id, name, category, price, rating)
VALUES (1, 'table', 'bois', 99, 3.6),
    (2, 'chaise', 'bois', 29, 4.7),
    (3, 'torchon', 'textile', 7, 2.3),
    (4, 'serviette', 'textile', 14, 3.1),
    (5, 'poubelle', 'plastique', 10, 4.2);
INSERT INTO clients(client_id, name)
VALUES (47, 'Tux'),
    (48, 'Linus');