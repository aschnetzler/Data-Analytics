SELECT cost
FROM books
WHERE title ='DATABASE IMPLEMENTATION';

SELECT category, title, cost
FROM books
WHERE cost >= (SELECT cost
FROM books
WHERE title ='DATABASE IMPLEMENTATION')
ORDER BY cost;

--This code does not work will will discuss at a later time
SELECT title, shipdate, customer#
FROM customers JOIN orders USING(customer#)
JOIN orderitems USING(order#)
JOIN books USING(isbn)
WHERE shipdate <=
(SELECT shipdate FROM orders WHERE customer# = 'C1005');

SELECT category, title, pubdate
FROM books
WHERE pubdate >(SELECT pubdate FROM books WHERE title = 'HANDCRANKED COMPUTERS')
AND category='COMPUTER'
ORDER BY pubdate;

SELECT category, title, cost
FROM books
WHERE 
(SELECT cost FROM books WHERE title = 'DATABASE IMPLEMENTATION') <= cost
ORDER BY cost;

SELECT category, title, cost
FROM books
WHERE 
cost >=( SELECT cost FROM books WHERE title = 'DATABASE IMPLEMENTATION')
ORDER BY cost;

SELECT category, title, cost 
FROM books 
WHERE cost >=(SELECT cost FROM books WHERE title='DATABASE IMPLEMENTATION')
AND category ='COMPUTER'
ORDER BY cost;

--INCORRECT 
SELECT title,MIN(retail)
FROM books;

--INCORRECT 
SELECT title,MIN(retail)
FROM books
GROUP BY title;

--INCORRECT 
SELECT MIN(retail)
FROM books;

--CORRECT
SELECT title,retail
FROM books 
WHERE retail =(SELECT MIN(retail) FROM books);

SELECT category, AVG(retail-cost) "Average Profit"
FROM books
GROUP BY category
HAVING AVG(retail-cost) >
(SELECT AVG(retail-cost)
FROM books
WHERE category='LITERATURE');

--SUBQUERY
SELECT ROUND(AVG(retail), 2)
FROM books;

SELECT title, retail, 
(SELECT ROUND(AVG(retail), 2)
FROM books) "Average Retail"
FROM books;