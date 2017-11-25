CREATE DATABASE computer_store;

CREATE TABLE manufacturers (
id SERIAL PRIMARY KEY,
name TEXT NOT NULL
);

CREATE TABLE products (
id SERIAL PRIMARY KEY,
name TEXT NOT NULL ,
price REAL NOT NULL ,
manufacturer_id INTEGER NOT NULL,
FOREIGN KEY (manufacturer_id) REFERENCES manufacturers(id)
);

INSERT INTO manufacturers (name) VALUES ('Sony');
INSERT INTO manufacturers (name) VALUES ('Creative Labs');
INSERT INTO manufacturers (name) VALUES ('Hewlett-Packard');
INSERT INTO manufacturers (name) VALUES ('Iomega');
INSERT INTO manufacturers (name) VALUES ('Fujitsu');
INSERT INTO manufacturers (name) VALUES ('Winchester');
INSERT INTO manufacturers (name) VALUES ('Apple');

INSERT INTO products (name, price, manufacturer_id) VALUES ('Hard drive', 240, 5);
INSERT INTO products (name, price, manufacturer_id) VALUES ('Memory', 120, 6);
INSERT INTO products (name, price, manufacturer_id) VALUES ('ZIP drive', 150, 4);
INSERT INTO products (name, price, manufacturer_id) VALUES ('Floppy disk', 5, 6);
INSERT INTO products (name, price, manufacturer_id) VALUES ('Monitor', 240, 1);
INSERT INTO products (name, price, manufacturer_id) VALUES ('DVD drive', 180, 2);
INSERT INTO products (name, price, manufacturer_id) VALUES ('CD drive', 90, 2);
INSERT INTO products (name, price, manufacturer_id) VALUES ('Printer', 270, 3);
INSERT INTO products (name, price, manufacturer_id) VALUES ('Toner cartridge', 66, 3);
INSERT INTO products (name, price, manufacturer_id) VALUES ('DVD burner', 180, 2);
