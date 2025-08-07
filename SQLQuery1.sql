create table surveylog
(
   id     int,
   action varchar(10),
   questionid  int,
   answerid     int,
   qnum         int,
   timestamp	int
   )

select * from surveylog


select questionid from
(
select top 1 questionid,sum(case when action='answer' then 1 else 0 end)/sum(case when action='show' then 1 else 0 end) as answerrate
from surveylog
group by questionid
) as k
