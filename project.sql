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
(	sender	number(10),
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
INSERT INTO Friendships VALUES(3,19,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(19,3,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(3,100,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(100,3,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(3,73,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(73,3,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(3,82,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
INSERT INTO Friendships VALUES(182,3,1,TO_DATE('2016-02-17', 'YYYY-MM-DD'));
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
INSERT INTO Friendships VALUES(49,3,0,TO_DATE('2016-04-14', 'YYYY-MM-DD')); --50
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


