--Nick DeFranco & Peter Schaldenbrand
--CS 1555 Database Management Project
purge recyclebin;

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
	status	number(1),
	date_sent	DATE,
	CONSTRAINT Friendships_PK PRIMARY KEY (userId1,userId2),
	CONSTRAINT Friendships_FK_Profiles1 FOREIGN KEY (userId1) REFERENCES Profiles(userID),
	CONSTRAINT Friendships_FK_Profiles2 FOREIGN KEY (userId2) REFERENCES Profiles(userID),
	CONSTRAINT Check_SameUser CHECK (userId1 != userId2)
);
--Status: 0 = pending, 1 = established

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
(	msgId	number(10) PRIMARY KEY,
	sender	number(10),
	receiver	number(10),
	subject	varchar2(32),
	body	varchar2(100),
	sent_date	TIMESTAMP,
	CONSTRAINT Messages_FK_ProfilesS FOREIGN KEY (sender) REFERENCES Profiles(userID),
	CONSTRAINT Messages_FK_ProfilesR FOREIGN KEY (receiver) REFERENCES Profiles(userID)
);

INSERT INTO Profiles VALUES(1, 'Ada', 'Lovelace', 'ada1@gmail.com', TO_DATE('1990-01-03','YYYY-MM-DD'),  TIMESTAMP '2016-03-29 14:24:51');
INSERT INTO Profiles VALUES(2, 'Na', 'Li','na2@gmail.com', TO_DATE('1993-08-21','YYYY-MM-DD'), TIMESTAMP '2016-04-13 05:21:02');
INSERT INTO Profiles VALUES(3, 'Francis', 'Lefebvre', 'francis3@gmail.com', TO_DATE('1994-09-01','YYYY-MM-DD'), TIMESTAMP '2015-12-26 01:51:28'); 
INSERT INTO Profiles VALUES(4, 'Amanda', 'Carlevaro', 'amanda4@gmail.com', TO_DATE('1991-12-25','YYYY-MM-DD'), TIMESTAMP '2016-02-29 19:12:07'); 
INSERT INTO Profiles VALUES(5, 'Ethan', 'Lee', 'ethan5@gmail.com', TO_DATE('1995-08-09','YYYY-MM-DD'), TIMESTAMP '2016-03-19 12:34:48'); 
INSERT INTO Profiles VALUES(6, 'Zina', 'Mkizungo', 'zina6@gmail.com', TO_DATE('1990-08-13','YYYY-MM-DD'), TIMESTAMP '2014-06-28 17:55:23');
INSERT INTO Profiles VALUES(7, 'Ada', 'Lovelace', 'ada1@gmail.com', TO_DATE('1990-01-03','YYYY-MM-DD'),  TIMESTAMP '2016-03-29 14:24:51');
INSERT INTO Profiles VALUES(8, 'Na', 'Li','na2@gmail.com', TO_DATE('1993-08-21','YYYY-MM-DD'), TIMESTAMP '2016-04-13 05:21:02');
INSERT INTO Profiles VALUES(9, 'Francis', 'Lefebvre', 'francis3@gmail.com', TO_DATE('1994-09-01','YYYY-MM-DD'), TIMESTAMP '2015-12-26 01:51:28'); 
INSERT INTO Profiles VALUES(10, 'Amanda', 'Carlevaro', 'amanda4@gmail.com', TO_DATE('1991-12-25','YYYY-MM-DD'), TIMESTAMP '2016-02-29 19:12:07'); 
INSERT INTO Profiles VALUES(11, 'Ethan', 'Lee', 'ethan5@gmail.com', TO_DATE('1995-08-09','YYYY-MM-DD'), TIMESTAMP '2016-03-19 12:34:48'); 
INSERT INTO Profiles VALUES(12, 'Zina', 'Mkizungo', 'zina6@gmail.com', TO_DATE('1990-08-13','YYYY-MM-DD'), TIMESTAMP '2014-06-28 17:55:23');
INSERT INTO Profiles VALUES(13, 'Ada', 'Lovelace', 'ada1@gmail.com', TO_DATE('1990-01-03','YYYY-MM-DD'),  TIMESTAMP '2016-03-29 14:24:51');
INSERT INTO Profiles VALUES(14, 'Na', 'Li','na2@gmail.com', TO_DATE('1993-08-21','YYYY-MM-DD'), TIMESTAMP '2016-04-13 05:21:02');
INSERT INTO Profiles VALUES(15, 'Francis', 'Lefebvre', 'francis3@gmail.com', TO_DATE('1994-09-01','YYYY-MM-DD'), TIMESTAMP '2015-12-26 01:51:28'); 
INSERT INTO Profiles VALUES(16, 'Amanda', 'Carlevaro', 'amanda4@gmail.com', TO_DATE('1991-12-25','YYYY-MM-DD'), TIMESTAMP '2016-02-29 19:12:07'); 
INSERT INTO Profiles VALUES(17, 'Ethan', 'Lee', 'ethan5@gmail.com', TO_DATE('1995-08-09','YYYY-MM-DD'), TIMESTAMP '2016-03-19 12:34:48'); 
INSERT INTO Profiles VALUES(18, 'Zina', 'Mkizungo', 'zina6@gmail.com', TO_DATE('1990-08-13','YYYY-MM-DD'), TIMESTAMP '2014-06-28 17:55:23');
INSERT INTO Profiles VALUES(19, 'Ada', 'Lovelace', 'ada1@gmail.com', TO_DATE('1990-01-03','YYYY-MM-DD'),  TIMESTAMP '2016-03-29 14:24:51');
INSERT INTO Profiles VALUES(20, 'Na', 'Li','na2@gmail.com', TO_DATE('1993-08-21','YYYY-MM-DD'), TIMESTAMP '2016-04-13 05:21:02');
INSERT INTO Profiles VALUES(21, 'Francis', 'Lefebvre', 'francis3@gmail.com', TO_DATE('1994-09-01','YYYY-MM-DD'), TIMESTAMP '2015-12-26 01:51:28'); 
INSERT INTO Profiles VALUES(22, 'Amanda', 'Carlevaro', 'amanda4@gmail.com', TO_DATE('1991-12-25','YYYY-MM-DD'), TIMESTAMP '2016-02-29 19:12:07'); 
INSERT INTO Profiles VALUES(23, 'Ethan', 'Lee', 'ethan5@gmail.com', TO_DATE('1995-08-09','YYYY-MM-DD'), TIMESTAMP '2016-03-19 12:34:48'); 
INSERT INTO Profiles VALUES(24, 'Zina', 'Mkizungo', 'zina6@gmail.com', TO_DATE('1990-08-13','YYYY-MM-DD'), TIMESTAMP '2014-06-28 17:55:23');
INSERT INTO Profiles VALUES(25, 'Ada', 'Lovelace', 'ada1@gmail.com', TO_DATE('1990-01-03','YYYY-MM-DD'),  TIMESTAMP '2016-03-29 14:24:51');
INSERT INTO Profiles VALUES(26, 'Na', 'Li','na2@gmail.com', TO_DATE('1993-08-21','YYYY-MM-DD'), TIMESTAMP '2016-04-13 05:21:02');
INSERT INTO Profiles VALUES(27, 'Francis', 'Lefebvre', 'francis3@gmail.com', TO_DATE('1994-09-01','YYYY-MM-DD'), TIMESTAMP '2015-12-26 01:51:28'); 
INSERT INTO Profiles VALUES(28, 'Amanda', 'Carlevaro', 'amanda4@gmail.com', TO_DATE('1991-12-25','YYYY-MM-DD'), TIMESTAMP '2016-02-29 19:12:07'); 
INSERT INTO Profiles VALUES(29, 'Ethan', 'Lee', 'ethan5@gmail.com', TO_DATE('1995-08-09','YYYY-MM-DD'), TIMESTAMP '2016-03-19 12:34:48'); 
INSERT INTO Profiles VALUES(30, 'Zina', 'Mkizungo', 'zina6@gmail.com', TO_DATE('1990-08-13','YYYY-MM-DD'), TIMESTAMP '2014-06-28 17:55:23');
INSERT INTO Profiles VALUES(31, 'Ada', 'Lovelace', 'ada1@gmail.com', TO_DATE('1990-01-03','YYYY-MM-DD'),  TIMESTAMP '2016-03-29 14:24:51');
INSERT INTO Profiles VALUES(32, 'Na', 'Li','na2@gmail.com', TO_DATE('1993-08-21','YYYY-MM-DD'), TIMESTAMP '2016-04-13 05:21:02');
INSERT INTO Profiles VALUES(33, 'Francis', 'Lefebvre', 'francis3@gmail.com', TO_DATE('1994-09-01','YYYY-MM-DD'), TIMESTAMP '2015-12-26 01:51:28'); 
INSERT INTO Profiles VALUES(34, 'Amanda', 'Carlevaro', 'amanda4@gmail.com', TO_DATE('1991-12-25','YYYY-MM-DD'), TIMESTAMP '2016-02-29 19:12:07'); 
INSERT INTO Profiles VALUES(35, 'Ethan', 'Lee', 'ethan5@gmail.com', TO_DATE('1995-08-09','YYYY-MM-DD'), TIMESTAMP '2016-03-19 12:34:48'); 
INSERT INTO Profiles VALUES(36, 'Zina', 'Mkizungo', 'zina6@gmail.com', TO_DATE('1990-08-13','YYYY-MM-DD'), TIMESTAMP '2014-06-28 17:55:23');
INSERT INTO Profiles VALUES(37, 'Ada', 'Lovelace', 'ada1@gmail.com', TO_DATE('1990-01-03','YYYY-MM-DD'),  TIMESTAMP '2016-03-29 14:24:51');
INSERT INTO Profiles VALUES(38, 'Na', 'Li','na2@gmail.com', TO_DATE('1993-08-21','YYYY-MM-DD'), TIMESTAMP '2016-04-13 05:21:02');
INSERT INTO Profiles VALUES(39, 'Francis', 'Lefebvre', 'francis3@gmail.com', TO_DATE('1994-09-01','YYYY-MM-DD'), TIMESTAMP '2015-12-26 01:51:28'); 
INSERT INTO Profiles VALUES(40, 'Amanda', 'Carlevaro', 'amanda4@gmail.com', TO_DATE('1991-12-25','YYYY-MM-DD'), TIMESTAMP '2016-02-29 19:12:07'); 
INSERT INTO Profiles VALUES(41, 'Ethan', 'Lee', 'ethan5@gmail.com', TO_DATE('1995-08-09','YYYY-MM-DD'), TIMESTAMP '2016-03-19 12:34:48'); 
INSERT INTO Profiles VALUES(42, 'Zina', 'Mkizungo', 'zina6@gmail.com', TO_DATE('1990-08-13','YYYY-MM-DD'), TIMESTAMP '2014-06-28 17:55:23');
INSERT INTO Profiles VALUES(43, 'Ada', 'Lovelace', 'ada1@gmail.com', TO_DATE('1990-01-03','YYYY-MM-DD'),  TIMESTAMP '2016-03-29 14:24:51');
INSERT INTO Profiles VALUES(44, 'Na', 'Li','na2@gmail.com', TO_DATE('1993-08-21','YYYY-MM-DD'), TIMESTAMP '2016-04-13 05:21:02');
INSERT INTO Profiles VALUES(45, 'Francis', 'Lefebvre', 'francis3@gmail.com', TO_DATE('1994-09-01','YYYY-MM-DD'), TIMESTAMP '2015-12-26 01:51:28'); 
INSERT INTO Profiles VALUES(46, 'Amanda', 'Carlevaro', 'amanda4@gmail.com', TO_DATE('1991-12-25','YYYY-MM-DD'), TIMESTAMP '2016-02-29 19:12:07'); 
INSERT INTO Profiles VALUES(47, 'Ethan', 'Lee', 'ethan5@gmail.com', TO_DATE('1995-08-09','YYYY-MM-DD'), TIMESTAMP '2016-03-19 12:34:48'); 
INSERT INTO Profiles VALUES(48, 'Zina', 'Mkizungo', 'zina6@gmail.com', TO_DATE('1990-08-13','YYYY-MM-DD'), TIMESTAMP '2014-06-28 17:55:23');
INSERT INTO Profiles VALUES(49, 'Ada', 'Lovelace', 'ada1@gmail.com', TO_DATE('1990-01-03','YYYY-MM-DD'),  TIMESTAMP '2016-03-29 14:24:51');
INSERT INTO Profiles VALUES(50, 'Na', 'Li','na2@gmail.com', TO_DATE('1993-08-21','YYYY-MM-DD'), TIMESTAMP '2016-04-13 05:21:02');
INSERT INTO Profiles VALUES(51, 'Francis', 'Lefebvre', 'francis3@gmail.com', TO_DATE('1994-09-01','YYYY-MM-DD'), TIMESTAMP '2015-12-26 01:51:28'); 
INSERT INTO Profiles VALUES(52, 'Amanda', 'Carlevaro', 'amanda4@gmail.com', TO_DATE('1991-12-25','YYYY-MM-DD'), TIMESTAMP '2016-02-29 19:12:07'); 
INSERT INTO Profiles VALUES(53, 'Ethan', 'Lee', 'ethan5@gmail.com', TO_DATE('1995-08-09','YYYY-MM-DD'), TIMESTAMP '2016-03-19 12:34:48'); 
INSERT INTO Profiles VALUES(54, 'Zina', 'Mkizungo', 'zina6@gmail.com', TO_DATE('1990-08-13','YYYY-MM-DD'), TIMESTAMP '2014-06-28 17:55:23');
INSERT INTO Profiles VALUES(55, 'Ada', 'Lovelace', 'ada1@gmail.com', TO_DATE('1990-01-03','YYYY-MM-DD'),  TIMESTAMP '2016-03-29 14:24:51');
INSERT INTO Profiles VALUES(56, 'Na', 'Li','na2@gmail.com', TO_DATE('1993-08-21','YYYY-MM-DD'), TIMESTAMP '2016-04-13 05:21:02');
INSERT INTO Profiles VALUES(57, 'Francis', 'Lefebvre', 'francis3@gmail.com', TO_DATE('1994-09-01','YYYY-MM-DD'), TIMESTAMP '2015-12-26 01:51:28'); 
INSERT INTO Profiles VALUES(58, 'Amanda', 'Carlevaro', 'amanda4@gmail.com', TO_DATE('1991-12-25','YYYY-MM-DD'), TIMESTAMP '2016-02-29 19:12:07'); 
INSERT INTO Profiles VALUES(59, 'Ethan', 'Lee', 'ethan5@gmail.com', TO_DATE('1995-08-09','YYYY-MM-DD'), TIMESTAMP '2016-03-19 12:34:48'); 
INSERT INTO Profiles VALUES(60, 'Zina', 'Mkizungo', 'zina6@gmail.com', TO_DATE('1990-08-13','YYYY-MM-DD'), TIMESTAMP '2014-06-28 17:55:23');
INSERT INTO Profiles VALUES(61, 'Ada', 'Lovelace', 'ada1@gmail.com', TO_DATE('1990-01-03','YYYY-MM-DD'),  TIMESTAMP '2016-03-29 14:24:51');
INSERT INTO Profiles VALUES(62, 'Na', 'Li','na2@gmail.com', TO_DATE('1993-08-21','YYYY-MM-DD'), TIMESTAMP '2016-04-13 05:21:02');
INSERT INTO Profiles VALUES(63, 'Francis', 'Lefebvre', 'francis3@gmail.com', TO_DATE('1994-09-01','YYYY-MM-DD'), TIMESTAMP '2015-12-26 01:51:28'); 
INSERT INTO Profiles VALUES(64, 'Amanda', 'Carlevaro', 'amanda4@gmail.com', TO_DATE('1991-12-25','YYYY-MM-DD'), TIMESTAMP '2016-02-29 19:12:07'); 
INSERT INTO Profiles VALUES(65, 'Ethan', 'Lee', 'ethan5@gmail.com', TO_DATE('1995-08-09','YYYY-MM-DD'), TIMESTAMP '2016-03-19 12:34:48'); 
INSERT INTO Profiles VALUES(66, 'Zina', 'Mkizungo', 'zina6@gmail.com', TO_DATE('1990-08-13','YYYY-MM-DD'), TIMESTAMP '2014-06-28 17:55:23');
INSERT INTO Profiles VALUES(67, 'Ada', 'Lovelace', 'ada1@gmail.com', TO_DATE('1990-01-03','YYYY-MM-DD'),  TIMESTAMP '2016-03-29 14:24:51');
INSERT INTO Profiles VALUES(68, 'Na', 'Li','na2@gmail.com', TO_DATE('1993-08-21','YYYY-MM-DD'), TIMESTAMP '2016-04-13 05:21:02');
INSERT INTO Profiles VALUES(69, 'Francis', 'Lefebvre', 'francis3@gmail.com', TO_DATE('1994-09-01','YYYY-MM-DD'), TIMESTAMP '2015-12-26 01:51:28'); 
INSERT INTO Profiles VALUES(70, 'Amanda', 'Carlevaro', 'amanda4@gmail.com', TO_DATE('1991-12-25','YYYY-MM-DD'), TIMESTAMP '2016-02-29 19:12:07'); 
INSERT INTO Profiles VALUES(71, 'Ethan', 'Lee', 'ethan5@gmail.com', TO_DATE('1995-08-09','YYYY-MM-DD'), TIMESTAMP '2016-03-19 12:34:48'); 
INSERT INTO Profiles VALUES(72, 'Zina', 'Mkizungo', 'zina6@gmail.com', TO_DATE('1990-08-13','YYYY-MM-DD'), TIMESTAMP '2014-06-28 17:55:23');
INSERT INTO Profiles VALUES(73, 'Ada', 'Lovelace', 'ada1@gmail.com', TO_DATE('1990-01-03','YYYY-MM-DD'),  TIMESTAMP '2016-03-29 14:24:51');
INSERT INTO Profiles VALUES(74, 'Na', 'Li','na2@gmail.com', TO_DATE('1993-08-21','YYYY-MM-DD'), TIMESTAMP '2016-04-13 05:21:02');
INSERT INTO Profiles VALUES(75, 'Francis', 'Lefebvre', 'francis3@gmail.com', TO_DATE('1994-09-01','YYYY-MM-DD'), TIMESTAMP '2015-12-26 01:51:28'); 
INSERT INTO Profiles VALUES(76, 'Amanda', 'Carlevaro', 'amanda4@gmail.com', TO_DATE('1991-12-25','YYYY-MM-DD'), TIMESTAMP '2016-02-29 19:12:07'); 
INSERT INTO Profiles VALUES(77, 'Ethan', 'Lee', 'ethan5@gmail.com', TO_DATE('1995-08-09','YYYY-MM-DD'), TIMESTAMP '2016-03-19 12:34:48'); 
INSERT INTO Profiles VALUES(78, 'Zina', 'Mkizungo', 'zina6@gmail.com', TO_DATE('1990-08-13','YYYY-MM-DD'), TIMESTAMP '2014-06-28 17:55:23');
INSERT INTO Profiles VALUES(79, 'Ada', 'Lovelace', 'ada1@gmail.com', TO_DATE('1990-01-03','YYYY-MM-DD'),  TIMESTAMP '2016-03-29 14:24:51');
INSERT INTO Profiles VALUES(80, 'Na', 'Li','na2@gmail.com', TO_DATE('1993-08-21','YYYY-MM-DD'), TIMESTAMP '2016-04-13 05:21:02');
INSERT INTO Profiles VALUES(81, 'Francis', 'Lefebvre', 'francis3@gmail.com', TO_DATE('1994-09-01','YYYY-MM-DD'), TIMESTAMP '2015-12-26 01:51:28'); 
INSERT INTO Profiles VALUES(82, 'Amanda', 'Carlevaro', 'amanda4@gmail.com', TO_DATE('1991-12-25','YYYY-MM-DD'), TIMESTAMP '2016-02-29 19:12:07'); 
INSERT INTO Profiles VALUES(83, 'Ethan', 'Lee', 'ethan5@gmail.com', TO_DATE('1995-08-09','YYYY-MM-DD'), TIMESTAMP '2016-03-19 12:34:48'); 
INSERT INTO Profiles VALUES(84, 'Zina', 'Mkizungo', 'zina6@gmail.com', TO_DATE('1990-08-13','YYYY-MM-DD'), TIMESTAMP '2014-06-28 17:55:23');
INSERT INTO Profiles VALUES(85, 'Ada', 'Lovelace', 'ada1@gmail.com', TO_DATE('1990-01-03','YYYY-MM-DD'),  TIMESTAMP '2016-03-29 14:24:51');
INSERT INTO Profiles VALUES(86, 'Na', 'Li','na2@gmail.com', TO_DATE('1993-08-21','YYYY-MM-DD'), TIMESTAMP '2016-04-13 05:21:02');
INSERT INTO Profiles VALUES(87, 'Francis', 'Lefebvre', 'francis3@gmail.com', TO_DATE('1994-09-01','YYYY-MM-DD'), TIMESTAMP '2015-12-26 01:51:28'); 
INSERT INTO Profiles VALUES(88, 'Amanda', 'Carlevaro', 'amanda4@gmail.com', TO_DATE('1991-12-25','YYYY-MM-DD'), TIMESTAMP '2016-02-29 19:12:07'); 
INSERT INTO Profiles VALUES(89, 'Ethan', 'Lee', 'ethan5@gmail.com', TO_DATE('1995-08-09','YYYY-MM-DD'), TIMESTAMP '2016-03-19 12:34:48'); 
INSERT INTO Profiles VALUES(90, 'Zina', 'Mkizungo', 'zina6@gmail.com', TO_DATE('1990-08-13','YYYY-MM-DD'), TIMESTAMP '2014-06-28 17:55:23');
INSERT INTO Profiles VALUES(91, 'Ada', 'Lovelace', 'ada1@gmail.com', TO_DATE('1990-01-03','YYYY-MM-DD'),  TIMESTAMP '2016-03-29 14:24:51');
INSERT INTO Profiles VALUES(92, 'Na', 'Li','na2@gmail.com', TO_DATE('1993-08-21','YYYY-MM-DD'), TIMESTAMP '2016-04-13 05:21:02');
INSERT INTO Profiles VALUES(93, 'Francis', 'Lefebvre', 'francis3@gmail.com', TO_DATE('1994-09-01','YYYY-MM-DD'), TIMESTAMP '2015-12-26 01:51:28'); 
INSERT INTO Profiles VALUES(94, 'Amanda', 'Carlevaro', 'amanda4@gmail.com', TO_DATE('1991-12-25','YYYY-MM-DD'), TIMESTAMP '2016-02-29 19:12:07'); 
INSERT INTO Profiles VALUES(95, 'Ethan', 'Lee', 'ethan5@gmail.com', TO_DATE('1995-08-09','YYYY-MM-DD'), TIMESTAMP '2016-03-19 12:34:48'); 
INSERT INTO Profiles VALUES(96, 'Zina', 'Mkizungo', 'zina6@gmail.com', TO_DATE('1990-08-13','YYYY-MM-DD'), TIMESTAMP '2014-06-28 17:55:23');
INSERT INTO Profiles VALUES(97, 'Ada', 'Lovelace', 'ada1@gmail.com', TO_DATE('1990-01-03','YYYY-MM-DD'),  TIMESTAMP '2016-03-29 14:24:51');
INSERT INTO Profiles VALUES(98, 'Na', 'Li','na2@gmail.com', TO_DATE('1993-08-21','YYYY-MM-DD'), TIMESTAMP '2016-04-13 05:21:02');
INSERT INTO Profiles VALUES(99, 'Francis', 'Lefebvre', 'francis3@gmail.com', TO_DATE('1994-09-01','YYYY-MM-DD'), TIMESTAMP '2015-12-26 01:51:28'); 
INSERT INTO Profiles VALUES(100, 'Amanda', 'Carlevaro', 'amanda4@gmail.com', TO_DATE('1991-12-25','YYYY-MM-DD'), TIMESTAMP '2016-02-29 19:12:07'); 

