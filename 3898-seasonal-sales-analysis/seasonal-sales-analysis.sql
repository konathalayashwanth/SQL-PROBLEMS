/* Write your T-SQL query statement below */
with monthnames as
(
select *,case when monthnames in ('December', 'January', 'February') then 'Winter'
              when monthnames in ('March', 'April', 'May') then 'Spring'
              when monthnames in ('June','July','August') then 'Summer'
              when monthnames in ('September','October','November') then 'Fall'
              end as season
              from
     (
select sale_id,
       product_id,
       datename(month,sale_date) as monthnames,
       quantity,
       price
       from sales
     ) as k
)
select season,category,total_quantity,total_revenue
from
(
select s.season,p.category,sum(s.quantity) as total_quantity,sum(s.quantity*s.price) as total_revenue,
rank() over(partition by s.season order by sum(s.quantity) desc,sum(s.quantity*s.price) desc) as rn
 from monthnames s inner join products p
 on s.product_id=p.product_id
 group by s.season,p.category
) as k
where rn=1
order by season asc;


