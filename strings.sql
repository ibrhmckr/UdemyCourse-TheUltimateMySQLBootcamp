-- select
-- concat
--   (
--   substring(title,1,10),
-- "..."
--   )
--   As 'Short title'
-- from books;
-- Select
-- substring
-- (
--     Replace
--       (
--         title, 'e','3'
--       ),1,10
-- )
--   From books;

-- select concat
--       (
--         upper(author_fname), ' ', upper(author_lname)
--       )
--       as 'full name in caps'
--       from books;


-- Select concat
--         (
--           title, 'was released in ',released_year
--         )
--         as 'Blurb'
--         from books;

-- select title  as 'title', char_length(title) as 'character count'
-- from books;


-- select concat(substring(title,1,10),'...') as 'short title',
--  concat(author_lname, ',',author_fname) as 'author',
--  concat(stock_quantity,' in stock') as "quantity"
--  from books;

-- INSERT INTO books
--     (title, author_fname, author_lname, released_year, stock_quantity, pages)
--     VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256),
--            ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
--            ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
--

-- select distinct author_lname from books;

--
-- select distinct concat(author_fname,' ', author_lname) from books;

-- select distinct author_fname, author_lname from books;
--
-- select author_lname from books order by author_lname;

-- select title, released_year from books order by released_year desc limit 5;


--- YOUR TURN
--1
--select title from books where title like '%stories%';
--2 Longest books
 --select title,pages from books order by pages desc limit 1;

--3 Most recent books
--select concat(title,'-',released_year) as Summary from books order by released_year desc limit 3;

--4 Find one space
--select title, author_lname from books where author_lname like '% %';

--5 Find The 3 Books With The Lowest Stock
--select title, released_year,stock_quantity from books order by 3 limit 3;

--6 Print the title and author_lname,sorted first by author_lname and then by title

--select title, author_lname from books order by author_lname,title;

-- select  upper
--               (
--
-- concat
--       (
--         'my favorite author is ', author_fname, ' ', author_lname,'!'
--       )
--
--     )
--       as yell
--       from books
--
--       order by author_lname;
