CREATE DATABASE testDB

use testDB

create table Department_tb1
( id int primary key ,
name varchar (50),
phonenumber varchar (50),
diseases varchar (50),
location varchar (50)
)

create table patient_tb2 (
id int primary key,
firstname varchar (50),
lastname varchar (50),
doctor_id int ,
age int ,
department_id int ,
treatment_id int 

)

create table doctor_tb3 (
id int primary key ,
firstname varchar (50),
lastname varchar (50),
department_id varchar(50),
phonenumber varchar(50),
age int 

)

create table treatment_tb4 (
id int primary key ,
firstname varchar (50),
lastname varchar (50),
diseases varchar (50),
doctor_id int 
)

-- INSERT
insert into Department_tb1 values (1,'Dental_section' , 0103786873,'Molar_nerve','A1')
insert into Department_tb1 values (2,'nose_ear' , 0105578002,'nasal_sinus','BB1')
insert into Department_tb1 values (3,'chlidern' , 01137487485,'fever','B4')
insert into Department_tb1 values (4,'Gynecology' , 0156789439,' infertility','B2')
insert into Department_tb1 values (5,'Department of the brain and nerves' , 012746397,' Seventh nerve diseases','A3')
insert into Department_tb1 values (6,'Leather',01177372828,'smallpox','c1')
insert into patient_tb2 values (1, 'ahmed', 'amir', 2, 25, 2, 2)
insert into patient_tb2 values (2, 'ahmed', 'yasser', 3, 27, 5, 5)
insert into patient_tb2 values (3, 'bondk', 'galal', 4, 36, 3, 3)
insert into patient_tb2 values (4, 'fatma', 'ahmed', 5, 20, 2, 2)
insert into patient_tb2 values (5, 'alaa', 'mohammed', 5, 23, 4, 4)
insert into patient_tb2 values (6, 'marina', 'ahmed', 4, 19, 1, 5)
insert into doctor_tb3 values (1, 'amir', 'monir', '1', '12374378', 23)
insert into doctor_tb3 values (2, 'ali', 'ahmed', '2', '1166688', 25)
insert into doctor_tb3 values (3, 'mostafa', 'ahmed', '3', '1237643', 27)
insert into doctor_tb3 values (4, 'mohammed', 'ahmed', '2', '1245565667', 30)
insert into doctor_tb3 values (5,'mohammed','ali',5,0158546789,22)
insert into doctor_tb3 values (6,'monir','ali',1,011128474,36)
insert into doctor_tb3 values (7,'rahma','zaher',3,01536647,23)
insert into doctor_tb3 values (4,'merna','khalid',5,0305678,22)
insert into treatment_tb4 values (6,'revo','...','headache',5)
insert into treatment_tb4 values (5,'Voltaren','...','Inflammation of the bones',5)
insert into treatment_tb4 values (1,'Voltaren','...','broken elbow',4)
insert into treatment_tb4 values (2,'pandol','...','a headache',2)
insert into treatment_tb4 values (3,'Insulin','...','suger',3)

select *from Department_tb1
select *from patient_tb2
select * from doctor_tb3
select * from treatment_tb4


-- QUESTIONS
-- #1
select *from treatment_tb4

-- #2
select name from Department_tb1

-- #3
select location,phonenumber from Department_tb1;

-- #4
select diseases from Department_tb1
where id=3;

-- #5
SELECT * FROM Department_tb1
WHERE name='Dental_section' AND diseases='Molar_nerve';

-- #6
SELECT * FROM treatment_tb4
WHERE firstname='pandol' or firstname='insulin'; 

-- #7
SELECT * FROM treatment_tb4
WHERE NOT diseases='diarrhea';

-- #8
SELECT * FROM doctor_tb3
WHERE lastname LIKE  'a%';

-- #9
SELECT * FROM treatment_tb4
WHERE firstname LIKE '%l';

-- #10
SELECT TOP 3 * FROM doctor_tb3;

