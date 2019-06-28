clear screen;

DROP TABLE stadium1 CASCADE CONSTRAINTS;
DROP TABLE coach1 CASCADE CONSTRAINTS;
DROP TABLE referee1 CASCADE CONSTRAINTS;
DROP TABLE player1 CASCADE CONSTRAINTS;

CREATE TABLE stadium1 
( 
stadium_name varchar2(20) NOT NULL,
city varchar2(20) NOT NULL,
capacity number NOT NULL,
PRIMARY KEY(stadium_name)
);


CREATE TABLE coach1
( 
coach_id number NOT NULL,
nationality varchar2(20) NOT NULL,
coach_name varchar2(20) NOT NULL,
PRIMARY KEY(coach_id)
);

CREATE TABLE referee1
(
ref_id number NOT NULL,
ref_name varchar2(20) NOT NULL,
nationality varchar2(20) NOT NULL,
PRIMARY KEY(ref_id)
);

CREATE TABLE player1
(
player_id number NOT NULL,
player_name varchar2(20) NOT NULL,
nationality varchar2(20) NOT NULL,
weight number NOT NULL,
height number NOT NULL,
date_of_birth date NOT NULL,
player_position varchar2(20) NOT NULL,
team_id number NOT NULL,
PRIMARY KEY(player_id)
);

CREATE TABLE team1
(
team_id number NOT NULL,
team_name varchar2(20) NOT NULL,
coach_id number NOT NULL,
city varchar2(20) NOT NULL,
PRIMARY KEY(team_id)
);