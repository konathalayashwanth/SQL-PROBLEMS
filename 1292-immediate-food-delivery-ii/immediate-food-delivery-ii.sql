/* Write your T-SQL query statement below */
With X As
(SELECT*, ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date ) as rn 
 FROM Delivery)

SELECT ROUND(
    100.0*SUM(
        CASE WHEN order_date = customer_pref_delivery_date THEN 1 
        ELSE 0 
        END)
        /COUNT(*),2) as immediate_percentage
FROM X WHERE rn = 1; 