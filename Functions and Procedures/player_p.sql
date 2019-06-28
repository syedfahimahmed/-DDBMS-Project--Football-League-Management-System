create or replace procedure player_pro(pla_pos in varchar, t_name2 in varchar)
is
	
cursor cur_player is
SELECT player.player_name FROM player@site_link INNER JOIN team@site_link ON team.team_id = player.team_id WHERE player.player_position = pla_pos AND team.team_name = t_name2;

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
/