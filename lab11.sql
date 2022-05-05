//11.Create a function to find the factorial of an integer call it from the sql*plus 

create or replace function fact(n in integer)
return integer as
i integer;
f integer;
begin
i:=1;
f:=1;
while i<=n loop
f:=f*i;
i:=i+1;
end loop;
return f;
end;
/