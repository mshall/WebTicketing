-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema web-tk
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `web-tk` ;

-- -----------------------------------------------------
-- Schema web-tk
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `web-tk` DEFAULT CHARACTER SET utf8 ;
USE `web-tk` ;

-- -----------------------------------------------------
-- Table `web-tk`.`technical`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `web-tk`.`technical` ;

CREATE TABLE IF NOT EXISTS `web-tk`.`technical` (
  `Technical-id` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `ContactPerson` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NOT NULL,
  `City` VARCHAR(45) NULL DEFAULT NULL,
  `Street` VARCHAR(45) NULL DEFAULT NULL,
  `UserName` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  `Phone1` VARCHAR(11) NOT NULL,
  `Phone2` VARCHAR(11) NULL DEFAULT NULL,
  `Status` VARCHAR(11) NULL DEFAULT NULL,
  `Vendor` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Technical-id`),
  UNIQUE INDEX `UserName_UNIQUE` (`UserName` ASC),
  UNIQUE INDEX `Email_UNIQUE` (`Email` ASC),
  UNIQUE INDEX `Phone1_UNIQUE` (`Phone1` ASC),
  UNIQUE INDEX `Technical-id_UNIQUE` (`Technical-id` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `web-tk`.`merchant`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `web-tk`.`merchant` ;

CREATE TABLE IF NOT EXISTS `web-tk`.`merchant` (
  `Merchant-id` INT(11) NOT NULL AUTO_INCREMENT,
  `MerchantName` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `MCC` INT(5) NULL DEFAULT NULL,
  `Status` VARCHAR(11) NULL DEFAULT NULL,
  `City` VARCHAR(45) NULL DEFAULT NULL,
  `Street` VARCHAR(45) NULL DEFAULT NULL,
  `Phone1` VARCHAR(11) NOT NULL,
  `Phone 2` VARCHAR(11) NULL DEFAULT NULL,
  `Currancy` VARCHAR(45) NOT NULL,
  `Vendor` VARCHAR(45) NULL DEFAULT NULL,
  `ContactPerson` VARCHAR(45) NULL DEFAULT NULL,
  `AMex MerchantID` INT(11) NULL DEFAULT NULL,
  `PremiumID` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Merchant-id`),
  UNIQUE INDEX `MearchentEmail_UNIQUE` (`Email` ASC),
  UNIQUE INDEX `Phone1_UNIQUE` (`Phone1` ASC),
  UNIQUE INDEX `MerchantName_UNIQUE` (`MerchantName` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 50
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `web-tk`.`store`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `web-tk`.`store` ;

CREATE TABLE IF NOT EXISTS `web-tk`.`store` (
  `store-id` INT(11) NOT NULL AUTO_INCREMENT,
  `store-city` VARCHAR(45) NOT NULL,
  `store-street` VARCHAR(45) NOT NULL,
  `Status` VARCHAR(11) NOT NULL,
  `Phone1` VARCHAR(11) NOT NULL,
  `Phone 2` VARCHAR(11) NULL DEFAULT NULL,
  `Contact-Person` VARCHAR(45) NULL DEFAULT NULL,
  `store-name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`store-id`))
ENGINE = InnoDB
AUTO_INCREMENT = 300
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `web-tk`.`terminal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `web-tk`.`terminal` ;

CREATE TABLE IF NOT EXISTS `web-tk`.`terminal` (
  `Terminal-id` INT(11) NOT NULL AUTO_INCREMENT,
  `Model` VARCHAR(45) NOT NULL,
  `SerialNumber` INT(11) NOT NULL,
  `Condition` VARCHAR(45) NULL DEFAULT NULL,
  `Status` VARCHAR(11) NULL DEFAULT NULL,
  `Currancy` VARCHAR(45) NULL DEFAULT NULL,
  `MCC` VARCHAR(45) NULL DEFAULT NULL,
  `Class` VARCHAR(45) NULL DEFAULT NULL,
  `Sale` TINYINT(4) NULL DEFAULT NULL,
  `OnlineReturned` TINYINT(4) NULL DEFAULT NULL,
  `OffLinereturned` TINYINT(4) NULL DEFAULT NULL,
  `OfflineSale` TINYINT(4) NULL DEFAULT NULL,
  `OnlineVoid` TINYINT(4) NULL DEFAULT NULL,
  `OffLineVoid` TINYINT(4) NULL DEFAULT NULL,
  `Preauth` TINYINT(4) NULL DEFAULT NULL,
  `Amex` TINYINT(4) NULL DEFAULT NULL,
  `instatiment` VARCHAR(45) NULL DEFAULT NULL,
  `prepaid Services` TINYINT(4) NULL DEFAULT NULL,
  `Diners` TINYINT(4) NULL DEFAULT NULL,
  `Premuim` TINYINT(4) NULL DEFAULT NULL,
  `ManualEntry` TINYINT(4) NULL DEFAULT NULL,
  `store_store-id` INT(11) NULL,
  `merchant_Merchant-id` INT(11) NULL,
  PRIMARY KEY (`Terminal-id`),
  UNIQUE INDEX `TerminalSerialNumber_UNIQUE` (`SerialNumber` ASC),
  UNIQUE INDEX `Terminal-id_UNIQUE` (`Terminal-id` ASC),
  INDEX `fk_terminal_store_idx` (`store_store-id` ASC),
  INDEX `fk_terminal_merchant1_idx` (`merchant_Merchant-id` ASC),
  CONSTRAINT `fk_terminal_store`
    FOREIGN KEY (`store_store-id`)
    REFERENCES `web-tk`.`store` (`store-id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_terminal_merchant1`
    FOREIGN KEY (`merchant_Merchant-id`)
    REFERENCES `web-tk`.`merchant` (`Merchant-id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `web-tk`.`problemassignment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `web-tk`.`problemassignment` ;

CREATE TABLE IF NOT EXISTS `web-tk`.`problemassignment` (
  `Problem-id` INT NOT NULL AUTO_INCREMENT,
  `Problem-Date` DATE NOT NULL,
  `Problem-Details` VARCHAR(45) NULL DEFAULT NULL,
  `merchant_Merchant-id` INT(11) NOT NULL,
  `terminal_Terminal-id` INT(11) NOT NULL,
  PRIMARY KEY (`Problem-id`),
  INDEX `fk_problemassignment_merchant1_idx` (`merchant_Merchant-id` ASC),
  INDEX `fk_problemassignment_terminal1_idx` (`terminal_Terminal-id` ASC),
  CONSTRAINT `fk_problemassignment_merchant1`
    FOREIGN KEY (`merchant_Merchant-id`)
    REFERENCES `web-tk`.`merchant` (`Merchant-id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_problemassignment_terminal1`
    FOREIGN KEY (`terminal_Terminal-id`)
    REFERENCES `web-tk`.`terminal` (`Terminal-id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `web-tk`.`maintenance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `web-tk`.`maintenance` ;

CREATE TABLE IF NOT EXISTS `web-tk`.`maintenance` (
  `Maintenance-id` INT NOT NULL AUTO_INCREMENT,
  `SubmittedDate` DATE NULL DEFAULT NULL,
  `Solution` VARCHAR(45) NULL DEFAULT NULL,
  `Status` VARCHAR(11) NULL DEFAULT NULL,
  `MaintainDate` DATE NULL DEFAULT NULL,
  `Notes` VARCHAR(45) NULL DEFAULT NULL,
  `technical_Technical-id` INT(11) NOT NULL,
  `problemassignment_Problem-id` INT NOT NULL,
  PRIMARY KEY (`Maintenance-id`),
  INDEX `fk_maintenance_technical1_idx` (`technical_Technical-id` ASC),
  INDEX `fk_maintenance_problemassignment1_idx` (`problemassignment_Problem-id` ASC),
  CONSTRAINT `fk_maintenance_technical1`
    FOREIGN KEY (`technical_Technical-id`)
    REFERENCES `web-tk`.`technical` (`Technical-id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_maintenance_problemassignment1`
    FOREIGN KEY (`problemassignment_Problem-id`)
    REFERENCES `web-tk`.`problemassignment` (`Problem-id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 20
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `web-tk`.`rollpaper`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `web-tk`.`rollpaper` ;

CREATE TABLE IF NOT EXISTS `web-tk`.`rollpaper` (
  `RollPaperSize` VARCHAR(45) NOT NULL,
  `Total-in` INT(11) NULL DEFAULT NULL,
  `store_store-id` INT(11) NULL,
  PRIMARY KEY (`RollPaperSize`),
  INDEX `fk_rollpaper_store1_idx` (`store_store-id` ASC),
  CONSTRAINT `fk_rollpaper_store1`
    FOREIGN KEY (`store_store-id`)
    REFERENCES `web-tk`.`store` (`store-id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `web-tk`.`marchent_rollpaper`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `web-tk`.`marchent_rollpaper` ;

CREATE TABLE IF NOT EXISTS `web-tk`.`marchent_rollpaper` (
  `RollPaper-Default` INT(11) NULL DEFAULT NULL,
  `RollPaper-Out` INT(11) NULL DEFAULT NULL,
  `merchant_Merchant-id` INT(11) NOT NULL,
  `rollpaper_RollPaperSize` VARCHAR(45) NOT NULL,
  INDEX `fk_RollPaper_has_Marchent_RollPaper1_idx` (`RollPaper-Default` ASC),
  INDEX `fk_marchent_rollpaper_merchant1_idx` (`merchant_Merchant-id` ASC),
  INDEX `fk_marchent_rollpaper_rollpaper1_idx` (`rollpaper_RollPaperSize` ASC),
  CONSTRAINT `fk_marchent_rollpaper_merchant1`
    FOREIGN KEY (`merchant_Merchant-id`)
    REFERENCES `web-tk`.`merchant` (`Merchant-id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_marchent_rollpaper_rollpaper1`
    FOREIGN KEY (`rollpaper_RollPaperSize`)
    REFERENCES `web-tk`.`rollpaper` (`RollPaperSize`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `web-tk`.`sim`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `web-tk`.`sim` ;

CREATE TABLE IF NOT EXISTS `web-tk`.`sim` (
  `SimSerial` INT(11) NOT NULL,
  `operator` VARCHAR(45) NOT NULL,
  `SimStatus` VARCHAR(11) NULL,
  `SimCondition` VARCHAR(45) NULL DEFAULT NULL,
  `store_store-id` INT(11) NULL,
  `merchant_Merchant-id` INT(11) NULL,
  `terminal_Terminal-id` INT(11) NULL,
  PRIMARY KEY (`SimSerial`),
  INDEX `fk_sim_store1_idx` (`store_store-id` ASC),
  INDEX `fk_sim_merchant1_idx` (`merchant_Merchant-id` ASC),
  INDEX `fk_sim_terminal1_idx` (`terminal_Terminal-id` ASC),
  CONSTRAINT `fk_sim_store1`
    FOREIGN KEY (`store_store-id`)
    REFERENCES `web-tk`.`store` (`store-id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sim_merchant1`
    FOREIGN KEY (`merchant_Merchant-id`)
    REFERENCES `web-tk`.`merchant` (`Merchant-id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sim_terminal1`
    FOREIGN KEY (`terminal_Terminal-id`)
    REFERENCES `web-tk`.`terminal` (`Terminal-id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `web-tk`.`Vendor-Admin`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `web-tk`.`Vendor-Admin` ;

CREATE TABLE IF NOT EXISTS `web-tk`.`Vendor-Admin` (
  `VID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NULL,
  `Phone1` VARCHAR(11) NULL,
  `UserName` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  `tag` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`VID`),
  UNIQUE INDEX `UserName_UNIQUE` (`UserName` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 500;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
