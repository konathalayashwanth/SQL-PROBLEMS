
WITH CTE AS
(
SELECT 
      PP.user_id,
      pp.product_id,
      pi.category
FROM ProductPurchases pp INNER JOIN ProductInfo pi
    ON pp.product_id = pi.product_id
)
SELECT 
    c1.category AS category1,
    c2.category AS category2,
    COUNT(DISTINCT c1.user_id)  AS customer_count 
FROM cte c1 inner join cte c2
   ON  c1.user_id = c2.user_id 
   AND  c1.category < c2.category 
   AND c1.product_id <> c2.product_id
GROUP BY c1.category,c2.category
HAVING COUNT(DISTINCT c1.user_id) > 2
ORDER BY customer_count DESC,c1.category ASC, c2.category ASC