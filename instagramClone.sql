-- source C:\Users\SMARTBOX\Desktop\instagramClone.sql
create table users(
create table users(
create table users(
create table users(

        id integer auto_increment primary key,
        username varchar(200) unique not null,
        created_at TimeStamp default now()
)

insert into users (username) VALUES
('BlueThecat'),
('CharlieBrown'),
('ColtSteele');


create table photos(
    id integer auto_increment primary key,
    image_url varchar(200) not null,
    user_id integer not null,
    created_at TimeStamp default now(),
    foreign key(user_id) references users(id)
);

insert into photos (image_url,user_id) VALUES
  ('/dasdadasd',1),
  ('/dasdadasd2',2),
  ('/dasdadasd3',2);


  select photos.image_url, users.username from photos
  Join users on users.id = photos.user_id

-- COMMENT TABLE

create table comments
    (
      id integer auto_increment primary key,
      comment_text varchar(200) not null ,
      user_id integer not null,
      photo_id integer not null,
      created_at timestamp default now(),
      foreign key(user_id) references users(id),
      foreign key (photo_id) references photos(id)
    )

--Inser INTO comments

insert into comments (comment_text,user_id,photo_id) VALUES
  ('Meow!', 1, 2),
  ('Amazing Shot!', 3, 2),
  ('Meow!', 1, 2),
  ('I < 3!', 2, 1);

-- LIKES TABLE

  create table likes
      (
        user_id int not null,
        photo_id int not null,
        created_at timestamp default now(),
        foreign key(user_id) references users(id),
        foreign key(photo_id) references photos(id),
        primary key(user_id, photo_id)
      )




  -- WON`T WORK BECAUSE OF primary KEY CONSTRAINT --> Kisitlama zorlama
  insert into likes (user_id, photo_id) VALUES
    (1,1),
    (2,1)
    (1,2)
    (1,3)
    (3,3);


-- FOLLOWS

create table follows(
        follower_id integer not null,
        followee_id integer not null,
        created_at TimeStamp default now(),
        foreign key(follower_id) references users(id),
        foreign key(followee_id) references users(id),
        primary key(follower_id,followee_id) -- It doesn't allow dublıcate combination
        )


  insert into follows(follower_id,followee_id) VALUES
    (1,2),
    (1,3),
    (3,1),
    (2,3);


--- HASTAGS

Create table tags(

            id integer auto_increment primary key,
            tag_name varchar(200) unique,
            created_at TimeStamp default now()
          )

Create table photo_tags(
        photo_id integer not null,
        tag_id integer not null,
        foreign key(photo_id) references photos(id),
        foreign key(tag_id) references tags(id),
        primary key(photo_id,tag_id)
      );


insert into tags(tag_name) VALUES
  ('adorable'),
  ('cute'),
  ('sunrise');


insert into photo_tags(photo_id,tag_id) values
(1,1),
(1,2),
(2,3),
(3,2);
