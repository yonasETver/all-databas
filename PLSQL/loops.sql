/*
* The PL/SQL
*     Basic loop
      while loop
      for loop
      nested loop
*/

set SERVEROUTPUT on;

DECLARE
    x NUMBER  := 10;
    i int := 0;
    j int := 0;
    a number(2) := 10;
BEGIN
    dbms_output.put_line('Basic loops...............');
    --Basic loop
    LOOP
        dbms_output.put_line('Itration ' || i || ' nuber is ' || x);
        i := i + 1;
        x := x + 10;
        if i > 10 then
            exit;
        end if;
    END LOOP;
    
      
    LOOP
        dbms_output.put_line('With when in loop..........');
        dbms_output.put_line('Iteration ' || (j));
        j := j + 1;
        exit when j > 10;
        
    END LOOP;
    
    --while looop
    dbms_output.put_line('The while loop........');
    while j < 20 loop
        dbms_output.put_line('Value of j '|| j);
        j := j + 1;
    end loop;
    
    --for loop
    dbms_output.put_line('For loop.......');
    for j in 20 .. 40 loop
        dbms_output.put_line('Value of j '|| j);
    end loop;
    
    --reverse for loop
    dbms_output.put_line('Reverse for loop.......');
    for j in reverse 41 .. 50 loop
        dbms_output.put_line('Value of j '|| j);
    end loop;
    
    --nested loop
    dbms_output.put_line('nested loop.......');
    i := 2;
    LOOP
        j:= 2;
        LOOP
            exit WHEN ((mod(i, j) = 0) or (j = i));
            j := j +1;
        END LOOP;
        IF (j = i ) THEN
            dbms_output.put_line(i || ' is prime');
        END IF;
        i := i + 1;
        exit WHEN i = 50;
    END LOOP;
    
    dbms_output.put_line('Labling..........');
    << outer_loop >>
    FOR i IN 1..3 LOOP
        << inner_loop >>
        FOR j IN 1..3 LOOP
            dbms_output.put_line('i is: '|| i || ' and j is: ' || j);
        END loop inner_loop;
    END loop outer_loop;
    
    /*
              loop control statement
              exit
              continue
              goto
    */
    dbms_output.put_line('The loop control statement.......');
    dbms_output.put_line('Continue.......');
    WHILE a < 20 LOOP
        dbms_output.put_line ('value of a: ' || a);
        a := a + 1;
        IF a = 15 THEN
            -- skip the loop using the CONTINUE statement
            a := a + 1;
            CONTINUE;
        END IF;
    END LOOP;
    
    <<loopstart>>
 
    dbms_output.put_line('Goto.......');
    WHILE a < 40 LOOP
        dbms_output.put_line ('value of a: ' || a);
        a := a + 1;
        IF a = 35 THEN
            a := a + 1;
            GOTO loopstart;
        END IF;
    END LOOP;
END;
/

