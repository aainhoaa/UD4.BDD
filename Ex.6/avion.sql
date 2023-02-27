-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercici 6
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercici 6
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercici 6` ;
USE `Exercici 6` ;

-- -----------------------------------------------------
-- Table `Exercici 6`.`passatge`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici 6`.`passatge` (
  `dni` INT NOT NULL,
  `pasaport_passatger` VARCHAR(45) NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `cognom` VARCHAR(45) NOT NULL,
  `telefon` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `adreça` VARCHAR(45) NULL,
  PRIMARY KEY (`dni`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici 6`.`avio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici 6`.`avio` (
  `identificador` INT NOT NULL,
  `model` VARCHAR(45) NOT NULL,
  `capacitat_passatgers` VARCHAR(45) NULL,
  PRIMARY KEY (`identificador`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici 6`.`vol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici 6`.`vol` (
  `numero_vol` INT NOT NULL,
  `avio` VARCHAR(45) NULL,
  `origen` VARCHAR(45) NOT NULL,
  `desti` VARCHAR(45) NOT NULL,
  `data_sortida` VARCHAR(45) NOT NULL,
  `data_arrobada` VARCHAR(45) NOT NULL,
  `hora_sortida` VARCHAR(45) NOT NULL,
  `hora_rivada` VARCHAR(45) NOT NULL,
  `avio_identificador` INT NOT NULL,
  PRIMARY KEY (`numero_vol`),
  INDEX `fk_vol_avio1_idx` (`avio_identificador` ASC) VISIBLE,
  CONSTRAINT `fk_vol_avio1`
    FOREIGN KEY (`avio_identificador`)
    REFERENCES `Exercici 6`.`avio` (`identificador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici 6`.`reserves`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici 6`.`reserves` (
  `identificador` INT NOT NULL,
  `data_reserva` VARCHAR(45) NOT NULL,
  `numero_vol` VARCHAR(45) NOT NULL,
  `import_total` VARCHAR(45) NULL,
  `passatge_dni` INT NOT NULL,
  `vol_numero_vol` INT NOT NULL,
  PRIMARY KEY (`identificador`),
  INDEX `fk_reserves_passatge_idx` (`passatge_dni` ASC) VISIBLE,
  INDEX `fk_reserves_vol1_idx` (`vol_numero_vol` ASC) VISIBLE,
  CONSTRAINT `fk_reserves_passatge`
    FOREIGN KEY (`passatge_dni`)
    REFERENCES `Exercici 6`.`passatge` (`dni`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reserves_vol1`
    FOREIGN KEY (`vol_numero_vol`)
    REFERENCES `Exercici 6`.`vol` (`numero_vol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
