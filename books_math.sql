SELECT author_fname, author_lname, SUM(pages)
FROM books
GROUP BY author_lname, author_fname;

SELECT AVG(pages)
FROM books;

SELECT AVG(stock_quantity)
FROM books
GROUP BY released_year;

SELECT released_year, AVG(stock_quantity)
FROM books
GROUP BY released_year;

SELECT author_fname, author_lname, AVG(pages)
FROM books GROUP BY author_lname, author_fname;
