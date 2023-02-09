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
-- Table `mydb`.`Tipo de tarifa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tipo de tarifa` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Preu` VARCHAR(45) NOT NULL,
  `Descripció` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `Preu_UNIQUE` (`Preu` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pel·lícula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pel·lícula` (
  `ID` VARCHAR(45) NOT NULL,
  `Titol` INT NOT NULL,
  `Genere` VARCHAR(45) NOT NULL,
  `Preu` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Projecció`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Projecció` (
  `ID_Cine` INT NOT NULL,
  `Data` VARCHAR(45) NOT NULL,
  `Sala` VARCHAR(45) NOT NULL,
  `ID_Peli` VARCHAR(45) NOT NULL,
  `Pel·lícula_ID` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_Cine`, `Data`, `ID_Peli`),
  UNIQUE INDEX `ID_Cine_UNIQUE` (`ID_Cine` ASC) VISIBLE,
  INDEX `fk_Projecció_Pel·lícula1_idx` (`Pel·lícula_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Projecció_Pel·lícula1`
    FOREIGN KEY (`Pel·lícula_ID`)
    REFERENCES `mydb`.`Pel·lícula` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cine` (
  `ID` VARCHAR(45) NOT NULL,
  `Nom` INT NOT NULL,
  `Adreça` VARCHAR(45) NOT NULL,
  `Telefon` VARCHAR(45) NOT NULL,
  `Nom de sales` VARCHAR(45) NOT NULL,
  `Projecció_ID_Cine` INT NOT NULL,
  `Projecció_Data` VARCHAR(45) NOT NULL,
  `Projecció_ID_Peli` VARCHAR(45) NOT NULL,
  UNIQUE INDEX `Nom_UNIQUE` (`Nom` ASC) VISIBLE,
  PRIMARY KEY (`ID`),
  INDEX `fk_Cine_Projecció1_idx` (`Projecció_ID_Cine` ASC, `Projecció_Data` ASC, `Projecció_ID_Peli` ASC) VISIBLE,
  CONSTRAINT `fk_Cine_Projecció1`
    FOREIGN KEY (`Projecció_ID_Cine` , `Projecció_Data` , `Projecció_ID_Peli`)
    REFERENCES `mydb`.`Projecció` (`ID_Cine` , `Data` , `ID_Peli`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Entrada cine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Entrada cine` (
  `ID` VARCHAR(45) NOT NULL,
  `ID_Cine` INT NOT NULL,
  `ID_TIPUS_TARIFA` VARCHAR(45) NOT NULL,
  `Data` VARCHAR(45) NOT NULL,
  `Tipo de tarifa_ID` INT NOT NULL,
  `Cine_ID` VARCHAR(45) NOT NULL,
  UNIQUE INDEX `ID_Cine_UNIQUE` (`ID_Cine` ASC) VISIBLE,
  UNIQUE INDEX `ID_TIPUS_TARIFA_UNIQUE` (`ID_TIPUS_TARIFA` ASC) VISIBLE,
  PRIMARY KEY (`ID`),
  INDEX `fk_Entrada cine_Tipo de tarifa_idx` (`Tipo de tarifa_ID` ASC) VISIBLE,
  INDEX `fk_Entrada cine_Cine1_idx` (`Cine_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Entrada cine_Tipo de tarifa`
    FOREIGN KEY (`Tipo de tarifa_ID`)
    REFERENCES `mydb`.`Tipo de tarifa` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Entrada cine_Cine1`
    FOREIGN KEY (`Cine_ID`)
    REFERENCES `mydb`.`Cine` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
