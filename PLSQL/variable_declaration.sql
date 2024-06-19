-- variable declaration and intialization 

SET SERVEROUTPUT ON;

DECLARE
    name_per VARCHAR2(20):='Yonas Tedela';
    age INT:= 30;
    message  VARCHAR2(20) DEFAULT 'Hello from Ethiopia.';
    v1 INT:=99;
    v2 INT:=1;
    v3 REAL;
    
BEGIN
    v3 := v1 +v2;
    dbms_output.put_line('Name: '||name_per || 'Age: '||age);
    dbms_output.put_line(message);
    dbms_output.put_line('The sum of two number: '||v3);
END;
/