/* Write your T-SQL query statement below */

select product_id ,product_name ,description
from products cross apply string_split(description ,' ') 
where value COLLATE Latin1_General_BIN  like  'SN[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]' 
order by product_id asc 