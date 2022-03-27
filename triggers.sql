DELIMITER $$

CREATE TRIGGER must_be_adult
     BEFORE INSERT ON users FOR EACH ROW
     BEGIN
          IF NEW.age < 18
          THEN
              SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Must be an adult!';
          END IF;
     END;
$$

DELIMITER ;


DELIMITER $$

create trigger prevent_self_follows
  Before insert on follows FOR EACH ROW
  BEGIN
        if new.follower_id = new.followee_id
        then
            SIGNAL SQLSTATE '45000'
            set MESSAGE_TEXT = 'You can not follow yourself!';
        end if;
  END;

  $$
  DELIMITER ;


-- TYPICALL INSERT
Delimiter $$

create trigger capture_unfollows

  after delete on follows for each ROW
        BEGIN
              insert into unfollows(follower_id,followee_id)
                values(old.follower_id,old.followee_id)
        END;



$$
DELIMITER ;


-- COLTS WAY insert

DELIMITER $$

create trigger capture_unfollows
        after delete on follows for each ROW
        BEGIN
             insert into unfollows
               set
               followee_id = old.followee_id,
               follower_id = old.follower_id;

        END

$$

Delimiter ;
