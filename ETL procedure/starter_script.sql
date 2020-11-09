-------------------------------------------
-- drop tables and sequences
-------------------------------------------
--drop tables

drop table Prospective_User;
drop table curr_user_table;



----Drop sequences
DROP SEQUENCE curr_user_table_id_seq;
DROP SEQUENCE prospective_id_seq;
 

-------------------------------------------
-- CREATE sequences 
-------------------------------------------
-- create curr_user_table_id sequence
CREATE SEQUENCE curr_user_table_id_seq
START WITH 1 INCREMENT BY 1;
 
-- create curr_user_table_id sequence
CREATE SEQUENCE prospective_id_seq
START WITH 1 INCREMENT BY 1;

-------------------------------------------
-- CREATE tables 
-------------------------------------------
CREATE TABLE curr_user_table
(
    user_id         NUMBER    default curr_user_table_id_seq.NEXTVAL    PRIMARY KEY,
    first_name      VARCHAR(50)     NOT NULL,
    middle_name     VARCHAR(50),
    last_name       VARCHAR(50)     NOT NULL,
    email           VARCHAR(50)     UNIQUE      NOT NULL,
    systemdate      DATE            DEFAULT SYSDATE,
    birthdate       DATE            NOT NULL,
    CC_flag         VARCHAR(1)      default 'N' NOT NULL,
    CONSTRAINT  age_atleast13_check    CHECK ((systemdate - birthdate)/365 > 13),
    CONSTRAINT  email_length7_check  CHECK (LENGTH(email) >= 7)
    );

-----------create table Prospective_Users
CREATE TABLE Prospective_User (
    Prospective_ID      NUMBER          default prospective_id_seq.NEXTVAL      PRIMARY KEY,
    PC_First_Name       VARCHAR(40)     NOT NULL,
    PC_Last_Name        VARCHAR(50)     NOT NULL,
    Email               VARCHAR(50)     UNIQUE      NOT NULL,
    Phone               CHAR(10)        NOT NULL,
    zip_code            CHAR(5)         NOT NULL
);

-------------------------------------------------------------
-- SEED DATA
-------------------------------------------------------------
 
SET DEFINE OFF
 


--INSERT curr_user_tables;
-- insert users
INSERT INTO curr_user_table (first_name, middle_name, last_name, email, birthdate, CC_flag)
VALUES ('Clint','John','Tuttle','tuttle@mail.com','04-AUG-85','Y');

INSERT INTO curr_user_table (first_name, middle_name, last_name, email, birthdate, CC_flag)
VALUES ('Tricia','Lynn','Moravec','tricia@mail.com','24-AUG-89','Y');

INSERT INTO curr_user_table (first_name, last_name, email, birthdate, CC_flag)
VALUES ('Hamish','Cuthbert','ham@mail.com','04-JUL-87','N');

INSERT INTO curr_user_table (first_name, last_name, email, birthdate, CC_flag)
VALUES ('Prabhudev','Garg','prabhu@mail.com','26-FEB-68','N');

INSERT INTO curr_user_table (first_name, last_name, email, birthdate, CC_flag)
VALUES ('Lucy','Xiao','xiao@mail.com','01-JAN-03','Y');

INSERT INTO curr_user_table (first_name, last_name, email, birthdate, CC_flag)
VALUES ('Tomoka','Kawahara','tomoka@mail.com','25-DEC-98','Y');

INSERT INTO curr_user_table (first_name, last_name, email, birthdate, CC_flag)
VALUES ('Aditya','Yan','Aditya@mail.com','12-MAY-90','N');

INSERT INTO curr_user_table (first_name, last_name, email, birthdate, CC_flag)
VALUES ('Lucy','Lui','lucylui@mail.com','02-DEC-68','Y');

INSERT INTO curr_user_table (first_name, middle_name, last_name, email, birthdate, CC_flag)
VALUES ('Tej','S','Anand','anand@mail.com','16-NOV-63','Y');

INSERT INTO curr_user_table (first_name, middle_name, last_name, email, birthdate, CC_flag)
VALUES ('Jamill', 'K', 'Kemm', 'jamillkemm@pmail.com', '06-JUN-79','N');

INSERT INTO curr_user_table (first_name, middle_name, last_name, email, birthdate, CC_flag)
VALUES ('Malory', 'Gawen', 'Buttrum', 'malorybuttrum@pmail.com', '12-JAN-71','N');

INSERT INTO curr_user_table (first_name, middle_name, last_name, email, birthdate, CC_flag)
VALUES ('Oren', 'Sondra', 'Darycott', 'orendarycott@pmail.com', '28-AUG-89','N');

