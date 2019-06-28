set serveroutput on;
DECLARE
stad_name varchar2(30);
c_nat varchar2(30);
team_name varchar2(30);
pl_date date;
playerName VARCHAR2(30);
totGoal integer;

begin	
	
	team_name:= 'Barcelona';
	stad_name:= stad_func(team_name);
	dbms_output.put_line('.......................................');
	dbms_output.put_line('Stadium name of Barcelona :'|| TO_CHAR(stad_name));
	dbms_output.put_line('.......................................');

	
	playerName := 'Lionel Messi';
	totGoal:=totalGoals(playerName);
	DBMS_OUTPUT.PUT_LINE('.......................................................');
	DBMS_OUTPUT.PUT_LINE('Total Goals scored by '|| TO_CHAR(playerName) || ' : '|| TO_CHAR(totGoal));
	DBMS_OUTPUT.PUT_LINE('.......................................................');
	
	playername:= topGoalScorer();
	dbms_output.put_line('.......................................');
	dbms_output.put_line('Top goal scorer in La Liga: '|| TO_CHAR(playername));
	dbms_output.put_line('.......................................');
	
	
	c_nat:= 'Spanish';
	coach_pro(c_nat);
	
	player_pro('Forward','Barcelona');
	
	pl_date := '20-MAY-17';
	up_pro(pl_date);
	
	team_name:= 'Real Madrid';
	findTeamstat(team_name);
	
end;
/