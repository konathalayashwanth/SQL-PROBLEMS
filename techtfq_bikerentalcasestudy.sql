




select * from membership_type;
select * from membership;

/*
next, Emily would like data about memberships purchased in 2023, with 
subtotals and grand totals for all the different combinations of membership 
types and months.
 Display the total revenue from memberships purchased in 2023 for each 
combination of month and membership type. Generate subtotals and 
grand totals for all possible combinations.  There should be 3 columns: 
membership_type_name , 
month , and 
total_revenue .
 Sort the results by membership type name alphabetically and then 
chronologically by month.
*/


select mt.name,month(start_date) as month,sum(m.total_paid) as totalrevenue from membership_type mt inner join membership m
on mt.id=m.membership_type_id
group by grouping sets( (mt.name,month(start_date)), (mt.name), ())








