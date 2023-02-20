-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Client` (
  `DNI` VARCHAR(45) NOT NULL,
  `User` INT NOT NULL,
  `pwd` VARCHAR(45) NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognom` VARCHAR(45) NOT NULL,
  `Adreça` VARCHAR(45) NOT NULL,
  `població` VARCHAR(45) NULL,
  `Gmail` VARCHAR(45) NOT NULL,
  `Telèfon` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tipus_Vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tipus_Vehicle` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Descripció` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cita` (
  `Matricula_Vehicle` INT NOT NULL,
  `Data` VARCHAR(45) NOT NULL,
  `Hora` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Matricula_Vehicle`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vehicle` (
  `Matricula` INT NOT NULL,
  `Marca` VARCHAR(45) NOT NULL,
  `Model` VARCHAR(45) NOT NULL,
  `DNI_Tipus_Vehicle` VARCHAR(45) NOT NULL,
  `client_DNI` VARCHAR(45) NOT NULL,
  `Tipus_Vehicle_ID` INT NOT NULL,
  `Cita_Matricula_Vehicle` INT NOT NULL,
  PRIMARY KEY (`Matricula`),
  INDEX `fk_Vehicle_client_idx` (`client_DNI` ASC) VISIBLE,
  INDEX `fk_Vehicle_Tipus_Vehicle1_idx` (`Tipus_Vehicle_ID` ASC) VISIBLE,
  INDEX `fk_Vehicle_Cita1_idx` (`Cita_Matricula_Vehicle` ASC) VISIBLE,
  CONSTRAINT `fk_Vehicle_client`
    FOREIGN KEY (`client_DNI`)
    REFERENCES `mydb`.`Client` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vehicle_Tipus_Vehicle1`
    FOREIGN KEY (`Tipus_Vehicle_ID`)
    REFERENCES `mydb`.`Tipus_Vehicle` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vehicle_Cita1`
    FOREIGN KEY (`Cita_Matricula_Vehicle`)
    REFERENCES `mydb`.`Cita` (`Matricula_Vehicle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
