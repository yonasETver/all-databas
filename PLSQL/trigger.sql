--------------------------------------------------------
--  DDL for Table CUSTOMERS
--------------------------------------------------------

  CREATE TABLE CUSTOMERS
   (	
   "ID" NUMBER(*,0), 
	"NAME" VARCHAR2(20 BYTE), 
	"AGE" NUMBER(*,0), 
	"ADDRESS" CHAR(25 BYTE), 
	"SALARY" NUMBER(18,2)
   ) 

DROP TABLE CUSTOMERS;

SET SERVEROUTPUT ON;
INSERT INTO CUSTOMERS (ID, NAME, AGE, ADDRESS, SALARY) VALUES (1, 'Yonas Tedela', 30, 'Addis Ababa', 2000 );
INSERT INTO CUSTOMERS (ID, NAME, AGE, ADDRESS, SALARY) VALUES (2, 'Addis Bekele', 30, 'Addis Ababa', 4000 );
INSERT INTO CUSTOMERS (ID, NAME, AGE, ADDRESS, SALARY) VALUES (3, 'Veronica Rosi', 30, 'Addis Ababa', 5000 );
INSERT INTO CUSTOMERS (ID, NAME, AGE, ADDRESS, SALARY) VALUES (4, 'Eyob Tesfaye', 30, 'Addis Ababa', 7000 );
INSERT INTO CUSTOMERS (ID, NAME, AGE, ADDRESS, SALARY) VALUES (5, 'Aster Tegene', 30, 'Addis Ababa', 10000 );
INSERT INTO CUSTOMERS (ID, NAME, AGE, ADDRESS, SALARY) VALUES (6, 'Abbebe Bikia', 30, 'Addis Ababa', 8000 );
INSERT INTO CUSTOMERS (ID, NAME, AGE, ADDRESS, SALARY) VALUES (8, 'Chala Lema', 30, 'Addis Ababa', 9000 );
INSERT INTO CUSTOMERS (ID, NAME, AGE, ADDRESS, SALARY) VALUES (9, 'Lema Chala', 30, 'Addis Ababa', 10000 );

--update record
UPDATE CUSTOMERS
SET AGE = 20, SALARY = 50000
WHERE ID = 9;


SET SERVEROUTPUT ON;

select * from customers;



-- TRIGER 
CREATE OR REPLACE TRIGGER display_salary_changes
    BEFORE DELETE OR INSERT OR UPDATE ON customers
    FOR EACH ROW
    WHEN (NEW.ID > 0)
DECLARE
    sal_diff number;
BEGIN
    sal_diff := :NEW.salary - :OLD.salary;
    dbms_output.put_line('Old salary: ' || :OLD.salary);
    dbms_output.put_line('New salary: ' || :NEW.salary);
    dbms_output.put_line('Salary difference: ' || sal_diff);
END;
/
   
SET SERVEROUTPUT ON;
INSERT INTO CUSTOMERS (NAME, AGE, ADDRESS, SALARY) VALUES ('Mengstu Lema', 30, 'Addis Ababa', 10000 );
   