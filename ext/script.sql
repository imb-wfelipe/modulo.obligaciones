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
-- Table `mydb`.`oc_proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`oc_proveedor` (
  `id` INT NOT NULL,
  `codigo` VARCHAR(45) NOT NULL,
  `razsoc` VARCHAR(200) CHARACTER SET 'armscii8' NOT NULL COMMENT 'Razon Social',
  `ruc` VARCHAR(11) NOT NULL,
  `dir1` VARCHAR(100) NULL,
  `dir2` VARCHAR(100) NULL,
  `tel1` VARCHAR(20) NULL,
  `tel2` VARCHAR(20) NULL,
  `correo` VARCHAR(50) NULL,
  `nomcon` VARCHAR(150) NULL COMMENT 'Contacto comercial de la empresa',
  `ctapri` VARCHAR(45) NOT NULL COMMENT 'Cuenta principal',
  `banpri` INT NOT NULL COMMENT 'Banco Principal',
  `ctadet` VARCHAR(45) NULL COMMENT 'Cuenta de detracciones',
  `bandet` INT NULL COMMENT 'Banco de la cuenta de detracciones',
  `compania` INT NULL COMMENT 'El proveedor puede estar registrado dentro de una compañía en partícular.',
  `proyecto` INT NULL COMMENT 'El proveedor puede estar registrado dentro de un proyecto en particular.',
  `nomcom` VARCHAR(100) NULL COMMENT 'Nombre Comercial\n',
  `user_created` VARCHAR(50) NULL,
  `date_created` DATETIME NULL,
  `user_updated` VARCHAR(50) NULL,
  `date_updated` DATETIME NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `ctapri_UNIQUE` (`ctapri` ASC) VISIBLE,
  UNIQUE INDEX `banpri_UNIQUE` (`banpri` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`oc_concepto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`oc_concepto` (
  `id` INT NOT NULL,
  `codigo` VARCHAR(20) NOT NULL,
  `nombre` VARCHAR(150) NOT NULL,
  `descripcion` VARCHAR(200) NULL,
  `unimed` VARCHAR(50) NOT NULL,
  `compania` INT NULL,
  `proyecto` INT NULL,
  `user_created` VARCHAR(100) NULL,
  `date_created` DATETIME NULL,
  `user_updated` VARCHAR(100) NULL,
  `date_updated` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`oc_orden`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`oc_orden` (
  `id` INT NOT NULL,
  `proveedor` INT NOT NULL,
  `concepto` INT NOT NULL,
  `numero` INT NOT NULL,
  `tipo` INT NOT NULL,
  `moneda` INT NOT NULL,
  `condpago` INT NOT NULL,
  `observaciones` TEXT NOT NULL,
  `estado` INT NOT NULL,
  `fecemi` DATETIME NOT NULL,
  `fecpropag` DATETIME NULL,
  `fecven` DATETIME NULL,
  `fecanu` DATETIME NULL,
  `abono` DECIMAL(14,2) NULL,
  `fecpag` DATETIME NULL,
  `cantidad` INT NOT NULL,
  `precio1` DECIMAL(14,2) NOT NULL,
  `precio2` DECIMAL(14,2) NULL,
  `decimal1` DECIMAL(14,2) NULL,
  `subtotal` DECIMAL(14,2) NOT NULL,
  `decimal2` DECIMAL(14,2) NULL,
  `total` DECIMAL(14,2) NOT NULL,
  `compania` INT NOT NULL,
  `proyecto` INT NULL,
  `user_created` VARCHAR(50) NULL,
  `date_created` DATETIME NULL,
  `user_updated` VARCHAR(50) NULL,
  `date_updated` DATETIME NULL,
  PRIMARY KEY (`id`, `proveedor`, `concepto`),
  INDEX `fk_oc_orden_oc_proveedor_idx` (`proveedor` ASC) VISIBLE,
  INDEX `fk_oc_orden_oc_concepto1_idx` (`concepto` ASC) VISIBLE,
  CONSTRAINT `fk_oc_orden_oc_proveedor`
    FOREIGN KEY (`proveedor`)
    REFERENCES `mydb`.`oc_proveedor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_oc_orden_oc_concepto1`
    FOREIGN KEY (`concepto`)
    REFERENCES `mydb`.`oc_concepto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
