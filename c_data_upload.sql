--data uploading--

begin;

insert into election values
	('2019-04-09', 1),
	('2019-09-17', 2),
	('2020-03-02', 3),
	('2021-03-23', 4),
	('2022-11-01', 5);
	
insert into party values
	('nature party', 'np'),
	('science group', 'sg'),
	('life party', 'lp'),
	('art group', 'ag'),
	('lost group', 'lg');
	
insert into city values
	(22, 'ryde end', 'north'),
	(77, 'east strat', 'north'),
	(33, 'grandetu', 'center'),
	(88, 'royalpre', 'hills'),
	(11, 'carlpa', 'hills'),
	(44, 'lommont', 'north'),
	(66, 'grand sen', 'south'),
	(99, 'kingo haven', 'hills'),
	(55, 'el munds', 'south');
	
insert into running values
	('nature party', '2019-04-09', 12345),
	('life party', '2019-04-09', 54321),
	('lost group', '2019-04-09', 34567),
	('lost group', '2019-09-17', 76543),
	('art group', '2019-09-17', 67890),
	('nature party', '2020-03-02', 55555),
	('science group', '2020-03-02', 90876),
	('life party', '2020-03-02', 54321);
	
insert into votes values
	(22, 'nature party', '2020-03-02', 100),
	(22, 'science group', '2020-03-02', 30),
	(22, 'life party', '2020-03-02', 500),
	(77, 'nature party', '2020-03-02', 300),
	(77, 'science group', '2020-03-02', 150),
	(77, 'life party', '2020-03-02', 25),
	(33, 'nature party', '2020-03-02', 13),
	(33, 'science group', '2020-03-02', 740),
	(33, 'life party', '2020-03-02', 670),
	
	(22, 'nature party', '2019-04-09' , 140),
	(22, 'lost group', '2019-04-09', 300),
	(22, 'life party', '2019-04-09', 50),
	(77, 'nature party', '2019-04-09', 20),
	(77, 'lost group', '2019-04-09', 10),
	(77, 'life party', '2019-04-09', 55),
	(33, 'nature party', '2019-04-09', 130),
	(33, 'lost group', '2019-04-09', 45),
	(33, 'life party', '2019-04-09', 265);
	
commit;
	
