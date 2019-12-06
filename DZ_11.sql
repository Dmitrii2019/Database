/*Практическое задание по теме “Оптимизация запросов”
Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, catalogs и products в таблицу 
logs помещается время и дата создания записи, название таблицы, идентификатор первичного ключа и содержимое поля name.
*/
DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
  name_table VARCHAR (255),
  date_creation DATETIME,
  id_fk INT(25),
  name VARCHAR (255)
) ENGINE=Archive;

-- TRIGGER users
DROP TRIGGER IF EXISTS shop.lofs_user_insert;

DELIMITER $$
$$
CREATE TRIGGER lofs_user_insert
AFTER INSERT
ON users FOR EACH ROW
BEGIN
	DECLARE a varchar(255);
    DECLARE b DATETIME;
    DECLARE c INT(25);
    SELECT name, created_at, id INTO a, b, c FROM users ORDER BY id DESC LIMIT 1;
	INSERT INTO logs(name, date_creation, id_fk, name_table) VALUES (a, b, c, "users");
END
$$
DELIMITER ;

-- TRIGGER catalogs
DROP TRIGGER IF EXISTS shop.lofs_catalog_insert;

DELIMITER $$
$$
CREATE DEFINER=`root`@`localhost` TRIGGER `lofs_catalog_insert` AFTER INSERT ON `catalogs` FOR EACH ROW BEGIN
	DECLARE a varchar(255);
    DECLARE c INT(25);
    DECLARE d DATETIME DEFAULT CURRENT_TIMESTAMP;
    SELECT name, id INTO a, c FROM catalogs ORDER BY id DESC LIMIT 1;
	INSERT INTO logs(name, id_fk, date_creation, name_table) VALUES (a, c, d, "catalogs");
END $$
DELIMITER ;

-- TRIGGER products
DROP TRIGGER IF EXISTS shop.lofs_product_insert;

DELIMITER $$
$$
CREATE DEFINER=`root`@`localhost` TRIGGER `lofs_product_insert` AFTER INSERT ON `products` FOR EACH ROW BEGIN
	DECLARE a varchar(255);
    DECLARE b DATETIME;
    DECLARE c INT(25);
    SELECT name, created_at, id INTO a, b, c FROM products ORDER BY id DESC LIMIT 1;
	INSERT INTO logs(name, date_creation, id_fk, name_table) VALUES (a, b, c, "products");
END $$
DELIMITER ;

/*Практическое задание по теме “NoSQL”*/
-- 1) В базе данных Redis подберите коллекцию для подсчета посещений с определенных IP-адресов.
SCARD id 

-- 2) При помощи базы данных Redis решите задачу поиска имени пользователя по электронному адресу и наоборот, 
-- поиск электронного адреса пользователя по его имени.
SET email 'name' 
SET name email 
GET email - вставляем искомый email 
GET name - вставляем искомое name

-- 3) Организуйте хранение категорий и товарных позиций учебной базы данных shop в СУБД MongoDB.
use shop
db.shop.insert({category: 'Процессоры'})

db.shop.update({category: 'Процессоры'}, {$set: { products:{name:'Intel Core i3-8100', desription: 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', price:'7890'}}})


















