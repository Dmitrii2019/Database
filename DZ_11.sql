/*������������ ������� �� ���� ������������ ��������
�������� ������� logs ���� Archive. ����� ��� ������ �������� ������ � �������� users, catalogs � products � ������� 
logs ���������� ����� � ���� �������� ������, �������� �������, ������������� ���������� ����� � ���������� ���� name.
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

/*������������ ������� �� ���� �NoSQL�*/
-- 1) � ���� ������ Redis ��������� ��������� ��� �������� ��������� � ������������ IP-�������.
SCARD id 

-- 2) ��� ������ ���� ������ Redis ������ ������ ������ ����� ������������ �� ������������ ������ � ��������, 
-- ����� ������������ ������ ������������ �� ��� �����.
SET email 'name' 
SET name email 
GET email - ��������� ������� email 
GET name - ��������� ������� name

-- 3) ����������� �������� ��������� � �������� ������� ������� ���� ������ shop � ���� MongoDB.
use shop
db.shop.insert({category: '����������'})

db.shop.update({category: '����������'}, {$set: { products:{name:'Intel Core i3-8100', desription: '��������� ��� ���������� ������������ �����������, ���������� �� ��������� Intel.', price:'7890'}}})


















