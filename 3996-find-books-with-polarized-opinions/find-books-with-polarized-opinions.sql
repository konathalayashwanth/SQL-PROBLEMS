select books.book_id, title ,author,genre ,pages,
max(session_rating)-min(session_rating) rating_spread ,
round(sum(case when session_rating>3 or session_rating <3 then 1 else 0 end )*1.0/count(*),2) polarization_score 
from books
join reading_sessions 
on books.book_id=reading_sessions.book_id
group by books.book_id, title ,author,genre ,pages
having count(*)>4
and sum(case when session_rating>3 then 1 else 0 end)>0
and sum(case when session_rating<3 then 1 else 0 end)>0
and 
round(sum(case when session_rating>3 or session_rating <3 then 1 else 0 end )*1.0/count(*),2)>=0.6
order by polarization_score desc,title desc