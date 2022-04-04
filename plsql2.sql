'To find greater'

CREATE OR REPLACE PROCEDURE findgreat(x IN INTEGER,y IN INTEGER,z OUT INTEGER) AS
BEGIN
IF x>y THEN
z:=x;
ELSE
z:=y;
END IF;
END;
/

declare 
a integer;
b integer;
c integer;
begin
a:=20;
b:=30;
findgreat(a,b,c);
dbms_output.put_line('greater '||c);
end;
/

'to find square '
create or replace procedure sqrnum(x in integer,y out integer) as
begin
y:=x*x;
end;
/

declare
a integer;
b integer;
begin
a:=&a;
sqrnum(a,b);
dbms_output.put_line('square of x '||b);
end;
/

'factorial number'
create or replace procedure fac(x in integer,y out integer) as
begin
for i in 1..x loop
y:=i*x;
end loop;
end;
/

declare
a integer;
b integer;
begin
a:=&a;
fac(a,b);
dbms_output.put_line(b);
end;
/

'printing tables'
create or replace procedure tab(n in integer,y out integer)as
begin
for i in 1..10 loop
y:=n*i;
end loop;
end;
/

declare 
a integer;
b integer;
begin
a:=&a;
tab(a,b);
dbms_output.put_line(b);
end;
/
