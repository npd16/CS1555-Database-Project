--Nick DeFranco & Peter Schaldenbrand
--CS 1555 Database Management Project

DROP TABLE Profiles CASCADE CONSTRAINTS;
DROP TABLE Friendships CASCADE CONSTRAINTS;
DROP TABLE Groups CASCADE CONSTRAINTS;
DROP TABLE GroupMembers CASCADE CONSTRAINTS;
DROP TABLE Messages CASCADE CONSTRAINTS;

CREATE TABLE Profiles
(   userID  number(10) PRIMARY KEY,
    fname   varchar2(10),
    lname   varchar2(32),
    email   varchar2(42),
    dob    	DATE,
    last_login TIMESTAMP
);

CREATE TABLE Friendships
(	shipId	number(10) PRIMARY KEY,
	userId1 number(10),
	userId2	number(10),
	status	varchar2(12),
	date_sent	DATE
);

CREATE TABLE Groups
(	groupId	number(10) PRIMARY KEY,
	gname	varchar2(32),
	description	varchar2(140),
	members	number(3)
);

CREATE TABLE GroupMembers
(	groupId	number(10),
	userId	number(10)
);

CREATE TABLE Messages
(	sender	number(10),
	receiver	number(10),
	subject	varchar2(32),
	body	varchar2(100),
	sent_date	TIMESTAMP
);