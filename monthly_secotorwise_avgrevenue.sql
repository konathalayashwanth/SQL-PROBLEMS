CREATE TABLE Transactions6 (
    transaction_id INT PRIMARY KEY,
    company_id INT,
    transaction_date DATE,
    revenue DECIMAL(10, 2)
);


INSERT INTO Transactions6 (transaction_id, company_id, transaction_date, revenue) VALUES
(101, 1, '2020-01-15', 5000.00),
(102, 2, '2020-01-20', 8500.00),
(103, 1, '2020-02-10', 4500.00),
(104, 3, '2020-02-20', 9900.00),
(105, 2, '2020-02-25', 7500.00);




CREATE TABLE Sectors (
    company_id INT PRIMARY KEY,
    sector VARCHAR(50)
);
INSERT INTO Sectors (company_id, sector) VALUES
(1, 'Technology'),
(2, 'Healthcare'),
(3, 'Technology');



select * from transactions6

select * from sectors


with cte as
(
select month(transaction_date) as month,company_id,avg(revenue) over(partition by month(transaction_date) order by transaction_date,company_id)
as avgrevenue from transactions6 
where year(transaction_date)=2020
)
select month,s.sector,avgrevenue from cte c join sectors s
on c.company_id=s.company_id
