CREATE TABLE transactions5 (
    product_id INT,
    user_id INT,
    spend DECIMAL(10, 2),
    transaction_date DATETIME
);

INSERT INTO transactions5 (product_id, user_id, spend, transaction_date)
VALUES
(3673, 123, 68.90, '2022-07-08 10:00:00'),
(9623, 123, 274.10, '2022-07-08 10:00:00'),
(1467, 115, 19.90, '2022-07-08 10:00:00'),
(2513, 159, 25.00, '2022-07-08 10:00:00'),
(1452, 159, 74.50, '2022-07-10 10:00:00'),
(1452, 123, 74.50, '2022-07-10 10:00:00'),
(9765, 123, 100.15, '2022-07-11 10:00:00'),
(6536, 115, 57.00, '2022-07-12 10:00:00'),
(7384, 159, 15.50, '2022-07-12 10:00:00'),
(1247, 159, 23.40, '2022-07-12 10:00:00');


select * from transactions5


with cte as
(
select *,row_number() over(partition by user_id order by transaction_date desc) as rn,
		 count(product_id) over(partition by user_id order by transaction_date desc) as cnt
		 from transactions5
		 _)
select user_id,transaction_date,cnt as nooftransactions
from cte 
where rn=1



-----

