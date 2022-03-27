-- source C:\Users\SMARTBOX\Desktop\starter_data.sql

-- select id,username, created_at
-- from users
-- order by created_at ASC limit 5;


-- | Field      | Type         | Null | Key | Default           | Extra             |
-- +------------+--------------+------+-----+-------------------+-------------------+
-- | id         | int          | NO   | PRI | NULL              | auto_increment    |
-- | username   | varchar(200) | NO   | UNI | NULL              |                   |
-- | created_at | timestamp    | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
-- +------------+--------------+------+-----+-------------------+-------------------

-- MOST POPULAR REGISTRATION DAY

-- select *, dayname(created_at) AS DAY_NAME, count(dayname(created_at)) AS TOTAL from users
--
--
-- group by dayname(created_at)
-- order by count(dayname(created_at))  DESC
-- LIMIT 2;

-- IDENTIFY INACTIVE USERS (USERS WITH NO PHOTO)

-- select username,image_url
--
-- from users
--
-- left join photos on photos.user_id = users.id
-- where photos.id is NULL;

-- 4. Identify most popular photo (and user who created_at it)

-- select likes.photo_id, users.username,  count(likes.photo_id) as TOTAL_LIKES
-- from photos
-- Inner Join likes on photos.id = likes.photo_id
-- inner join users on users.id = photos.user_id
-- group by likes.photo_id
-- order by TOTAL_LIKES desc limit 10;


-- 5 CALCULATE AVERAGE POSTING

--Select count(*) from photos;
-- Select
--       (Select count(*) from photos) / (select count(*) from users) as AVG;


-- 6 FIND THE TOP 5 MOST COMMONLY USED HASTAGS

-- select tags.tag_name,
-- Count(*) as TOTAL from photo_tags
--
-- inner join tags
--       on photo_tags.tag_id = tags.id
-- group by tags.id
--
-- order by total desc
-- limit 5
-- ;
-- 7 FIND BOOT USERS WHO LIKED EVERY SINGLE photo

select photos.id,photos.user_id, count(*) as total
from photos
inner join likes
      on photos.id = likes.photo_id


group by likes.user_id
where total = 257

;
