/*
    ��¥ : 2023/10/02 
    �̸� : �����
    ���� : �����ͺ��̽� �⺻
*/

//�ǽ�1-1. ���̺� ����
    CREATE TABLE USER1 (
    ID VARCHAR2(20),
    NAME VARCHAR2(20),
    HP CHAR(13),
    AGE NUMBER
    );
    
//�ǽ�1-2. ������ �߰�
    INSERT INTO USER1 VALUES ('A101', '������', '010-1234-1111', 25);
    INSERT INTO USER1 VALUES ('A102', '������', '010-1234-2222', 23);
    INSERT INTO USER1 VALUES ('A103', '�庸��', '010-1234-3333', 32);
    INSERT INTO USER1 (id, name, age) VALUES ('A104', '������', 45);
    INSERT INTO USER1 (id, name, hp) VALUES ('A105', '�̼���', '010-1234-5555');
    
//�ǽ�1-3. ������ ��ȸ
    SELECT * FROM USER1;
    SELECT * FROM USER1 WHERE id='A101';
    SELECT * FROM USER1 WHERE name='������';
    SELECT * FROM USER1 WHERE age > 30;
    SELECT id, name, age FROM USER1;
    
//�ǽ�1-4. ������ ����
    UPDATE USER1 SET hp='010-1234-4444' WHERE id='A104';
    UPDATE USER1 SET age=51 WHERE id='A105';
    UPDATE USER1 SET hp='010-1234-1001', age=27 WHERE id='A101';

//�ǽ�1-5. ������ ����
    DELETE FROM USER1 WHERE id='A101';
    DELETE FROM USER1 WHERE id='A102' AND age=25;
    DELETE FROM USER1 WHERE age >= 30;

//�ǽ�2-1. �⺻Ű 
     CREATE TABLE USER2 (
        ID VARCHAR2(20) PRIMARY KEY,
        NAME VARCHAR2(20),
        HP CHAR(13),
        AGE NUMBER(2)
        );

//�ǽ�2-1. ������ �߰�
    INSERT INTO USER2 VALUES ('A101', '������', '010-1234-1111', 22);
    INSERT INTO USER2 VALUES ('A102', '������', '010-1234-2222', 23);
    INSERT INTO USER2 VALUES ('A103', '�庸��', '010-1234-3333', 32);
    INSERT INTO USER2 (id, name, age) VALUES ('A104', '������', 45);
    INSERT INTO USER2 (id, name, hp) VALUES ('A105', '�̼���', '010-1234-5555');

//�ǽ�2-2. ����Ű
     CREATE TABLE USER3 (
        ID VARCHAR2(20) PRIMARY KEY,
        NAME VARCHAR2(20),
        HP CHAR(13) UNIQUE,
        AGE NUMBER(3)
        );
        
//�ǽ�2-3. �ܷ�Ű
    CREATE TABLE PARENT(
        PID VARCHAR2(20) PRIMARY KEY,
        NAME VARCHAR2(20),
        HP CHAR(13) UNIQUE
    );
    CREATE TABLE CHILD(
        CID VARCHAR2(20) PRIMARY KEY,
        NAME VARCHAR2(20),
        HP CHAR(13) UNIQUE,
        PARENT VARCHAR2(20),
        FOREIGN KEY (PARENT) REFERENCES PARENT (PID)
    );
    INSERT INTO PARENT VALUES ('P101', '�輭��', '010-1234-1001');
    INSERT INTO PARENT VALUES ('P102', '�̼���', '010-1234-1002');
    INSERT INTO PARENT VALUES ('P103', '�Ż��Ӵ�', '010-1234-1003');
    
    INSERT INTO CHILD VALUES ('C101', '������', '010-1234-2001', 'P101');
    INSERT INTO CHILD VALUES ('C102', '�̹��', '010-1234-2002', 'P102');
    INSERT INTO CHILD VALUES ('C103', '�̹��', '010-1234-2003', 'P102');
    INSERT INTO CHILD VALUES ('C104', '����', '010-1234-2004', 'P103');
    
//�ǽ�2-4. DEFAULT�� NOT NULL
    CREATE TABLE USER4 (
        NAME VARCHAR2(20) NOT NULL,
        GENDER CHAR(1) NOT NULL,
        AGE INT DEFAULT 1,
        ADDR VARCHAR2(255)
        );
    INSERT INTO USER4 VALUES ('������', 'M', 23, '���ؽ�');
    INSERT INTO USER4 VALUES ('������', 'M', 21, '���ֽ�');
    INSERT INTO USER4 (NAME, GENDER, ADDR) VALUES ('�Ż��Ӵ�', 'F', '������');
    INSERT INTO USER4 (NAME, GENDER) VALUES ('�̼���', 'M');
    INSERT INTO USER4 (NAME, GENDER, AGE) VALUES ('�����', 'M', 33);
    
