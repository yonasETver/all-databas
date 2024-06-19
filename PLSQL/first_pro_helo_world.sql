-- hello world example
SET SERVEROUTPUT ON;

DECLARE
    message VARCHAR2(20):= 'Hello World';
BEGIN
    dbms_output.put_line(message);
END;
/