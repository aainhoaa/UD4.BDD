-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercici 4
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercici 4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercici 4` ;
USE `Exercici 4` ;

-- -----------------------------------------------------
-- Table `Exercici 4`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici 4`.`Client` (
  `DNI` VARCHAR(10) NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognom` VARCHAR(45) NOT NULL,
  `Adreça` VARCHAR(45) NOT NULL,
  `Mobil` VARCHAR(45) NULL,
  `VIP` INT NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici 4`.`TipusPolissa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici 4`.`TipusPolissa` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(120) NOT NULL,
  `Descripcio` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici 4`.`Venedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici 4`.`Venedor` (
  `DNI/CIF` VARCHAR(45) NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognom` VARCHAR(45) NOT NULL,
  `Adreça` VARCHAR(45) NOT NULL,
  `Mobil` VARCHAR(45) NOT NULL,
  `Descripcio` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DNI/CIF`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici 4`.`Polissa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici 4`.`Polissa` (
  `NumPolissa` INT NOT NULL,
  `Import` FLOAT NOT NULL,
  `Data inici` DATE NOT NULL,
  `Data Fi` DATE NOT NULL,
  `Client_DNI` VARCHAR(10) NOT NULL,
  `TipusPolissa_ID` INT NOT NULL,
  `Venedor_DNI/CIF` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`NumPolissa`),
  INDEX `fk_Polissa_Client_idx` (`Client_DNI` ASC) VISIBLE,
  INDEX `fk_Polissa_TipusPolissa1_idx` (`TipusPolissa_ID` ASC) VISIBLE,
  INDEX `fk_Polissa_Venedor1_idx` (`Venedor_DNI/CIF` ASC) VISIBLE,
  CONSTRAINT `fk_Polissa_Client`
    FOREIGN KEY (`Client_DNI`)
    REFERENCES `Exercici 4`.`Client` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Polissa_TipusPolissa1`
    FOREIGN KEY (`TipusPolissa_ID`)
    REFERENCES `Exercici 4`.`TipusPolissa` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Polissa_Venedor1`
    FOREIGN KEY (`Venedor_DNI/CIF`)
    REFERENCES `Exercici 4`.`Venedor` (`DNI/CIF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
