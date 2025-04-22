
-- SQL Assignment: Employee Management

-- Objective:  
-- Understand and apply basic SQL operations including database creation, data retrieval, data manipulation, and aggregation in the context of human resources.


-- 1. Create a database named EmployeeManagement.
create database EmployeeManagement;

-- 2. Select the EmployeeManagement database for use.
use EmployeeManagement; -- i double clicked on the database in the schemas tab 

-- 3. Create a table named Employees with the following columns:
	--   EmployeeID (Primary Key, Auto Increment)
	--   FirstName
	--   LastName
	--   Department
	--   Position
	--   Salary
	--   DateOfHire
	--   Location
    
    CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    First_Name VARCHAR(100),
    Last_Name VARCHAR(100),
    Department TEXT,
    Position VARCHAR(100),
    Salary INT,
    Date_Of_Hire TEXT,
    Location VARCHAR(100)
);
    
    
    
-- 4. Insert the following rows into the Employees table: (write table name)
INSERT INTO Employees(First_Name, Last_Name, Department, Position, Salary, Date_Of_Hire, Location)

VALUES
    ('Ali', 'Khan', 'Finance', 'Analyst', 60000, '2022-03-15', 'Karachi'),
    ('Fatima', 'Rashid', 'HR', 'Manager', 80000, '2021-07-22', 'Lahore'),
    ('Ahmed', 'Butt', 'IT', 'Developer', 70000, '2023-01-10', 'Islamabad'),
    ('Sara', 'Sheikh', 'Marketing', 'Coordinator', 50000, '2020-06-05', 'Karachi'),
    ('Ayesha', 'Iqbal', 'Finance', 'Accountant', 65000, '2022-11-01', 'Lahore'),
    ('Bilal', 'Zafar', 'HR', 'Recruiter', 55000, '2021-09-17', 'Islamabad'),
    ('Nida', 'Malik', 'IT', 'System Admin', 75000, '2022-04-28', 'Karachi'),
    ('Usman', 'Rizvi', 'Marketing', 'Manager', 85000, '2020-02-14', 'Lahore'),
    ('Hassan', 'Shah', 'Finance', 'Consultant', 90000, '2019-05-21', 'Karachi'),
    ('Zainab', 'Hassan', 'HR', 'Assistant', 45000, '2023-07-19', 'Islamabad'),
    ('Omar', 'Farooq', 'IT', 'Support Engineer', 60000, '2021-08-23', 'Lahore'),
    ('Mariam', 'Yousaf', 'Marketing', 'Content Writer', 48000, '2022-01-10', 'Islamabad'),
    ('Arif', 'Nawaz', 'Finance', 'Advisor', 72000, '2021-11-30', 'Karachi'),
    ('Rabia', 'Khan', 'HR', 'Training Specialist', 67000, '2022-05-14', 'Lahore'),
    ('Hiba', 'Ali', 'IT', 'Network Admin', 74000, '2021-03-25', 'Islamabad'),
    ('Waqar', 'Aziz', 'Marketing', 'Social Media Manager', 68000, '2020-09-18', 'Karachi'),
    ('Saad', 'Mirza', 'Finance', 'Investment Analyst', 78000, '2023-04-11', 'Lahore'),
    ('Nimra', 'Yasin', 'HR', 'HR Coordinator', 52000, '2021-06-01', 'Islamabad'),
    ('Raza', 'Siddiqui', 'IT', 'Data Analyst', 72000, '2022-02-20', 'Karachi'),
    ('Asma', 'Khalid', 'Marketing', 'Brand Manager', 82000, '2019-12-02', 'Lahore'),
    ('Faisal', 'Haider', 'Finance', 'Account Manager', 76000, '2021-10-12', 'Islamabad'),
    ('Hira', 'Anwar', 'HR', 'Recruitment Lead', 83000, '2020-07-28', 'Karachi'),
    ('Imran', 'Qureshi', 'IT', 'DevOps Engineer', 87000, '2019-03-15', 'Lahore'),
    ('Bushra', 'Saeed', 'Marketing', 'SEO Specialist', 62000, '2022-08-07', 'Islamabad'),
    ('Shahid', 'Iqbal', 'Finance', 'Internal Auditor', 75000, '2021-12-19', 'Karachi'),
    ('Ammar', 'Khan', 'HR', 'Compensation Analyst', 67000, '2021-05-23', 'Lahore'),
    ('Noor', 'Zaman', 'IT', 'Software Engineer', 78000, '2022-10-01', 'Islamabad'),
    ('Sana', 'Hameed', 'Marketing', 'PR Specialist', 70000, '2020-11-09', 'Karachi'),
    ('Rehan', 'Aslam', 'Finance', 'Budget Analyst', 69000, '2021-03-15', 'Lahore'),
    ('Uzma', 'Rauf', 'HR', 'Employee Relations Specialist', 62000, '2022-06-22', 'Islamabad');

   