INSERT INTO curr_user_table (first_name, middle_name, last_name, email, birthdate, CC_flag)
VALUES ('Rosalind', 'B', 'Joncic', 'rosalindjoncic@pmail.com', '10-JUN-69','N');

INSERT INTO curr_user_table (first_name, middle_name, last_name, email, birthdate, CC_flag)
VALUES ('Shirline', 'Maurizia', 'Laverock', 'shirlinelaverock@pmail.com', '11-FEB-73','N');

INSERT INTO curr_user_table (first_name, middle_name, last_name, email, birthdate, CC_flag)
VALUES ('Sue', NULL, 'Stonehouse', 'suestonehouse@pmail.com', '31-OCT-82','N');

INSERT INTO curr_user_table (first_name, middle_name, last_name, email, birthdate, CC_flag)
VALUES ('Tarra', 'A', 'Vaughton', 'tarravaughton@pmail.com', '25-DEC-90','N');

INSERT INTO curr_user_table (first_name, middle_name, last_name, email, birthdate, CC_flag)
VALUES ('Zarah', NULL, 'Lockney', 'zarahlockney@pmail.com', '06-NOV-58','N');

INSERT INTO curr_user_table (first_name, middle_name, last_name, email, birthdate, CC_flag)
VALUES ('Zelma', 'I', 'Reynalds', 'zelmareynalds@pmail.com', '18-APR-83','N');

INSERT INTO curr_user_table (first_name, middle_name, last_name, email, birthdate, CC_flag)
VALUES ( 'Appolonia', 'Padraig', 'Kilmartin', 'appoloniakilmartin@pmail.com','26-JUN-80','N');

INSERT INTO curr_user_table (first_name, middle_name, last_name, email, birthdate, CC_flag)
VALUES ('Ayn', 'N', 'Style', 'aynstyle@pmail.com', '10-OCT-86','N');

INSERT INTO curr_user_table (first_name, middle_name, last_name, email, birthdate, CC_flag)
VALUES ('Constantine', 'Emilee', 'Churchman', 'constantinechurchman@pmail.com', '14-MAY-79','N');

INSERT INTO curr_user_table (first_name, middle_name, last_name, email, birthdate, CC_flag)
VALUES ('Geraldine', NULL, 'Merali', 'geraldinemerali@pmail.com', '21-MAY-96','N');

INSERT INTO curr_user_table (first_name, middle_name, last_name, email, birthdate, CC_flag)
VALUES ('Travers', 'J', 'Tingle', 'traverstingle@pmail.com', '06-FEB-2002','N');

INSERT INTO curr_user_table (first_name, middle_name, last_name, email, birthdate, CC_flag)
VALUES ('Charlean', 'G', 'Eckert', 'charleaneckert@pmail.com', '19-MAR-97','N');



----insert for prospective clients

INSERT INTO Prospective_User (PC_FIRST_NAME, PC_LAST_NAME, EMAIL, ZIP_CODE, PHONE) 
VALUES ('Hedda', 'Slorach', 'heddaslorach@pmail.com', '62248', '5013819554');

INSERT INTO Prospective_User (PC_FIRST_NAME, PC_LAST_NAME, EMAIL, ZIP_CODE, PHONE)
VALUES ('Jobey', 'Gowdie', 'jobeygowdie@pmail.com', '27949', '3378183072');

INSERT INTO Prospective_User (PC_FIRST_NAME, PC_LAST_NAME, EMAIL, ZIP_CODE, PHONE)
VALUES ('Lazare', 'Dreamer', 'lazaredreamer@pmail.com','51489', '2143552569');

INSERT INTO Prospective_User (PC_FIRST_NAME, PC_LAST_NAME, EMAIL, ZIP_CODE, PHONE)
VALUES ('Lissie', 'de Juares', 'lissiede juares@pmail.com', '64863', '6827405284');

INSERT INTO Prospective_User (PC_FIRST_NAME, PC_LAST_NAME, EMAIL, ZIP_CODE, PHONE)
VALUES ('Malanie', 'Greenside', 'malaniegreenside@pmail.com', '64258', '8327489550');

INSERT INTO Prospective_User (PC_FIRST_NAME, PC_LAST_NAME, EMAIL, ZIP_CODE, PHONE)
VALUES ('Marketa', 'Scroggie', 'marketascroggie@pmail.com', '56999', '9366527953');

INSERT INTO Prospective_User (PC_FIRST_NAME, PC_LAST_NAME, EMAIL, ZIP_CODE, PHONE)
VALUES ('Pauletta', 'Jurkowski', 'paulettajurkowski@pmail.com', '45364', '4056872354');

