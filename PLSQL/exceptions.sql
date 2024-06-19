
SET SERVEROUTPUT ON;

DECLARE
    c_id customers.id%type := 8;
    c_name customerS.name%type;
    c_addr customers.address%type;
BEGIN
    SELECT name, address INTO c_name, c_addr
    FROM customers
    WHERE id = c_id;
    DBMS_OUTPUT.PUT_LINE ('Name: '|| c_name);
    DBMS_OUTPUT.PUT_LINE ('Address: ' || c_addr);
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('No such customer!');
    WHEN CASE_NOT_FOUND Then
        dbms_output.put_line('no choice in when close!');
    WHEN others THEN
        dbms_output.put_line('Error!');
END;
/

-- Raising exception
SET SERVEROUTPUT ON;
DECLARE
        exc_name EXCEPTION;
        x INT := 10;
BEGIN
    if x = 10 then
        RAISE exc_name;
    end if;
EXCEPTION 
    WHEN exc_name THEN
        dbms_output.put_line('Raise Error!');
END;
/

/*
      User-defined Exception
*/
set serveroutput on;
DECLARE
    c_id customers.id%type := &cc_id;
    c_name customerS.name%type;
    c_addr customers.address%type;
    -- user defined except
    ex_invalid_id EXCEPTION;
BEGIN
    IF c_id <= 0 THEN
        RAISE ex_invalid_id;
    ELSE

    SELECT name, address INTO c_name, c_addr FROM customers
    WHERE id = c_id;
        DBMS_OUTPUT.PUT_LINE ('Name: '|| c_name);
        DBMS_OUTPUT.PUT_LINE ('Address: ' || c_addr);
    END IF;
EXCEPTION
    WHEN ex_invalid_id THEN
        dbms_output.put_line('ID must be greater than zero!');
    WHEN no_data_found THEN
        dbms_output.put_line('No such customer!');
    WHEN others THEN
        dbms_output.put_line('Error!');
END;
/