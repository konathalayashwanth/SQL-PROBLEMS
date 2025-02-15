create table account_balance
(
    account_no          varchar(20),
    transaction_date    date,
    debit_credit        varchar(10),
    transaction_amount  decimal
);

insert into account_balance values ('acc_1', '2022-01-20',  'credit', 100);
insert into account_balance values ('acc_1', '2022-01-21',  'credit', 500);
insert into account_balance values ('acc_1', '2022-01-22',  'credit', 300);
insert into account_balance values ('acc_1', '2022-01-23',  'credit', 200);
insert into account_balance values ('acc_2', '2022-01-20',  'credit', 500);
insert into account_balance values ('acc_2', '2022-01-21',  'credit', 1100);
insert into account_balance values ('acc_2', '2022-01-22',  'debit', 1000);
insert into account_balance values ('acc_3', '2022-01-20',  'credit', 1000);
insert into account_balance values ('acc_4', '2022-01-20',  'credit', 1500);
insert into account_balance values ('acc_4', '2022-01-21',  'debit', 500);
insert into account_balance values ('acc_5', '2022-01-20',  'credit', 900);



-----Q 

with cte as
(
select *, case when debit_credit='debit' then transaction_amount*-1 else transaction_amount end as trans_amt      
from account_balance
),finalbalance as
(
select *, sum(trans_amt) over(partition by account_no order by transaction_date) as currentbalance,
sum(trans_amt) over(partition by account_no order by transaction_date range between unbounded preceding and unbounded following) as final_balance,
case when sum(trans_amt) over(partition by account_no order by transaction_date)>=1000 then 1 else 0 end as flag
			from cte
)
select account_no,min(transaction_date) as transactiondate
from finalbalance
where flag=1 and final_balance>=1000
group by account_no