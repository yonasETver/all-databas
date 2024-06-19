--Strings in plsql

/*
    CHAR, NCHAR, VARCHAR2, NVARCHAR2, CLOB, and NCLOB
*/

SET SERVEROUTPUT ON;

DECLARE
    greetings VARCHAR2(11); 
    greetings2 VARCHAR2(50);

BEGIN 
    greetings := 'hello world';
    dbms_output.put_line(upper(greetings));
    dbms_output.put_line(NLS_upper(greetings));
    dbms_output.put_line(LOWER(greetings));
    dbms_output.put_line(NLS_LOWER(greetings));
    dbms_output.put_line(INITCAP(greetings)); -- Cappital each word first letter
    dbms_output.put_line(NLS_INITCAP(greetings)); -- Cappital each word first letter
    
    dbms_output.put_line(SUBSTR(greetings,1,1)); --retrive the first letter
    dbms_output.put_line(SUBSTR(greetings,-1,1)); --retrive the last letter 
    dbms_output.put_line(SUBSTR(greetings,7,4)); --retrive 4 character starting from th 7 letter
    dbms_output.put_line(SUBSTR(greetings,2)); --retrive all letter staring from the second
    
    dbms_output.put_line(instr(greetings,'e')); --retrive the location of the first e letter
    dbms_output.put_line(instrB(greetings,'e'));

    greetings2 := '.......hello world.......';
    dbms_output.put_line(RTRIM(greetings2,'.')); --remove all . at the right
    dbms_output.put_line(LTRIM(greetings2,'.')); --remove all . at the left side
    dbms_output.put_line(TRIM('.' from greetings2)); --remove all . at both side
    
    dbms_output.put_line(LENGTH(greetings2)); -- RETURN THE LENGTH OF THE CHARACTER
    dbms_output.put_line(LENGTHB(greetings2)); -- RETURN THE LENGTH OF THE CHARACTER
    
    dbms_output.put_line(ASCII('A'));
    dbms_output.put_line(CHR(65));
    dbms_output.put_line(CONCAT(greetings,greetings2));
    
    dbms_output.put_line(LPAD(greetings,4,'*')); --pad to the lefft until it reach to specified number of width
    dbms_output.put_line(RPAD(greetings,4,'-')); 
    
    dbms_output.put_line(nlssort(greetings));
    dbms_output.put_line(SOUNDEX(greetings));
    
    
END;
/