
/*

creating a funcction
*/

SET SERVEROUTPUT ON;
DECLARE
    a number;
    b number;
    c number;
FUNCTION findMax(x IN number, y IN number)
RETURN number
IS
    z number;
BEGIN
    IF x > y THEN
    z:= x;
    ELSE
    Z:= y;
    END IF;
RETURN z;
END;
BEGIN
    a:= 23;
    b:= 45;
    c := findMax(a, b);
    dbms_output.put_line(' Maximum of (23,45): ' || c);
END;
/

--Subtraction
CREATE OR REPLACE FUNCTION subtractor 
    (a in number, b in number)    
RETURN number    
IS     
    c number(8);    
BEGIN    
    c :=a-b;    
return c;    
END;

SET SERVEROUTPUT ON;
DECLARE    
   c number(2);    
BEGIN    
   c := subtractor (10, 5);    
   dbms_output.put_line('Subtraction is: ' || c);    
END;


--factorial
CREATE OR REPLACE FUNCTION fact 
        (a in number)
RETURN number
IS 
   fac number (10) := 1;
   i number:=0;
BEGIN
  
   loop
     i := i+1;
     fac := fac * i;
     if i > a-1 then
        exit;
     end if;
    end loop;
    RETURN fac;
END;

SET SERVEROUTPUT ON;
DECLARE
    x number(8);
BEGIN
   x := fact(6);
   dbms_output.put_line('The factorial of 6 is '|| x);
END;

--sum of three number


DROP FUNCTION SUM;
DROP FUNCTION SUM2;

--recursive function
SET SERVEROUTPUT ON;
DECLARE
    num number;
    factorial number;
FUNCTION fact(x number)
RETURN number
IS
    f number;
BEGIN
    IF x=0 THEN
        f := 1;
    ELSE
        f := x * fact(x-1);
    END IF;
RETURN f;
END;
BEGIN
    num:= 6;
    factorial := fact(num);
    dbms_output.put_line(' Factorial '|| num || ' is ' || factorial);
END;
/





