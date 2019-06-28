set serveroutput on;
create or replace procedure findTeamstat
(tname in varchar2)
is

cursor team_cur IS
SELECT team_stats.season, team_stats.position FROM team_stats@site_link WHERE team_id = ( SELECT team_id FROM team@site_link WHERE team.team_name = tname);

seasons varchar(10);
pos varchar(30);

begin

open team_cur;
	dbms_output.put_line(' ');
	DBMS_OUTPUT.PUT_LINE('................................');
	DBMS_OUTPUT.PUT_LINE('	Season	' || '	Position	');
	DBMS_OUTPUT.PUT_LINE('................................');
loop
	fetch team_cur into seasons, pos;
	exit when team_cur%notfound;
	
	DBMS_OUTPUT.PUT_LINE('	'||TO_CHAR(seasons) || '		'|| TO_CHAR(pos));
	
	end loop;
	close team_cur;

end;
/