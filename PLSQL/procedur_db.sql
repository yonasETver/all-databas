/*

  Procedure
              has three part
              1. declaration
              2. execution
              3. exception
*/

SET SERVEROUTPUT ON;


DECLARE
    a number;
    b number;
    c number;
PROCEDURE findMin(x IN number, y IN number, z OUT number) IS
BEGIN
    IF x < y THEN
        z:= x;
    ELSE
        z:= y;
    END IF;
END;
BEGIN
    a:= 23;
    b:= 45;
    findMin(a, b, c);
    dbms_output.put_line(' Minimum of (23, 45) : ' || c);
END;
/


create or replace NONEDITIONABLE PROCEDURE min_num(num_one IN NUMBER, num_two IN NUMBER, res out NUMBER)

IS

BEGIN
    if num_one > num_two then
        res := num_two;
    else
        res := num_one;
    end if;

EXCEPTION WHEN others Then
    dbms_output.put_line('Some error occured!!!');
END;


SET SERVEROUTPUT ON;
DECLARE
  c NUMBER;

BEGIN
  min_num(10,20, c);
  dbms_output.put_line('The minmum number is ' || c);
END; 
/

 
Create or replace procedure max_num(x in Number, y in Number)

is 
    z NUMBER;

begin
  if x > y then
    z := x;
  else
    z := y;
  end if;
  dbms_output.put_line('The  maximum number is of (' ||  x || ') and (' || y ||') is '|| z);
exception when others then
   dbms_output.put_line('some error ocurr!!');
end;
/

--parameter with positional notation
set serveroutput on;
exec max_num(20,99);
execute max_num(100,99); 

--parameter with named notation
set serveroutput on;
exec max_num(y =>20,x=> 99);

set serveroutput on;
declare 
    a number;
    b number;
begin
    a := 200;
    b := 600;
    max_num(y => a,x => b);
end;
/

--parameter with mixed notation
set serveroutput on;
exec max_num(y =>20,x=> 99);

