CREATE TABLE sls_tbl (pid INT, sls_dt DATE, sls_amt INT )

-- Insert data into the table
INSERT INTO sls_tbl (pid, sls_dt, sls_amt)
VALUES (201, '2024-07-11', 140), (201, '2024-07-18', 160), (201, '2024-07-25', 150), (201, '2024-08-01', 180), (201, '2024-08-15', 170), (201, '2024-08-29', 130)



declare @startdate date;
set @startdate='2024-07-11';

declare @enddate date;
set @enddate='2024-08-29';

with weekdays
as
(
select @startdate as sls_dt
union all
select dateadd(week,1,sls_dt) from weekdays
where dateadd(week,1,sls_dt)<=@enddate
)
select * from weekdays
except
select sls_dt from sls_tbl


