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
-- Table `mydb`.`Pacient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pacient` (
  `idPacient` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognom` VARCHAR(45) COLLATE 'Default Collation' NULL,
  `DNI` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPacient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Metge`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Metge` (
  `NumeroSegSocial INT` VARCHAR(45) NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognom` VARCHAR(45) NOT NULL,
  `Metgecol` VARCHAR(45) NOT NULL,
  `DNI` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`NumeroSegSocial INT`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Consulta` (
  `Pacient_idPacient` INT NOT NULL,
  `Metge_NumeroSegSocial INT` VARCHAR(45) NOT NULL,
  INDEX `fk_Consulta_Pacient_idx` (`Pacient_idPacient` ASC) VISIBLE,
  INDEX `fk_Consulta_Metge1_idx` (`Metge_NumeroSegSocial INT` ASC) VISIBLE,
  CONSTRAINT `fk_Consulta_Pacient`
    FOREIGN KEY (`Pacient_idPacient`)
    REFERENCES `mydb`.`Pacient` (`idPacient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consulta_Metge1`
    FOREIGN KEY (`Metge_NumeroSegSocial INT`)
    REFERENCES `mydb`.`Metge` (`NumeroSegSocial INT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
