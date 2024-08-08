--details od customer who have both accounts
--1
select * from customer where cid in (select cid from  account type='Savings' intersect select cid from account type='Current');
--2
select distinct c.cid,c.name from customer c 
    join account a1 on c.cid=a1.cid 
    join account a2 on c.cid=a2.cid 
        where a1.type='Current' and a2.type='Savings';
--3
select distinct c.cid,c.name from customer c,account a1,account a2 where a1.type='Savings' and a2.type='Current' and c.cid=a1.cid and c.cid=a2.cid;

--retrive details of branches and no of accounts in each branch
select b.bid,b.city,count(a.aid) from branch b left join account a on b.bid=a.bid group by b.bid,b.city;

--details of customer who have performed atleast 3 transaction
--1
select c.cid,c.name,count(t.tid) as no_of_transactions from customer c join account a on c.cid=a.cid join transaction t on a.aid=t.aid group by c.cid,c.name having count(t.tid)>=3;
--2
select c.cid,c.name,count(t.tid) as no_of_transactions from customer c,account a,transaction t 
    where c.cid=a.cid and a.aid=t.aid group by c.cid,c.name having count(t.tid)>=2;

--details of brances where avg number of accounts in all branches
with branchcount as(select b.bid,b.city,count(a.aid) as no_acc from branch b,account a where a.bid=b.bid group by b.bid,b.city),
    avgcount as (select avg(no_acc) as avg_no from branchcount)
    select b1.bid,b1.city,b1.no_acc from branchcount b1,avgcount a1 where b1.no_acc>a1.avg_no;

--mongodb
use banking

db.branches.insertMany([
  { branch_id: 1, branch_name: "Main Branch", address: "123 Main St" },
  { branch_id: 2, branch_name: "Downtown Branch", address: "456 Downtown Ave" },
  { branch_id: 3, branch_name: "Uptown Branch", address: "789 Uptown Blvd" }
])

db.customers.insertMany([
  { customer_id: 1, name: "John Doe", address: "123 Home St", phone: "123-456-7890" },
  { customer_id: 2, name: "Jane Doe", address: "456 Home Ave", phone: "987-654-3210" },
  { customer_id: 3, name: "Bob Smith", address: "789 Home Blvd", phone: "555-123-4567" }
])

db.accounts.insertMany([
  { account_id: 1, customer_id: 1, branch_id: 1, account_type: "Savings" },
  { account_id: 2, customer_id: 1, branch_id: 1, account_type: "Current" },
  { account_id: 3, customer_id: 2, branch_id: 2, account_type: "Savings" },
  { account_id: 4, customer_id: 3, branch_id: 3, account_type: "Current" },
  { account_id: 5, customer_id: 1, branch_id: 2, account_type: "Savings" },
  { account_id: 6, customer_id: 2, branch_id: 3, account_type: "Current" }
])

--1
db.branch.find({branch_id: 2},{branch_name: 1, _id:0})
--2
db.accounts.aggregate([
    {$group :{ _id:"$customer_id",num_accounts:{$sum:1}}},
    {$lookup:{from:"customers",localField:"_id",foreignField:"customer_id",as:"customer"}},
    {$unwind:"$customer"},
    {$project:{customer_name:"$customer.name",num_accounts: 1}}
])

--pl/sql

create table part(pno int,pname varchar(20),pcolor varchar(10));
insert into part(pno,pname,pcolor) values
    (1,'screw','grey'),
    (2,'tv','color'),
    (3,'table','brown');

create table copy_part(pno int,pname varchar(20),pcolor varchar(10))


set serverouput on
declare
cursor cur is select * from part;
counter int;
rows part%rowtype;
begin
    open cur;
    loop
        fetch cur into rows;
        exit when cur % notfound;
        insert into copy_part values (rows.pno,rows.pname,rows.color);
    end loop;
    counter := cur % rowcount;
    close cur;
    dbms_output.put_line(counter||' rows inserted to the table copy');
end;
/