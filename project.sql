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
(	userId1 number(10),
	userId2	number(10),
	status	number(1),	--0 for pending : 1 for full-on friendship
	date_sent	DATE,
	CONSTRAINT Friendships_PK PRIMARY KEY (userId1,userId2),
	CONSTRAINT Friendships_FK_Profiles1 FOREIGN KEY (userId1) REFERENCES Profiles(userID),
	CONSTRAINT Friendships_FK_Profiles2 FOREIGN KEY (userId2) REFERENCES Profiles(userID),
	CONSTRAINT Check_SameUser CHECK (userId1 != userId2)
);

CREATE TABLE Groups
(	groupId	number(10) PRIMARY KEY,
	gname	varchar2(32),
	description	varchar2(140),
	members	number(4),
	CONSTRAINT Check_Members CHECK (members <= 1000)
);

CREATE TABLE GroupMembers
(	groupId	number(10),
	userId	number(10),
	CONSTRAINT GroupMembers_FK_Groups FOREIGN KEY (groupId) REFERENCES Groups(groupId),
	CONSTRAINT GroupMembers_FK_Profiles FOREIGN KEY (userId) REFERENCES Profiles(userID)
);

CREATE TABLE Messages
(	sender	number(10),
	receiver	number(10),
	subject	varchar2(32),
	body	varchar2(100),
	sent_date	TIMESTAMP,
	CONSTRAINT Messages_FK_ProfilesS FOREIGN KEY (sender) REFERENCES Profiles(userID),
	CONSTRAINT Messages_FK_ProfilesR FOREIGN KEY (receiver) REFERENCES Profiles(userID)
);
