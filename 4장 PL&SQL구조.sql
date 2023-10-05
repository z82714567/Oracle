/*
    ��¥ : 2023/10/05 
    �̸� : �����
    ���� : PL/SQL �ǽ�
*/

//�ǽ�1-1. HELLO, ORACLE ���
SET SERVEROUTPUT ON; //�ֿܼ� ������ ���
BEGIN
    dbms_output.put_line('Hello Oracle!');
END;

//�ǽ�1-2. �ּ� ó��(--)
DECLARE
    NO NUMBER(4) := 1001;
    NAME VARCHAR2(10) := 'ȫ�浿';
    HP CHAR(13) := '010-1001-1001';
    ADDR VARCHAR2(100) := '�λ걤����';
BEGIN
    --dbms_output.put_line('��ȣ : ' || NO);
    dbms_output.put_line('�̸� : ' || NAME);
    dbms_output.put_line('��ȭ : ' || HP);
    dbms_output.put_line('�ּ� : ' || ADDR);
END;

//�ǽ�2-1. ���� ���� �� ������ ���
DECLARE
    NO CONSTANT NUMBER(4) := 1001;
    NAME VARCHAR2(10);
    HP CHAR(13) := '000-0000-0000';
    AGE NUMBER(2) DEFAULT 1;
    ADDR VARCHAR2(10) NOT NULL := '�λ�';
BEGIN
    NAME := '������';
    HP := '010-1000-1001';
    AGE := 22;
    dbms_output.put_line('��ȣ : ' || NO);
    dbms_output.put_line('�̸� : ' || NAME);
    dbms_output.put_line('��ȭ : ' || HP);
    dbms_output.put_line('���� : ' || AGE);
    dbms_output.put_line('�ּ� : ' || ADDR);
END;

//�ǽ�2-2. �� ������ ���� �ǽ�
DECLARE
     NO DEPT.DEPTNO%TYPE;
     NAME DEPT.DNAME%TYPE;
     ADDR DEPT.LOC%TYPE;
BEGIN
     SELECT * 
     INTO NO, NAME, ADDR 
     FROM DEPT 
     WHERE DEPTNO = 30;
     DBMS_OUTPUT.PUT_LINE('�μ���ȣ : ' || NO);
     DBMS_OUTPUT.PUT_LINE('�μ��� : ' || NAME);
     DBMS_OUTPUT.PUT_LINE('�ּ� : ' || ADDR);
END;

//�ǽ�2-3. �� ������ ���� �ǽ�
DECLARE
    -- ����
    ROW_DEPT DEPT%ROWTYPE;
BEGIN
    -- ó��
    SELECT *
    INTO ROW_DEPT
    FROM DEPT
    WHERE DEPTNO = 40;
    
    -- ���
    dbms_output.put_line('�μ���ȣ : ' || ROW_DEPT.DEPTNO);
    dbms_output.put_line('�μ��� : ' || ROW_DEPT.DNAME);
    dbms_output.put_line('�ּ� : ' || ROW_DEPT.LOC);
END;

//�ǽ�2-4. ���ڵ� �ڷ��� �⺻ �ǽ�
DECLARE
    -- ���ڵ� ����
    TYPE REC_DEPT IS RECORD(
        deptno NUMBER(2),
        dname DEPT.DNAME%TYPE,
        loc DEPT.LOC%TYPE
    );
    -- ���ڵ� ����
    dept_rec REC_DEPT;
BEGIN
    -- ���ڵ� �ʱ�ȭ
    dept_rec.deptno := 10;
    dept_rec.dname := '���ߺ�';
    dept_rec.loc := '�λ�';
    
    -- ���
    dbms_output.put_line('deptno : ' || dept_rec.deptno);
    dbms_output.put_line('dname : ' || dept_rec.dname);
    dbms_output.put_line('loc : ' || dept_rec.loc);
    dbms_output.put_line('PL/SQL����...');
END;

//�ǽ�2-5. ���ڵ� ����� INSERT �ǽ�
--���̺� ����(������ ����)
CREATE TABLE DEPT_RECORD AS SELECT * FROM DEPT WHERE 1 = 0;
DECLARE
    -- ���ڵ� ����
    TYPE REC_DEPT IS RECORD(
        deptno NUMBER(2),
        dname DEPT.DNAME%TYPE,
        loc DEPT.LOC%TYPE
    );
    -- ���ڵ� ����
    dept_rec REC_DEPT;
BEGIN
    -- ���ڵ� �ʱ�ȭ
    dept_rec.deptno := 10;
    dept_rec.dname := '���ߺ�';
    dept_rec.loc := '�λ�';
    
    INSERT INTO DEPT_RECORD VALUES dept_rec;
    
    -- ���
    dbms_output.put_line('PL/SQL����...');
END;

