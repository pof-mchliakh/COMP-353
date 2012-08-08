SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `rentrack_development` ;
CREATE SCHEMA IF NOT EXISTS `rentrack_development` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `rentrack_development` ;

-- -----------------------------------------------------
-- Table `rentrack_development`.`address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentrack_development`.`address` ;

CREATE  TABLE IF NOT EXISTS `rentrack_development`.`address` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `street_name` VARCHAR(255) NOT NULL ,
  `city` VARCHAR(255) NOT NULL ,
  `postal_code` VARCHAR(6) NOT NULL ,
  `created_at` DATETIME NULL ,
  `updated_at` DATETIME NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentrack_development`.`person`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentrack_development`.`person` ;

CREATE  TABLE IF NOT EXISTS `rentrack_development`.`person` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `first_name` VARCHAR(255) NOT NULL ,
  `last_name` VARCHAR(255) NOT NULL ,
  `telephone` CHAR(10) NOT NULL ,
  `street_number` INT UNSIGNED NOT NULL ,
  `apt` VARCHAR(255) NULL ,
  `address_id` INT UNSIGNED NOT NULL ,
  `created_at` DATETIME NULL ,
  `updated_at` DATETIME NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_person_address_address_id` (`address_id` ASC) ,
  CONSTRAINT `fk_person_address_address_id`
    FOREIGN KEY (`address_id` )
    REFERENCES `rentrack_development`.`address` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentrack_development`.`client`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentrack_development`.`client` ;

CREATE  TABLE IF NOT EXISTS `rentrack_development`.`client` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `person_id` INT UNSIGNED NOT NULL ,
  `created_at` DATETIME NULL ,
  `updated_at` DATETIME NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_client_person_person_id` (`person_id` ASC) ,
  CONSTRAINT `fk_client_person_person_id`
    FOREIGN KEY (`person_id` )
    REFERENCES `rentrack_development`.`person` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentrack_development`.`driver`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentrack_development`.`driver` ;

CREATE  TABLE IF NOT EXISTS `rentrack_development`.`driver` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `person_id` INT UNSIGNED NOT NULL ,
  `created_at` DATETIME NULL ,
  `updated_at` DATETIME NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_driver_person_driver_id` (`person_id` ASC) ,
  CONSTRAINT `fk_driver_person_driver_id`
    FOREIGN KEY (`person_id` )
    REFERENCES `rentrack_development`.`person` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentrack_development`.`truck_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentrack_development`.`truck_type` ;

CREATE  TABLE IF NOT EXISTS `rentrack_development`.`truck_type` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) NOT NULL ,
  `created_at` DATETIME NULL ,
  `updated_at` DATETIME NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentrack_development`.`truck`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentrack_development`.`truck` ;

CREATE  TABLE IF NOT EXISTS `rentrack_development`.`truck` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `truck_type_id` INT UNSIGNED NOT NULL ,
  `created_at` DATETIME NULL ,
  `updated_at` DATETIME NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_truck_truck_type_truck_type_id` (`truck_type_id` ASC) ,
  CONSTRAINT `fk_truck_truck_type_truck_type_id`
    FOREIGN KEY (`truck_type_id` )
    REFERENCES `rentrack_development`.`truck_type` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentrack_development`.`reservation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentrack_development`.`reservation` ;

CREATE  TABLE IF NOT EXISTS `rentrack_development`.`reservation` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `client_id` INT UNSIGNED NOT NULL ,
  `address_id` INT UNSIGNED NOT NULL ,
  `street_number` INT UNSIGNED NOT NULL ,
  `apt` VARCHAR(255) NULL ,
  `appointment_date` DATETIME NOT NULL ,
  `expected_end_time` DATETIME NOT NULL ,
  `created_at` DATETIME NULL ,
  `updated_at` DATETIME NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_reservation_client_client_id` (`client_id` ASC) ,
  INDEX `fk_reservation_address_address_id` (`address_id` ASC) ,
  CONSTRAINT `fk_reservation_client_client_id`
    FOREIGN KEY (`client_id` )
    REFERENCES `rentrack_development`.`client` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reservation_address_address_id`
    FOREIGN KEY (`address_id` )
    REFERENCES `rentrack_development`.`address` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentrack_development`.`mission`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentrack_development`.`mission` ;

