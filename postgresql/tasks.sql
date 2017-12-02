# 1. Wyświetl nazwy wszystkich produktów dostępnych w sklepie.
SELECT name FROM products;

# 2. Wyświetl nazwy oraz ceny wszystkich produktów dostępnych w sklepie.
SELECT name, price FROM products;

# 3. Wyświetl nazwy wszystkich produktów których cena jest mniejsza lub równa 200.
SELECT name FROM products WHERE price <= 200;

# 4. Wyświetl wszystkie produkty, których cena zawiera się w przedziale 60..120.
SELECT * FROM products WHERE price BETWEEN 60 AND 120;

# 5. Wyświetl nazwy oraz ceny w groszach wszystkich produktów dostępnych w sklepie (ceny powinny zostać pomnożone przez 100).
SELECT name, price*100 AS price_gr FROM products;

# 6. Oblicz średnią cenę z wszystkich produktów.
SELECT AVG(price) FROM products;

# 7. Oblicz średnią cenę z wszystkich produktów, które zostały wyprodukowane przez producenta o id 2.
SELECT AVG(price) FROM products WHERE manufacturer_id = 2;

# 8. Oblicz ilość produktów, których cena jest większa bądź równa 180.
SELECT COUNT(*) FROM products WHERE price >= 180;

# 9. Wyświetl nazwy i ceny produktów, których cena jest większa bądź równa 180. Wyniki posortuj po cenie (malejąco) oraz po nazwie (rosnąco).
SELECT name, price FROM products WHERE price >= 180 ORDER BY price DESC, name;

# 10. Wyświetl wszystkie dane o produktach oraz odpowiadających im producentach.
SELECT *
  FROM products
  INNER JOIN manufacturers ON manufacturer_id = manufacturers.id;

# 11. Wyświetl nazwę, cenę oraz nazwę producenta wszystkich produktów dostępnych w sklepie.
SELECT products.name, products.price, manufacturers.name
  FROM products
  INNER JOIN manufacturers ON manufacturer_id = manufacturers.id;

# 12. Wyświetl średnią cenę produktów dla każdego producenta oraz jego id.
SELECT manufacturer_id, AVG(price) FROM products GROUP BY manufacturer_id;

# 13. Wyświetl średnią cenę produktów dla każdego producenta oraz jego nazwę.
SELECT manufacturers.name, AVG(price)
  FROM manufacturers
  INNER JOIN products ON manufacturer_id = manufacturers.id
GROUP BY manufacturers.id;

# 14. Wyświetl nazwy producentów których produkty mają średnią cenę większą bądź równą 150.
SELECT manufacturers.name, AVG(price)
  FROM manufacturers
  INNER JOIN products ON manufacturer_id = manufacturers.id
GROUP BY manufacturers.id
HAVING AVG(price) >= 180;

# 15. Wyświetl nazwę oraz cenę najtańszego produktu w sklepie.
SELECT name, price FROM products ORDER BY price LIMIT 1;

# 16. Wyświetl nazwę każdego producenta wraz z nazwą oraz ceną najdroższego produktu tego producenta.
SELECT DISTINCT ON (products.manufacturer_id) manufacturers.name, products.name, products.price
  FROM products
  INNER JOIN manufacturers ON manufacturers.id = manufacturer_id
  WHERE products.id IN (SELECT id FROM products ORDER BY manufacturer_id, price DESC);

# 17. Wyświetl nazwy producentów, dla których sklep nie posiada produktów.
SELECT manufacturers.name
  FROM manufacturers
  LEFT OUTER JOIN products ON manufacturer_id = manufacturers.id
WHERE manufacturer_id is NULL;

# 18. Dodaj nowy produkt przypisany do producenta o id 2 z danymi: Loudspeakers, 70.
INSERT INTO products (name, price, manufacturer_id) VALUES ('Loudspeakers', 70, 2);

# 19. Zaktualizuj nazwę produktu o id 8 na Laser Printer.
UPDATE products SET name = 'Laser Printer' WHERE id = 8;

# 20. Zaktualizuj ceny wszystkich produktów o rabat 10%.
UPDATE products SET price = price * 0.9;

# 21. Obniż o 10% cenę wszystkich produktów droższych od 120.
UPDATE products SET price = price * 0.9 WHERE price > 120;
