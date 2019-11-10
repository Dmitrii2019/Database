
USE shop;

SELECT name
FROM users
JOIN orders 
ON users.id = orders.user_id
GROUP BY orders.user_id
ORDER BY name;



SELECT products.id, products.name AS products_name, catalogs.name AS catalogs_name
FROM catalogs
JOIN products
WHERE products.catalog_id = catalogs.id;












