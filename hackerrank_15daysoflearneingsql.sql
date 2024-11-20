


		with recursive yash as
		(
		select  distinct submission_date,hacker_id
		from submissions
		where submission_date=(select min(submission_date) from submissions)
		union all
		select s.submission_date,s.hacker_id from submissions s 
		join yash on yash.hacker_id=s.hacker_id
		where s.submission_date=(select min(submission_date) from submissions where submission_date>yash.submission_date)
		),
		unique_hackers as
		(
		select submission_date,count(*) as noofuniquehacker from yash
		group by submission_date
		),
		 count_submissions as
		(
		select submission_date,hacker_id,count(*) as noofsubmissions
		from submissions
		group by submission_date,hacker_id
		),
		max_submissions as
		(select submission_date,max(noofsubmissions) as maximumsubmissions
		from count_submissions
		group by submission_date
		),
		final_hackers as
		(
		select c.submission_date,min(c.hacker_id) as hacker_id from max_submissions m
		join count_submissions c
		on c.submission_date=m.submission_date
		and c.noofsubmissions=m.maximumsubmissions
		group by  c.submission_date
		)
		select u.submission_date,u.noofuniquehacker,f.hacker_id,hc.name as hacker_name
		from unique_hakcers u join final_hackers f
		on u.submission_date=f.submission_date
		join hackers h
		on h.hacker_id=f.hacker_id
		order by 1