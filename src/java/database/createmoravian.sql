-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema moravian
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema moravian
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `moravian` DEFAULT CHARACTER SET utf8 ;
USE `moravian` ;

-- -----------------------------------------------------
-- Table `moravian`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `moravian`.`customer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(225) NOT NULL,
  `lastname` VARCHAR(255) NOT NULL,
  `addressline1` VARCHAR(225) NOT NULL,
  `addressline2` VARCHAR(225) NOT NULL,
  `city` VARCHAR(225) NOT NULL,
  `postcode` VARCHAR(255) NOT NULL,
  `country` VARCHAR(255) NOT NULL,
  `company` VARCHAR(225) NOT NULL,
  `creditcardexpiry` VARCHAR(225) NOT NULL,
  `creditcardnumber` VARCHAR(225) NOT NULL,
  `creditcardtype` VARCHAR(225) NOT NULL,
  `emailaddress` VARCHAR(255) NOT NULL,
  `loginpassword` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `moravian`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `moravian`.`category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `moravian`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `moravian`.`product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(45) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `price` DOUBLE NOT NULL,
  `description` VARCHAR(255) NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_product_category1_idx` (`category_id` ASC),
  CONSTRAINT `fk_product_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `moravian`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `moravian`.`customer_order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `moravian`.`customer_order` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `amount` DECIMAL(6,2) NOT NULL,
  `orderdate` DATETIME NOT NULL,
  `confirmation_number` INT NOT NULL,
  `customer_customerid` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_order_customer1_idx` (`customer_customerid` ASC),
  CONSTRAINT `fk_order_customer1`
    FOREIGN KEY (`customer_customerid`)
    REFERENCES `moravian`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `moravian`.`ordered_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `moravian`.`ordered_product` (
  `customer_order_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `quantity` SMALLINT(4) NOT NULL,
  PRIMARY KEY (`customer_order_id`, `product_id`),
  INDEX `fk_customer_order_has_product_product1_idx` (`product_id` ASC),
  INDEX `fk_customer_order_has_product_customer_order1_idx` (`customer_order_id` ASC),
  CONSTRAINT `fk_customer_order_has_product_customer_order1`
    FOREIGN KEY (`customer_order_id`)
    REFERENCES `moravian`.`customer_order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customer_order_has_product_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `moravian`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
