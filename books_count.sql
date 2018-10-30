SELECT COUNT (*)
FROM books;

SELECT COUNT(DISTINCT author_fname)
FROM BOOKS;

SELECT COUNT(DISTINCT author_lname, author_fname
)
FROM BOOKS;

SELECT COUNT(*)
FROM books
WHERE title LIKE '%the%';

