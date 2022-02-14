SET SEARCH_PATH TO webshop;

INSERT INTO webshop.adress(adressNumber, street, postalCode, municipality, country) VALUES(20, 'Rue Jules guesde', 24120, 'Terrasson-Lavilledieu', 'France');
INSERT INTO webshop.adress(adressNumber, street, postalCode, municipality, country) VALUES(10, 'Rue Marc-Antoine', 19100, 'Brive', 'France');

INSERT INTO webshop.clientcategory(categories) VALUES('ancien client');
INSERT INTO webshop.clientcategory(categories) VALUES('moteur de recherche');
INSERT INTO webshop.clientcategory(categories) VALUES('réseaux sociaux');
INSERT INTO webshop.clientcategory(categories) VALUES('partenariat');

INSERT INTO webshop.productcategory(categories) VALUES('électronique');
INSERT INTO webshop.productcategory(categories) VALUES('textile');
INSERT INTO webshop.productcategory(categories) VALUES('plastique');
INSERT INTO webshop.productcategory(categories) VALUES('bois');

INSERT INTO webshop.client(firstName, lastName, email, passwd, dateOfBirth, registrationDate, adress_id, category) VALUES('Cemal', 'Odabasioglu', 'cemal24120@gmail.com', 'password123', '2003-04-20', '2022-02-10', 1, 1);
INSERT INTO webshop.client(firstName, lastName, email, passwd, dateOfBirth, registrationDate, adress_id, category) VALUES('Mathis', 'Borger', 'mathis24120@gmail.com', 'password123', '2003-04-20', '2022-02-10', 2, 2);

INSERT INTO webshop.review(note, commentary, publishingDate, client_id) VALUES(5, 'Excellent', '2020-04-20', 1);
INSERT INTO webshop.review(note, commentary, publishingDate, client_id) VALUES(4, 'Très bien', '2019-02-10', 2);

INSERT INTO webshop.product(productName, IAN, manufacturer, price, catalogueEntryDate, category, review_id) VALUES('Aspirateur balai sans fil', 1928384758493, 'Dyson', 799, '2021-09-30', 1, 1);
INSERT INTO webshop.product(productName, IAN, manufacturer, price, catalogueEntryDate, category, review_id) VALUES('Aspirateur balai sans fil', 2528384254493, 'Rowenta', 199, '2020-10-20', 2, 2);

INSERT INTO webshop.order(quantity, discount, subTotal, taxAmount , total, validationDate, product_id, client_id) Values(1, 10, 709, 20, 789, '2022-02-12', 1, 1);
INSERT INTO webshop.order(quantity, discount, subTotal, taxAmount , total, validationDate, product_id, client_id) Values(2, 0, 199, 20, 239, '2022-01-10', 2, 2);