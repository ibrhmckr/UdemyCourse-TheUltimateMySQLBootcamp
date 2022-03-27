-- source C:\Users\SMARTBOX\Desktop\JOIN.sql
-- create table customers(
--     id int auto_increment primary key,
--     first_name varchar(100),
--     last_name varchar(100),
--     email varchar(100)
-- )

-- Create table orders(
--      id int auto_increment primary key,
--      order_date date,
--      amount decimal(8,2),
--      customer_id int,
--      Foreign key(customer_id) references customers(id)
-- );
-- INSERT INTO customers (first_name, last_name, email)
-- VALUES ('Boy', 'George', 'george@gmail.com'),
--        ('George', 'Michael', 'gm@gmail.com'),
--        ('David', 'Bowie', 'david@gmail.com'),
--        ('Blue', 'Steele', 'blue@gmail.com'),
--        ('Bette', 'Davis', 'bette@aol.com');
--
-- INSERT INTO orders (order_date, amount, customer_id)
-- VALUES ('2016/02/10', 99.99, 1),
--        ('2017/11/11', 35.50, 1),
--        ('2014/12/12', 800.67, 2),
--        ('2015/01/03', 12.50, 2),
--        ('1999/04/11', 450.25, 5);

-- select * from customers
--
-- where last_name="George";
--
-- select * from orders where customer_id = 1;

-- select * from orders where customer_id =
--       (
--           select id from customers where last_name ='George'
--       );


-- select * from customers,orders;


-- select first_name,last_name,order_date,amount from customers,orders where customers.id = customer_id;

-- select first_name,last_name,order_date,amount from customers
-- Join orders on customers.id = orders.customer_id;


-- select * from custormers
-- join orders on customers.id = orders.customer_id;


-- select first_name,last_name,order_date,amount from orders
-- Join customers on customers.id = orders.customer_id;

-- select first_name,last_name,order_date,amount, sum(amount) as total_spend from customers
-- Join orders on customers.id = orders.customer_id
-- group by orders.customer_id
-- order by total_spend;

-- LEFT JOIN

-- select first_name,last_name,amount,IFNULL(Sum(amount), 0) as total_spend
--   from customers
-- left Join orders
-- on customers.id = orders.customer_id
-- group by customers.id
-- order by total_spend;

-- RIGHT JOIN
-- select * from customers
--  join orders
--   on customers.id = orders.customer_id;

--YOUR TURN
-- table relations is
--   one to many
--   many to one
--   many to many


-- We need one to many in this example--> One student can have many papers
-- create table students
--           (
--             id int auto_increment primary key,
--             first_name varchar(100)
--           );
--
-- create table papers
--     (
--     title varchar(100),
--     grade int,
--     student_id int,
--     foreign key (student_id)
--      references students(id)
--     on delete cascade
--   );

-- DATAS
-- INSERT INTO students (first_name) VALUES
-- ('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');
--
-- INSERT INTO papers (student_id, title, grade ) VALUES
-- (1, 'My First Book Report', 60),
-- (1, 'My Second Book Report', 75),
-- (2, 'Russian Lit Through The Ages', 94),
-- (2, 'De Montaigne and The Art of The Essay', 98),
-- (4, 'Borges and Magical Realism', 89);


-- Print this

--Solved with  Innder Join
select first_name,title,grade from students
inner join papers on students.id = papers.student_id
Order by grade DESC;

-- I think going to solve with left JOIN

select first_name,title,grade,id,student_id from students
left join papers on papers.student_id = students.id;


select first_name,ifnull(title,'missing') as title,ifnull(grade,0) as grade,id,student_id from students

left join papers on papers.student_id = students.id;


select first_name, ifnull(avg(grade),0) as average  from students

left join papers on papers.student_id = students.id
group by students.first_name
order by average desc;

select first_name, ifnull(avg(grade),0) as average,
  case
        when avg(grade) is null then 'FAILING'
        when avg(grade) >= 70 then 'PASSING'
        else 'FAILING'
  end as passing_status

 from students

left join papers on papers.student_id = students.id
group by students.first_name
order by average desc;
