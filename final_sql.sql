create table workers(
					worker_id number(10),
					first_name varchar2(20) not null,
					last_name varchar2(20) not null,
					salary number(15),
					joining_date date,
					department varchar2(10),
					primary key(worker_id)
					);
					
insert into workers values(101,'ram','rao',25000,'10-jun-1987','sales');
insert into workers values(102,'sam','shetty',25000,'11-dec-1997','sales');
insert into workers values(103,'tanu','rai',20000,'19-may-1988','it');
insert into workers values(104,'carol','lobo',35000,'20-jun-1887','finance');
insert into workers values(105,'anush','salian',27000,'13-feb-2000','sales');
insert into workers values(106,'savio','dcosta',20000,'10-aug-2001','it');
insert into workers values(107,'amithab','bb',30000,'10-jun-2011','it');
insert into workers values(108,'divina','dsa',15000,'10-jun-1987','manager');
insert into workers values(109,'ethan','dsouza',9000,'20-mar-1988','admin');

select * from workers;

alter table workers modify salary 9000 where worker_id = 108;

create table workers_bonus(
					worker_ref_id number(10),
					bonus_data date,
					bonus_amount number(20),
					foreign key(worker_ref_id) references workers(worker_id)
					);
					
insert into workers_bonus values(101,'10-jun-1990',1000);
insert into workers_bonus values(102,'11-dec-1999',1000);
insert into workers_bonus values(103,'19-may-1999',5000);
insert into workers_bonus values(104,'20-jun-1990',1000);
insert into workers_bonus values(105,'13-may-2001',2000);
insert into workers_bonus values(106,'10-aug-2002',1000);

select * from workers_bonus;


		
create table title(
					worker_ref_id number(10),
					worker_title varchar2(20),
					affected_from date,
					foreign key(worker_ref_id) references workers(worker_id)
					);
insert into title values(101,'sales','10-jun-1987');	
insert into title values(102,'sales','11-dec-1997');
insert into title values(103,'it','19-may-1988');
insert into title values(104,'finance','20-jun-1887');
insert into title values(105,'sales','13-feb-2000');
insert into title values(106,'it','10-aug-2001');

select * from title;


Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
select first_name as Worker_Name from workers;
			
Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
select upper(first_name) from workers;

Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
select distinct department from workers;

Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.
select substr(first_name,1,3) from workers;

Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.
Select instr(first_name,binary'a')from worker where first_name = 'amitabh';....

Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
select rtrim(first_name)from workers; 

Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
select ltrim(department) as dep from workers;

Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
select distinct length(department) from workers;

Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
select replace(first_name,'a','A') from workers;

Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.
select CONCAT(first_name,last_name) as complete_name from workers;

Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
select * from workers order by first_name asc;

Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
select * from workers order by first_name asc,department desc;

Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
select * from workers where first_name in('vipul','satish');

Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
select * from workers where first_name not in('vipul','satish');

Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
select * from workers where department ='admin';

Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
select * from workers where first_name like 'a%';
 
Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
select * from workers where first_name like '%a';

Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
select * from workers where first_name like '_____h';

Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
select * from workers where salary between 100000 and 500000;

Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.
select * from workers where joining_date>='01-feb-2014';

Q-21. Write an SQL query to fetch the count of employees working in the department ‘sales’.
select department,count(*) from workers where department='sales' group by department;

Q-22. Write an SQL query to fetch worker names with salaries >= 20000 and <= 10000.
select first_name,salary from workers where salary in
(select salary from workers where salary not between 10000 and 20000 );

Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
select distinct(department),count(*) as no_of_workers from workers group by department order by department desc;

Q-24. Write an SQL query to print details of the Workers who are also Managers.
select * from workers where department = 'managers';

Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.


Q-26. Write an SQL query to show only odd rows from a table.
select * from workers where mod(worker_id,2)<>0;

Q-27. Write an SQL query to show only even rows from a table.
select * from workers where mod(worker_id,2)=0;

Q-28. Write an SQL query to clone a new table from another table.
select * INTO WorkerClone from workers;....
create table WorkersClone LIKE workers;....

Q-29. Write an SQL query to fetch intersecting records of two tables.
(select * from WorkerClone)intersect(select * from workers);

Q-30. Write an SQL query to show records from one table that another table does not have.
(select * from workers)minus(select * from title);

Q-31. Write an SQL query to show the current date and time.
select SYSTIMESTAMP as date_time from dual;
		or
select sysdate from dual;

Q-32. Write an SQL query to show the top n (say 5) records of a table.
select * from (select * from workers order by worker_id asc) where rownum <= 5;
			or
select * from workers where rownum <=5;

Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
select * from workers where salary in
(select max(salary) from workers);

Q-35. Write an SQL query to fetch the list of employees with the same salary.
select * from workers where salary in(select salary from workers where salary = salary);

Q-36. Write an SQL query to show the second highest salary from a table.
select max(salary) from workers where salary not in(select max(salary) from workers);

Q-41. Write an SQL query to show all departments along with the number of people in there.
select distinct(department),count(*) as no_of_people from workers group by department;

Q-42. Write an SQL query to show the last record from a table.
select * from workers where worker_id in(
select max(worker_id) from workers );

Q-43. Write an SQL query to fetch the first row of a table.
select * from workers where worker_id in(
select min(worker_id) from workers );

Q-44. Write an SQL query to fetch the last five records from a table.
select * from workers where rownum >5;


