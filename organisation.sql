create database ORGANIZATION

CREATE TABLE Worker(WORKER_ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
FIRST_NAME char(25),
LAST_NAME char(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25));

INSERT INTO Worker(FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT)
values('Monika','Arora',100000,'2014-02-20 09:00:00','HR');
INSERT INTO Worker(FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT)
values
('Niharika','Varma',80000,'2014-06-11 09:00:00','Admin');
INSERT INTO Worker(FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT)
values
('Vishal','Singhal',300000,'2014-02-20 09:00:00','HR'),
('Amitabh','Singh',500000,'2014-02-20 09:00:00','Admin'),
('Vivek','Bhati',500000,'2014-06-11 09:00:00','Admin'),
('Vipul','Diwan',200000,'2014-06-11 09:00:00','Account'),
('Satish','Kumar',75000,'2014-01-20 09:00:00','Account'),
('Geethika','Chauhan',90000,'2014-04-11 09:00:00','Admin');

drop table Worker;
SELECT * from Worker;

create table Title(WORKER_REF_ID INT,
WORKER_TITILE CHAR(25),
AFFECTED_FROM DATETIME,
FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) ON DELETE CASCADE);
drop table Title

SELECT * FROM Title
INSERT INTO Title(WORKER_REF_ID,WORKER_TITILE,AFFECTED_FROM)
VALUES(1,'Manager','2016-02-20 00:00:00'),
(2,'Executive','2016-06-11 00:00:00'),
(8,'Executive','2016-06-11 00:00:00'),
(5,'Manager','2016-06-11 00:00:00'),
(4,'Asst.Manager','2016-06-11 00:00:00'),
(7,'Executive','2016-06-11 00:00:00'),
(6,'Lead','2016-06-11 00:00:00'),
(3,'Lead','2016-06-11 00:00:00');


create table Bonus(WORKER_REF_ID INT,
BONUS_AMOUNT INT,
BONUS_DATE DATETIME,
FOREIGN KEY(WORKER_REF_ID)
REFERENCES Worker(WORKER_ID) ON DELETE CASCADE);
 
 drop table Bonus;
 SELECT * FROM Bonus;

  INSERT INTO Bonus(WORKER_REF_ID,BONUS_AMOUNT,BONUS_DATE)
  VALUES
  (1,5000,'2016-02-20 00:00:00'),
  (2,3000,'2016-06-11 00:00:00'),
  (3,4000,'2016-02-20 00:00:00'),
  (1,4500,'2016-02-20 00:00:00'),
  (2,3500,'2016-06-11 00:00:00');

   select FIRST_NAME AS WORKER_NAME FROM Worker;

 -- Q-1. Write an SQL query to fetch �FIRST_NAME� from Worker table using the alias name as <WORKER_NAME>--
	


--Q-2. Write an SQL query to fetch �FIRST_NAME� from Worker table in upper case.--

      select UPPER(FIRST_NAME) AS  FIRST_NAME_UPPERCASE FROM Worker;


-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.--

      SELECT DISTINCT DEPARTMENT FROM Worker;


-- Q-4. Write an SQL query to print the first three characters of FIRST_NAME from Worker table.

select LEFT(FIRST_NAME,3) AS FIRST_NAME_FIRST_THREE_CHARS FROM Worker;


--Q-5. Write an SQL query to find the position of the alphabet (a) in the first name column Amitabh from Worker table.
SELECT *
FROM bonus
WHERE NOT EXISTS (
    SELECT 1
    FROM title
    WHERE title.WORKER_REF_ID= bonus.WORKER_REF_ID
);

--Q-31. Write an SQL query to show the current date and time.

SELECT CURRENT_TIMESTAMP;

--Q-32. Write an SQL query to show the top n (say 10) records of a table.

SELECT TOP 5 *
FROM worker;

--Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.

SELECT DISTINCT SALARY
FROM 
(SELECT DISTINCT TOP 5 SALARY 
FROM WORKER
ORDER BY SALARY DESC)
AS TOP_SALARIES ORDER BY SALARY ASC;

--Q-34. Write an SQL query to determine the 5th highest salary without using TOP or limit method.

SELECT SALARY FROM
( SELECT SALARY,ROW_NUMBER() OVER (ORDER BY SALARY DESC) AS ROW_NUM
FROM WORKER)
AS RANKED_SALARIES
WHERE ROW_NUM=5;

--Q-35. Write an SQL query to fetch the list of employees with the same salary.
FROM Title
GROUP BY WORKER_TITILE
HAVING COUNT(*) < 5;

--Q-41. Write an SQL query to show all departments along with the number of people in there.

SELECT WORKER_TITILE FROM TITLE

--Q-42. Write an SQL query to show the last record from a table.

SELECT TOP 8 * FROM WORKER
ORDER BY WORKER_ID DESC;

SELECT * FROM WORKER 
WHERE WORKER_ID=8;

--Q-43. Write an SQL query to fetch the first row of a table.

SELECT * FROM WORKER WHERE WORKER_ID=1;

SELECT TOP 1 * FROM WORKER

--Q-44. Write an SQL query to fetch the last five records from a table.

SELECT TOP 5 * FROM WORKER
ORDER BY WORKER_ID DESC;

--Q-45. Write an SQL query to print the name of employees having the highest salary in each department.

--Q-46. Write an SQL query to fetch three max salaries from a table.

SELECT TOP 3 salary
FROM WORKER
ORDER BY salary DESC;

--Q-47. Write an SQL query to fetch three min salaries from a table.