--1
DECLARE
    principal_amt NUMBER;
    rate NUMBER;
    t NUMBER;
    si NUMBER;
    
    BEGIN
        principal_amt := 5700;
        rate := 3;
        t := 8;
        
        si := (principal_amt*rate*t)/100;
        
        DBMS_OUTPUT.PUT_LINE('S.I. : ' || si);
        
    END;
    
    
--2

DECLARE
    ename VARCHAR2(20);
    sal NUMBER(10,0);
    bonus NUMBER(10,2);
   BEGIN
   
    ename := 'Alice';
    sal := 46000;
    
    IF sal > 50000 THEN
        bonus := sal * 0.10;
    ELSE
        bonus := sal * 0.15;
    END IF;
    
    DBMS_OUTPUT.PUT_LINE(ename || ' got ' || bonus);
    
END;

--3
DECLARE 
    V_DEPT DEPARTMENTS%ROWTYPE;
BEGIN
    SELECT * INTO V_DEPT FROM DEPARTMENTS WHERE DEPT_NO=101;
    DBMS_OUTPUT.PUT_LINE('DEPARTMENT NAME: '||V_DEPT.DNAME||'LOCATION : '||V_DEPT.LOC);
END;

--4



DECLARE
-- Define the associative array type
TYPE StudentMarksArray IS TABLE OF NUMBER INDEX BY VARCHAR2(100);

-- Declare a variable of the associative array type
v_student_marks StudentMarksArray;

v_student_name VARCHAR2(100);
v_total_marks NUMBER := 0;
v_student_count NUMBER := 0;
v_average_marks NUMBER;

BEGIN

v_student_marks('Alice') := 85;
v_student_marks('Bob') := 92;
v_student_marks('Charlie') := 78;
v_student_marks('David') := 95;
v_student_marks('Eve') := 88;


DBMS_OUTPUT.PUT_LINE('--- Student Marks ---');
v_student_name := v_student_marks.FIRST; 

WHILE v_student_name IS NOT NULL LOOP
DBMS_OUTPUT.PUT_LINE('Student: ' || v_student_name || ', Marks: ' || v_student_marks(v_student_name));
v_total_marks := v_total_marks + v_student_marks(v_student_name);
v_student_count := v_student_count + 1;
v_student_name := v_student_marks.NEXT(v_student_name); 
END LOOP;

DBMS_OUTPUT.PUT_LINE('---------------------');
DBMS_OUTPUT.PUT_LINE('Total Marks: ' || v_total_marks);

IF v_student_count > 0 THEN
v_average_marks := v_total_marks / v_student_count;
DBMS_OUTPUT.PUT_LINE('Average Marks: ' || ROUND(v_average_marks, 2));
ELSE
DBMS_OUTPUT.PUT_LINE('No students found to calculate average.');
END IF;

END;


--5


DECLARE
TYPE StudentMarksArray IS TABLE OF NUMBER INDEX BY VARCHAR2(100);


v_student_marks StudentMarksArray;

v_student_name VARCHAR2(100);
v_total_marks NUMBER := 0;
v_student_count NUMBER := 0;
v_average_marks NUMBER;

BEGIN

v_student_marks('Alice') := 85;
v_student_marks('Bob') := 92;
v_student_marks('Charlie') := 78;
v_student_marks('David') := 95;
v_student_marks('Eve') := 88;


DBMS_OUTPUT.PUT_LINE('--- Student Marks ---');
v_student_name := v_student_marks.FIRST; -- Get the first key

WHILE v_student_name IS NOT NULL LOOP
DBMS_OUTPUT.PUT_LINE('Student: ' || v_student_name || ', Marks: ' || v_student_marks(v_student_name));
v_total_marks := v_total_marks + v_student_marks(v_student_name);
v_student_count := v_student_count + 1;
v_student_name := v_student_marks.NEXT(v_student_name); -- Get the next key
END LOOP;



DBMS_OUTPUT.PUT_LINE('Total Marks: ' || v_total_marks);

IF v_student_count > 0 THEN
v_average_marks := v_total_marks / v_student_count;
DBMS_OUTPUT.PUT_LINE('Average Marks: ' || ROUND(v_average_marks, 2));
ELSE
DBMS_OUTPUT.PUT_LINE('No students found to calculate average.');
END IF;

END;


--5

DECLARE
TYPE country_capital_table IS TABLE OF VARCHAR2(50) INDEX BY VARCHAR2(50);
country_capital country_capital_table;
v_country VARCHAR2(50);
BEGIN
country_capital('INDIA'):='NEW DELHI';
country_capital('USA'):='WASHINGTON';
country_capital('FRANCE'):='PARIS';
country_capital('AUSTRALIA'):='CANBERRA';
country_capital('GERMANY'):='BERLIN';

v_country:='&enter_country_name';
IF country_capital.EXISTS(v_country) THEN
DBMS_OUTPUT.PUT_LINE('THE CAPITAL OF'||v_country||' is '||country_capital(v_country));
ELSE
DBMS_OUTPUT.PUT_LINE('COUNTRY NOT IN LIST');
END IF;
END;




    
