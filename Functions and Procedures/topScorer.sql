
create or replace function topGoalScorer
	return varchar
	is
	
pname varchar(30);

begin
	
	SELECT player.player_name into pname FROM player where player.player_id=( select player_stats.player_id from player_stats where player_stats.goals=( select max(player_stats.goals) from player_stats ));

return pname;
end;
/