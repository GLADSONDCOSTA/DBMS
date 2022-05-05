//9.Write a plsql Program to input principle amount,rate of intrest and time to calculate 
//and display si and ci

declare
p number(9,2);
t number(9,2);
r number(9,2);
a number(20,2);
si number(9,2);
ci number(9,2);
begin
p:=&p;
t:=&t;
r:=&r;
si:=(p*t*r)/100;
a:=p*POWER((1+r/100),t);
ci:=a-p;
dbms_output.put_line('Ci = '||ci);
dbms_output.put_line('Si = '||si);
end;
/
