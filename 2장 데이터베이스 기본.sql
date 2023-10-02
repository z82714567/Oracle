/*
    날짜 : 2023/10/02 
    이름 : 노수현
    내용 : 데이터베이스 기본
*/

//실습1-1. 테이블 생성
    CREATE TABLE USER1 (
    ID VARCHAR2(20),
    NAME VARCHAR2(20),
    HP CHAR(13),
    AGE NUMBER
    );
    
//실습1-2. 데이터 추가
    INSERT INTO USER1 VALUES ('A101', '김유신', '010-1234-1111', 25);
    INSERT INTO USER1 VALUES ('A102', '김춘추', '010-1234-2222', 23);
    INSERT INTO USER1 VALUES ('A103', '장보고', '010-1234-3333', 32);
    INSERT INTO USER1 (id, name, age) VALUES ('A104', '강감찬', 45);
    INSERT INTO USER1 (id, name, hp) VALUES ('A105', '이순신', '010-1234-5555');
    
//실습1-3. 데이터 조회
    SELECT * FROM USER1;
    SELECT * FROM USER1 WHERE id='A101';
    SELECT * FROM USER1 WHERE name='김춘추';
    SELECT * FROM USER1 WHERE age > 30;
    SELECT id, name, age FROM USER1;
    
//실습1-4. 데이터 수정
    UPDATE USER1 SET hp='010-1234-4444' WHERE id='A104';
    UPDATE USER1 SET age=51 WHERE id='A105';
    UPDATE USER1 SET hp='010-1234-1001', age=27 WHERE id='A101';

//실습1-5. 데이터 삭제
    DELETE FROM USER1 WHERE id='A101';
    DELETE FROM USER1 WHERE id='A102' AND age=25;
    DELETE FROM USER1 WHERE age >= 30;

    