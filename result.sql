--!  CREATE TABLE result (
    roll_no NUMBER PRIMARY KEY,
    name VARCHAR2(50) NOT NULL,
    sub1 NUMBER(3) CHECK (sub1 BETWEEN 0 AND 100),
    sub2 NUMBER(3) CHECK (sub2 BETWEEN 0 AND 100),
    sub3 NUMBER(3) CHECK (sub3 BETWEEN 0 AND 100),
    sub4 NUMBER(3) CHECK (sub4 BETWEEN 0 AND 100),
    sub5 NUMBER(3) CHECK (sub5 BETWEEN 0 AND 100),
    total NUMBER(3),
    percentage NUMBER(5,2),
    grade VARCHAR2(2)
  );--
