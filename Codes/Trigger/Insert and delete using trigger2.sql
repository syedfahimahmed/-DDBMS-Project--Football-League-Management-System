SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER insert_into_site 
AFTER INSERT OR DELETE ON stadium 
REFERENCING OLD AS old NEW AS new
FOR EACH ROW

DECLARE 

BEGIN 
   
   IF INSERTING THEN
		IF :new.capacity >= 50000 THEN
			insert into stadium1@site_link1 values (:new.stadium_name, :new.city, :new.capacity);
		ELSE
			insert into stadium2@site_link2 values (:new.stadium_name, :new.city, :new.capacity);
		END IF;
	
   ELSE
		IF :old.capacity >= 50000 THEN
			delete from stadium1@site_link1 where stadium_name = :old.stadium_name;
		ELSE
			delete from stadium2@site_link2 where stadium_name = :old.stadium_name;
		END IF;
	END IF;
   
END; 
/ 