CREATE OR REPLACE PACKAGE BODY foot_manage AS 
   
procedure coach_pro(c_nation in varchar)
is

cursor cur_coach is
SELECT coach1@site_link1.coach_name, team1@site_link1.team_name FROM coach1@site_link1 INNER JOIN team1@site_link1 on team1@site_link1.coach_id = coach1@site_link1.coach_id WHERE coach1@site_link1.nationality = c_nation;

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



procedure player_pro(pla_pos in varchar, t_name2 in varchar)
is
	
cursor cur_player is
SELECT player1@site_link1.player_name FROM player1@site_link1 INNER JOIN team1@site_link1 ON team1@site_link1.team_id = player1@site_link1.team_id WHERE player1@site_link1.player_position = pla_pos AND team1@site_link1.team_name = t_name2;

pla_name varchar(30);

begin
	open cur_player;
	dbms_output.put_line(' ');
	dbms_output.put_line('.......................................');
	dbms_output.put_line('Forward Players of '||TO_CHAR(t_name2)|| ': ');
	dbms_output.put_line('.......................................');
	loop
		fetch cur_player into pla_name;
		exit when cur_player%notfound;
		dbms_output.put_line(pla_name);
	end loop;
	close cur_player;
end player_pro;



function stad_func(t_name in varchar)
return varchar2
is
sta_name varchar2(30);

begin
 select team2@site_link2.stadium_name from team2@site_link2 inner join team1@site_link1 ON team1@site_link1.team_id = team2@site_link2.team_id where team1@site_link1.team_name= t_name );

  return sta_name;

end stad_func;



procedure findTeamstat
(tname in varchar2)
is

cursor team_cur IS
SELECT team_stats.season, team_stats.position FROM team_stats WHERE team_id = ( SELECT team1@site_link1.team_id FROM team1@site_link1 WHERE team1@site_link1.team_name = tname);

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

end findTeamstat;
   
   
   
function topGoalScorer
	return varchar
	is
	
pname varchar(30);

begin
	
	SELECT player.player_name into pname FROM player where player.player_id=( select player_stats.player_id from player_stats where player_stats.goals=( select max(player_stats.goals) from player_stats ));

return pname;
end topGoalScorer;



function totalGoals
	(pname in varchar2)
	return integer
	is
	
tot_gl integer;

begin
	
	SELECT SUM(player_stats.goals) into tot_gl FROM player_stats GROUP BY player_stats.player_id HAVING player_stats.player_id = (SELECT player1@site_link1.player_id FROM player1@site_link1 WHERE player1@site_link1.player_name= pname);
	
return tot_gl;
end totalGoals;   


   
procedure up_pro(p_date in date)
is
	
cursor cur_upcom is
select homeTeam.team_name, awayTeam.team_name, schedules.play_date, time_slot.start_time 
from time_slot inner join schedules on time_slot.time_slot_id=schedules.time_slot_id 
inner join matchplay on schedules.match_id=matchplay.match_id inner join team homeTeam on matchplay.home_team_id=homeTeam.team_id 
inner join team awayTeam on matchplay.away_team_id=awayTeam.team_id 
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
   
   
END foot_manage;
/