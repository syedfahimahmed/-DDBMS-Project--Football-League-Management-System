SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER update_stadium 
AFTER UPDATE OF capacity ON stadium 
REFERENCING OLD AS old NEW AS new
FOR EACH ROW


BEGIN 
   
	IF :old.capacity < 50000 and :new.capacity >= 50000 THEN
	
		delete from stadium2@site_link2 where stadium_name = :new.stadium_name;
		insert into stadium1@site_link1 values (:new.stadium_name,:new.city,:new.capacity);
	
	ELSIF :old.capacity >= 50000 and :new.capacity < 50000 THEN	
		delete from stadium1@site_link1 where stadium_name = :new.stadium_name;
		insert into stadium2@site_link2 values (:new.stadium_name, :new.city, :new.capacity);
		
	ELSIF :old.capacity >= 50000 and :new.capacity >= 50000 THEN	
		update stadium1@site_link1 set capacity = :new.capacity;
	
	ELSE
		update stadium2@site_link2 set capacity = :new.capacity;
		
	END IF;
   
END; 
/ 