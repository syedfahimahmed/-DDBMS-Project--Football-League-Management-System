create or replace procedure coach_pro(c_nation in varchar)
is

cursor cur_coach is
SELECT coach.coach_name, team.team_name FROM coach@site_link INNER JOIN team@site_link on team.coach_id = coach.coach_id WHERE coach.nationality = c_nation;

c_name varchar(30);
team_n varchar(30);

begin
	open cur_coach;
	dbms_output.put_line(' ');
	dbms_output.put_line('................................................');
	dbms_output.put_line('Coach Name			Team Name');
	dbms_output.put_line('................................................');
	loop
		fetch cur_coach into c_name, team_n;
		exit when cur_coach%notfound;
		dbms_output.put_line(TO_CHAR(c_name)||'			'||TO_CHAR(team_n));
	end loop;
	close cur_coach;
end coach_pro;
/