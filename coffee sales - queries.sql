SELECT * FROM employees;
SELECT * FROM location;

-- Select employee id, first name, date of hiring and salary from employees table
SELECT
	employee_id,
    first_name,
    hire_date,
    salary
FROM employees;

-- Find employees with salary more than $50000
SELECT * FROM employees
WHERE salary > 50000;

-- Find employees that makes between 35000 and 50000
SELECT 
	first_name,
    last_name,
    salary
    FROM employees
WHERE salary BETWEEN 35000 AND 50000;

-- Find employees whose hire date is after 2018 and work in Early Rise
SELECT * FROM employees
WHERE hire_date > '2018-01-01' AND coffeeshop_id = 1;

-- Find employees whose hire date is after 2018, salary more than 45000 and works in Ancient Bean
SELECT * FROM employees
WHERE hire_date > '2018/01/01'
AND salary > 45000
AND coffeeshop_id = 3;

-- Finding suppliers with the name 'Cool Beans'
SELECT * FROM suppliers
WHERE supplier_name = 'Cool Beans';

-- Finding suppliers other than 'Cool Beans'
select * FROM suppliers
WHERE supplier_name <> 'Cool Beans';

-- Select all coffee types other than Arabica and Robusta
SELECT * FROM suppliers
WHERE coffee_type NOT IN ('Arabica', 'Robusta');

-- Select employees with missing email addresses
SELECT * FROM employees
WHERE email IS NULL;

-- Employee's salary in ascending order
SELECT
	first_name,
    last_name,
    salary
FROM employees
ORDER BY salary;

-- Top 20 highest paid employees
SELECT
	first_name,
    last_name,
    salary
FROM employees
ORDER BY salary DESC
LIMIT 20;

-- All unique coffeeshop IDs
SELECT DISTINCT coffeeshop_id
FROM employees;

-- Renaming some columns in employees table
ALTER TABLE employees
RENAME COLUMN email
TO email_address,
RENAME COLUMN hire_date
TO date_joined,
RENAME COLUMN salary
TO pay;

-- Renameto original columns
ALTER TABLE employees
RENAME COLUMN email_address
TO email,
RENAME COLUMN date_joined 
TO hire_date,
RENAME COLUMN pay
TO salary;

-- Extract
SELECT
	hire_date AS date,
	EXTRACT(YEAR FROM hire_date) AS year,
	EXTRACT(MONTH FROM hire_date) AS month,
	EXTRACT(DAY FROM hire_date) AS day
FROM employees;

-- calculating the length of emil, excluding missing ones
SELECT
	email,
    LENGTH(email) AS length_email
FROM employees
WHERE email IS NOT NULL;

-- Inserting values for JOIN exercises
INSERT INTO location values (4, 'Bali', 'Indonesia');
INSERT INTO shops values (6, 'Happy Beans', NULL);

-- Checking the new data
SELECT * FROM location;
SELECT * FROM shops;

-- INNER JOIN = JOIN (Return records that have matching values in both table)
SELECT
	shops.coffeeshop_name,
    city,
    country
FROM shops
INNER JOIN location
ON shops.city_id = location.city_id; -- CG and UG: LA; ER and TC: NY; AB: London

-- LEFT JOIN (Returns all records from left table, and the matched records from right table)
SELECT
	shops.coffeeshop_name,
    city,
    country
FROM shops
LEFT JOIN location
ON shops.city_id = location.city_id; -- Returns the same as INNER JOIN and the new added record: HB, which is NULL for all values

-- RIGHT JOIN (Returns all records from right table, and the matched records from left table)
SELECT
	shops.coffeeshop_name,
    city,
    country
FROM shops
RIGHT JOIN location
ON shops.city_id = location.city_id; -- Returns the same as INNER JOIN and new added value Bali, having NULL for shop name

-- FULL JOIN (Returns all records from both table, values will be NULL if no matching rows)
SELECT
	coffeeshop_name,
    city,
    country
FROM shops
FULL JOIN location
ON shops.city_id = location.city_id;

-- UNION (Joining 2 or more datasets into one table; essentially same as FULL JOIN if using left/right join)
SELECT
	coffeeshop_name,
    city,
    country
FROM shops
LEFT JOIN location
ON location.city_id = shops.city_id
UNION
SELECT
	coffeeshop_name,
    city,
    country
FROM shops
RIGHT JOIN location
ON location.city_id = shops.city_id;

-- UNION removing duplicates (or keep them using UNION ALL)
SELECT city FROM location
UNION
SELECT city FROM location;




