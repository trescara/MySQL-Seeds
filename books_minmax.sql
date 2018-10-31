SELECT MIN(released_year)
FROM books;

SELECT MAX(pages)
FROM books;


-- Using SubQuery to avoid MINMAX issues
SELECT title, pages
FROM books
WHERE pages = (SELECT Max(pages)
FROM books);

-- This is a shorter way of doing this by single query

SELECT title, pages
FROM books
ORDER BY pages DESC
LIMIT 1;

SELECT author_fname, author_lname, MIN(released_year)
FROM books
GROUP BY author_lname, author_fname
ORDER BY author_lname DESC;

SELECT author_fname, author_lname, Max(pages)
FROM books
GROUP BY author_lname,
         author_fname;

SELECT CONCAT(author_fname, ' ', author_lname) AS author,
  MAX(pages) AS 'longest book'
FROM books
GROUP BY author_lname,
         author_fname;