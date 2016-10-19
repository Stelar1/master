-- -----------------------------------------------------
-- Table `IOS_DEVICE`
-- -----------------------------------------------------
CREATE TABLE IOS_DEVICE (
  MOBILE_DEVICE_ID VARCHAR(45) NOT NULL,
  APNS_PUSH_TOKEN VARCHAR(100) DEFAULT NULL,
  MAGIC_TOKEN VARCHAR(100) DEFAULT NULL,
  MDM_TOKEN VARCHAR(100) DEFAULT NULL,
  UNLOCK_TOKEN VARCHAR(2000) DEFAULT NULL,
  CHALLENGE_TOKEN VARCHAR(45) DEFAULT NULL,
  DEVICE_INFO VARCHAR(4000) DEFAULT NULL,
  SERIAL VARCHAR(45) DEFAULT NULL,
  PRODUCT VARCHAR(45) DEFAULT NULL,
  IMEI VARCHAR(45) DEFAULT NULL,
  VERSION VARCHAR(45) DEFAULT NULL,
  MAC_ADDRESS VARCHAR(45) DEFAULT NULL,
  DEVICE_NAME VARCHAR(100) DEFAULT NULL,
  ICCID VARCHAR(45) DEFAULT NULL,
  LATITUDE VARCHAR(45) DEFAULT NULL,
  LONGITUDE VARCHAR(45) DEFAULT NULL,
  CONSTRAINT PK_IOS_DEVICE PRIMARY KEY (MOBILE_DEVICE_ID)
)
/

-- -----------------------------------------------------
-- Table `IOS_FEATURE`
-- -----------------------------------------------------
CREATE TABLE IOS_FEATURE (
  ID INT NOT NULL,
  CODE VARCHAR(45) NOT NULL,
  NAME VARCHAR(100) NOT NULL,
  DESCRIPTION VARCHAR(200) NULL,
  CONSTRAINT PK_IOS_FEATURE PRIMARY KEY (ID)
)
/

-- Sequence `IOS_FEATURE_ID_INC_SEQ`
-- -----------------------------------------------------
CREATE SEQUENCE IOS_FEATURE_ID_INC_SEQ START WITH 1 INCREMENT BY 1 NOCACHE
/

-- -----------------------------------------------------
-- Trigger `IOS_FEATURE_ID_INC_TRIG`
-- -----------------------------------------------------
CREATE OR REPLACE TRIGGER IOS_FEATURE_ID_INC_TRIG
BEFORE INSERT
ON IOS_FEATURE
REFERENCING NEW AS NEW
FOR EACH ROW
  BEGIN
    SELECT IOS_FEATURE_ID_INC_SEQ.NEXTVAL INTO :NEW.ID FROM DUAL;
  END;
/