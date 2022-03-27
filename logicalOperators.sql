-- Source Folder

-- source C:\Users\SMARTBOX\Desktop\logicalOperators.sql
-- select title, author_lname, author_fname from books
--
-- where  author_lname = 'Eggers' && author_fname='Dave'
-- && released_year > 2010 order by released_year DESC;


-- select * from products where brand ="lego" and instock = 'true';

-- select * from books where author_lname = 'Eggers'
-- or released_year > 2010 or
-- released_year > 100;

-- select title, released_year from books
-- where released_year >= 2004
--  && released_year <=2015;

-- select title,released_year from books
--
-- where released_year not between 2004 and 2015;


-- THIS WILL BE WORK BUT TO CAST WILL BE GIVE BEST RESULT
-- Select name, birthdt from people
-- where birthdt between '1980-01-01' and '2000-01-01';
--
-- Select name, birthdt from people
-- where birthdt between cast('1980-01-01' as Datetime)
-- and cast('2000-01-01' as Datetime);



-- select title, author_lname from books
-- where author_lname = 'Carver' or
-- author_lname = 'Lahiri' or
-- author_lname = 'Smith';


-- Shorter way to do it
-- select title, released_year from books
-- where released_year in(2017, 1985);

-- select title, released_year from books
--
-- where released_year >= 2000 and released_year % 2 !=0
--    order by released_year;

-- select  title, released_year,
--           CASE
--             WHEN released_year >= 2000 Then 'Modern Lit'
--             Else '20th Century Lit'
--           END as Gendre
--   From books;


-- select title,stock_quantity,
--           Case
--               WHEN stock_quantity between 0 and 50 then '*'
--               When stock_quantity between 51 and 100 then '**'
--               Else '***'
--           END As 'STOCK LEVEL'
--
--
-- From books;


--- YOURN TURN

-- TASK 1 Selct All the books written before 1980
--
-- select title,released_year
-- from books
-- where released_year < 1980;
--  TASK 2  Select All Books Written By Egger Or Chabon
-- select title, author_lname from books
-- where author_lname ='Eggers' or author_lname ='Chabon';
--TASK 3 Select All Books Written by Lahiri  published after 2000

-- select title, author_lname
--
-- from books
-- where author_lname = 'Lahiri' and released_year > 2000;

--TASK 4 sELECT All Books With Page Counts between 100 and 200
-- select title, pages
--
-- from books
-- where pages between 100 and 200;

--Task 5 Select all books where author_lname starts with a 'C'
-- or  an 'S'
--
-- select author_lname from books
-- where author_lname like 'C%' or author_lname like 'S%';

-- select title, author_lname,
--       CASE
--           when title like '%stories%' then 'Short Stories'
--           when title like '%Just Kids%' or title like '%A Heartbreaking%'
--           then 'Memoir'
--           else 'Novel'
--         END as 'TYPE'
-- from books;

-- BONUS

select title, author_fname, author_lname,

  CASE
      WHEN count(*) between 0 and 1 then concat(count(*),' book')
      Else concat(count(*),' books')
  END as COUNT
from books
group by author_lname, author_fname;
