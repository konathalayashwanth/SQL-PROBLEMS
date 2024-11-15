/* Write your T-SQL query statement below */
SELECT p.product_id,COALESCE(ROUND(CAST(SUM(p.price * Us.units) AS FLOAT)/SUM(Us.units),2),0) AS average_price
FROM Prices p
LEFT join UnitsSold Us
ON p.product_id = Us.product_id
    AND Us.purchase_date  BETWEEN p.start_date AND p.end_date  
GROUP BY p.product_id
