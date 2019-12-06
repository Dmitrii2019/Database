-- 1)Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.
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

/* 2)Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались
значения в формате "20.10.2017 8:10". Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.
*/
ALTER TABLE users MODIFY COLUMN created_at DATETIME;
ALTER TABLE users MODIFY COLUMN updated_at DATETIME;
-- НЕ РАЗОБРАЛСЯ КАК ПРАВИЛЬНО СДЕЛАТЬ

/* В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, если товар закончился и выше нуля,
 если на складе имеются запасы. Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value.
 Однако, нулевые запасы должны выводиться в конце, после всех записей.
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

-- 4)(по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. Месяцы заданы в виде списка английских названий ('may', 'august')
SELECT * FROM users
WHERE birthday_at = 'may' OR birthday_at = 'august';
-- или
WHERE birthday_at BETWEEN 'may' AND 'august';

-- Практическое задание теме “Агрегация данных”
-- 1)Подсчитайте средний возраст пользователей в таблице users
SELECT name,
avg (TIMESTAMPDIFF(YEAR, birthday_at, NOW())) AS mean_age
FROM users;
-- или
SELECT name,
avg(FLOOR((TO_DAYS(NOW()) - TO_DAYS(birthday_at))/365.25)) AS mean_age 
FROM users;
-- 2)Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. Следует учесть, что необходимы дни недели текущего года, а не года рождения.
-- не разобрался

-- 3)(по желанию) Подсчитайте произведение чисел в столбце таблицы

DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
  value INT UNSIGNED 
);
INSERT storehouses_products (value) values (1),(2),(3),(4),(5);
SELECT value FROM storehouses_products;
SELECT ROUND(EXP(SUM(ln(value))))AS composition FROM storehouses_products;

