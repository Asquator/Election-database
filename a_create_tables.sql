create table election(
	edate date primary key,
	kno integer not null
);

create table party(
	pname char(20) primary key,
	symbol char(5)
);

create table running(
	edate date,
	pname char(20),
	chid numeric(5,0),
	totalvotes integer,

	primary key(edate, pname),
	foreign key(edate) references election, 
	foreign key(pname) references party
);

create table city(
	cid numeric(5,0),
	cname varchar(20),
	region varchar(20),

	primary key(cid)
);

create table votes(
	cid numeric(5,0),
	pname char(20),
	edate date,
	nofvotes integer not null,

	primary key(cid, pname, edate),
	foreign key(cid) references city,
	foreign key(pname) references party,
	foreign key(edate) references election
);



