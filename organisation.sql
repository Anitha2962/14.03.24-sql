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

   select FIRST_NAME AS WORKER_NAME FROM Worker;  select * from worker;  select * from Title;  select * from Bonus;  

 -- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>--      select FIRST_NAME AS WORKER_NAME FROM Worker;
	


--Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.--

      select UPPER(FIRST_NAME) AS  FIRST_NAME_UPPERCASE FROM Worker;


-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.--

      SELECT DISTINCT DEPARTMENT FROM Worker;


-- Q-4. Write an SQL query to print the first three characters of FIRST_NAME from Worker table.

select LEFT(FIRST_NAME,3) AS FIRST_NAME_FIRST_THREE_CHARS FROM Worker;


--Q-5. Write an SQL query to find the position of the alphabet (a) in the first name column Amitabh from Worker table.SELECT  CHARINDEX('k','Niharika') as Position_Of_k ;--Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.select RTRIM(FIRST_NAME) AS TRIMMED_FIRST_NAME FROM Worker;--Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.SELECT DISTINCT DEPARTMENT as unique_department, LEN(DEPARTMENT) AS Department_Length FROM Worker;--Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing a with A.SELECT REPLACE(FIRST_NAME,'h','H') AS REPLACED_FIRST_NAME FROM WORKER;--Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.SELECT CONCAT(FIRST_NAME,' ' ,LAST_NAME) AS COMPLETE_NAME FROM WORKER;--Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.SELECT * FROM WORKER ORDER BY FIRST_NAME ASC;SELECT * FROM WORKER ORDER BY LAST_NAME ASC;--Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.SELECT * FROM WORKER ORDER BY FIRST_NAME ASC,DEPARTMENT DESC;SELECT * FROM WORKER ORDER  BY DEPARTMENT DESC;--Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.SELECT * FROM WORKER WHERE FIRST_NAME='Vipul' OR FIRST_NAME='Satish';select * from Worker where FIRST_NAME IN('Vipul','Satish');--Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.SELECT * FROM Worker where FIRST_NAME NOT IN('Vipul','Satish');--Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.SELECT * FROM Worker WHERE DEPARTMENT='Admin';--Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains "a".SELECT * FROM Worker where FIRST_NAME like '%h%';--Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with a.SELECT * FROM Worker where FIRST_NAME LIKE '%h';--Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with h and contains six alphabets.SELECT * FROM WORKER WHERE FIRST_NAME LIKE '_____h';--Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.SELECT * FROM WORKER WHERE SALARY BETWEEN 100000 AND 500000;--Q-20. Write an SQL query to print details of the Workers who have joined in Feb 2014.SELECT * FROM WORKER WHERE MONTH(JOINING_DATE)=2 AND YEAR(JOINING_DATE)=2014;--Q-21. Write an SQL query to fetch the count of employees working in the department Admin.SELECT * FROM WORKER WHERE DEPARTMENT='Admin';--Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.SELECT FIRST_NAME,SALARY FROM WORKER WHERE SALARY>=50000 AND SALARY<=100000;--Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.SELECT DEPARTMENT,COUNT(*) AS WORKER_COUNT FROM WORKER GROUP BY DEPARTMENT ORDER BY WORKER_COUNT DESC;--Q-24. Write an SQL query to print details of the Workers who are also Managers.SELECT * FROM WORKER WINNER JOIN TITLE T ON W.WORKER_ID = T.WORKER_REF_IDWHERE T.WORKER_TITILE='manager';--Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.SELECT WORKER_REF_ID,WORKER_TITILE, count(*)from TITLEgroup by WORKER_REF_ID,WORKER_TITILEhaving count(*)>1;--Q-26. Write an SQL query to show only odd rows from a table.SELECT * FROM(SELECT *,ROW_NUMBER() OVER( ORDER BY WORKER_ID)AS ROW_NUM FROM WORKER)AS NUMBERD_ROWSWHERE ROW_NUM % 2=1;--Q-27. Write an SQL query to show only even rows from a tableSELECT * FROM(SELECT *,ROW_NUMBER() OVER (ORDER BY WORKER_ID) AS ROW_NUM FROM WORKER)AS NUMBERD_ROWSWHERE ROW_NUM %2=0;--Q-28. Write an SQL query to clone a new table from another table.--Q-29. Write an SQL query to fetch intersecting records of two tables.select * from titleintersectselect * from bonus;--Q-30. Write an SQL query to show records from one table that another table does not have.
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

--Q-35. Write an SQL query to fetch the list of employees with the same salary.SELECT W1.WORKER_ID,W1.SALARY FROM WORKER W1JOIN WORKER W2 ON W1.SALARY = W2.SALARYWHERE W1.WORKER_ID <> W2.WORKER_IDORDER BY W1.SALARY;--Q-36. Write an SQL query to show the second highest salary from a table.SELECT MAX(SALARY) AS second_highest_salaryFROM WORKERWHERE SALARY<(SELECT MAX (SALARY) FROM WORKER);--Q-37. Write an SQL query to show one row twice in results from a table.SELECT * FROM WORKERUNION ALLSELECT TOP 1 * FROM WORKER;--Q-38. Write an SQL query to fetch intersecting records of two tables.SELECT * FROM TITLEINNER JOIN BONUS ON TITLE.WORKER_REF_ID = BONUS.WORKER_REF_ID;--Q-39. Write an SQL query to fetch the first 50% records from a table.---40. Write an SQL query to fetch the departments that have less than five people in it.SELECT WORKER_TITILE, COUNT(*) AS num_people
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

--Q-47. Write an SQL query to fetch three min salaries from a table.SELECT TOP 3 SALARY FROM WORKERORDER BY SALARY ASC;--Q-48. Write an SQL query to fetch nth max salaries from a table.--Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of themSELECT WORKER_ID ,SUM(SALARY) AS TOTAL_SALARIES_PAIDFROM WORKERGROUP BY WORKER_ID;--Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.SELECT FIRST_NAMEFROM WORKERWHERE SALARY =(SELECT MAX(SALARY) FROM WORKER);