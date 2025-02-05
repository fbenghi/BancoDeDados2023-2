SELECT * from Orders;
SELECT * from Orderdetails;

/* Quantas ordens de compra cada cliente já pediu? */

SELECT 
	CustomerNumber, Count(*)
FROM 
	Orders
group by
	CustomerNumber;
    
/* Quais clientes tem mais de 10 ordens de compra?*/
    
SELECT 
	CustomerNumber, Count(*)
FROM 
	Orders
group by
	CustomerNumber
HAVING
	Count(*) > 10;


/* Qual o valor total de cada ordem de compra (`orderNumber`) */

SELECT 
	orderNumber, SUM(priceEach*quantityOrdered)
FROM
	orderdetails
GROUP BY
	orderNumber;


/* Qual o nome dos clientes responsáveis pelas 5 maiores ordem de compra? */

SELECT 
	Orders.orderNumber, Orders.customerNumber, customers.customerName, SUM(priceEach*quantityOrdered) TOTAL_ORDER
FROM
	orderdetails
INNER JOIN
	Orders ON Orders.orderNumber = orderdetails.orderNumber
INNER JOIN
	customers ON customers.customerNumber = Orders.customerNumber
GROUP BY
	Orders.orderNumber, Orders.customerNumber, customers.customerName
Order BY
	TOTAL_ORDER DESC
LIMIT 5;