--Obtain the details of employees assigned to “Database” project.
select e.ssn,e.name,e.deptno,e.salary from employee e,works w,project p 
    where e.ssn=w.ssn and p.pno=w.pno and p.domain='Finance';

--Find the number of employees working in each department with department details.
select deptno,count(ssn) as no_employees from employee group by deptno;

--Update the Project details of Employee bearing SSN = #SSN to ProjectNo = #Project_No and display the same
update works set pno=9 where ssn=105;
select * from works;

--mongodb
db.employee.insertMany([
        {"ssn":104,"name":"keerthan","dept":"database","pno":10},
        {"ssn":104,"name":"adiya","dept":"database","pno":11}
    ])

--1
db.employee.find({"dept":"database"})

--2
db.employee.find({"pno":10},{_id:0,"name":1})


--plsql
set serveroutput on
begin
    update employee
    set salary=(1.15*salary) where dept=20;
    dbms_output.put_line('number of rows updated are: '||sql%rowcount);
end;
/
