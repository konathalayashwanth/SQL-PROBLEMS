with cte as
(select genre,title,avg(rating) as avgrating,row_number() over(partition by genre order by avg(rating) desc) as rn
from movies m inner join reviews1 r 
on m.id=r.movie_id
group by genre,title)
select genre,title,REPLICATE('*',round(avgrating,0)) as stars from cte
where rn=1