set serveroutput on;

declare

--for coach table

cursor  c_cur is
select coach_id,nationality,coach_name from coach;

c_id number;
c_nat varchar2(20);
c_name varchar2(20);


--for stadium table
cursor s_cur is
select stadium_name,city,capacity FROM stadium;

s_name varchar2(20);
s_city varchar2(20);
cap number;

--for referee table
cursor  r_cur is
select ref_id,ref_name,nationality from referee;

r_id number;
r_name varchar2(20);
r_nat varchar2(20);


--for Team1 table
cursor t_cur is
select team.team_id, team.team_name, team.coach_id,stadium1.city from team inner join stadium1@site_link1 on stadium1.stadium_name = team.stadium_name;

t_id number;
t_name varchar2(20);
tc_id number;
t_stadium varchar2(20);


--for Team2 table
cursor t_cur2 is
select team.team_id, stadium1.stadium_name,stadium1.capacity from team inner join stadium1@site_link1 on stadium1.stadium_name = team.stadium_name;

s_cap number;

--for player table
cursor p_cur is
select player_id, player_name, nationality, weight, height, date_of_birth, player_position, team_id from player;

p_id number;
p_name varchar2(20);
p_nat varchar2(20);
p_weight number;
p_height number;
p_date date;
p_pos varchar2(20);
p_team number;

begin
	open c_cur;
	loop
		fetch c_cur into c_id,c_nat,c_name;
		exit when c_cur%notFound;
		
		IF c_nat = 'Spanish'
		THEN insert into coach1@site_link1 values(c_id,c_nat,c_name);
		
		ELSE 
		insert into coach2@site_link2 values(c_id,c_nat,c_name);
		
		END IF;
	end loop;
	close c_cur;
	
	open s_cur;
	loop
		fetch s_cur into s_name,s_city,cap;
		exit when s_cur%notFound;
		
		IF cap >= 50000
		THEN insert into stadium1@site_link1 values(s_name,s_city,cap);
		
		ELSE
		insert into stadium2@site_link2 values(s_name,s_city,cap);
		
		END IF;
	end loop;
	close s_cur;
	
	open r_cur;
	loop
		fetch r_cur into r_id,r_name,r_nat;
		exit when r_cur%notFound;
		
		IF r_nat = 'Spanish'
		THEN insert into referee1@site_link1 values(r_id,r_name,r_nat);
		
		ELSE
		insert into referee2@site_link2 values(r_id,r_name,r_nat);
		
		END IF;
	end loop;
	close r_cur;
	
	
	open t_cur;
	loop
		fetch t_cur into t_id,t_name,tc_id,s_city;
		exit when t_cur%notFound;
		insert into team1@site_link1 values(t_id,t_name,tc_id,s_city);
	end loop;
	close t_cur;
	
	open t_cur2;
	loop
		fetch t_cur2 into t_id,t_stadium,s_cap;
		exit when t_cur2%notFound;
		insert into team2@site_link2 values(t_id,t_stadium,s_cap);
	end loop;
	close t_cur2;
	
	
	open p_cur;
	loop
		fetch p_cur into p_id,p_name,p_nat,p_weight,p_height,p_date,p_pos,p_team;
		exit when p_cur%notFound
		
		IF p_team = 4 THEN
			insert into player1@site_link1 values(p_id,p_name,p_nat,p_weight,p_height,p_date,p_pos,p_team);
		ELSIF p_team = 15 THEN
			insert into player2@site_link2 values(p_id,p_name,p_nat,p_weight,p_height,p_date,p_pos,p_team);	
		END IF;
		
	end loop;
	close p_cur;
	
	
	
end;
/


commit;