//�ǽ�2-6. ���ڵ� ������ ���ڵ� �ǽ�
DECLARE
    -- ���ڵ� ����
    TYPE REC_DEPT IS RECORD(
        deptno DEPT.DEPTNO%TYPE,
        dname DEPT.DNAME%TYPE,
        loc DEPT.LOC%TYPE
    );
    -- ���ڵ� ����
    TYPE REC_EMP IS RECORD(
        empno EMP.EMPNO%TYPE,
        ename EMP.ENAME%TYPE,
        dinfo REC_DEPT
        );
    -- ���ڵ� ����
    emp_rec REC_EMP;
BEGIN
    -- ���ڵ� �ʱ�ȭ
    SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME, D.LOC
    INTO
        emp_rec.empno,
        emp_rec.ename,
        emp_rec.dinfo.deptno,
        emp_rec.dinfo.dname,
        emp_rec.dinfo.loc
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND E.EMPNO = 7788;
    
    -- ���
    dbms_output.put_line('EMPNO : ' || emp_rec.empno);
    dbms_output.put_line('ENAME : ' || emp_rec.ename);
    dbms_output.put_line('DEPTNO : ' || emp_rec.dinfo.deptno);
    dbms_output.put_line('DNAME : ' || emp_rec.dinfo.dname);
    dbms_output.put_line('LOC : ' || emp_rec.dinfo.loc);
    dbms_output.put_line('PL/SQL ����...');
END;

//�ǽ�2-7. ���̺�(�����迭) �⺻ �ǽ�
DECLARE
    TYPE ARR_CITY IS TABLE OF VARCHAR2(20) INDEX BY PLS_INTEGER;
    arrCity ARR_CITY;
BEGIN
    arrCity(1) := '����';
    arrCity(2) := '����';
    arrCity(3) := '�뱸';
    
    dbms_output.put_line('arrCity(1) : ' || arrCity(1));
    dbms_output.put_line('arrCity(2) : ' || arrCity(2));
    dbms_output.put_line('arrCity(3) : ' || arrCity(3));
    dbms_output.put_line('PL/SQL ����...');
END;

//�ǽ�3-1. IF�� �ǽ�
DECLARE
    NUM NUMBER := 1;
BEGIN
    IF NUM > 0 THEN
    dbms_output.put_line('NUM�� 0���� ũ��.');
    END IF;
    dbms_output.put_line('PL/SQL ����...');
END;

//�ǽ�3-2. IF~ELSE �ǽ�
DECLARE
    NUM NUMBER := -1;
BEGIN
    IF NUM > 0 THEN
    dbms_output.put_line('NUM�� 0���� ũ��.');
    ELSE
    dbms_output.put_line('NUM�� 0���� �۴�.');
    END IF;
    dbms_output.put_line('PL/SQL ����...');
END;

//�ǽ�3-3. IF~ELSIF` �ǽ�
DECLARE
    SCORE NUMBER := 86;
BEGIN
    IF SCORE >= 90 AND SCORE <= 100 THEN
    dbms_output.put_line('A�Դϴ�.');
    ELSIF SCORE >= 80 AND SCORE < 90 THEN
    dbms_output.put_line('B�Դϴ�.');
    ELSIF SCORE >= 70 AND SCORE < 80 THEN
    dbms_output.put_line('C�Դϴ�.');
    ELSIF SCORE >= 60 AND SCORE < 70 THEN
    dbms_output.put_line('D�Դϴ�.');
    ELSE
    dbms_output.put_line('F�Դϴ�.');
    END IF;
    dbms_output.put_line('PL/SQL ����...');
END;

//�ǽ�3-4. CASE �ǽ�
DECLARE
    SCORE NUMBER := 86;
BEGIN
    CASE FLOOR(SCORE/10)
    WHEN 9 THEN dbms_output.put_line('A�Դϴ�.');
    WHEN 8 THEN dbms_output.put_line('B�Դϴ�.');
    WHEN 7 THEN dbms_output.put_line('C�Դϴ�.');
    WHEN 6 THEN dbms_output.put_line('D�Դϴ�.');
    ELSE dbms_output.put_line('F�Դϴ�.');
    END CASE;
    dbms_output.put_line('PL/SQL ����...');
END;

//�ǽ�3-5. �⺻ LOOP �ǽ�
DECLARE
    NUM NUMBER := 0;
BEGIN
    LOOP
        dbms_output.put_line('NUM : ' || NUM);
        NUM := NUM + 1;
        
        IF NUM > 3 THEN
        EXIT;
        END IF;
    END LOOP;
    dbms_output.put_line('PL/SQL ����...');
END;

//�ǽ�3-6. �⺻ FOR �ǽ�
BEGIN
    FOR i IN 1..3 LOOP
        dbms_output.put_line('i : ' || i);
    END LOOP;
    dbms_output.put_line('PL/SQL ����...');
END;

//�ǽ�3-7. �⺻ WHILE �ǽ�
DECLARE
    NUM NUMBER := 0;
