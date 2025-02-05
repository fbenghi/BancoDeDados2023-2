
/* 1. */
SELECT 
    SUM(quantityOrdered * priceEach) AS PRECO_TOTAL,
    SUM(quantityOrdered) AS QUANTIDADE_TOTAL
FROM
    orderdetails
WHERE
    orderNumber = 10100;

/*2. */
SELECT 
    products.productName AS NOME_PRODUTO
FROM
    products
        INNER JOIN
    orderdetails ON products.productCode = orderdetails.productCode
WHERE
    orderNumber = 10100;

/*3. */
SELECT 
	products.productName  AS NOME_PRODUTO, 
    productlines.productLine AS LINHA_PRODUTO, 
    productlines.textDescription AS DESCRICAO_PRODUTO
from products Inner join orderdetails
ON products.productCode = orderdetails.productCode
INNER JOIN productlines
ON productlines.productLine = products.productLine
WHERE orderNumber = 10100;

/*4. */
SELECT 
	products.productName AS NOME_PRODUTO,
    productlines.productLine AS LINHA_PRODUTO, 
	quantityOrdered * priceEach AS TOTAL_PRODUTO
from products Inner join orderdetails
ON products.productCode = orderdetails.productCode
INNER JOIN productlines
ON productlines.productLine = products.productLine
WHERE orderNumber = 10100;
