CREATE DATABASE dvdrental;
--Descargamos la base de datos informada
pg_restore -U postgres -d dvdrental dvdrental.tar
--Insertar, modificar y eliminar un Customer, Staff y Actor.
SELECT * FROM Customer;
INSERT INTO customer(customer_id, store_id, first_name, last_name, email, address_id, activebool, create_date, last_update, active) 
VALUES(600, 1, 'Anakarina', 'Mora','anaka1@gmail.com', 55, 't', '2006-02-14', '2013-05-06', 144945738);

SELECT * FROM staff;
INSERT INTO staff(staff_id, first_name, last_name, address_id, email, store_id, active, username, password, last_update)
VALUES(3, 'Anakarina', 'Mora', 5, 'anaka1@gmail.com', 3, 't', 'Mora', '8cb2237d0679ca88db6464eac60da96345513964', '2006-05-16 16:13:11.793628');

SELECT * FROM actor;
INSERT INTO actor(actor_id, first_name, last_name, last_update)
VALUES(201, 'Anakarina', 'Mora', '2013-05-26 14:47:57.62');

UPDATE customer
SET email = 'mora264@gmail.com'
WHERE customer_id = 600;

UPDATE staff
SET email = 'mora264@gmail.com'
WHERE staff_id = 3;

UPDATE actor
SET last_name = 'Faneite'
WHERE actor_id = 201;

DELETE FROM customer
WHERE customer_id = 600;

DELETE FROM staff
WHERE staff_id = 3;

DELETE FROM actor
WHERE actor_id = 201;

--Listar todas las “rental” con los datos del “customer” dado un año y mes

SELECT * FROM rental WHERE rental.customer_id;

SELECT rental.*, customer.*
FROM rental
JOIN customer ON rental.customer_id = customer.customer_id
WHERE EXTRACT(MONTH FROM rental.rental_date) = 5
AND EXTRACT(YEAR FROM rental.rental_date) = 2005;

--Listar Número, Fecha (payment_date) y Total (amount) de todas las “payment”.

SELECT payment_id, amount, payment_date FROM payment;

--Listar todas las “film” del año 2006 que contengan un (rental_rate) mayor a 4.0
SELECT * FROM film WHERE release_year = '2006' and rental_rate > 4.0;

--Realiza un Diccionario de datos que contenga el nombre de las tablas y columnas, si 
---éstas pueden ser nulas, y su tipo de dato correspondiente.
SELECT
t1.TABLE_NAME AS table_name,
t1.COLUMN_NAME AS referencia,
t1.IS_NULLABLE AS nulo,
t1.DATA_TYPE AS tipo_dato
FROM
INFORMATION_SCHEMA.COLUMNS t1
WHERE 
t1.TABLE_SCHEMA = 'public'
ORDER BY
t1.TABLE_NAME;

ALTER TABLE category
ADD COLUMN descripcion text;

UPDATE category
SET descripcion = 'dvd';












