USE classicmodels;

# 1.- Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo nombre empiece con A.
SELECT employeeNumber, lastName, firstName
FROM employees
WHERE firstName LIKE "A%";

# 2.- Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo apellido termina con on.
SELECT employeeNumber, lastName, firstName
FROM employees
WHERE lastName LIKE "%on";

# 3.- Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo nombre incluye la cadena on.
SELECT employeeNumber, lastName, firstName
FROM employees
WHERE lastName LIKE "%on%";

# 4.- Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyos nombres tienen seis letras e inician con G.
SELECT employeeNumber, lastName, firstName
FROM employees
WHERE firstName LIKE "G_____";

# 5.- Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo nombre no inicia con B.
SELECT employeeNumber, lastName, firstName
FROM employees
WHERE firstName NOT LIKE "B%";

# 6.- Dentro de la tabla products, obten el código de producto y nombre de los productos cuyo código incluye la cadena _20.
SELECT productCode, productName
FROM products
WHERE productCode NOT LIKE "%_20";

# 7.- Dentro de la tabla orderdetails, obten el total de cada orden.
SELECT orderNumber, SUM(quantityOrdered) as total_per_order
FROM orderdetails
GROUP BY orderNumber;

# 8.- Dentro de la tabla orders obten el número de órdenes por año.
SELECT
  EXTRACT(year FROM orderDate) AS year,
  COUNT(orderNumber) AS orders_per_year
FROM orders
GROUP BY EXTRACT(year FROM orderDate);

# 9.- Obten el apellido y nombre de los empleados cuya oficina está ubicada en USA.
SELECT lastName, firstName
FROM employees
INNER JOIN offices ON employees.officeCode = offices.officeCode
WHERE country = "USA";

# 10.- Obten el número de cliente, número de cheque y cantidad del cliente que ha realizado el pago más alto.
SELECT payments.customerNumber, checkNumber, amount
FROM payments
INNER JOIN customers ON payments.customerNumber = customers.customerNumber
INNER JOIN orders ON customers.customerNumber = orders.customerNumber
ORDER BY amount DESC
LIMIT 1;

# 11.- Obten el número de cliente, número de cheque y cantidad de aquellos clientes cuyo pago es más alto que el promedio. *** NO LO PUDE HACER ***
SELECT customerNumber, checkNumber, MAX(amount)
FROM payments
GROUP BY customerNumber;

# 12.- Obten el nombre de aquellos clientes que no han hecho ninguna orden. *** NO LO PUDE HACER ***
SELECT *
FROM payments
INNER JOIN customers ON payments.customerNumber = customers.customerNumber
INNER JOIN orders ON customers.customerNumber = orders.customerNumber;

# 13.- Obten el máximo, mínimo y promedio del número de productos en las órdenes de venta.
SELECT MAX(amount)
FROM payments;

SELECT MIN(amount)
FROM payments;

SELECT AVG(amount)
FROM payments;

# 14.- Dentro de la tabla orders, obten el número de órdenes que hay por cada estado.
SELECT status, COUNT(orderNumber) as count
FROM orders
GROUP BY status;