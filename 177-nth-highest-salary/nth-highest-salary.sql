/* Write your T-SQL query statement below. */
CREATE FUNCTION getNthHighestSalary (@N INT)
RETURNS INT
AS
BEGIN
  DECLARE @result INT;

  SELECT @result = Salary
  FROM (
    SELECT Salary, DENSE_RANK() OVER (ORDER BY Salary DESC) AS ranking
    FROM Employee
  ) AS ranked_salaries
  WHERE ranking = @N;

  RETURN @result;
END;