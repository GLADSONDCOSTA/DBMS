'plsql'

'printing hello world'
declare 
x varchar2(20):='hello world';
begin
dbms_output.put_line(x);
end;
/

'Adding two number'
declare 
a integer;
b integer;
c integer;
begin
a:=&a;
b:=&b;
c:=a+b;
dbms_output.put_line('a+b '||c);
end;
/

'prime number'
declare
n integer;
flage integer;
begin
flage:=1;
n:=&n;
for i in 2..(n/2) loop
if mod(n,i)=0 then
flage:=0;
exit;
end if;
end loop;

if flage=1 then
dbms_output.put_line('prime');
else
dbms_output.put_line('Not prime');
end if;
end;
/