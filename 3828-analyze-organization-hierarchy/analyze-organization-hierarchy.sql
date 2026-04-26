/* Write your T-SQL query statement below */

--Step 1: use recursive to get level
;WITH CTE_manager AS(
	SELECT 
		employee_id,employee_name,manager_id,salary,department, 1 AS level 
	FROM	
		Employees
	WHERE 
		manager_id IS NULL
	UNION ALL
	SELECT
		E1.employee_id,E1.employee_name,E1.manager_id,E1.salary,E1.department,E2.level + 1  AS level
	FROM 
		Employees E1	
	INNER JOIN 
		CTE_manager E2 ON E1.manager_id = E2.employee_id

)
--Step 2: use union all, calculate total managers and employees under them
,CTE_calcu AS(
SELECT  
	employee_id AS employee,manager_id AS manager,employee_name,salary,department
FROM 
	CTE_manager
UNION ALL
SELECT  
	manager_id,employee_id,employee_name,salary,department
FROM 
	CTE_manager	
)
--Step 3: Count team_size, total sal
,CTE_calcu_total AS(
	SELECT 
		E1.manager_id,COUNT(C1.employee_name) team_size  , SUM(C1.salary) budget
	FROM 
		Employees E1
		 JOIN 
		CTE_calcu C1 ON E1.employee_id = C1.employee 
WHERE  E1.manager_id IS NOT NULL
GROUP BY E1.manager_id

)
-- Step 4: Result 
SELECT	
	E.employee_id,
    E.employee_name,
    C1.level,
    IIF(E.manager_id IS NULL,(SELECT COUNT(employee_id) FROM CTE_manager WHERE manager_id is not null),ISNULL(team_size,0)) team_size , 
				IIF( E.manager_id IS NULL,(SELECT SUM(salary) FROM CTE_manager),ISNULL(E.salary,0) + ISNULL(budget,0))  as budget 
FROM 
	Employees E
	LEFT JOIN
	CTE_calcu_total C ON E.employee_id = C.manager_id
	LEFT JOIN
	CTE_manager C1 ON E.employee_id = C1.employee_id
ORDER BY level ASC,budget  DESC ,employee_name ASC