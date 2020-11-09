--Author: Dylan Nikol

--drop table client_dw;
--drop view curr_user_view;
--drop view prospective_view;
--drop procedure user_etl_proc;

-- create data warehouse table for clients
CREATE TABLE client_dw 
(
    data_source     VARCHAR2(4)            NOT NULL,
    client_id       NUMBER                 NOT NULL,
    first_name      VARCHAR2(30)           NOT NULL,
    last_name       VARCHAR2(30)           NOT NULL,
    email           VARCHAR2(60)           NOT NULL,
    status          VARCHAR2(1)            NOT NULL,

    CONSTRAINT pk_customers_dw
        PRIMARY KEY (data_source, client_id),
        
    CONSTRAINT data_source_ck 
        CHECK (data_source IN ('CURR','PROS'))
);

-- create view that formats curr_user_table
CREATE OR REPLACE VIEW curr_user_view AS
    SELECT
        'CURR' AS data_source,
        USER_ID AS client_id,
        FIRST_NAME AS first_name,
        LAST_NAME AS last_name,
        EMAIL AS email,
        CC_FLAG AS status
    FROM CURR_USER_TABLE;
    
-- create view that formats prospective_user
CREATE OR REPLACE VIEW prospective_view AS
    SELECT
        'PROS' AS data_source,
        PROSPECTIVE_ID AS client_id,
        PC_FIRST_NAME AS first_name,
        PC_LAST_NAME AS last_name,
        EMAIL AS email,
        'N' AS status
    FROM PROSPECTIVE_USER;


-- create a procedure called user_etl_proc that executes the 2 insert statements and 2 update statements
CREATE OR REPLACE PROCEDURE user_etl_proc  
AS
BEGIN
  -- insert values for unique data_source/customer_id from curr_user_view into client_dw table
    INSERT INTO client_dw
        (data_source, client_id, first_name, last_name, email, status)
    SELECT  *
    FROM   curr_user_view
    WHERE  NOT EXISTS (SELECT *
                       FROM   client_dw
                       WHERE  curr_user_view.data_source = client_dw.data_source AND
                              curr_user_view.client_id = client_dw.client_id);

    -- insert values for unique data_source/client_id from prospective_user_view into customers_dw table
    INSERT INTO client_dw
        (data_source, client_id, first_name, last_name, email, status)
    SELECT  *
    FROM   prospective_view
    WHERE  NOT EXISTS (SELECT *
                       FROM   client_dw
                       WHERE  prospective_view.data_source = client_dw.data_source AND
                              prospective_view.CLIENT_ID = client_dw.client_id);


    -- Merge statement that updates matching data_source/client_id combinations from curr_user_view
    -- in client_dw and if no combination found, inserts new client into client_dw
    MERGE INTO client_dw dw
        USING (SELECT * FROM curr_user_view) cu  ON (cu.DATA_SOURCE = dw.DATA_SOURCE AND
                                                      cu.CLIENT_ID = dw.CLIENT_ID) 
      WHEN MATCHED THEN
        UPDATE SET
          dw.FIRST_NAME = cu.FIRST_NAME,
          dw.LAST_NAME = cu.LAST_NAME,
          dw.email = cu.email,
          dw.status = cu.status
      WHEN NOT MATCHED THEN
        INSERT (DATA_SOURCE, CLIENT_ID, FIRST_NAME, LAST_NAME, email, status)
        VALUES (cu.DATA_SOURCE, cu.CLIENT_ID, cu.FIRST_NAME, cu.LAST_NAME, cu.EMAIL, cu.STATUS);

    -- Merge statement that updates matching data_source/client_id combinations from prospective_view
    -- in client_dw and if no combination found, inserts new client into client_dw
    MERGE INTO client_dw dw
        USING (SELECT * FROM prospective_view) pu  ON (pu.DATA_SOURCE = dw.DATA_SOURCE AND
                                                            pu.CLIENT_ID = dw.CLIENT_ID) 
      WHEN MATCHED THEN
        UPDATE SET
          dw.FIRST_NAME = pu.FIRST_NAME,
          dw.LAST_NAME = pu.LAST_NAME,
          dw.email = pu.email,
          dw.status = pu.status
      WHEN NOT MATCHED THEN
        INSERT (DATA_SOURCE, CLIENT_ID, FIRST_NAME, LAST_NAME, email, status)
        VALUES (pu.DATA_SOURCE, pu.CLIENT_ID, pu.FIRST_NAME, pu.LAST_NAME, pu.EMAIL, pu.STATUS);
    
 COMMIT;
 
END;
/

-- TEST PROCEDURE
--EXECUTE USER_ETL_PROC;

--INSERT INTO Prospective_User (PC_FIRST_NAME, PC_LAST_NAME, EMAIL, ZIP_CODE, PHONE)
--VALUES ('BBBBBBB', 'dododoodod', 'sdzfsdfsdf@pmail.com', '48620', '2148453869');

--INSERT INTO curr_user_table (first_name, middle_name, last_name, email, birthdate, CC_flag)
--VALUES ('Jerry', 'J', 'Jingles', 'jingles@pmail.com', '02-MAR-2000','N');