-- #11
SELECT * FROM patient_tb2
WHERE lastname IN ('AHMED', 'GALAL');

-- #12
SELECT * FROM patient_tb2
WHERE doctor_id NOT IN (4, 1, 3);

-- #13
SELECT * FROM doctor_tb3
WHERE age BETWEEN '20' AND '25';

-- #14
SELECT * FROM doctor_tb3
WHERE age not BETWEEN '20' AND '25';

-- #15
SELECT * FROM doctor_tb3
WHERE age BETWEEN 20 AND 25
AND ID NOT IN (5,1);

-- #16
SELECT * FROM treatment_tb4
WHERE diseases BETWEEN 'cold' AND 'suger'
ORDER BY diseases;

-- #17
SELECT DISTINCT lastname FROM doctor_tb3;

-- #18
SELECT COUNT(DISTINCT lastname) FROM doctor_tb3;

-- #19
SELECT * FROM Department_tb1
ORDER BY name;

-- #20
SELECT * FROM Department_tb1
ORDER BY name, diseases;

-- SUB QUERIES
select *
from patient_tb2
where doctor_id=4


SELECT a.id, a.firstname, b.id
FROM patient_tb2 a, doctor_tb3 b
WHERE a.id = b.id
AND b.id >3;

SELECT a.id, a.firstname, b.id
FROM patient_tb2 a, doctor_tb3 b
WHERE a.id = b.id AND b.id >
(SELECT id
FROM doctor_tb3
WHERE id =  2);


--#function
SELECT avg(age)
FROM patient_tb2;

SELECT SUM(id)
FROM Department_tb1
where id=3 or id=4 

SELECT max(age)
FROM patient_tb2; 



-- COUNT AND GROUP BY
SELECT COUNT(id), diseases
FROM Department_tb1
GROUP BY diseases;

SELECT COUNT(id), age
FROM patient_tb2
GROUP BY age;




-- JOINS
SELECT doctor_tb3.id, patient_tb2.doctor_id
FROM doctor_tb3
INNER JOIN patient_tb2 ON doctor_tb3.id= patient_tb2.id;

SELECT treatment_tb4.doctor_id, patient_tb2.doctor_id
FROM patient_tb2
LEFT JOIN treatment_tb4 ON treatment_tb4.doctor_id= patient_tb2.id
ORDER BY patient_tb2.doctor_id ;

SELECT  patient_tb2.id, treatment_tb4.firstname,treatment_tb4.lastname
FROM patient_tb2
RIGHT JOIN treatment_tb4 ON patient_tb2.treatment_id=patient_tb2.treatment_id
ORDER BY patient_tb2.id;

SELECT patient_tb2.firstname, doctor_tb3.id
FROM patient_tb2
FULL OUTER JOIN doctor_tb3 ON patient_tb2.doctor_id=doctor_tb3.id
ORDER BY patient_tb2.firstname;

SELECT A.firstname AS fristname1, B.lastname AS lastname2, A.age
FROM patient_tb2 A, patient_tb2 B
WHERE A.id <> B.id
AND A.age > B.age
ORDER BY A.age;



-- UPDATE
UPDATE patient_tb2
SET doctor_id = 5, lastname= 'mohammed'
WHERE id= 5;

UPDATE patient_tb2
SET firstname = 'bondk', age= 36
WHERE id= 3;

UPDATE doctor_tb3
SET department_id = 2, phonenumber= 01245565667
WHERE id= 4;

UPDATE treatment_tb4
SET firstname = 'fucidin', diseases= 'antibiotic'
WHERE id= 1;

UPDATE Department_tb1
SET diseases = 'Fever', location='B4',name ='chlidern'
WHERE id= 3;

-- DELETE
DELETE FROM patient_tb2 WHERE id=6;
DELETE FROM Department_tb1 WHERE id=6;
DELETE FROM treatment_tb4 WHERE id=6;
DELETE FROM doctor_tb3 WHERE id=6 ;
DELETE FROM doctor_tb3 WHERE id=7;



