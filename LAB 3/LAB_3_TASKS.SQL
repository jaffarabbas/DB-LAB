--STEP 1
CREATE TABLE FACULTY (FACULTY_ID NUMBER(6), LAST_NAME VARCHAR2(15) NOT NULL,FIRST_NAME VARCHAR2(15)NOT NULL, DEPT CHAR(3), CONSTRAINTS FACULTY_PK PRIMARY KEY(FACULTY_ID));
--STEP 2
CREATE TABLE DEPARTMENT (DEPT_CODE CHAR(3), DEPT_NAME VARCHAR2(20) NOT NULL, CONSTRAINTS DEPT_PK PRIMARY KEY (DEPT_CODE)); 

-- STEP 3
ALTER TABLE DEPARTMENT ADD LOCATION CHAR(7);

--STEP 4
ALTER TABLE FACULTY ADD CONSTRAINT FACULTY_DEPT_FK FOREIGN KEY(DEPT) REFERENCES DEPARTMENT(DEPT_CODE);

--STEP 5
ALTER TABLE FACULTY MODIFY LAST_NAME VARCHAR2(25);


--SCENARIO TWO
-- CREATING BOOK
CREATE TABLE BOOK (BOOKID NUMBER(11), TITLE VARCHAR2(30) NOT NULL, PUBLISHER_NAME VARCHAR2(30) NOT NULL, CONSTRAINTS BOOKID_PK PRIMARY KEY(BOOKID));

--CREATING BOOK_AUTHORS
CREATE TABLE BOOK_AUTHORS (BOOKID NUMBER(11), AUTHOR_NAME VARCHAR2(30) NOT NULL, CONSTRAINTS BOOK_AUTHOR_PK PRIMARY KEY(BOOKID,AUTHOR_NAME));

--CREATING TABLE PUBLISHER
CREATE TABLE PUBLISHER (PNAME VARCHAR2(30) NOT NULL, ADDRESS VARCHAR2(30), PHONE NUMBER(11), CONSTRAINTS PNAME_PK PRIMARY KEY(PNAME));

--CREATING TABLE BOOK_COPIES
CREATE  TABLE  BOOK_COPIES (BOOKID NUMBER(11), BRANCH_ID NUMBER(11) NOT NULL, NO_OF_COPIES NUMBER(11) NOT NULL , CONSTRAINTS BOOK_BRANCH_PK PRIMARY KEY(BOOKID, BRANCH_ID));

--CREATING TABLE BOOK_LOANS
CREATE TABLE BOOK_LOANS (BOOKID NUMBER(11),BRANCH_ID NUMBER(11) NOT NULL, CARD_NO NUMBER(11) NOT NULL, DATE_OUT DATE, DUE_DATE DATE, CONSTRAINTS BOOK_BRANCH_CARD_PK PRIMARY KEY(BOOKID, BRANCH_ID, CARD_NO));

--CREATING LIBRARY_BRANCH 
CREATE TABLE LIBRARY_BRANCH (BRANCH_ID NUMBER(11) NOT NULL, BRANCH_NAME VARCHAR2(30), ADDRESS VARCHAR2(30), CONSTRAINTS BRANCHID_PK PRIMARY KEY(BRANCH_ID));

--CREATING BORROWER
CREATE TABLE BORROWER (CARD_NO NUMBER(11) NOT NULL, BNAME VARCHAR2(30) NOT NULL, ADDRESS VARCHAR2(30) NOT NULL, PHONE NUMBER(11) NOT NULL, CONSTRAINTS CARD_NO_PK PRIMARY KEY(CARD_NO));

--FOREIGN KEY BOOK_AUTHORS TO BOOK
ALTER TABLE BOOK_AUTHORS ADD CONSTRAINT BOOKID_FK FOREIGN KEY(BOOKID) REFERENCES BOOK(BOOKID) INITIALLY DEFERRED DEFERRABLE;

--FOREIGN KEY BOOK_COPIES TO BOOK
ALTER TABLE BOOK_COPIES ADD CONSTRAINT BOOK_COPIES_BOOKID_FK FOREIGN KEY(BOOKID) REFERENCES BOOK(BOOKID) INITIALLY DEFERRED DEFERRABLE;

--FOREIGN KEY BOOK_LOANS TO BOOK
ALTER TABLE BOOK_LOANS ADD CONSTRAINT BOOK_LOANS_BOOKID_FK FOREIGN KEY(BOOKID) REFERENCES BOOK(BOOKID) INITIALLY DEFERRED DEFERRABLE;

--FOREIGN KEY BOOK TO PUBLISHER
ALTER TABLE BOOK ADD CONSTRAINT PUBLISHER_NAME_FK FOREIGN KEY(PUBLISHER_NAME) REFERENCES PUBLISHER(PNAME) INITIALLY DEFERRED DEFERRABLE;

--FOREIGN KEY BOOK_LOANS TO BORROWER
ALTER TABLE BOOK_LOANS ADD CONSTRAINT CARD_NO_FK FOREIGN KEY(CARD_NO) REFERENCES BORROWER(CARD_NO)INITIALLY DEFERRED DEFERRABLE;

--FOREIGN KEY BOOK_LOANS TO LIBRARY_BRANCH
ALTER TABLE BOOK_LOANS ADD CONSTRAINT LIBRARY_BRANCH_ID_FK FOREIGN KEY(BRANCH_ID) REFERENCES LIBRARY_BRANCH(BRANCH_ID)INITIALLY DEFERRED DEFERRABLE;

--FOREIGN KEY BOOK_COPIES TO LIBRARY_BRANCH
ALTER TABLE BOOK_COPIES ADD CONSTRAINT BOOK_COPIES_BRANCH_ID_FK FOREIGN KEY(BRANCH_ID) REFERENCES LIBRARY_BRANCH(BRANCH_ID) INITIALLY DEFERRED DEFERRABLE;

--COMMIT
COMMIT
