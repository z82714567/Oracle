/*
  ��¥ : 2023/10/02
  �̸� : �����
  ���� : 1�� �����ͺ��̽��� DBMS ����
*/

//�ǽ��ϱ� 1-1. �����ͺ��̽� ����(����� ����)

//�ǽ��ϱ� 1-2. NUMBER �ڷ��� �ǽ�
    CREATE TABLE TYPE_TEST_NUMBER(
    num1 NUMBER,
    num2 NUMBER(2),
    num3 NUMBER(3,1),
    num4 NUMBER(4,2),
    num5 NUMBER(5,6)
    );
    
    //num1 NUMBER
    insert into TYPE_TEST_NUMBER (num1) values (1);
    insert into TYPE_TEST_NUMBER (num1) values (123);
    insert into TYPE_TEST_NUMBER (num1) values (123.74);
    insert into TYPE_TEST_NUMBER (num1) values (123.12345);
    
    //num2 NUMBER(2)
    insert into TYPE_TEST_NUMBER (num2) values (12);
    insert into TYPE_TEST_NUMBER (num2) values (123); //2�ڸ��ʰ�
    insert into TYPE_TEST_NUMBER (num2) values (1.2);
    insert into TYPE_TEST_NUMBER (num2) values (1.23);
    insert into TYPE_TEST_NUMBER (num2) values (12.34567);
    insert into TYPE_TEST_NUMBER (num2) values (12.56789);
    insert into TYPE_TEST_NUMBER (num2) values (123.56789); //2�ڸ��ʰ�
    
    //num3 NUMBER(3,1) 
    insert into TYPE_TEST_NUMBER (num3) values (12);
    insert into TYPE_TEST_NUMBER (num3) values (123); //�Ҽ��ڸ� ���
    insert into TYPE_TEST_NUMBER (num3) values (12.1);
    insert into TYPE_TEST_NUMBER (num3) values (12.1234);
    insert into TYPE_TEST_NUMBER (num3) values (12.56789);
    insert into TYPE_TEST_NUMBER (num3) values (123.56789); //����3�ڸ�, �Ǽ�1�ڸ� �ʰ� -> 4�ڸ�
    
//�ǽ��ϱ� 1-3. ������ �ǽ�
    CREATE TABLE TYPE_TEST_CHAR (
    char1 CHAR(1),
    char2 CHAR(2),
    char3 CHAR(3),
    vchar1 VARCHAR2(1),
    vchar2 VARCHAR2(2),
    vchar3 VARCHAR2(3),
    nvchar1 NVARCHAR2(1),
    nvchar2 NVARCHAR2(2),
    nvchar3 NVARCHAR2(3)
    );
    
    //CHAR
    insert into TYPE_TEST_CHAR (char1) VALUES ('A');
    insert into TYPE_TEST_CHAR (char1) VALUES ('��');
    insert into TYPE_TEST_CHAR (char2) VALUES ('AB');
    insert into TYPE_TEST_CHAR (char2) VALUES ('ABC');
    insert into TYPE_TEST_CHAR (char2) VALUES ('��');
    insert into TYPE_TEST_CHAR (char3) VALUES ('��');
    
    //VARCHAR2
    insert into TYPE_TEST_CHAR (vchar1) VALUES ('A');
    insert into TYPE_TEST_CHAR (vchar2) VALUES ('AB');
    insert into TYPE_TEST_CHAR (vchar3) VALUES ('��');
    
    //NVARCHAR2
    insert into TYPE_TEST_CHAR (nvchar1) VALUES ('A');
    insert into TYPE_TEST_CHAR (nvchar2) VALUES ('AB');
    insert into TYPE_TEST_CHAR (nvchar3) VALUES ('������');