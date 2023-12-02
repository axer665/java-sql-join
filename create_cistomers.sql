/* Создаем таблицу CUSTOMERS */
CREATE TABLE CUSTOMERS 
(
	id SERIAL PRIMARY KEY,
	"name" VARCHAR(50),
	surname VARCHAR(50),
	age INTEGER,
	phone_number VARCHAR(12) NOT NULL,
	UNIQUE(phone_number)
);