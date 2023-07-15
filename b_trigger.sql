create or replace function trigf1() returns trigger as $$
	declare diff integer; --votes difference to add 
	
	begin
		diff = new.votes - old.votes;
		update running
		set totalvotes = totalvotes + diff
		where pname = new.pname;
	end;
$$ language plpgsql;

create or replace trigger T1 
after update or insert on votes
for each row execute procedure trigf1();
