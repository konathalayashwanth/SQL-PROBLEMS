select * from hospital;

--write a sql query to find the no of people inside the hospital


select emp_id,
       max(case when action='in' then time end) as intime,
	   max(case when action='out' then time end) as outtime
	   from hospital
	   group by emp_id
having max(case when action='in' then time end)>max(case when action='out' then time end) or max(case when action='out' then time end) is null;