
create or replace function totalGoals
	(pname in varchar2)
	return integer
	is
	
tot_gl integer;

begin
	
	SELECT SUM(player_stats.goals) into tot_gl FROM player_stats@site_link GROUP BY player_stats.player_id HAVING player_stats.player_id = (SELECT player.player_id FROM player@site_link WHERE player.player_name= pname);
	
return tot_gl;
end;
/