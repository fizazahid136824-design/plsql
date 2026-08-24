BEGIN
FOR r IN
(SELECT * FROM emp WHERE gender='Male' And deptname='HR')
LOOP
DBMS_OUTPUT.PUT_LINE(
r.eid||''||
r.ename||''||
r.basicsal);
END LOOP;
END;
/
