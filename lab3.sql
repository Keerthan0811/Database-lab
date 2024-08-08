--1.	Obtain the details of the boats reserved by ‘#Sailor_Name’.
select b.bid,b.name,b.color,r.date from boat b,reserves r,sailor s 
    where b.bid=r.bid and r.sid=s.sid and s.name='John Doe';

--2.	Retrieve the BID of the boats reserved necessarily by all the sailors.
select b.bid from boat b,sailor s,reserves r 
    where b.bid=r.bid and r.sid=s.sid group by b.bid 
    having count(s.sid)=(select count(sid) from sailor);

--3.	Find the number of boats reserved by each sailor. Display the Sailor_Name along with the number of boats reserved.
select s.name,count(b.bid) as no_boats from boat b,sailor s,reserves r 
    where b.bid=r.bid and r.sid=s.sid group by s.name;

--Create the table, insert suitable tuples and perform the following operations using MongoDB.
db.BOATRES.insert({"BID":9988,"BNAME":'ABC',"COLOUR":'Black',"SNAME":'John',"SID":1234,"DAY":'2017-12-25'})
db.BOATRES.insert({"BID":9989,"BNAME":'ABD',"COLOUR":'Blue',"SNAME":'John',"SID":1234,"DAY":'2017-12-27'})
db.BOATRES.insert({"BID":8877,"BNAME":'DEF',"COLOUR":'Black',"SNAME":'Smith',"SID":4567,"DAY":'2017-11-24'})

--1.	Obtain the number of boats obtained by sailor :#Sailor_Name
db.BOATRES.find({"SNAME":'JHON'}).count()

--2.	Retrieve boats of color :”#color”
db.BOATRES.find({"COLOR":'Black'}).pretty()

--	Write a PL/SQL program to check whether a given number is prime or not
set serveroutput on
declare
n number:=&n;
j number:=2;
counter number:=0;

begin
    while(j<=n/2)
    loop
        if mod(j,n)=0
        then
            dbms_output.put_line(n||' number is not a prime number');
            counter:=1;
            exit;
        else
        j:=j+1;
        end if;
    end loop;
if (counter=0)
then
    dbms_output.put_line(n||' number is prime number');
end if;
end;
/