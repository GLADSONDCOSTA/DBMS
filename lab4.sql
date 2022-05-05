//4.Write a pl/sql prog to display result based on regno 

declare
prno student.rno%type;
pname student.name%type;
psub1 student.sub1%type;
psub2 student.sub2%type;
psub3 student.sub3%type;
avgr number(5);
begin
prno:=&rno;
select name,sub1,sub2,sub3 into pname,psub1,psub2,psub3 from student where rno=prno;
avgr:=(psub1+psub2+psub3)/3;
if psub1<35 or psub2<35 or psub3<35 then
dbms_output.put_line('Result = Fail');
else
dbms_output.put_line('Result = Pass and avgMarks ='||avgr);
end if;
exception
when no_data_found then
dbms_output.put_line('No regno Found');
end;
/

create table student(rno number(5),name varchar2(10),sub1 number,sub2 number,sub3 number);
insert into student values(100,'ram',36,45,55);
insert into student values(101,'sam',46,55,75);
