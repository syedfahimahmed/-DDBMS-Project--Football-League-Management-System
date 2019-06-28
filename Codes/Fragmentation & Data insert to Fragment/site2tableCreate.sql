clear screen;

DROP TABLE stadium2 CASCADE CONSTRAINTS;
DROP TABLE coach2 CASCADE CONSTRAINTS;
DROP TABLE referee2 CASCADE CONSTRAINTS;
DROP TABLE player2 CASCADE CONSTRAINTS;


CREATE TABLE stadium2 
( 
stadium_name varchar2(20) NOT NULL,
city varchar2(20) NOT NULL,
capacity number NOT NULL,
PRIMARY KEY(stadium_name)
);


CREATE TABLE coach2
( 
coach_id number NOT NULL,
nationality varchar2(20) NOT NULL,
coach_name varchar2(20) NOT NULL,
PRIMARY KEY(coach_id)
);

CREATE TABLE referee2
(
ref_id number NOT NULL,
ref_name varchar2(20) NOT NULL,
nationality varchar2(20) NOT NULL,
PRIMARY KEY(ref_id)
);

CREATE TABLE player2
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

);

CREATE TABLE team2
(
team_id number NOT NULL,
stadium_name varchar2(20) NOT NULL,
capacity number NOT NULL,
PRIMARY KEY(team_id)
);