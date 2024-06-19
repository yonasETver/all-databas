SET SERVEROUTPUT ON;

/*
    Arithmetic Operators (+, -, *, /, **)
    Relational operators (=, !=, <>, ~=, >, <, >=, <=)
    Comparison operators (like, between, in, is null)
*/

DECLARE
    x INT := 20;
    y INT := 10;
    letter VARCHAR2(1) := 'm';
    a BOOLEAN := true;
    b BOOLEAN := false;
    PROCEDURE compare (value varchar2, pattern varchar2 ) is

BEGIN
   -- Arithmetic Operators
   dbms_output.put_line('Arithmetic Operators');
   dbms_output.put_line('Add: ' || x || ' + ' || y || ' = ' || (x + y));
   dbms_output.put_line('Sub: ' || x || ' - ' || y || ' = ' || (x - y));
   dbms_output.put_line('Mul: ' || x || ' * ' || y || ' = ' || (x * y));
   dbms_output.put_line('Div: ' || x || ' / ' || y || ' = ' || (x / y));
   dbms_output.put_line('Exp: ' || x || ' + ' || y || ' = ' || (x ** y));
   
   -- Relational operators
   dbms_output.put_line('Relational operators');
   IF (x = y ) then
    dbms_output.put_line('x is equal with y');
   ELSE
    dbms_output.put_line('x is not equal with y');
   END IF;
   
   IF (x <> y or x != y) then
    dbms_output.put_line('x is not equal with y');
   ELSE
    dbms_output.put_line('x is equal with y');
   END IF;
   
   IF ( x ~= y) then
    dbms_output.put_line('x is not equal with y');
   ELSE
    dbms_output.put_line('x is equal with y');
   END IF;
   
    -- Comparison operators
    dbms_output.put_line('Comparison operators');
    
    IF(x BETWEEN 10 and 30) THEN
        dbms_output.put_line('True');
    ELSE
        dbms_output.put_line('False');
    END IF;
    
    IF (letter in ('a', 'b', 'c', 'd')) THEN
        dbms_output.put_line('True');
    ELSE
        dbms_output.put_line('False');
    END IF;
    
    IF (letter is null) THEN
        dbms_output.put_line('True');
    ELSE
        dbms_output.put_line('False');
    END IF;
    IF value LIKE pattern THEN
        dbms_output.put_line ('True');
    ELSE
        dbms_output.put_line ('False');
    END IF;
    
    --Logical oprators
    dbms_output.put_line('Logical operatores.........');
    IF( a and b) THEN
      dbms_output.put_line('True');
    END IF;
    
    IF (a or b) THEN
      dbms_output.put_line('True');
    END IF;
    
    IF (NOT a) THEN
       dbms_output.put_line('The logical not: '||'True');
    END IF;
    
    
    
    
   
END;

BEGIN
    compare('Zara Ali', 'Z%A_i');
    compare('Nuha Ali', 'Z%A_i');
END;
/