--PLSQL collections 

    /*
          Three collection type
             1. Index-by table or Associative array
             2. Nested table
             3. Variable-size array or Varray
    */

/*
Index-by table or Associative array
*/

SET SERVEROUTPUT ON;
DECLARE
    TYPE salary IS TABLE OF NUMBER INDEX BY VARCHAR2(20);
    salary_list salary;
    name VARCHAR2(20);
BEGIN
    --adding element to the table
    salary_list('Yonas') := 62000;
    salary_list('Veronica') := 75000;
    salary_list('Addis') := 100000;
    salary_list('Eyob') := 78000;
    
    
    --printing the table
    name := salary_list.FIRST;
    WHILE name IS NOT null LOOP
        dbms_output.put_line
        ('Salary of ' || name || ' is ' || TO_CHAR(salary_list(name)));
        name := salary_list.NEXT(name);
    END LOOP;
END;
/


-- using cursore 
DECLARE
    CURSOR c_customers is
        select name from customers;
    TYPE c_list IS TABLE of customers.name%type INDEX BY binary_integer;
    name_list c_list;
    counter integer :=0;
BEGIN
    FOR n IN c_customers LOOP
        counter := counter +1;
        name_list(counter) := n.name;
        dbms_output.put_line('Customer('||counter|| '):'||name_list(counter));
END LOOP;
END;
/


/*
     Nested table
*/
SET SERVEROUTPUT ON;
DECLARE
    TYPE names_table IS TABLE OF VARCHAR2(10);
    TYPE grades IS TABLE OF INTEGER;

    names names_table;
    marks grades;
    total integer;
BEGIN
    names := names_table('Kavita', 'Pritam', 'Ayan', 'Rishav', 'Aziz');
    marks:= grades(98, 97, 78, 87, 92);
    total := names.count;
    dbms_output.put_line('Total '|| total || ' Students');
    FOR i IN 1 .. total LOOP
    dbms_output.put_line('Student:  '||names(i)||', Marks: ' || marks(i));
end loop;
END;
/

-- using cursor
DECLARE
    CURSOR c_customers is
        SELECT name FROM customers;

    TYPE c_list IS TABLE of customers.name%type;
    name_list c_list := c_list();
    counter integer :=0;
BEGIN
    FOR n IN c_customers LOOP
        counter := counter +1;
        name_list.extend;
        name_list(counter) := n.name;
        dbms_output.put_line('Customer('||counter||'):'||name_list(counter));
    END LOOP;
END;