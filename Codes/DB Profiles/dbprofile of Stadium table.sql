DROP TABLE db_profile_stadium CASCADE CONSTRAINTS;

CREATE TABLE db_profile_stadium
(
attribute varchar2(15),
attribute_size number,
val integer,
PRIMARY KEY(attribute)
);

set serveroutput on;

declare 

cursor  c_cur is
SELECT column_name, data_length FROM user_tab_columns WHERE table_name = 'STADIUM';

c_name varchar2(15);
c_val integer;
c_len number;

card number;
tabSize number;


begin
	
	open c_cur;
	loop
		fetch c_cur into c_name,c_len;
		exit when c_cur%notFound;
		
		EXECUTE IMMEDIATE 'select count(distinct ' || c_name || ') from stadium' into c_val;
		insert into db_profile_stadium values(c_name,c_len,c_val);
	
	end loop;
	close c_cur;
	
	select count(*) into card from stadium;
	dbms_output.put_line('Card(stadium) = '||TO_CHAR(card));
	
	select sum(attribute_size) into tabSize from db_profile_stadium;
	dbms_output.put_line('Size(stadium) = '||TO_CHAR(tabSize));
	

	
end;
/

select * from db_profile_stadium;



