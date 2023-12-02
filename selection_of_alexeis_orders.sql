/* Выбираем все имена продуктов в заказах пользователей с именем alexey без учета регистра */
SELECT 
	O.product_name AS product_name
FROM
	ORDERS AS O INNER JOIN
	CUSTOMERS AS C ON C.id = O.customer_id
WHERE
	C."name" ilike 'alexey';