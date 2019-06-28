CREATE OR REPLACE PACKAGE foot_manage AS 
   -- Spanish coaches in La Liga
   procedure coach_pro(c_nation in varchar);
   
   -- All forwards of Barcelona FC
   procedure player_pro(pla_pos in varchar, t_name2 in varchar);
   
   -- Stadium name of Barcelona FC
   function stad_func(t_name in varchar) return varchar2;
   
   -- Real Madrid FC's performance statistics
   procedure findTeamstat(tname in varchar2);
   
   -- Top goal scorer of La Liga in current season
   function topGoalScorer return varchar;
   
   -- Total goals of Messi
   function totalGoals (pname in varchar2) return integer;
   
   -- Upcoming matches in La Liga
   procedure up_pro(p_date in date);
  
END foot_manage;
/