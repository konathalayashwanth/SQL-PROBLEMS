select * from friendship


select * from likes



with cte as
(
	select user2_id as id from friendship
	where user1_id=1

	union all

	select user1_id as id from friendship
	where user2_id=1
)
select distinct page_id as recommended_page from cte
inner join likes b
on cte.id=b.user_id
where b.page_id not in(select page_id from likes where user_id=1)