//5.Write a plsql program to read a string and display 
//given string is palindrome or not reverse of a given string total no of vowels 

declare
str varchar2(10);
temp varchar2(10);
vcount integer;
i integer;
len integer;
ch varchar2(1);
rev varchar2(10);
begin
str:='&str';
temp:=str; 
i:=1;
vcount:=0;
len:=length(str);
str:=lower(str);
while i<=len loop
ch:=substr(str,i,1);
rev:=ch||rev;
if (ch='a' or ch='e' or ch='i' or ch='o' or ch='u') then
vcount:=vcount+1;
end if;
i:=i+1;
end loop;
dbms_output.put_line('Vowels = '||vcount);
dbms_output.put_line('Reverse = '||rev);
if(rev=temp) then
dbms_output.put_line('Palindrome');
else
dbms_output.put_line('Not Palindrome');
end if;
end;
/