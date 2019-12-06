-- Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
USE shop;

SELECT name
FROM users
JOIN orders 
ON users.id = orders.user_id
GROUP BY orders.user_id
ORDER BY name;

-- Выведите список товаров products и разделов catalogs, который соответствует товару.

SELECT products.id, products.name AS products_name, catalogs.name AS catalogs_name
FROM catalogs
JOIN products
WHERE products.catalog_id = catalogs.id;












