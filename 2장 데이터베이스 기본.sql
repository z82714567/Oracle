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

    