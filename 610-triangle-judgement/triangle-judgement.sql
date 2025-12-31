/* Write your T-SQL query statement below */
select *,
case when x+y>z and y+z>x and z+x>y then 'Yes'
else 'No'
end as triangle
from triangle