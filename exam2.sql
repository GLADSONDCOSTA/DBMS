create table bank_customer(cid integer,
						cname varchar2(20) NOT NULL ,
						dob DATE not null,
						city varchar2(15)not null check(city = upper(city))
						);
drop table loans;					
create table loans(loanid integer,cid integer,
					ldate date ,lamount number(10,2),
					lclosedata date,
					status char(1)
					);
					

alter table loans add (constraint lc check(lclosedata>ldate));
alter table bank_customer add (check(cname = upper(cname)));
alter table loans add (check(status in ('A','N','C')));


						

insert into bank_customer values(1001,'RAM','20-nov-1974','GOA');
insert into bank_customer values(1002,'CAROL','22-jan-1984','MYSORE');
insert into bank_customer values(1003,'TANU','05-oct-2000','MANGALORE');

insert into loans values(111,1001,'03-NOV-2015',20500,'05-nov-2016','A');
insert into loans values(112,1002,'04-Oct-2001',30500,'10-oct-2002','C');
insert into loans values(113,1003,'13-nov-2005',48000,'20-nov-2005','A');
insert into loans values(114,1004,'23-sep-2018',900000,'28-sep-2018','N');
insert into loans values(115,1005,'10-dec-1990',34900,'13-dec-1990','A');
insert into loans values(116,1006,'05-nov-2001',50000,'09-nov-2001','C');
insert into loans values(117,1007,'10-jan-2004',250000,'20-jan-2004','C');
insert into loans values(118,1008,'08-jun-2013',20800,'15-sep-2013','N');
insert into loans values(119,1009,'18-jun-2014',350000,'30-jun-2015','A');

alter table bank_customer add (primary key(cid));
alter table loans add (primary key(loanid));
alter table loans add (CONSTRAINT loans_fk foreign key(Cid) references bank_customer(cid));
alter table loans drop CONSTRAINT loans_fk;
alter table loans add (foreign key(CiD) references bank_customer(cid) on delete cascade);
alter table loans drop CONSTRAINTS lc;






a)select cid,cname,city from bank_customer where city ='MANGALORE';
b)select cid,cname,city from bank_customer where city = 'MANGALORE' order by city desc,cname asc;
c)select cid,cname,city from bank_customer where city in('MANGALORE','BANGALORE','MYSORE')order by city asc;
d)select cid,cname,city from bank_customer where cname like 'a%' or cname like 'c%' and dob > '01-jan-1990';
e)select cid,cname,city from bank_customer where cname like '%l' and city not in('MANGALORE' , 'MYSORE' , 'BANGALORE' , 'COORDE')order by city asc;
f)select cid,loanid,ldate,lamount from loans where lamount between 50000 and 10000 and ldate<'31-mar-2016' order by lamount desc;


'to display total and avg marks in student table [input:rollno,name,m1,m2,m3]'

create or replace procedure stu(total out integer,average out integer,m1 in integer,m2 in integer,m3 in integer) as
begin
total:=m1+m2+m3;
average:=total/3;
end;
/

declare
t integer;
a integer;
x integer;
y integer;
z integer;
begin
x:=&x;
y:=&y;
z:=&z;
stu(t,a,x,y,z);
dbms_output.put_line('Total '||t);
dbms_output.put_line('Average '||a);
end;
/ 

'to display total and avg marks in student table [input:rollno,name,m1,m2,m3]'
create or replace procedure stt(total out integer,average out integer) as
mark1 integer;
mark2 integer;
mark3 integer;
begin
select m1 into mark1,m2 into mark2,m3 into mark3 from student where rollnum=101;
total=mark1+mark2+mark3;
average=total/3;
end;
/

declare
t integer;
a integer;
begin
stt(t,a);
dbms_output.put_line('Total '||t);
dbms_output.put_line('Average '||a);
end;
/ 
