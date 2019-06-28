clear screen;

DROP TABLE stadium CASCADE CONSTRAINTS;
DROP TABLE coach CASCADE CONSTRAINTS;
DROP TABLE team CASCADE CONSTRAINTS;
DROP TABLE team_stats CASCADE CONSTRAINTS;
DROP TABLE referee CASCADE CONSTRAINTS;
DROP TABLE time_slot CASCADE CONSTRAINTS;
DROP TABLE player CASCADE CONSTRAINTS;
DROP TABLE player_stats CASCADE CONSTRAINTS;
DROP TABLE matchplay CASCADE CONSTRAINTS;
DROP TABLE match_details CASCADE CONSTRAINTS;
DROP TABLE schedules CASCADE CONSTRAINTS;
DROP TABLE fouls CASCADE CONSTRAINTS;
DROP TABLE goals CASCADE CONSTRAINTS;
DROP TABLE point_table CASCADE CONSTRAINTS;



CREATE TABLE stadium 
( 
stadium_name varchar2(20) NOT NULL,
city varchar2(20) NOT NULL,
capacity number NOT NULL,
PRIMARY KEY(stadium_name)
);


CREATE TABLE coach
( 
coach_id number NOT NULL,
nationality varchar2(20) NOT NULL,
coach_name varchar2(20) NOT NULL,
PRIMARY KEY(coach_id)
);

CREATE TABLE team
(
team_id number NOT NULL,
team_name varchar2(20) NOT NULL,
coach_id number NOT NULL,
stadium_name varchar2(20) NOT NULL,
PRIMARY KEY(team_id),
FOREIGN KEY(coach_id) REFERENCES coach(coach_id),
FOREIGN KEY(stadium_name) REFERENCES stadium(stadium_name)
);

CREATE TABLE team_stats
(
team_id number NOT NULL,
season varchar(10) NOT NULL,
position varchar2(20) NOT NULL,
PRIMARY KEY(team_id,season),
FOREIGN KEY(team_id) REFERENCES team(team_id)
);

CREATE TABLE referee
(
ref_id number NOT NULL,
ref_name varchar2(20) NOT NULL,
nationality varchar2(20) NOT NULL,
PRIMARY KEY(ref_id)
);

CREATE TABLE time_slot
(
time_slot_id char(1) NOT NULL,
start_time varchar2(20) NOT NULL,
PRIMARY KEY(time_slot_id)
);

CREATE TABLE player
(
player_id number NOT NULL,
player_name varchar2(20) NOT NULL,
nationality varchar2(20) NOT NULL,
weight number NOT NULL,
height number NOT NULL,
date_of_birth date NOT NULL,
player_position varchar2(20) NOT NULL,
team_id number NOT NULL,
PRIMARY KEY(player_id),
FOREIGN KEY(team_id) REFERENCES team(team_id)
);

CREATE TABLE player_stats
(
player_id number NOT NULL,
p_season varchar(10) NOT NULL,
apps number NOT NULL,
goals number NOT NULL,
assists number NOT NULL,
own_goals number NOT NULL,
yellow_card number NOT NULL,
red_card number NOT NULL,
PRIMARY KEY(player_id,p_season),
FOREIGN KEY(player_id) REFERENCES player(player_id)
);

CREATE TABLE matchplay
(
match_id number NOT NULL,
score varchar2(20) NOT NULL,
stadium_name varchar2(20) NOT NULL,
ref_id number NOT NULL,
home_team_id number NOT NULL,
away_team_id number NOT NULL,
PRIMARY KEY(match_id),
FOREIGN KEY(stadium_name) REFERENCES stadium(stadium_name),
FOREIGN KEY(ref_id) REFERENCES referee(ref_id),
FOREIGN KEY(home_team_id) REFERENCES team(team_id),
FOREIGN KEY(away_team_id) REFERENCES team(team_id)
);

CREATE TABLE match_details
(
match_id number NOT NULL,
home_pos number NOT NULL,
away_pos number NOT NULL,
home_goals number NOT NULL,
away_goals number NOT NULL,
home_fouls number NOT NULL,
away_fouls number NOT NULL,
PRIMARY KEY(match_id),
FOREIGN KEY(match_id) REFERENCES matchplay(match_id)
);

CREATE TABLE schedules
(
match_id number NOT NULL,
time_slot_id char(1) NOT NULL,
play_date date NOT NULL,
PRIMARY KEY(match_id,time_slot_id),
FOREIGN KEY(match_id) REFERENCES matchplay(match_id),
FOREIGN KEY(time_slot_id) REFERENCES time_slot(time_slot_id)
);

CREATE TABLE fouls
(
player_id number NOT NULL,
match_id number NOT NULL,
foul_time number NOT NULL,
card_type varchar2(20) NOT NULL,
team_id number NOT NULL,
PRIMARY KEY(match_id,team_id,player_id,foul_time),
FOREIGN KEY(team_id) REFERENCES team(team_id),
FOREIGN KEY(match_id) REFERENCES matchplay(match_id),
FOREIGN KEY(player_id) REFERENCES player(player_id)
);

CREATE TABLE goals
(
player_id number NOT NULL,
match_id number NOT NULL,
goal_time number NOT NULL,
team_id number NOT NULL,
PRIMARY KEY(match_id,team_id,player_id,goal_time),
FOREIGN KEY(team_id) REFERENCES team(team_id),
FOREIGN KEY(match_id) REFERENCES matchplay(match_id),
FOREIGN KEY(player_id) REFERENCES player(player_id)
);

CREATE TABLE point_table
(
point_table_id number NOT NULL,
team_id number NOT NULL,
apps number NOT NULL,
wins number NOT NULL,
draw number NOT NULL,
loses number NOT NULL,
points number NOT NULL,
PRIMARY KEY(point_table_id),
FOREIGN KEY(team_id) REFERENCES team(team_id)
);


commit;