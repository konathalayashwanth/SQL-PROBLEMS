/*
write a query to provide  the date for nth occurence of monday in future  from given date.
 sunday-1
 monday-2
 tuesday-3
 wednesday-4
 thursday-5
 friday-6
 saturday-7
*/


declare @todaydate date;
declare @n int;
set @todaydate=GETDATE();---monday
set @n=3;

--query solution
---for monday nth occurence
select dateadd(week,@n-1,dateadd(day,9-datepart(weekday,@todaydate),@todaydate)) as thirdoccurence


---for sunday nth occurence
select dateadd(week,@n-1,dateadd(day,8-datepart(weekday,@todaydate),@todaydate))
