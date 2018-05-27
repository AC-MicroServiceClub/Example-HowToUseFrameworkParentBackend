CREATE DATABASE MicroServiceDev;

CREATE TABLE IF NOT EXISTS `MicroServiceDev`.`Training` (
  `ID` int NOT NULL,   
  `Training_Plan_ID` int NOT NULL,
  `Training_STATE_IND` INT NOT NULL DEFAULT 0 comment '0-planned 1-in-progress 2-cancelled 3-confirmed 4-train started 5-train finished 6-send feedback to trainee/completed',
  `Training_TITLE` VARCHAR(200) NOT NULL DEFAULT '',
  `Training_START_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Training_END_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Training_DURATION` INT NOT NULL DEFAULT 0 comment 'this is calculated by minutes',
  `Training_LOCATION` VARCHAR(200) NOT NULL DEFAULT '',
  `Training_DESCRIPTION` TEXT NOT NULL,  
  `Trainier` VARCHAR(500) NOT NULL DEFAULT '' comment 'e.g. trainer1_ID:trainer_name|trainer2_ID:trainer_name',
  `CREATOR_ID` int NOT NULL DEFAULT 0,  
  `CREATOR` varchar(45) NOT NULL DEFAULT '',
  `CREATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY_ID` int NOT NULL DEFAULT 0,  
  `UPDATED_BY` varchar(45) NOT NULL DEFAULT '',
  `LAST_UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DELETED_IND` int NOT NULL DEFAULT 0,
  `DELETED_BY` varchar(45) NOT NULL DEFAULT '',
  `DELETED_BY_ID` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`));
  
  
CREATE TABLE IF NOT EXISTS `MicroServiceDev`.`Trainer` (
  `ID` INT NOT NULL,    
  `Trainer_EID` VARCHAR(50) NOT NULL,    
  `Trainer_STATE_IND` INT NOT NULL,
  `Trainer_DESCRIPTION` VARCHAR(500) NOT NULL DEFAULT '',
  `CREATOR_ID` int NOT NULL DEFAULT 0,  
  `CREATOR` varchar(45) NOT NULL DEFAULT '',
  `CREATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY_ID` int NOT NULL DEFAULT 0,  
  `UPDATED_BY` varchar(45) NOT NULL DEFAULT '',
  `LAST_UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DELETED_IND` int NOT NULL DEFAULT 0,
  `DELETED_BY` varchar(45) NOT NULL DEFAULT '',
  `DELETED_BY_ID` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`));
  
  
CREATE TABLE IF NOT EXISTS `MicroServiceDev`.`Trainee` (
  `ID` int NOT NULL,   
  `TRAINEE_ID` int NOT NULL  COMMENT 'The user who attend the training',    
  `TRAINING_ID` int NOT NULL,  
  `CREATOR_ID` int NOT NULL DEFAULT 0,  
  `CREATOR` varchar(45) NOT NULL DEFAULT '',
  `CREATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY_ID` int NOT NULL DEFAULT 0,  
  `UPDATED_BY` varchar(45) NOT NULL DEFAULT '',
  `LAST_UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DELETED_IND` int NOT NULL DEFAULT 0,
  `DELETED_BY` varchar(45) NOT NULL DEFAULT '',
  `DELETED_BY_ID` int NOT NULL DEFAULT 0,
  `TRAINEE_STATE_IND` char(1) NOT NULL DEFAULT '' COMMENT '0-Register successfully 1-self cancel the training 2- no show 3-checked in 4- responded the feedback / completed',
  PRIMARY KEY (`ID`));
