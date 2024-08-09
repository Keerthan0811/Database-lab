--1.Obtain the details of parts supplied by supplier #SNAME.
select p.pid,p.name,p.color from parts p,supplier sp,supply s 
    where p.pid=s.pid and s.sid=sp.sid and sp.name='Corp Ltd';

--2.Obtain the Names of suppliers who supply #PNAME.
select s.name,p.name from parts p,supplier s,supply sp 
    where p.pid=sp.pid and sp.sid=s.sid and p.name='Spring';

--mongodb
db.WAREHOUSE.insert({"PNO":1947,"Pname":'bolts',"Colour":'Black',"SNO":1234,"Sname":'ABC',"Address":'blore'})
db.WAREHOUSE.insert({"PNO":1950,"Pname":'chain',"Colour":'Blue',"SNO":4567,"Sname":'DEF',"Address":'chen'})


--1.Update the details of parts for a given part identifier: #PID.
db.WAREHOUSE.update({"PNO":1950},{$set:{"PNO":2017}},{multi:true})

--2.Display all suppliers who supply the part with part identifier: #PID.
db.WAREHOUSE.find({"PNO":2017}).pretty()

--plsql
--g)Write a PL/SQL program to copy the contents of the Shipment table to another table for maintaining records for specific part number. 
create table shipment(sid int,pno int,quan int);
insert into shipment(sid,pno,int) values
    (1,2,100),
    (2,4,900),
    (3,8,800);
create table copy_shipment(sid int,pno int,quan int);

set serveroutput on
declare
cur_partno shipment.pno%type:=4;
begin
    insert into copy_shipment
    select * from shipment where pno=cur_partno;
    dbms_output.put_line(sql%rowcount ||' number of rows has be cpoied');
exception
        when others then
            dbms_ouput.put_line(' ERROR '|| sqlerrm);
end;
/
