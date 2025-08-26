/*Now it's time for the final task.
 Emily wants to segment customers based on the number of rentals and 
see the count of customers in each segment. Use your SQL skills to get 
this!
 Categorize customers based on their rental history as follows:
 Customers who have had more than 10 rentals are categorized as 
than 10' .
 'more 
Customers who have had 5 to 10 rentals (inclusive) are categorized as 
'between 5 and 10' .
 Customers who have had fewer than 5 rentals should be categorized as 
'fewer than 5' .
 Calculate the number of customers in each category. Display two columns: 
rental_count_category (the rental count category) and 
number of customers in each category).
*/


select * from customer;
select * from bike;
select * from rental;
select * from membership_type;
select * from membership;


with cte as
(
select customer_id,
	   case when totalnoofrents>10 then 'morethan10'
		    when totalnoofrents between 5 and 10 then 'between 5 and 10'
			else 'fewer than 5'
			end as category
			from
			(
       select customer_id,
	   count(*) as totalnoofrents
	   from rental
	   group by customer_id
	   ) as k
)
select category as [the rental count category],count(1) as customer_count
from cte
group by category
