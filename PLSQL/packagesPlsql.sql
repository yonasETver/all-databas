/*
    Packages 
*/
-- Package specification
CREATE PACKAGE cust_sal AS
    PROCEDURE find_sal(c_id customers.id%type);
END cust_sal;
/


--Package body
SET SERVEROUTPUT ON
CREATE OR REPLACE PACKAGE BODY cust_sal AS
    PROCEDURE find_sal(c_id customers.id%TYPE) IS
    c_sal customers.salary%TYPE;
BEGIN
    SELECT salary INTO c_sal
    FROM customers
    WHERE id = c_id;
    dbms_output.put_line('Salary: '|| c_sal);
    END find_sal;
END cust_sal;
/

DECLARE
    code customers.id%type := &cc_id;
BEGIN
    cust_sal.find_sal(code);
END;
/

select *from customers;

-- create package  to insert and delete customer 
CREATE OR REPLACE PACKAGE c_package AS
-- Adds a customer
PROCEDURE addCustomer(c_id customers.id%type,
    c_name customers.name%type,
    c_age customers.age%type,
    c_addr customers.address%type,
    c_sal customers.salary%type);
    
-- Removes a customer
PROCEDURE delCustomer(c_id customers.id%TYPE);

--Lists all customers
PROCEDURE listCustomer;
END c_package;
/

--create the body
SET SERVEROUTPUT ON;
CREATE OR REPLACE PACKAGE BODY c_package AS
PROCEDURE addCustomer(c_id customers.id%type,
    c_name customers.name%type,
    c_age customers.age%type,
    c_addr customers.address%type,
    c_sal customers.salary%type)
IS
BEGIN
    INSERT INTO customers (id,name,age,address,salary)
    VALUES(c_id, c_name, c_age, c_addr, c_sal);
END addCustomer;

PROCEDURE delCustomer(c_id customers.id%type) IS
BEGIN
    DELETE FROM customers
    WHERE id = c_id;
END delCustomer;

PROCEDURE listCustomer IS
    CURSOR c_customers is
        SELECT name FROM customers;
    TYPE c_list is TABLE OF customerS.name%type;
    name_list c_list := c_list();
    counter integer :=0;
BEGIN
        FOR n IN c_customers LOOP
        counter := counter +1;
        name_list.extend;
        name_list(counter) := n.name;
        dbms_output.put_line('Customer(' ||counter|| ')'||name_list(counter));
        END LOOP;
    END listCustomer;
END c_package;
/

/*
    using the package
*/
DECLARE
    code customers.id%type:= 8;
BEGIN
    c_package.addcustomer(11, 'Rajnish', 25, 'Chennai', 3500);
    c_package.addcustomer(12, 'Subham', 32, 'Delhi', 7500);
    c_package.listcustomer;
    c_package.delcustomer(code);
    c_package.listcustomer;
END;
/