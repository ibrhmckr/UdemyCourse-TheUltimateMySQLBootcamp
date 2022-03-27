-- Source Folder

-- source C:\Users\SMARTBOX\Desktop\aggregate.sql

-- select author_fname,
--         author_lname,
--         min(released_year)
-- from books
-- Group by author_fname,author_lname;

-- select Concat(author_fname," ",author_lname," ", pages)
-- as 'Longest Book'
-- from books
-- where pages=
--   (select max(pages) from books);

-- create table people (
--    name varchar(10),
--   birthdate DATE,
--   birthtime TIME,
--    birthdt DATETIME
--   );
-- insert into people(name, birthdate, birthtime, birthdt) values
--     (
--        'Microwave', curdate(), curtime(), now()
--     );

-- select
-- concat
-- (
--   monthname(birthdate),
--  ' ', day(birthdate),
--  ' ',year(birthdate)
-- )
-- from people;


-- create table comments
--   (
--     content varchar(100),
--     created_at timestamp default now()
--   );

-- insert into comments(content) values
--   ('asdkaskdakdalskdlkasld');
--

-- create table comments2
--   (
--     content varchar(100),
--     created_at timestamp default now() on update current_timestamp
--   );

-- insert into comments2(content) values
--   ('I like cats and dogs')
--   ;

-- create table inventory
--     (
--       item_name varchar(100),
--       price decimal(8,2),
--       quantity int
--     );

--
--     datetime has huger range than timestamp
--     Datetime can store date from 1880s to 2070s
--     but timestamp can store from 1970s to 2030s
--     and timestamp cover less memory


-- Tweets table

-- create table tweets
--     (
--       username varchar(50),
--       content varchar(140),
--       created_at timestamp default now() on update current_timestamp
--     );


insert into tweets(username, content) values
      ('Ibrahim CAKIR'),
      ('This is my first message at twitter');
