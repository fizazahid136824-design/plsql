DECLARE 
    -- Anchored datatype initialized by ROLLNO
    RNO result.ROLL_NO%TYPE := &RNO; 
    T NUMBER; 
    P NUMBER; 
    G VARCHAR2(5); 
BEGIN 
    -- Logic to calculate total marks
    SELECT (SUB1 + SUB2 + SUB3 + SUB4 + SUB5) 
    INTO T 
    FROM RESULT 
    WHERE ROLL_NO = RNO; 
    
    -- Calculate percentage
    P := T / 5; 
    
    -- Grade logic using declared variable P and G
    IF P >= 90 THEN 
        G := 'A'; 
    ELSIF P >= 80 THEN 
        G := 'B'; 
    ELSIF P >= 70 THEN 
        G := 'C'; 
    ELSIF P >= 60 THEN 
        G := 'D'; 
    ELSE 
        G := 'F'; 
    END IF; 
    
    -- Update the table with calculated values
    UPDATE RESULT 
    SET TOTAL = T, PERCENTAGE = P, GRADE = G 
    WHERE ROLL_NO = RNO; 
    
    -- Display the output
    DBMS_OUTPUT.PUT_LINE('TOTAL = ' || T); 
    DBMS_OUTPUT.PUT_LINE('PERCENTAGE = ' || P); 
    DBMS_OUTPUT.PUT_LINE('GRADE = ' || G); 
END; 
/
