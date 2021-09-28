-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema parcial2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema parcial2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `parcial2` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `parcial2` ;

-- -----------------------------------------------------
-- Table `parcial2`.`inventariodepersonal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parcial2`.`inventariodepersonal` (
  `pkIdInventarioDePersonal` VARCHAR(18) NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `apellido` VARCHAR(45) NULL DEFAULT NULL,
  `correo` VARCHAR(45) NULL DEFAULT NULL,
  `direccion` VARCHAR(45) NULL DEFAULT NULL,
  `añosDeExperiencia` VARCHAR(45) NULL DEFAULT NULL,
  `telefono` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`pkIdInventarioDePersonal`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `parcial2`.`detallesempleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parcial2`.`detallesempleado` (
  `pkIdDesarrollodecarrera` VARCHAR(18) NOT NULL,
  `observaciones` VARCHAR(45) NULL DEFAULT NULL,
  `aspiracionSueldo` VARCHAR(45) NULL DEFAULT NULL,
  `ausencias` VARCHAR(45) NULL DEFAULT NULL,
  `pkIdInventarioDePersonal` VARCHAR(18) NULL,
  PRIMARY KEY (`pkIdDesarrollodecarrera`),
  INDEX `fk_Desarrollo de carrera_InventarioDePersonal1_idx` (`pkIdInventarioDePersonal` ASC) VISIBLE,
  CONSTRAINT `fk_Desarrollo de carrera_InventarioDePersonal1`
    FOREIGN KEY (`pkIdInventarioDePersonal`)
    REFERENCES `parcial2`.`inventariodepersonal` (`pkIdInventarioDePersonal`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `parcial2`.`mediodecontacto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parcial2`.`mediodecontacto` (
  `idMedioDeContratacion` VARCHAR(18) NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `costoMensual` DECIMAL(10,0) NULL DEFAULT NULL,
  PRIMARY KEY (`idMedioDeContratacion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `parcial2`.`reclutamiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parcial2`.`reclutamiento` (
  `pkIdReclutamiento` VARCHAR(18) NOT NULL,
  `fkIdMedioDeContacto` VARCHAR(18) NOT NULL,
  `fkIdInventarioDePersonal` VARCHAR(18) NOT NULL,
  PRIMARY KEY (`pkIdReclutamiento`),
  INDEX `fk_Reclutamiento_MedioDeContacto1_idx` (`fkIdMedioDeContacto` ASC) VISIBLE,
  INDEX `fk_Reclutamiento_InventarioDePersonal1_idx` (`fkIdInventarioDePersonal` ASC) VISIBLE,
  CONSTRAINT `fk_Reclutamiento_InventarioDePersonal1`
    FOREIGN KEY (`fkIdInventarioDePersonal`)
    REFERENCES `parcial2`.`inventariodepersonal` (`pkIdInventarioDePersonal`),
  CONSTRAINT `fk_Reclutamiento_MedioDeContacto1`
    FOREIGN KEY (`fkIdMedioDeContacto`)
    REFERENCES `parcial2`.`mediodecontacto` (`idMedioDeContratacion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`puesto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`puesto` (
  `pkIdPuesto` VARCHAR(18) NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `sueldo` DECIMAL(10,0) NULL DEFAULT NULL,
  `añosDeExperiencia` INT NULL DEFAULT NULL,
  `fkIdPuestoSuperior` VARCHAR(18) NOT NULL,
  PRIMARY KEY (`pkIdPuesto`),
  INDEX `fk_Puesto_Puesto1_idx` (`fkIdPuestoSuperior` ASC) VISIBLE,
  CONSTRAINT `fk_Puesto_Puesto1`
    FOREIGN KEY (`fkIdPuestoSuperior`)
    REFERENCES `mydb`.`puesto` (`pkIdPuesto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`inventariodepersonal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`inventariodepersonal` (
  `pkIdInventarioDePersonal` VARCHAR(18) NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `apellido` VARCHAR(45) NULL DEFAULT NULL,
  `fechaDeNacimiento` DATE NULL DEFAULT NULL,
  `correo` VARCHAR(45) NULL DEFAULT NULL,
  `direccion` VARCHAR(45) NULL DEFAULT NULL,
  `contratado` INT NULL DEFAULT NULL,
  `añosDeExperiencia` INT NULL DEFAULT NULL,
  `telefono` VARCHAR(45) NULL DEFAULT NULL,
  `fkIdPuesto` VARCHAR(18) NOT NULL,
  PRIMARY KEY (`pkIdInventarioDePersonal`),
  INDEX `fk_InventarioDePersonal_Puesto1_idx` (`fkIdPuesto` ASC) VISIBLE,
  CONSTRAINT `fk_InventarioDePersonal_Puesto1`
    FOREIGN KEY (`fkIdPuesto`)
    REFERENCES `mydb`.`puesto` (`pkIdPuesto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`desarrollo de carrera`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`desarrollo de carrera` (
  `pkIdDesarrollo de carrera` VARCHAR(18) NOT NULL,
  `observaciones` VARCHAR(45) NULL DEFAULT NULL,
  `aspiracionSueldo` DECIMAL(10,0) NULL DEFAULT NULL,
  `ausencias` VARCHAR(45) NULL DEFAULT NULL,
  `pkIdInventarioDePersonal` VARCHAR(18) NOT NULL,
  PRIMARY KEY (`pkIdDesarrollo de carrera`),
  INDEX `fk_Desarrollo de carrera_InventarioDePersonal1_idx` (`pkIdInventarioDePersonal` ASC) VISIBLE,
  CONSTRAINT `fk_Desarrollo de carrera_InventarioDePersonal1`
    FOREIGN KEY (`pkIdInventarioDePersonal`)
    REFERENCES `mydb`.`inventariodepersonal` (`pkIdInventarioDePersonal`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`diastrabajados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`diastrabajados` (
  `pkIdDiasTrabajados` VARCHAR(18) NOT NULL,
  `fkIdInventarioDePersonal` VARCHAR(18) NOT NULL,
  `año` INT NULL DEFAULT NULL,
  `enero` INT NULL DEFAULT NULL,
  `febrero` INT NULL DEFAULT NULL,
  `marzo` INT NULL DEFAULT NULL,
  `abril` INT NULL DEFAULT NULL,
  `mayo` INT NULL DEFAULT NULL,
  `junio` INT NULL DEFAULT NULL,
  `julio` INT NULL DEFAULT NULL,
  `agosto` INT NULL DEFAULT NULL,
  `septiembre` INT NULL DEFAULT NULL,
  `octubre` INT NULL DEFAULT NULL,
  `noviembre` INT NULL DEFAULT NULL,
  `diciembre` INT NULL DEFAULT NULL,
  `totalDiasTrabajados` INT NULL DEFAULT NULL,
  PRIMARY KEY (`pkIdDiasTrabajados`),
  INDEX `fk_Anual_InventarioDePersonal1_idx` (`fkIdInventarioDePersonal` ASC) VISIBLE,
  CONSTRAINT `fk_Anual_InventarioDePersonal10`
    FOREIGN KEY (`fkIdInventarioDePersonal`)
    REFERENCES `mydb`.`inventariodepersonal` (`pkIdInventarioDePersonal`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`mediodecontacto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`mediodecontacto` (
  `idMedioDeContratacion` VARCHAR(18) NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `costoMensual` DECIMAL(10,0) NULL DEFAULT NULL,
  PRIMARY KEY (`idMedioDeContratacion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`prestacionlaboral`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`prestacionlaboral` (
  `pkIdPrestacionLaboral` VARCHAR(18) NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `descripcion` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`pkIdPrestacionLaboral`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`prestacionlaboralaplicada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`prestacionlaboralaplicada` (
  `pkIdPrestacionLaboralAplicada` VARCHAR(18) NOT NULL,
  `fkIdPrestacionLaboral` VARCHAR(18) NOT NULL,
  `fkIdDiasTrabajados` VARCHAR(18) NOT NULL,
  PRIMARY KEY (`pkIdPrestacionLaboralAplicada`),
  INDEX `fk_PrestacionLaboralAplicada_PrestacionLaboral1_idx` (`fkIdPrestacionLaboral` ASC) VISIBLE,
  INDEX `fk_PrestacionLaboralAplicada_DiasTrabajados1_idx` (`fkIdDiasTrabajados` ASC) VISIBLE,
  CONSTRAINT `fk_PrestacionLaboralAplicada_DiasTrabajados1`
    FOREIGN KEY (`fkIdDiasTrabajados`)
    REFERENCES `mydb`.`diastrabajados` (`pkIdDiasTrabajados`),
  CONSTRAINT `fk_PrestacionLaboralAplicada_PrestacionLaboral1`
    FOREIGN KEY (`fkIdPrestacionLaboral`)
    REFERENCES `mydb`.`prestacionlaboral` (`pkIdPrestacionLaboral`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`reclutamiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`reclutamiento` (
  `pkIdReclutamiento` VARCHAR(18) NOT NULL,
  `fkIdMedioDeContacto` VARCHAR(18) NOT NULL,
  `fkIdInventarioDePersonal` VARCHAR(18) NOT NULL,
  PRIMARY KEY (`pkIdReclutamiento`),
  INDEX `fk_Reclutamiento_MedioDeContacto1_idx` (`fkIdMedioDeContacto` ASC) VISIBLE,
  INDEX `fk_Reclutamiento_InventarioDePersonal1_idx` (`fkIdInventarioDePersonal` ASC) VISIBLE,
  CONSTRAINT `fk_Reclutamiento_InventarioDePersonal1`
    FOREIGN KEY (`fkIdInventarioDePersonal`)
    REFERENCES `mydb`.`inventariodepersonal` (`pkIdInventarioDePersonal`),
  CONSTRAINT `fk_Reclutamiento_MedioDeContacto1`
    FOREIGN KEY (`fkIdMedioDeContacto`)
    REFERENCES `mydb`.`mediodecontacto` (`idMedioDeContratacion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
