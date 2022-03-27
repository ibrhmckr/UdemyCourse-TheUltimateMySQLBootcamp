create table users(
  username varchar(100),
  age int
);

insert into users(username,age) values
  ('Yang',14)
;

insert into follows(follower_id,followee_id) values(5,5)


create table unfollows(
    follower_id integer not null,
    followee_id integer not null,
    created_at timestamp default now(),
    foreign key(follower_id) references users(id),
    foreign key(followee_id) references users(id),
    primary key(follower_id,followee_id)
);


delete from follows where follower_id = 3;
