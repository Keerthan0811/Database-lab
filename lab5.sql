--1.	Obtain the names of the student who has borrowed either book bearing ISBN ‘123’ or ISBN ‘124’.
select s.name,br.isbn from student s,borrow br where s.sid=br.sid and br.isbn in (103,101);

--2.	Obtain the Names of female students who have borrowed “Database” books.
select s.name,s.gender,br.isbn from student s,borrow br,book b where s.sid=br.sid and b.isbn=br.isbn and b.title='Pride' and s.gender='Female';

--3.	Find the number of books borrowed by each student. Display the student details along with the number of books.
select s.sid,s.name,s.gender,count(b.isbn) as no_of_books from student s,borrow br,book b 
    where s.sid=br.sid and b.isbn=br.isbn group by s.sid,s.name,s.gender;




--mongo db
db.LIBRARY.insert({"ISBN":1122,"TITLE":'datbase',"AUTHOR":'ABC',"PUBLISHER":'selina',"SSN":2015,"date":'2017-05-29'})
db.LIBRARY.insert({"ISBN":2233,"TITLE":'datbase',"AUTHOR":'DEF',"PUBLISHER":'mcgraw',"SSN":2016,"date":'2017-06-29' })


--1
db.LIBRARY.find({"ISBN":1122},{"SSN":1,_id:0}).pretty()

--2
db.LIBRARY.find({"TITLE":'datbase'},{"SSN":1,_id:0}).pretty()


--plsql
set serverouput on
declare
a number;
b number;
c number;
n number;
i number;

begin
    n:=8;
    a:=0;
    b:=1;
    
    dbms_output.put_line(a);
    dbms_output.put_line(b);
    for i in 1..n-2
    loop
        c:=a+b;
        dbms_output.put_line(c);
        a:=b;
        b:=c;
    end loop;
end;
/