CREATE  TABLE IF NOT EXISTS `rentrack_development`.`mission` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `driver_id` INT UNSIGNED NOT NULL ,
  `truck_id` INT UNSIGNED NOT NULL ,
  `reservation_id` INT UNSIGNED NOT NULL ,
  `expected_start_time` DATETIME NOT NULL ,
  `expected_end_time` DATETIME NOT NULL ,
  `created_at` DATETIME NULL ,
  `updated_at` DATETIME NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_mission_truck_truck_id` (`truck_id` ASC) ,
  INDEX `fk_mission_reservation_reservation_id` (`reservation_id` ASC) ,
  CONSTRAINT `fk_mission_driver_driver_id`
    FOREIGN KEY (`driver_id` )
    REFERENCES `rentrack_development`.`driver` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_mission_truck_truck_id`
    FOREIGN KEY (`truck_id` )
    REFERENCES `rentrack_development`.`truck` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_mission_reservation_reservation_id`
    FOREIGN KEY (`reservation_id` )
    REFERENCES `rentrack_development`.`reservation` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentrack_development`.`mission_sheet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentrack_development`.`mission_sheet` ;

CREATE  TABLE IF NOT EXISTS `rentrack_development`.`mission_sheet` (
  `mission_id` INT UNSIGNED NOT NULL ,
  `actual_start_time` DATETIME NOT NULL ,
  `actual_end_time` DATETIME NOT NULL ,
  `start_odometer` INT UNSIGNED NOT NULL ,
  `end_odometer` INT UNSIGNED NOT NULL ,
  `created_at` DATETIME NULL ,
  `updated_at` DATETIME NULL ,
  PRIMARY KEY (`mission_id`) ,
  INDEX `fk_mission_sheet_mission_mission_id` (`mission_id` ASC) ,
  CONSTRAINT `fk_mission_sheet_mission_mission_id`
    FOREIGN KEY (`mission_id` )
    REFERENCES `rentrack_development`.`mission` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentrack_development`.`invoice`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentrack_development`.`invoice` ;

CREATE  TABLE IF NOT EXISTS `rentrack_development`.`invoice` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `reservation_id` INT UNSIGNED NOT NULL ,
  `date` DATE NOT NULL ,
  `created_at` DATETIME NULL ,
  `updated_at` DATETIME NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_invoice_reservation_reservation_id` (`reservation_id` ASC) ,
  CONSTRAINT `fk_invoice_reservation_reservation_id`
    FOREIGN KEY (`reservation_id` )
    REFERENCES `rentrack_development`.`reservation` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentrack_development`.`tax_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentrack_development`.`tax_type` ;

CREATE  TABLE IF NOT EXISTS `rentrack_development`.`tax_type` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) NOT NULL ,
  `created_at` DATETIME NULL ,
  `updated_at` DATETIME NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentrack_development`.`tax`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentrack_development`.`tax` ;

