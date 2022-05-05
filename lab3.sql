//3. Write a PlSql Program to read regno,name, sub1,sub2 & sub3 marks and display the result 

declare
regno number(5);
name varchar2(10);
sub1 number(5);
sub2 number(5);
sub3 number(5);
avge number(5);
begin
regno:=&regno;
name:='&name';
sub1:=&sub1;
sub2:=&sub2;
sub3:=&sub3;
avge:=(sub1+sub2+sub3)/3;
dbms_output.put_line('avgmarke = '||avge);
if sub1<35 or sub2<35 or sub3<35 then
dbms_output.put_line('result = Fail');
else
dbms_output.put_line('result = Pass');
end if;
end;
/