INSERT INTO Prospective_User (PC_FIRST_NAME, PC_LAST_NAME, EMAIL, ZIP_CODE, PHONE)
VALUES ('Raven', 'Aspinal', 'ravenaspinal@pmail.com', '74274', '9151440876');

INSERT INTO Prospective_User (PC_FIRST_NAME, PC_LAST_NAME, EMAIL, ZIP_CODE, PHONE)
VALUES ('Stewart','Larking', 'stewartlarking@pmail.com', '55146', '6016687268');

INSERT INTO Prospective_User (PC_FIRST_NAME, PC_LAST_NAME, EMAIL, ZIP_CODE, PHONE)
VALUES ('Veronike', 'Gallamore', 'veronikegallamore@pmail.com', '25634', '5048846665');

INSERT INTO Prospective_User (PC_FIRST_NAME, PC_LAST_NAME, EMAIL, ZIP_CODE, PHONE)
VALUES ('Xenos', 'Brickdale', 'xenosbrickdale@pmail.com', '50292', '2144571891');

INSERT INTO Prospective_User (PC_FIRST_NAME, PC_LAST_NAME, EMAIL, ZIP_CODE, PHONE)
VALUES ('Aurie', 'Slinn', 'aurieslinn@pmail.com', '68404', '5059121449');

INSERT INTO Prospective_User (PC_FIRST_NAME, PC_LAST_NAME, EMAIL, ZIP_CODE, PHONE)
VALUES ('Buckie', 'Sugar', 'buckiesugar@pmail.com', '86082', '9037936971');

INSERT INTO Prospective_User (PC_FIRST_NAME, PC_LAST_NAME, EMAIL, ZIP_CODE, PHONE)
VALUES ('Dawna', 'Kalinovich', 'dawnakalinovich@pmail.com', '70833', '2142638212');

INSERT INTO Prospective_User (PC_FIRST_NAME, PC_LAST_NAME, EMAIL, ZIP_CODE, PHONE)
VALUES ('Glen', 'Bonett', 'glenbonett@pmail.com', '40366', '2103268811');

INSERT INTO Prospective_User (PC_FIRST_NAME, PC_LAST_NAME, EMAIL, ZIP_CODE, PHONE)
VALUES ('Marilyn', 'Gainor', 'marilyngainor@pmail.com', '59218', '2102233167');

INSERT INTO Prospective_User (PC_FIRST_NAME, PC_LAST_NAME, EMAIL, ZIP_CODE, PHONE)
VALUES ('Meredith', 'Burrel', 'meredithburrel@pmail.com', '72925', '8177609626');

INSERT INTO Prospective_User (PC_FIRST_NAME, PC_LAST_NAME, EMAIL, ZIP_CODE, PHONE)
VALUES ('Mikkel', 'Kilbane', 'mikkelkilbane@pmail.com', '27822', '7137619173');

INSERT INTO Prospective_User (PC_FIRST_NAME, PC_LAST_NAME, EMAIL, ZIP_CODE, PHONE)
VALUES ('Norton', 'Allibone', 'nortonallibone@pmail.com', '63538', '9367699284');

INSERT INTO Prospective_User (PC_FIRST_NAME, PC_LAST_NAME, EMAIL, ZIP_CODE, PHONE)
VALUES ('Orson', 'Boote', 'orsonboote@pmail.com', '61214', '9031841306');

INSERT INTO Prospective_User (PC_FIRST_NAME, PC_LAST_NAME, EMAIL, ZIP_CODE, PHONE)
VALUES ('Sydney', 'Mabb', 'sydneymabb@pmail.com', '23795', '9159054980');

INSERT INTO Prospective_User (PC_FIRST_NAME, PC_LAST_NAME, EMAIL, ZIP_CODE, PHONE)
VALUES ('Winne', 'Medcraft', 'winnemedcraft@pmail.com', '68149', '6821223915');

INSERT INTO Prospective_User (PC_FIRST_NAME, PC_LAST_NAME, EMAIL, ZIP_CODE, PHONE)
VALUES ('Alfonso', 'Gornall', 'alfonsogornall@pmail.com', '48620', '2148053861');

Commit;



----------------------------------------------------------------
-- CREATE INDEXES
----------------------------------------------------------------
CREATE INDEX curr_user_table_last_name_ix
    ON curr_user_table (last_name);
    
CREATE INDEX curr_user_table_cc_flag_ix
    ON curr_user_table (cc_flag);

CREATE INDEX curr_user_table_birthdate_ix
    ON curr_user_table (birthdate);

     
