DROP SCHEMA webshop CASCADE;
CREATE SCHEMA webshop;

SET SEARCH_PATH TO webshop;

CREATE TABLE webshop.Adress(
    adress_id SERIAL PRIMARY KEY,
    adressNumber SMALLINT NOT NULL,
    street VARCHAR(40) NOT NULL,
    postalCode SMALLINT NOT NULL,
    municipality VARCHAR(40) NOT NULL,
    country VARCHAR(43) NOT NULL
);

CREATE TABLE webshop.ClientCategory(
    category_id SERIAL PRIMARY KEY,
    categories TEXT NOT NULL
);

CREATE TABLE webshop.Client(
    client_id SERIAL PRIMARY KEY,
    firstName VARCHAR(40) NOT NULL,
    lastName VARCHAR(40) NOT NULL,
    email VARCHAR(40) NOT NULL,
    passwd VARCHAR(40) NOT NULL,
    dateOfBirth DATE NOT NULL,
    registrationDate DATE NOT NULL,
    adress_id INTEGER NOT NULL REFERENCES Adress(adress_id)
        ON UPDATE CASCADE
        ON DELETE SET NULL,
    category SERIAL NOT NULL REFERENCES webshop.ClientCategory(category_id)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

CREATE TABLE webshop.Review(
    review_id SERIAL PRIMARY KEY,
    note INTEGER NOT NULL,
    commentary TEXT,
    publishingDate DATE NOT NULL,
    client_id INTEGER NOT NULL REFERENCES webshop.Client(client_id)
        ON DELETE CASCADE
);

CREATE TABLE webshop.ProductCategory(
    category_id SERIAL PRIMARY KEY,
    categories TEXT NOT NULL
);

CREATE TABLE webshop.Product(
    product_id SERIAL PRIMARY KEY,
    productName TEXT NOT NULL,
    IAN BIGINT NOT NULL,
    manufacturer TEXT,
    price DECIMAL NOT NULL,
    catalogueEntryDate DATE NOT NULL,
    category SERIAL NOT NULL REFERENCES webshop.ClientCategory(category_id)
        ON UPDATE CASCADE
        ON DELETE SET NULL,
    review_id INTEGER REFERENCES webshop.Review(review_id)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

CREATE TABLE webshop.Order(
    order_id SERIAL PRIMARY KEY,
    quantity SMALLINT NOT NULL,
    discount DECIMAL,
    subTotal DECIMAL NOT NULL,
    taxAmount DECIMAL NOT NULL,
    total DECIMAL NOT NULL,
    validationDate DATE,
    product_id INTEGER NOT NULL REFERENCES webshop.Product(product_id)
        ON DELETE CASCADE,
    client_id INTEGER NOT NULL REFERENCES webshop.Client(client_id)
        ON DELETE CASCADE
);


