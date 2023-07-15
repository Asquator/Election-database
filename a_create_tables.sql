create table election(
	edate date primary key,
	kno integer not null
);

create table party(
	pname char(20) primary key,
	symbol char(5)
);

create table running(
	pname char(20),
	edate date,
	chid numeric(5,0),
	totalvotes integer default 0,

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
	nofvotes integer not null check(nofvotes > 0),

	primary key(cid, pname, edate),
	foreign key(cid) references city,
	foreign key(pname, edate) references running(pname, edate)
);
