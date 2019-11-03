-- 1)����� � ������� users ���� created_at � updated_at ��������� ��������������. ��������� �� �������� ����� � ��������.
DROP DATABASE IF EXISTS orders;
CREATE DATABASE orders;
USE orders;

DROP TABLE IF EXISTS users;
CREATE TABLE users(
    created_at VARCHAR (150),
    updated_at VARCHAR (150)
);
INSERT users (created_at, updated_at) values (now(), now());
SELECT * FROM users;

/* 2)������� users ���� �������� ��������������. ������ created_at � updated_at ���� ������ ����� VARCHAR � � ��� ������ ����� ����������
�������� � ������� "20.10.2017 8:10". ���������� ������������� ���� � ���� DATETIME, �������� �������� ����� ��������.
*/
ALTER TABLE users MODIFY COLUMN created_at DATETIME;
ALTER TABLE users MODIFY COLUMN updated_at DATETIME;
-- �� ���������� ��� ��������� �������

/* � ������� ��������� ������� storehouses_products � ���� value ����� ����������� ����� ������ �����: 0, ���� ����� ���������� � ���� ����,
 ���� �� ������ ������� ������. ���������� ������������� ������ ����� �������, ����� ��� ���������� � ������� ���������� �������� value.
 ������, ������� ������ ������ ���������� � �����, ����� ���� �������.
*/
DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
  id SERIAL PRIMARY KEY,
  value INT UNSIGNED 
);
INSERT storehouses_products (value) values (0),(2500),(0),(30),(500), (1);
SELECT value FROM storehouses_products;

SELECT * FROM storehouses_products WHERE id IN (6, 4, 5, 2, 1, 3)
ORDER BY FIELD(id, 6, 4, 5, 2, 1, 3);

-- 4)(�� �������) �� ������� users ���������� ������� �������������, ���������� � ������� � ���. ������ ������ � ���� ������ ���������� �������� ('may', 'august')
SELECT * FROM users
WHERE birthday_at = 'may' OR birthday_at = 'august';
-- ���
WHERE birthday_at BETWEEN 'may' AND 'august';

-- ������������ ������� ���� ���������� �������
-- 1)����������� ������� ������� ������������� � ������� users
SELECT name,
avg (TIMESTAMPDIFF(YEAR, birthday_at, NOW())) AS mean_age
FROM users;
-- ���
SELECT name,
avg(FLOOR((TO_DAYS(NOW()) - TO_DAYS(birthday_at))/365.25)) AS mean_age 
FROM users;
-- 2)����������� ���������� ���� ��������, ������� ���������� �� ������ �� ���� ������. ������� ������, ��� ���������� ��� ������ �������� ����, � �� ���� ��������.
-- �� ����������

-- 3)(�� �������) ����������� ������������ ����� � ������� �������

DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
  value INT UNSIGNED 
);
INSERT storehouses_products (value) values (1),(2),(3),(4),(5);
SELECT value FROM storehouses_products;
SELECT ROUND(EXP(SUM(ln(value))))AS composition FROM storehouses_products;





