SET SERVEROUTPUT ON;

DECLARE
    -- Variable declarations matching table columns
    v_eid      emp.eid%TYPE := &eid;
    v_basic    emp.basicsal%TYPE;
    v_hra      NUMBER;
    v_da       NUMBER;
    v_medical  NUMBER := 500;
    v_pf       NUMBER;
    v_gross    NUMBER;
BEGIN
    -- Fetch basic salary for the given employee ID
    SELECT basicsal 
    INTO v_basic
    FROM emp
    WHERE eid = v_eid;

    -- Apply financial calculations
    v_hra   := v_basic * 0.20; -- Calculated as 20% since hra column doesn't exist
    v_da    := v_basic * 0.50; -- DA = 50% of basic
    v_pf    := v_basic * 0.10; -- PF = 10% of basic 
    
    -- Formula: gross salary = basic sal + (da + hra + medical) - pf
    v_gross := v_basic + (v_da + v_hra + v_medical) - v_pf;

    -- Display the formatted results
    DBMS_OUTPUT.PUT_LINE('------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Employee ID   : ' || v_eid);
    DBMS_OUTPUT.PUT_LINE('Basic Salary  : ' || v_basic);
    DBMS_OUTPUT.PUT_LINE('DA (50%)      : ' || v_da);
    DBMS_OUTPUT.PUT_LINE('HRA (20%)     : ' || v_hra);
    DBMS_OUTPUT.PUT_LINE('Medical       : ' || v_medical);
    DBMS_OUTPUT.PUT_LINE('PF (10%)      : ' || v_pf);
    DBMS_OUTPUT.PUT_LINE('------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Gross Salary  : ' || v_gross);
    DBMS_OUTPUT.PUT_LINE('------------------------------------');

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: No employee found with ID ' || v_eid);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

