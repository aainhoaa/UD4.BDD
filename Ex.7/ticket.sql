-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercici 7
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercici 7
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercici 7` ;
USE `Exercici 7` ;

-- -----------------------------------------------------
-- Table `Exercici 7`.`vender`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici 7`.`vender` (
  `identificador` INT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `adreça` VARCHAR(45) NULL,
  `data_naixement` VARCHAR(45) NULL,
  `edat` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`nom`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici 7`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici 7`.`client` (
  `nom` INT NOT NULL,
  `ticket` VARCHAR(45) NULL,
  `dni` VARCHAR(45) NOT NULL,
  `doblers_gastat` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`dni`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici 7`.`ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici 7`.`ticket` (
  `identificador` INT NULL,
  `numero_factura` VARCHAR(45) NOT NULL,
  `empleat` VARCHAR(45) NOT NULL,
  `data_venda` VARCHAR(45) NOT NULL,
  `hora_venda` VARCHAR(45) NULL,
  `total_iva` VARCHAR(45) NOT NULL,
  `vender_nom` VARCHAR(45) NOT NULL,
  `client_dni` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`numero_factura`),
  INDEX `fk_ticket_vender_idx` (`vender_nom` ASC) VISIBLE,
  INDEX `fk_ticket_client1_idx` (`client_dni` ASC) VISIBLE,
  CONSTRAINT `fk_ticket_vender`
    FOREIGN KEY (`vender_nom`)
    REFERENCES `Exercici 7`.`vender` (`nom`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ticket_client1`
    FOREIGN KEY (`client_dni`)
    REFERENCES `Exercici 7`.`client` (`dni`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici 7`.`producte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici 7`.`producte` (
  `codi_intern` INT NULL,
  `descripcio` VARCHAR(45) NULL,
  `codi_barres` VARCHAR(45) NULL,
  `preu_unitari` VARCHAR(45) NULL,
  `iva` VARCHAR(45) NOT NULL,
  `preu_venda_public` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`iva`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici 7`.`linia_ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici 7`.`linia_ticket` (
  `identificador` INT NULL,
  `identificador_ticket` VARCHAR(45) NULL,
  `codi_producte` VARCHAR(45) NULL,
  `descripcio_producte` VARCHAR(45) NULL,
  `unitats` VARCHAR(45) NOT NULL,
  `descompte` VARCHAR(45) NOT NULL,
  `preu_unitari` VARCHAR(45) NULL,
  `preu_linia` VARCHAR(45) NULL,
  `ticket_numero_factura` VARCHAR(45) NOT NULL,
  `producte_iva` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`unitats`),
  INDEX `fk_linia_ticket_ticket1_idx` (`ticket_numero_factura` ASC) VISIBLE,
  INDEX `fk_linia_ticket_producte1_idx` (`producte_iva` ASC) VISIBLE,
  CONSTRAINT `fk_linia_ticket_ticket1`
    FOREIGN KEY (`ticket_numero_factura`)
    REFERENCES `Exercici 7`.`ticket` (`numero_factura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_linia_ticket_producte1`
    FOREIGN KEY (`producte_iva`)
    REFERENCES `Exercici 7`.`producte` (`iva`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
