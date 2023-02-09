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
-- Table `mydb`.`Alumne`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Alumne` (
  `DNI` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognom` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Telefon` VARCHAR(45) NOT NULL,
  `Adreça` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Matrícula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Matrícula` (
  `Data` INT NOT NULL,
  `Alumne` VARCHAR(45) NOT NULL,
  `Assifgnatura` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Data`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Assignatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Assignatura` (
  `Nom` INT NOT NULL,
  `Credits` VARCHAR(45) NOT NULL,
  `Departament` VARCHAR(45) NOT NULL,
  `Professor` VARCHAR(45) NOT NULL,
  `Matrícula_Data` INT NOT NULL,
  PRIMARY KEY (`Nom`),
  INDEX `fk_Assignatura_Matrícula1_idx` (`Matrícula_Data` ASC) VISIBLE,
  CONSTRAINT `fk_Assignatura_Matrícula1`
    FOREIGN KEY (`Matrícula_Data`)
    REFERENCES `mydb`.`Matrícula` (`Data`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Departament`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Departament` (
  `Nom` INT NOT NULL,
  `Assignatura_Nom` INT NOT NULL,
  PRIMARY KEY (`Nom`),
  INDEX `fk_Departament_Assignatura1_idx` (`Assignatura_Nom` ASC) VISIBLE,
  CONSTRAINT `fk_Departament_Assignatura1`
    FOREIGN KEY (`Assignatura_Nom`)
    REFERENCES `mydb`.`Assignatura` (`Nom`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Professor` (
  `DNI` INT NOT NULL,
  `Titulació` VARCHAR(45) NOT NULL,
  `Departament` VARCHAR(45) NOT NULL,
  `EsCapDepartament` VARCHAR(45) NOT NULL,
  `Alumne_DNI` INT NOT NULL,
  `Departament_Nom` INT NOT NULL,
  PRIMARY KEY (`DNI`),
  INDEX `fk_Professor_Alumne_idx` (`Alumne_DNI` ASC) VISIBLE,
  INDEX `fk_Professor_Departament1_idx` (`Departament_Nom` ASC) VISIBLE,
  CONSTRAINT `fk_Professor_Alumne`
    FOREIGN KEY (`Alumne_DNI`)
    REFERENCES `mydb`.`Alumne` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Professor_Departament1`
    FOREIGN KEY (`Departament_Nom`)
    REFERENCES `mydb`.`Departament` (`Nom`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
