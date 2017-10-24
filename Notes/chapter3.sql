SELECT category, ROUND(AVG(retail),2) cataverage
FROM books
GROUP BY category

SELECT b.title, b.reatil, t.cataveragefrom books b,
SELECT category, ROUND(AVG(retail),2) cataverage
FROM books
GROUP BY category
Where b.category = t.category