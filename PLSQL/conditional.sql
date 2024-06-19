-- conditional statement
/*
    IF-THEN
    IF-THEN-ELSE
    IF-THEN-ELSEIF
    CASE
    NESTED IF
*/
SET SERVEROUTPUT ON;

DECLARE
  x int := 10;
  grade char(1) := 'A';


BEGIN
  dbms_output.put_line('Conditional stetement........');
  IF ( x <> 20) THEN
    dbms_output.put_line('Number  ' || x || ' not equal with 20');
  END  IF;
  
  IF (x <= 5) THEN
    dbms_output.put_line('The number less than 6');
  ELSE
    dbms_output.put_line('The number greater than 5');
  END IF;
  
  
  CASE grade
    when 'A' then dbms_output.put_line('Excellent');
    when 'B' then dbms_output.put_line('Very good');
    when 'C' then dbms_output.put_line('Well done');
    when 'D' then dbms_output.put_line('You passed');
    when 'F' then dbms_output.put_line('Better try again');
    else dbms_output.put_line('No such grade');
  END CASE;
    
  IF (x < 5) THEN 
    dbms_output.put_line('Number less than 5');
  ELSE IF (x = 10) THEN
     dbms_output.put_line('The number is equal with 10');
  ELSE
     dbms_output.put_line('The number greater than 10');
  END IF;
  END IF;
  
  IF  ( x < 100) THEN
      IF (x < 5) THEN
        dbms_output.put_line('The number is less than 5');
      ELSE
        dbms_output.put_line('The number greater than 5');
      END IF;
  ELSE 
     dbms_output.put_line('Number greater than 100');
  END IF;
  
END;