INSERT INTO Friendships VALUES(1,2,1,TO_DATE('2015-02-04','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(2,1,1,TO_DATE('2015-02-04','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(1,12,1,TO_DATE('2015-02-04','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(12,1,1,TO_DATE('2015-02-04','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(1,21,1,TO_DATE('2015-02-04','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(21,1,1,TO_DATE('2015-02-04','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(1,25,1,TO_DATE('2015-02-04','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(25,1,1,TO_DATE('2015-02-04','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(1,26,1,TO_DATE('2015-02-04','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(26,1,1,TO_DATE('2015-02-04','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(1,22,1,TO_DATE('2015-02-04','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(22,1,1,TO_DATE('2015-02-04','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(1,52,1,TO_DATE('2015-02-04','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(52,1,1,TO_DATE('2015-02-04','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(1,33,1,TO_DATE('2015-02-04','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(33,1,1,TO_DATE('2015-02-04','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(1,53,1,TO_DATE('2015-02-04','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(53,1,1,TO_DATE('2015-02-04','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(1,67,1,TO_DATE('2015-02-04','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(67,1,1,TO_DATE('2015-02-04','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(1,79,1,TO_DATE('2015-02-04','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(79,1,1,TO_DATE('2015-02-04','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(1,6,1,TO_DATE('2015-02-04','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(6,1,1,TO_DATE('2015-02-04','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(1,17,1,TO_DATE('2015-02-04','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(17,1,1,TO_DATE('2015-02-04','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(3,9,0,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(3,19,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(19,3,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(3,74,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(74,3,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(3,81,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(81,3,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(3,100,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(100,3,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(3,73,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(73,3,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(3,82,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(82,3,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(3,4,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(4,3,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(3,2,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(2,3,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(3,10,0,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(3,61,0,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(3,52,0,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(49,10,0,TO_DATE('2016-04-14', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(49,61,0,TO_DATE('2016-04-14', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(49,52,0,TO_DATE('2016-04-14', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(49,3,0,TO_DATE('2016-04-14', 'YYYY-MM-DD')); 
INSERT INTO Friendships VALUES(49,90,0,TO_DATE('2016-04-14', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(49,21,0,TO_DATE('2016-04-14', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(49,63,0,TO_DATE('2016-04-14', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(49,9,0,TO_DATE('2016-04-14', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(49,37,0,TO_DATE('2016-04-14', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(49,71,0,TO_DATE('2016-04-14', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(49,5,0,TO_DATE('2016-04-14', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(49,6,0,TO_DATE('2016-04-14', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(49,78,0,TO_DATE('2016-04-14', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(49,12,0,TO_DATE('2016-04-14', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(49,11,0,TO_DATE('2016-04-14', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(49,44,0,TO_DATE('2016-04-14', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(95,2,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(2,95,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(95,12,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(12,95,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(95,21,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(21,95,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(95,25,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(25,95,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(95,26,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(26,95,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(95,22,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(22,95,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(95,52,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(52,95,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(95,33,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(33,95,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(95,53,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(53,95,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(95,67,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(67,95,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(95,79,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(79,95,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(95,100,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(6,95,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(95,17,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(17,95,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(100,9,0,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(100,19,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(19,100,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(100,74,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(74,100,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(100,89,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(89,100,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(32,100,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(100,32,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(100,73,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(73,100,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(100,82,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(82,100,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(100,4,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(4,100,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(100,2,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(2,100,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(100,10,0,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(100,61,0,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(100,52,0,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(100,29,0,TO_DATE('2016-04-14', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(100,43,0,TO_DATE('2016-04-14', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(100,72,0,TO_DATE('2016-04-14', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(50,100,0,TO_DATE('2016-04-14', 'YYYY-MM-DD')); 
INSERT INTO Friendships VALUES(22,87,0,TO_DATE('2015-02-04','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(87,52,1,TO_DATE('2015-02-04','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(52,87,1,TO_DATE('2015-02-04','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(87,33,1,TO_DATE('2015-02-04','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(33,87,1,TO_DATE('2015-02-04','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(87,53,1,TO_DATE('2015-02-04','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(53,87,1,TO_DATE('2015-02-04','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(87,67,1,TO_DATE('2015-02-04','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(67,87,1,TO_DATE('2015-02-04','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(87,79,1,TO_DATE('2015-02-04','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(79,87,1,TO_DATE('2015-02-04','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(87,6,1,TO_DATE('2015-02-04','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(6,87,1,TO_DATE('2015-02-04','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(87,17,1,TO_DATE('2015-02-04','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(17,87,1,TO_DATE('2015-02-04','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(7,9,0,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(7,19,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(19,7,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(7,74,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(74,7,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(7,20,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(20,7,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(7,100,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(100,7,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(7,73,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(73,7,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(7,82,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(82,7,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(7,4,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(4,7,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(7,2,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(2,7,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(7,10,0,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(7,61,0,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(7,52,0,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(45,10,0,TO_DATE('2016-04-14', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(45,61,0,TO_DATE('2016-04-14', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(45,52,0,TO_DATE('2016-04-14', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(45,3,0,TO_DATE('2016-04-14', 'YYYY-MM-DD')); 
INSERT INTO Friendships VALUES(45,90,0,TO_DATE('2016-04-14', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(45,21,0,TO_DATE('2016-04-14', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(45,63,0,TO_DATE('2016-04-14', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(45,9,0,TO_DATE('2016-04-14', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(45,37,0,TO_DATE('2016-04-14', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(45,71,0,TO_DATE('2016-04-14', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(45,5,0,TO_DATE('2016-04-14', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(45,6,0,TO_DATE('2016-04-14', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(45,78,0,TO_DATE('2016-04-14', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(45,12,0,TO_DATE('2016-04-14', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(45,11,0,TO_DATE('2016-04-14', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(45,44,0,TO_DATE('2016-04-14', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(72,2,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(2,72,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(72,12,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(12,72,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(72,21,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(21,72,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(72,25,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(25,72,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(72,26,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(26,72,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(72,22,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(22,72,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(72,52,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(52,72,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(72,33,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(33,72,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(72,53,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(53,72,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(72,67,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(67,72,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(72,79,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(79,72,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(72,100,0,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(6,72,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(72,17,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(17,72,1,TO_DATE('2015-12-13','YYYY-MM-DD'));
INSERT INTO Friendships VALUES(36,9,0,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(36,19,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(19,36,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(36,74,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(74,36,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(36,89,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(89,36,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(32,36,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(36,32,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(36,73,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(73,36,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));

INSERT INTO Groups VALUES(1,'Fan of Superman','We think Superman is the best superhero!',10);
INSERT INTO Groups VALUES(2,'Fan of Batman','We think Batman is the best superhero!',10);
INSERT INTO Groups VALUES(3,'Fan of Wonder Woman','We think Wonder Woman is the best superhero!',10);
INSERT INTO Groups VALUES(4,'Fan of Flash','We think Flash is the best superhero!',10);
INSERT INTO Groups VALUES(5,'Fan of Aquaman','We think Aquaman is the best superhero!',10);
INSERT INTO Groups VALUES(6,'Fan of Cyborg','We think Cyborg is the best superhero!',10);
INSERT INTO Groups VALUES(7,'Fan of Nightwing','We think Nightwing is the best superhero!',10);
INSERT INTO Groups VALUES(8,'Fan of Green Arrow','We think Green Arrow is the best superhero!',10);
INSERT INTO Groups VALUES(9,'Fan of Martian Manhunter','We think Martian Manhunter is the best superhero!',10);
INSERT INTO Groups VALUES(10,'Fan of Hawkgirl','We think Hawkgirl is the best superhero!',10);
--The number of members would use the function COUNT() to get the real totals. 
--For now just having a set number 
INSERT INTO GroupMembers Values(1,1);
INSERT INTO GroupMembers Values(1,2);
INSERT INTO GroupMembers Values(1,3);
INSERT INTO GroupMembers Values(1,4);
INSERT INTO GroupMembers Values(1,5);
INSERT INTO GroupMembers Values(1,6);
INSERT INTO GroupMembers Values(1,7);
INSERT INTO GroupMembers Values(1,8);
INSERT INTO GroupMembers Values(1,9);
INSERT INTO GroupMembers Values(1,10);
INSERT INTO GroupMembers Values(2,11);
INSERT INTO GroupMembers Values(2,12);
INSERT INTO GroupMembers Values(2,13);
INSERT INTO GroupMembers Values(2,14);
INSERT INTO GroupMembers Values(2,15);
INSERT INTO GroupMembers Values(2,16);
INSERT INTO GroupMembers Values(2,17);
INSERT INTO GroupMembers Values(2,18);
INSERT INTO GroupMembers Values(2,19);
INSERT INTO GroupMembers Values(2,20);
INSERT INTO GroupMembers Values(3,21);
INSERT INTO GroupMembers Values(3,22);
INSERT INTO GroupMembers Values(3,23);
INSERT INTO GroupMembers Values(3,24);
INSERT INTO GroupMembers Values(3,25);
INSERT INTO GroupMembers Values(3,26);
INSERT INTO GroupMembers Values(3,27);
INSERT INTO GroupMembers Values(3,28);
INSERT INTO GroupMembers Values(3,29);
INSERT INTO GroupMembers Values(3,30);
INSERT INTO GroupMembers Values(4,31);
INSERT INTO GroupMembers Values(4,32);
INSERT INTO GroupMembers Values(4,33);
INSERT INTO GroupMembers Values(4,34);
INSERT INTO GroupMembers Values(4,35);
INSERT INTO GroupMembers Values(4,36);
INSERT INTO GroupMembers Values(4,37);
INSERT INTO GroupMembers Values(4,38);
INSERT INTO GroupMembers Values(4,39);
INSERT INTO GroupMembers Values(4,40);
INSERT INTO GroupMembers Values(5,41);
INSERT INTO GroupMembers Values(5,42);
INSERT INTO GroupMembers Values(5,43);
INSERT INTO GroupMembers Values(5,44);
INSERT INTO GroupMembers Values(5,45);
INSERT INTO GroupMembers Values(5,46);
INSERT INTO GroupMembers Values(5,47);
INSERT INTO GroupMembers Values(5,48);
INSERT INTO GroupMembers Values(5,49);
INSERT INTO GroupMembers Values(5,50);
INSERT INTO GroupMembers Values(6,51);
INSERT INTO GroupMembers Values(6,52);
INSERT INTO GroupMembers Values(6,53);
INSERT INTO GroupMembers Values(6,54);
INSERT INTO GroupMembers Values(6,55);
INSERT INTO GroupMembers Values(6,56);
INSERT INTO GroupMembers Values(6,57);
INSERT INTO GroupMembers Values(6,58);
INSERT INTO GroupMembers Values(6,59);
INSERT INTO GroupMembers Values(6,60);
INSERT INTO GroupMembers Values(7,61);
INSERT INTO GroupMembers Values(7,62);
INSERT INTO GroupMembers Values(7,63);
INSERT INTO GroupMembers Values(7,64);
INSERT INTO GroupMembers Values(7,65);
INSERT INTO GroupMembers Values(7,66);
INSERT INTO GroupMembers Values(7,67);
INSERT INTO GroupMembers Values(7,68);
INSERT INTO GroupMembers Values(7,69);
INSERT INTO GroupMembers Values(7,70);
INSERT INTO GroupMembers Values(8,71);
INSERT INTO GroupMembers Values(8,72);
INSERT INTO GroupMembers Values(8,73);
INSERT INTO GroupMembers Values(8,74);
INSERT INTO GroupMembers Values(8,75);
INSERT INTO GroupMembers Values(8,76);
INSERT INTO GroupMembers Values(8,77);
INSERT INTO GroupMembers Values(8,78);
INSERT INTO GroupMembers Values(8,79);
INSERT INTO GroupMembers Values(8,80);
INSERT INTO GroupMembers Values(9,81);
INSERT INTO GroupMembers Values(9,82);
INSERT INTO GroupMembers Values(9,83);
INSERT INTO GroupMembers Values(9,84);
INSERT INTO GroupMembers Values(9,85);
INSERT INTO GroupMembers Values(9,86);
INSERT INTO GroupMembers Values(9,87);
INSERT INTO GroupMembers Values(9,88);
INSERT INTO GroupMembers Values(9,89);
INSERT INTO GroupMembers Values(9,90);
INSERT INTO GroupMembers Values(10,91);
INSERT INTO GroupMembers Values(10,92);
INSERT INTO GroupMembers Values(10,93);
INSERT INTO GroupMembers Values(10,94);
INSERT INTO GroupMembers Values(10,95);
INSERT INTO GroupMembers Values(10,96);
INSERT INTO GroupMembers Values(10,97);
INSERT INTO GroupMembers Values(10,98);
INSERT INTO GroupMembers Values(10,99);
INSERT INTO GroupMembers Values(10,100);