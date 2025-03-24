




select * from polls

select * from poll_answers



--Q

with lossers as
(
select polls.poll_id,sum(amount) as amount_to_be_distributed from polls inner join poll_answers
on polls.poll_id=poll_answers.poll_id
where poll_option_id!=correct_option_id
group by polls.poll_id
),winners as
(
select polls.poll_id,user_id,amount,amount*1.0/sum(amount) over(partition by polls.poll_id order by (select(null))) as amounttheyinvested
from polls inner join poll_answers
on polls.poll_id=poll_answers.poll_id
where poll_option_id=correct_option_id
)
select winners.poll_id,user_id,
amounttheyinvested*amount_to_be_distributed as amounttheywon 
from winners inner join lossers on winners.poll_id=lossers.poll_id


