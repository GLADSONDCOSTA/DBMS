//10. Write a plsql Program to input a number reverse the number find the sum check 
whether palindrome 

declare
n number(10);
temp number(10);
rem number(10);
rev number(10);
sum1 number(10);
begin
n:=&n;
temp:=n;
rev:=0;
sum1:=0;
while n>0 loop
rem:=n mod 10;
rev:=(rev*10)+rem;
sum1:=sum1+rem;
n:=floor(n/10);
end loop;
if(rev=temp) then
dbms_output.put_line('palindrome');
else
dbms_output.put_line('Not palindrome');
end if;
dbms_output.put_line('Rev = '||rev);
dbms_output.put_line('sum = '||sum1);
end;
/