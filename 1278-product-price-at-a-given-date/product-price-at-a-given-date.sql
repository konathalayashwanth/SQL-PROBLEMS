/* Write your T-SQL query statement below */
select
 product_id,
 isnull((
    select top 1 new_price
    from Products p2
    where p1.product_id = p2.product_id and change_date <= '2019-08-16'
    order by change_date desc
 ), 10) as price
from Products p1
group by product_id
