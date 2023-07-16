create or replace function trigf1() returns trigger as $$
declare 
	diff integer;

begin
	if TG_OP = 'INSERT'
		then diff = new.nofvotes;
		
	elsif TG_OP = 'UPDATE' then
		diff = new.nofvotes - old.nofvotes;
			
	end if;
		
	update running
	set totalvotes = totalvotes + diff
	where running.pname = new.pname and 
		running.edate = new.edate;
		
	return null;
end;
$$ language plpgsql;

create or replace trigger T1
after update or insert on votes
for each row execute procedure trigf1();
