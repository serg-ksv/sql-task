-- Task #1:
-- Write a SQL statement that selects the highest grade for each of the cities of the customers.
SELECT MAX(grade), city
FROM customer
GROUP BY city;

-- Task #2:
-- 1. Write a SQL statement to find the highest purchase amount ordered by the each customer
-- on a particular date with their ID, order date and highest purchase amount.
-- 2. Write a SQL statement to find the highest purchase amount with their ID and order date, for
-- those customers who have a higher purchase amount in a day is within the range 2000 and 6000.
SELECT customer_id, ord_date, MAX(purch_amt)
FROM orders
GROUP BY customer_id, ord_date;

SELECT customer_id, ord_date, MAX(purch_amt)
FROM orders
GROUP BY customer_id, ord_date
HAVING MAX(purch_amt) BETWEEN 2000 AND 6000;

-- Task #3:
-- 1. Write a SQL statement to find the list of customers who appointed a salesman for their jobs
-- who gets a commission from the company is more than 12%.
-- 2. Write a SQL statement to make a list in ascending order for the customer who works
-- either through a salesman or by own.
-- 3. Write a SQL statement to make a list in ascending order for the customer who holds a grade
-- less than 300 and works either through a salesman or by own.
SELECT customer_id, cust_name, name AS salesman, commission
FROM customer
JOIN salesman USING(salesman_id)
WHERE commission > 0.12;

SELECT customer_id, cust_name, name AS salesman
FROM customer
LEFT JOIN salesman USING(salesman_id)
ORDER BY customer_id;

SELECT customer_id, cust_name, grade, name AS salesman
FROM customer
LEFT JOIN salesman USING(salesman_id)
WHERE grade < 300
ORDER BY customer_id;

-- Task #4:
-- Write a query in SQL to find the names of departments where more than two employees are working.
SELECT DPT_NAME
FROM emp_department AS dep
JOIN emp_details AS det ON dep.DPT_CODE = det.EMP_DEPT
GROUP BY DPT_NAME
HAVING COUNT(*) > 2;
