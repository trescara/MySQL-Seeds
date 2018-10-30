SELECT title
FROM books
WHERE title LIKE '%stories%';

SELECT title, pages
FROM books
ORDER BY pages DESC LIMIT 1;

SELECT CONCAT(title,' - ', released_year)
FROM books AS summary
ORDER BY released_year DESC LIMIT 3;

SELECT title, author_lname
FROM books
WHERE author_lname LIKE '% %';

SELECT title, released_year, stock_quantity
FROM books
ORDER BY stock_quantity, title
LIMIT 3;

SELECT title, author_lname
FROM books
ORDER BY author_lname, title;

SELECT UPPER(CONCAT('My favorite author is',' - ', author_fname, ' ', author_lname,'!'))
FROM books AS yell
ORDER BY author_lname;
