/* Удалим таблицы из БД, если они уже есть (порядок удаления важен, ибо внешние ключи) */
DROP TABLE IF EXISTS ORDERS;
DROP TABLE IF EXISTS CUSTOMERS;

/* Создаем таблицы */
CREATE TABLE CUSTOMERS 
(
	id SERIAL PRIMARY KEY,
	"name" VARCHAR(50),
	surname VARCHAR(50),
	age INTEGER,
	phone_number VARCHAR(12) NOT NULL,
	UNIQUE(phone_number)
);

CREATE TABLE ORDERS 
(
	id SERIAL PRIMARY KEY,
	"date" DATE DEFAULT CURRENT_DATE,
	customer_id INTEGER,
	product_name VARCHAR(50),
	amount INTEGER,
	FOREIGN KEY (customer_id) REFERENCES CUSTOMERS (id)
);

/* Добавляем данные в таблицы */
INSERT INTO 
	CUSTOMERS
(
	"name",
	surname,
	age,
	phone_number
)
VALUES
(
	'Alexey',
	'Zlatouhov',
	25,
	'+79651031076'
),
(
	'Dmitry',
	'Porshnev',
	35,
	'+79651331876'
),
(
	'Mariya',
	'Pak',
	28,
	'+79652331876'
);

/* id пользовате получим ссылаясь на номер телефона как уникальный параметр пользователя */
INSERT INTO 
	ORDERS
(
	customer_id,
	product_name,
	amount
)
VALUES 
(
	(SELECT id FROM CUSTOMERS WHERE "phone_number" = '+79651031076'),
	'Капуста',
	1
),
(
	(SELECT id FROM CUSTOMERS WHERE "phone_number" = '+79651031076'),
	'Морковка',
	2
),
(
	(SELECT id FROM CUSTOMERS WHERE "phone_number" = '+79651331876'),
	'Капуста',
	3
);

/* Выбираем все имена продуктов в заказах пользователей с именем alexey без учета регистра */
SELECT 
	O.product_name AS product_name
FROM
	ORDERS AS O INNER JOIN
	CUSTOMERS AS C ON C.id = O.customer_id
WHERE
	C."name" ilike 'alexey';