-- 5. Retrieve all records from the Employees table.
SELECT 
    *
FROM
    employees;

-- 6. Retrieve all employees in the 'HR' department.
SELECT 
    *
FROM
    employees
WHERE
    Department = 'HR';

-- 7. Retrieve employees with a salary greater than 70,000 in Year 2022.
SELECT 
    *
FROM
    employees
WHERE
    Salary > 70000
        AND Date_Of_Hire LIKE '2022%';

-- 8. Add a new column named AnnualBonus to the Employees table
alter table employees
add column Annual_Bonus int;

-- 9. Update the Annual_Bonus column based on the following conditions:
--   If the salary is above 75,000, the bonus is 10% of the salary.
--   If the salary is between 60,000 and 75,000, the bonus is 7% of the salary.
--   If the salary is below 60,000, the bonus is 5% of the salary.
UPDATE employees 
SET 
    Annual_Bonus = Salary * 10 / 100
WHERE
    Salary > 75000;
UPDATE employees 
SET 
    Annual_Bonus = Salary * 7 / 100
WHERE
    Salary BETWEEN 60000 AND 75000;
UPDATE employees 
SET 
    Annual_Bonus = Salary * 5 / 100
WHERE
    Salary < 60000;

-- 10. Calculate the total payroll (sum of salaries) for the 'IT' department.
SELECT 
    Department, SUM(salary)
FROM
    employees
WHERE
    Department = 'IT'
GROUP BY Department;

-- 11. List the top 3 employees by salary.

SELECT 
    *
FROM
    employees
ORDER BY Salary DESC
LIMIT 3;


-- 12. Find the average salary for each department.
SELECT 
    department, AVG(salary)
FROM
    employees
GROUP BY department;


-- 13. How many employees were hired in the each year. count(EmployeeID)
SELECT 
    YEAR(Date_Of_Hire), COUNT(EmployeeID)
FROM
    employees
GROUP BY YEAR(Date_Of_Hire)
ORDER BY YEAR(Date_Of_Hire);


-- 14. Use the CASE statement to create a temporary column salary×10/100 where:
--    Salaries above 80,000 are classified as 'A'
--    Salaries between 60,000 and 80,000 are classified as 'B'
--    Salaries below 60,000 are classified as 'C'
SELECT 
    Salary,
    CASE
        WHEN Salary > 80000 THEN 'A'
        WHEN Salary BETWEEN 60000 AND 80000 THEN 'B'
        ELSE 'C'
    END AS 'salary×10/100'
FROM
    employees
GROUP BY Salary;


-- 15. Identify employees who have been with the company for more than 3 years.(Hint. subtract year from the current year)
SELECT 
    First_Name, Last_Name, YEAR(Date_Of_Hire)
FROM
    employees
WHERE
    Date_Of_Hire LIKE '2019%'
        OR Date_Of_Hire LIKE '2020%'
GROUP BY First_Name , Last_Name , YEAR(Date_Of_Hire)
ORDER BY YEAR(Date_Of_Hire);



-- Good Luck!
