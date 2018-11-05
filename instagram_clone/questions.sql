-- FIND THE 5 OLDEST USERS

SELECT *
FROM users
ORDER BY created_at
LIMIT 5;

-- Most popular registration date

SELECT
  DAYNAME(created_at) AS day,
  COUNT(*) AS total
FROM users
GROUP BY day
ORDER BY total DESC;

-- INACTIVE USERS OR THOSE WHO HAVE NEVER POSTED A PHOTO

SELECT username, image_url
FROM users
LEFT JOIN photos
  ON users.id = photos.user_id
WHERE photos.id IS NULL;

-- MOST LIKED PHOTO

SELECT
  photos.id,
  username,
  COUNT(*) as total
FROM photos
  INNER JOIN likes
  ON likes.photo_id = photos.id
  INNER JOIN users
  ON users.id = photos.user_id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 1;

-- HOW MANY TIMES DOES THE AVERAGE USER POST?

-- SELECT COUNT(user_id) AS posts
-- FROM photos
-- RIGHT JOIN users
--   ON users.id = photos.user_id
-- GROUP BY photos.user_id;

SELECT
(SELECT Count(*) FROM photos) / (SELECT Count(*)FROM users) AS avg;

-- MOST COMMON 5 USED PHOTO TAGS


SELECT COUNT(*) as total, tag_id, tag_name
FROM photo_tags
JOIN tags
  ON tags.id = photo_tags.tag_id
GROUP BY tag_id
ORDER BY total DESC
LIMIT 5;

SELECT tags.tag_name,
       Count(*) AS total
FROM   photo_tags
       JOIN tags
         ON photo_tags.tag_id = tags.id
GROUP  BY tags.id
ORDER  BY total DESC
LIMIT  5;

-- FIND USERS WHO HAVE LIKED ALL PHOTOS

SELECT
  username,
  user_id,
  COUNT(*) AS total
FROM users
INNER JOIN likes
  ON users.id = likes.user_id
GROUP BY likes.user_id
HAVING total = (SELECT COUNT(*) FROM photos);