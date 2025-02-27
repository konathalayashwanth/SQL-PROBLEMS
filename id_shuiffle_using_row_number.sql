CREATE TABLE Products4 (
    ProductID INT PRIMARY KEY,
    Product VARCHAR(255),
    Category VARCHAR(100)
);

INSERT INTO Products4 (ProductID, Product, Category)
VALUES
    (1, 'Laptop', 'Electronics'),
    (2, 'Smartphone', 'Electronics'),
    (3, 'Tablet', 'Electronics'),
    (4, 'Headphones', 'Accessories'),
    (5, 'Smartwatch', 'Accessories'),
    (6, 'Keyboard', 'Accessories'),
    (7, 'Mouse', 'Accessories'),
    (8, 'Monitor', 'Accessories'),
    (9, 'Printer', 'Electronics');


select * from Products4


with cte as 
(
select *,row_number() over(partition by category order by productid) as rn1,
row_number() over(partition by category order by productid desc) as rn2
from products4
)
select b.productid,a.product,a.category from cte a inner join cte b
on a.rn1=b.rn2