create or replace function stad_func(t_name in varchar)
return varchar2
is
sta_name varchar2(30);

begin
  SELECT stadium.stadium_name into sta_name
  FROM stadium@site_link where stadium.stadium_name = 
  ( select team.stadium_name from team@site_link where team.team_name= t_name );

  return sta_name;

end stad_func;
/