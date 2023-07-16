
--d1

select pname, nofvotes
from votes join city on votes.cid = city.cid
where edate = '2020-03-02' and cname = 'ryde end';


--d2

select pname, region, sum(nofvotes) as regvotes
from election join votes using(edate) join city using(cid)
where kno = 3
group by pname, region;


--d3

select cname, cid
from city

except

select cname, cid
from city join votes using(cid)
where pname='life party';


--d4

--auxiliary relation: number of parties by elections date
with nparties(edate, num) as ( 
	select edate, count(distinct pname)
	from running 
	group by edate
)

select edate, kno
from nparties natural join election	
where num = (select max(num) from nparties);


--d5


with desired as (select pname, sum(totalvotes) as sumvotes
	from running as r1
	where exists (select * 
		from election, running as r2
		where election.edate = r2.edate and
		 kno = 3 and r2.pname = r1.pname 
		) and
	not exists (
		select * 
		from votes, city
		where votes.cid = city.cid and
		votes.pname = r1.pname and
		region = 'hills')
	group by pname
)
select desired.pname
from desired
where desired.sumvotes = (select min(sumvotes) 
	from desired);


--d6

--kno3 parties with their total votes
with kno3(pname, totalvotes) as (
	select pname, totalvotes
	from running join election using(edate)
	where kno = 3
)
select pname --selecting the second maximum
from kno3
where totalvotes = (select max(totalvotes)
	from kno3
	where totalvotes < (select max(totalvotes)
		from kno3));


--d7

select p1.pname, p2.pname
from party as p1, party as p2
where p1.pname < p2.pname and not exists(
	select edate --iterating over election dates
	from election
	--applying XOR with each election date
	where (p1.pname in (select pname from 
		running
		where running.edate = election.edate
	) and p2.pname not in (select pname from 
		running
		where running.edate = election.edate
	)) or (p1.pname not in (select pname from 
		running
		where running.edate = election.edate
	) and p2.pname in (select pname from 
		running
		where running.edate = election.edate
	))
);

*/