BEGIN
    WHILE NUM < 4 LOOP
        dbms_output.put_line('NUM : ' || NUM);
        NUM := NUM + 1;
    END LOOP;
    dbms_output.put_line('PL/SQL ����...');
END;

//�ǽ�3-8. CONTINUE �ǽ�
DECLARE
    NUM NUMBER := 0;
BEGIN
    WHILE NUM < 5 LOOP
        NUM := NUM + 1;
        
        -- MOD(): �������� ���ϴ� SQL�Լ�
        IF MOD(NUM, 2) = 0 THEN
            CONTINUE;
        END IF;
        dbms_output.put_line('NUM : ' || NUM);
        
    END LOOP;
    dbms_output.put_line('PL/SQL ����...');
END;

//�ǽ�3-9. CONTINUE-WHEN �ǽ�
BEGIN
    FOR i IN 1..5 LOOP
        CONTINUE WHEN MOD(i, 2) = 0;
        dbms_output.put_line('i : ' || i);
    END LOOP;
    dbms_output.put_line('PL/SQL ����...');
END;

//�ǽ�4-1. ���� �� ����� ó���ϴ� Ŀ�� ���
DECLARE
    -- Ŀ�� �����͸� ������ ���� ����
    V_DEPT_ROW DEPT%ROWTYPE;
    
    -- Ŀ�� ����
    CURSOR c1 IS SELECT * FROM DEPT WHERE DEPTNO = 40;
BEGIN
    -- Ŀ�� ����
    OPEN c1;
    
    -- Ŀ�� ������ �Է�
    FETCH c1 INTO V_DEPT_ROW;
    
    -- Ŀ�� ������ ���
    dbms_output.put_line('DEPTNO : ' || V_DEPT_ROW.DEPTNO);
    dbms_output.put_line('DNAME : ' || V_DEPT_ROW.DNAME);
    dbms_output.put_line('LOC : ' || V_DEPT_ROW.LOC);
    -- Ŀ�� ����
    CLOSE c1;
END;

//�ǽ�4-2. ���� �� ����� ó���ϴ� Ŀ�� ���(LOOP)
DECLARE
    -- Ŀ�� �����͸� ������ ���� ����
    V_DEPT_ROW DEPT%ROWTYPE;
    
    -- Ŀ�� ����
    CURSOR c1 IS SELECT * FROM DEPT;
BEGIN
    -- Ŀ�� ����
    OPEN c1;
    
    LOOP
    -- Ŀ�� ������ �Է�
    FETCH c1 INTO V_DEPT_ROW;
    EXIT WHEN c1%NOTFOUND;
    
    -- Ŀ�� ������ ���
    dbms_output.put_line('------------------------------');
    dbms_output.put_line('DEPTNO : ' || V_DEPT_ROW.DEPTNO);
    dbms_output.put_line('DNAME : ' || V_DEPT_ROW.DNAME);
    dbms_output.put_line('LOC : ' || V_DEPT_ROW.LOC);
    
    END LOOP;
    -- Ŀ�� ����
    CLOSE c1;
END;

//�ǽ�4-3. ���� �� ����� ó���ϴ� Ŀ�� ���(FOR)
DECLARE 
    CURSOR c1 IS SELECT * FROM DEPT;
BEGIN 
     FOR c1_rec IN c1 LOOP
         DBMS_OUTPUT.PUT_LINE('------------------------------');
         DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || c1_rec.DEPTNO);
         DBMS_OUTPUT.PUT_LINE('DNAME : ' || c1_rec.DNAME);
         DBMS_OUTPUT.PUT_LINE('LOC : ' || c1_rec.LOC);
     END LOOP;
END;

//�ǽ�4-4. �⺻ ����ó�� �ǽ�
DECLARE 
    v_wrong NUMBER;
BEGIN 
    SELECT DNAME INTO v_wrong FROM DEPT WHERE DEPTNO = 10;
EXCEPTION
    WHEN VALUE_ERROR THEN
         DBMS_OUTPUT.PUT_LINE('VALUE_ERROR(��ġ �Ǵ� ��) �����߻�...');
END;

//�ǽ�4-5. ����ó�� �ڵ�/�޽��� �ǽ�
DECLARE 
    deptno DEPT.DEPTNO%TYPE;
    dname DEPT.DNAME%TYPE;
BEGIN 
    SELECT DEPTNO, DNAME INTO deptno, dname FROM DEPT;
    DBMS_OUTPUT.PUT_LINE('deptno : ' || deptno);
    DBMS_OUTPUT.PUT_LINE('dname : ' || dname);
EXCEPTION
    WHEN OTHERS THEN
         DBMS_OUTPUT.PUT_LINE('���� �߻�...');
         DBMS_OUTPUT.PUT_LINE('�����ڵ� : ' || SQLCODE);
         DBMS_OUTPUT.PUT_LINE('�������� : ' || SQLERRM);
END;