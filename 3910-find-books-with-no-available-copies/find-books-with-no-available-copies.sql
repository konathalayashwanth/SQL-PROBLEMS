/* Writ your T-SQL query statement below */

with no_of_borrowers
as
(
select book_id,count(*) as totalborrowers
from borrowing_records
WHERE return_date IS NULL 
group by book_id
)
select l.book_id,title,author,genre,publication_year,total_copies as current_borrowers 
from library_books l inner join no_of_borrowers n
on l.book_id=n.book_id
where n.totalborrowers=l.total_copies
order by 6 desc,2 asc