CREATE  TABLE IF NOT EXISTS `rentrack_development`.`tax` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `start_date` DATETIME NOT NULL ,
  `end_date` DATETIME NOT NULL ,
  `percentage` FLOAT NOT NULL ,
  `tax_type_id` INT UNSIGNED NOT NULL ,
  `created_at` DATETIME NULL ,
  `updated_at` DATETIME NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_tax_tax_type_tax_type_id` (`tax_type_id` ASC) ,
  CONSTRAINT `fk_tax_tax_type_tax_type_id`
    FOREIGN KEY (`tax_type_id` )
    REFERENCES `rentrack_development`.`tax_type` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentrack_development`.`invoice_tax`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentrack_development`.`invoice_tax` ;

CREATE  TABLE IF NOT EXISTS `rentrack_development`.`invoice_tax` (
  `invoice_id` INT UNSIGNED NOT NULL ,
  `tax_id` INT UNSIGNED NOT NULL ,
  `created_at` DATETIME NULL ,
  `updated_at` DATETIME NULL ,
  PRIMARY KEY (`invoice_id`, `tax_id`) ,
  INDEX `fk_invoice_tax_invoice_invoice_id` (`invoice_id` ASC) ,
  INDEX `fk_invoice_tax_tax_tax_id` (`tax_id` ASC) ,
  CONSTRAINT `fk_invoice_tax_invoice_invoice_id`
    FOREIGN KEY (`invoice_id` )
    REFERENCES `rentrack_development`.`invoice` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoice_tax_tax_tax_id`
    FOREIGN KEY (`tax_id` )
    REFERENCES `rentrack_development`.`tax` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentrack_development`.`cost_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentrack_development`.`cost_type` ;

CREATE  TABLE IF NOT EXISTS `rentrack_development`.`cost_type` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) NOT NULL ,
  `created_at` DATETIME NULL ,
  `updated_at` DATETIME NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentrack_development`.`cost`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentrack_development`.`cost` ;

CREATE  TABLE IF NOT EXISTS `rentrack_development`.`cost` (
  `truck_type_id` INT UNSIGNED NOT NULL ,
  `cost_type_id` INT UNSIGNED NOT NULL ,
  `amt` DECIMAL(10,2) NOT NULL ,
  `created_at` DATETIME NULL ,
  `updated_at` DATETIME NULL ,
  INDEX `fk_cost_truck_type_truck_type_id` (`truck_type_id` ASC) ,
  INDEX `fk_cost_cost_type_cost_type_id` (`cost_type_id` ASC) ,
  CONSTRAINT `fk_cost_truck_type_truck_type_id`
    FOREIGN KEY (`truck_type_id` )
    REFERENCES `rentrack_development`.`truck_type` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cost_cost_type_cost_type_id`
    FOREIGN KEY (`cost_type_id` )
    REFERENCES `rentrack_development`.`cost_type` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentrack_development`.`payment_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentrack_development`.`payment_type` ;

CREATE  TABLE IF NOT EXISTS `rentrack_development`.`payment_type` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) NOT NULL ,
  `created_at` DATETIME NULL ,
  `updated_at` DATETIME NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentrack_development`.`payment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentrack_development`.`payment` ;

CREATE  TABLE IF NOT EXISTS `rentrack_development`.`payment` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `invoice_id` INT UNSIGNED NOT NULL ,
  `payment_type_id` INT UNSIGNED NOT NULL ,
  `amt` DECIMAL(10,2) NOT NULL ,
  `created_at` DATETIME NULL ,
  `updated_at` DATETIME NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_payment_invoice_invoice_id` (`invoice_id` ASC) ,
  INDEX `fk_payment_payment_type_payment_type_id` (`payment_type_id` ASC) ,
  CONSTRAINT `fk_payment_invoice_invoice_id`
    FOREIGN KEY (`invoice_id` )
    REFERENCES `rentrack_development`.`invoice` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_payment_payment_type_payment_type_id`
    FOREIGN KEY (`payment_type_id` )
    REFERENCES `rentrack_development`.`payment_type` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentrack_development`.`license_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentrack_development`.`license_type` ;

CREATE  TABLE IF NOT EXISTS `rentrack_development`.`license_type` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) NOT NULL ,
  `created_at` DATETIME NULL ,
  `updated_at` DATETIME NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentrack_development`.`driver_license_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentrack_development`.`driver_license_type` ;

CREATE  TABLE IF NOT EXISTS `rentrack_development`.`driver_license_type` (
  `driver_id` INT UNSIGNED NOT NULL ,
  `license_type_id` INT UNSIGNED NOT NULL ,
  `created_at` DATETIME NULL ,
  `updated_at` DATETIME NULL ,
  PRIMARY KEY (`driver_id`, `license_type_id`) ,
  INDEX `fk_driver_license_type_license_type_license_type_id` (`license_type_id` ASC) ,
  INDEX `fk_driver_license_type_driver_driver_id` (`driver_id` ASC) ,
  CONSTRAINT `fk_driver_license_type_license_type_license_type_id`
    FOREIGN KEY (`license_type_id` )
    REFERENCES `rentrack_development`.`license_type` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_driver_license_type_driver_driver_id`
    FOREIGN KEY (`driver_id` )
    REFERENCES `rentrack_development`.`driver` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

