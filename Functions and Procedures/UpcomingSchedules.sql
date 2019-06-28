create or replace procedure up_pro(p_date in date)
is
	
cursor cur_upcom is
select homeTeam.team_name, awayTeam.team_name, schedules.play_date, time_slot.start_time 
from time_slot@site_link inner join schedules@site_link on time_slot.time_slot_id=schedules.time_slot_id 
inner join matchplay@site_link on schedules.match_id=matchplay.match_id inner join team@site_link homeTeam on matchplay.home_team_id=homeTeam.team_id 
inner join team@site_link awayTeam on matchplay.away_team_id=awayTeam.team_id 
where schedules.play_date>p_date; 


h_team varchar(30);
a_team varchar(30);
pl_date date;
st_time varchar(30);

begin
	open cur_upcom;
	dbms_output.put_line(' ');
	dbms_output.put_line('.................................................');
	dbms_output.put_line('		Upcoming Match Schedules: ');
	dbms_output.put_line('Home Team     Away Team     Date      Start Time');
	dbms_output.put_line('.................................................');
	for i in 1..5 loop
		fetch cur_upcom into h_team, a_team, pl_date, st_time;
		exit when cur_upcom%notfound;
		dbms_output.put_line(TO_CHAR(h_team)||'      '||TO_CHAR(a_team)||'    '||TO_CHAR(pl_date)||'    '||TO_CHAR(st_time));
	end loop;
	close cur_upcom;
end up_pro;
/