-- source C:\Users\SMARTBOX\Desktop\mySql\query.sql

create table users(
        email varchar(200) primary key,
        created_at timestamp default now()
);

insert into users(email) values
  ('Katie34@yahoo.com'),
  ('Tundegmail.com');

  select date_format(created_at,'%M %D %Y') as earliest_date from users
  order by created_at ASC limit 1;

  select email, date_format(created_at,'%M %D %Y') as earliest_date from users
  order by created_at asc limit 1;

select data_format(min(created_at),'%M %D %Y') as earliest_date
from users;

select email,date_format(min(created_at),"%M %D %Y") as earliest_date
from users
where created_at = (select min(created_at))
;


select monthname(created_at) as month, count(*) as COUNT
from users
group by month
order by COUNT DESC;


select email, count(*) from users
group by email like'%@yahoo.com';


select email,
        case
              when email like'%@yahoo.com' then 'yahoo'
              when email like'%@gmail.com' then 'gmail'
              when email like'%@hotmail.com' then 'hotmail'
              else 'other'

        end as provider,
        count(*)
from users

group by provider

;
