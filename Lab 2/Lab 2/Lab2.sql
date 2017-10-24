SELECT Order#, Shipstate, Shipdate
FROM orders
WHERE Shipstate = (SELECT shipstate
FROM orders
WHERE order# ='1014');

SELECT title,retail
FROM books 
WHERE retail =(SELECT MAX(retail) FROM books);

SELECT title,pubdate
FROM books 
WHERE pubdate =(SELECT MAX(pubdate) FROM books);

SELECT title,retail,(SELECT round(AVG(retail), 2) FROM books) "AVG_Retail"
FROM books
WHERE retail>(SELECT round(AVG(retail), 2) FROM books)
GROUP BY title, retail;