//�ǽ�2-5. CHECK(�÷��� ������ �� �ִ� ���� ���� �Ǵ� ���ָ� ����)
     CREATE TABLE USER5 (
        NAME VARCHAR2(20) NOT NULL,
        GENDER CHAR(1) NOT NULL CHECK(GENDER IN('M', 'F')),
        AGE INT DEFAULT 1 CHECK(AGE > 0 AND AGE < 100),
        ADDR VARCHAR2(255)
        );
        
    INSERT INTO USER5 VALUES ('������', 'S', 111, '���ؽ�');
    INSERT INTO USER5 VALUES ('������', 'M', 21, '���ֽ�');
    INSERT INTO USER5 (NAME, GENDER, ADDR) VALUES ('�Ż��Ӵ�', 'F', '������');
    INSERT INTO USER5 (NAME, GENDER) VALUES ('�̼���', 'M');
    INSERT INTO USER5 (NAME, GENDER, AGE) VALUES ('�����', 'M', 33);

//�ǽ�3-1. ������ ���� ��ȸ(System ����)
    SELECT * FROM DICT;
    SELECT TABLE_NAME FROM USER_TABLES;
    SELECT OWNER, TABLE_NAME FROM ALL_TABLES;

//�ǽ�3-2. �ε��� ��ȸ/����/����
    -- ���� ����� �ε��� ��ȸ
    SELECT * FROM USER_INDEXES;
    -- ���� ����� �ε��� ���� ��ȸ(�� �� �ڼ���)
    SELECT * FROM USER_IND_COLUMNS;
    -- �ε��� ����, ��ȸ
    CREATE INDEX IDX_USER1_ID ON USER1(ID);
    SELECT * FROM USER_IND_COLUMNS;
    -- �ε��� ����, ��ȸ
    DROP INDEX IDX_USER1_ID;
    SELECT * FROM USER_IND_COLUMNS;

//�ǽ�3-3. �� ���� ���� �Ҵ�(system���� ����)
    GRANT CREATE VIEW TO scott;

//�ǽ�3-4. ��(�������̺�) ����/��ȸ/����
    -- �� ����
    CREATE VIEW VW_USER1 AS (SELECT NAME, HP, AGE FROM USER1);
    CREATE VIEW VW_USER2_AGE_UNDER30 AS (SELECT * FROM USER2 WHERE AGE < 30);
    SELECT * FROM USER_VIEWS;
    -- �� ��ȸ
    SELECT * FROM VW_USER1;
    SELECT * FROM VW_USER2_AGE_UNDER30;
    -- �� ����
    DROP VIEW VW_USER1;
    DROP VIEW VW_USER2_AGE_UNDER30;
    
//�ǽ�3-5. ������ ���� ���̺� ����
    CREATE TABLE USER6 (
    SEQ NUMBER PRIMARY KEY,
    NAME VARCHAR2(20),
    GENDER CHAR(1),
    AGE NUMBER,
    ADDR VARCHAR2(255)
    
//�ǽ�3-6. ������ ����
    CREATE SEQUENCE SEQ_USER6 INCREMENT BY 1 START WITH 1;
    
//�ǽ�3-7. �������� �Է�
    INSERT INTO USER6 VALUES (SEQ_USER6.NEXTVAL, '������', 'M', 25, '���ؽ�');
    INSERT INTO USER6 VALUES (SEQ_USER6.NEXTVAL, '������', 'M', 23, '���ֽ�');
    INSERT INTO USER6 VALUES (SEQ_USER6.NEXTVAL, '�Ż��Ӵ�', 'F', 27, '������');
    
//�ǽ�4-1. ����� ����
    ALTER SESSION SET "_ORACLE_SCRIPT"=true;
    CREATE USER Z82714567 IDENTIFIED BY 1234;

//�ǽ�4-2. ����� ��ȸ
    -- ��ü
    SELECT * FROM ALL_USERS;
    -- Ư��
    SELECT * FROM ALL_USERS WHERE USERNAME='Z82714567';
        
//�ǽ�4-3. ����� ����
    -- ��й�ȣ ����
    ALTER USER Z82714567 IDENTIFIED BY 1234;
    -- ����� ����
    DROP USER Z82714567;
    -- ���̺� �� ��ü ��� ����
    DROP USER Z82714567 CASCADE;
//�ǽ�4-4. ���� �ο�
    GRANT CONNECT, RESOURCE TO z82714567;
    GRANT UNLIMITED TABLESPACE TO z82714567;