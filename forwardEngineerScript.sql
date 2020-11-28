-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema team2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema team2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `team2` ;
USE `team2` ;

-- -----------------------------------------------------
-- Table `team2`.`person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team2`.`person` (
  `id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `UIN` VARCHAR(45) NULL,
  `category` VARCHAR(45) NULL,
  `college` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `second` (`id` ASC, `first_name` ASC, `last_name` ASC, `email` ASC, `UIN` ASC, `category` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `team2`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team2`.`employee` (
  `person_id` INT NOT NULL,
  `employee_type` VARCHAR(45) NULL,
  `hourly_wage` VARCHAR(45) NULL,
  `start_date` DATE NULL,
  `end_date` DATE NULL,
  `school_year` VARCHAR(45) NULL,
  `major` VARCHAR(45) NULL,
  `postion` VARCHAR(45) NULL,
  INDEX `fk_Employee_person_idx` (`person_id` ASC) ,
  CONSTRAINT `fk_Employee_person`
    FOREIGN KEY (`person_id`)
    REFERENCES `team2`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `team2`.`patron`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team2`.`patron` (
  `person_id` INT NOT NULL,
  `designation` VARCHAR(45) NULL,
  INDEX `fk_Employee_person_idx` (`person_id` ASC) ,
  CONSTRAINT `fk_Employee_person0`
    FOREIGN KEY (`person_id`)
    REFERENCES `team2`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `team2`.`timesheet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team2`.`timesheet` (
  `employee_person_id` INT NOT NULL,
  `start_datetime` DATETIME NULL,
  `end_datetime` DATETIME NULL,
  `notes` LONGTEXT NULL,
  `project` VARCHAR(45) NULL,
  INDEX `fk_timesheet_employee1_idx` (`employee_person_id` ASC) ,
  CONSTRAINT `fk_timesheet_employee1`
    FOREIGN KEY (`employee_person_id`)
    REFERENCES `team2`.`employee` (`person_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `team2`.`donor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team2`.`donor` (
  `patron_person_id` INT NOT NULL,
  `organization` VARCHAR(45) NULL,
  INDEX `fk_donor_patron1_idx` (`patron_person_id` ASC) ,
  CONSTRAINT `fk_donor_patron1`
    FOREIGN KEY (`patron_person_id`)
    REFERENCES `team2`.`patron` (`person_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `team2`.`donations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team2`.`donations` (
  `donor_patron_person_id` INT NOT NULL,
  `date` VARCHAR(45) NULL,
  `item_name` VARCHAR(45) NULL,
  `item_desc` LONGTEXT NULL,
  `value` VARCHAR(45) NULL,
  PRIMARY KEY (`donor_patron_person_id`),
  CONSTRAINT `fk_donations_donor1`
    FOREIGN KEY (`donor_patron_person_id`)
    REFERENCES `team2`.`donor` (`patron_person_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `team2`.`event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team2`.`event` (
  `id` INT NOT NULL,
  `person_id` INT NOT NULL,
  `event_type` VARCHAR(45) NULL,
  `event_date` DATETIME NULL,
  `role` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_event_person1_idx` (`person_id` ASC) ,
  CONSTRAINT `fk_event_person1`
    FOREIGN KEY (`person_id`)
    REFERENCES `team2`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `team2`.`birthday`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team2`.`birthday` (
  `event_person_id` INT NOT NULL,
  `event_id` INT NOT NULL,
  `number_attendees` VARCHAR(45) NULL,
  INDEX `fk_birthday_event1_idx` (`event_id` ASC, `event_person_id` ASC) ,
  CONSTRAINT `fk_birthday_event1`
    FOREIGN KEY (`event_id` , `event_person_id`)
    REFERENCES `team2`.`event` (`id` , `person_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `team2`.`equipment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team2`.`equipment` (
  `p_code` INT NOT NULL,
  `equipment_desc` VARCHAR(45) NULL,
  `equipment_type` VARCHAR(45) NULL,
  `equipment_note` VARCHAR(45) NULL,
  PRIMARY KEY (`p_code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `team2`.`maintenance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team2`.`maintenance` (
  `maint_id` INT NOT NULL,
  `equipment_p_code` INT NOT NULL,
  `employee_person_id` INT NULL,
  `maint_date` VARCHAR(45) NULL,
  `maint_desc` LONGTEXT NULL,
  PRIMARY KEY (`maint_id`),
  INDEX `fk_maintenance_equipment1_idx` (`equipment_p_code` ASC) ,
  INDEX `fk_maintenance_employee1_idx` (`employee_person_id` ASC) ,
  CONSTRAINT `fk_maintenance_equipment1`
    FOREIGN KEY (`equipment_p_code`)
    REFERENCES `team2`.`equipment` (`p_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_maintenance_employee1`
    FOREIGN KEY (`employee_person_id`)
    REFERENCES `team2`.`employee` (`person_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `team2`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team2`.`product` (
  `id` INT NOT NULL,
  `product_name` VARCHAR(45) NULL,
  `desc` VARCHAR(45) NULL,
  `minimum` VARCHAR(45) NULL,
  `price_per_unit_sale` DECIMAL NULL,
  `QOH` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `team2`.`material`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team2`.`material` (
  `material_id` INT NOT NULL,
  `material_name` VARCHAR(45) NULL,
  `material_desc` LONGTEXT NULL,
  `donations_donor_patron_person_id` INT NULL,
  PRIMARY KEY (`material_id`),
  INDEX `fk_material_donations1_idx` (`donations_donor_patron_person_id` ASC) ,
  CONSTRAINT `fk_material_donations1`
    FOREIGN KEY (`donations_donor_patron_person_id`)
    REFERENCES `team2`.`donations` (`donor_patron_person_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `team2`.`vendor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team2`.`vendor` (
  `id` INT NOT NULL,
  `company` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `contact` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `team2`.`purchase`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team2`.`purchase` (
  `id` INT NOT NULL,
  `date` VARCHAR(45) NULL,
  `price_per_unit` DECIMAL NULL,
  `material_material_id` INT NOT NULL,
  `vendor_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `equipment_p_code` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_purchase_material1_idx` (`material_material_id` ASC) ,
  INDEX `fk_purchase_vendor1_idx` (`vendor_id` ASC) ,
  INDEX `fk_purchase_Product1_idx` (`product_id` ASC) ,
  INDEX `fk_purchase_equipment1_idx` (`equipment_p_code` ASC) ,
  CONSTRAINT `fk_purchase_material1`
    FOREIGN KEY (`material_material_id`)
    REFERENCES `team2`.`material` (`material_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_vendor1`
    FOREIGN KEY (`vendor_id`)
    REFERENCES `team2`.`vendor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_Product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `team2`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_equipment1`
    FOREIGN KEY (`equipment_p_code`)
    REFERENCES `team2`.`equipment` (`p_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `team2`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team2`.`student` (
  `idstudent` INT NOT NULL,
  `f_name` VARCHAR(45) NOT NULL,
  `l_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idstudent`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `team2`.`course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team2`.`course` (
  `idcourse` INT NOT NULL,
  `course_name` VARCHAR(45) NULL,
  `student_idstudent` INT NOT NULL,
  PRIMARY KEY (`idcourse`, `student_idstudent`),
  INDEX `fk_course_student_idx` (`student_idstudent` ASC) ,
  CONSTRAINT `fk_course_student`
    FOREIGN KEY (`student_idstudent`)
    REFERENCES `team2`.`student` (`idstudent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `team2`.`professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team2`.`professor` (
  `idprofessor` INT NOT NULL,
  `f_name` VARCHAR(45) NULL,
  `l_name` VARCHAR(45) NULL,
  PRIMARY KEY (`idprofessor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `team2`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team2`.`department` (
  `iddepartment` INT NOT NULL,
  PRIMARY KEY (`iddepartment`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `team2`.`subscription`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team2`.`subscription` (
  `subscription_id` INT NOT NULL,
  PRIMARY KEY (`subscription_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `team2`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team2`.`Customers` (
  `customer_id` INT NOT NULL,
  `email` VARCHAR(45) NULL,
  `f_name` VARCHAR(45) NULL,
  `l_name` VARCHAR(45) NULL,
  `birthdate` VARCHAR(45) NULL,
  `billing_address` VARCHAR(45) NULL,
  `account_name` VARCHAR(45) NULL,
  `subscription_subscription_id` INT NULL,
  PRIMARY KEY (`customer_id`),
  INDEX `fk_Customers_subscription1_idx` (`subscription_subscription_id` ASC) ,
  CONSTRAINT `fk_Customers_subscription1`
    FOREIGN KEY (`subscription_subscription_id`)
    REFERENCES `team2`.`subscription` (`subscription_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `team2`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team2`.`order` (
  `id` INT NOT NULL,
  `person_id` INT NOT NULL,
  `order_date` DATETIME NULL,
  `estimated_completion` VARCHAR(45) NULL,
  `delivery_method` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_order_person1_idx` (`person_id` ASC) ,
  CONSTRAINT `fk_order_person1`
    FOREIGN KEY (`person_id`)
    REFERENCES `team2`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `team2`.`invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team2`.`invoice` (
  `billing_address` VARCHAR(45) NULL,
  `shipping_address` VARCHAR(45) NULL,
  `total` DECIMAL NULL,
  `down_payment` DECIMAL NULL,
  `line_order_id` INT NOT NULL,
  `line_product_id` INT NOT NULL,
  INDEX `fk_invoice_line1_idx` (`line_order_id` ASC, `line_product_id` ASC) ,
  CONSTRAINT `fk_invoice_line1`
    FOREIGN KEY (`line_order_id` , `line_product_id`)
    REFERENCES `team2`.`line` (`order_id` , `product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `team2`.`shipment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team2`.`shipment` (
  `shipment_id` INT NOT NULL,
  `invoice_id` INT NOT NULL,
  `shipment_date` VARCHAR(45) NULL,
  PRIMARY KEY (`shipment_id`, `invoice_id`),
  INDEX `fk_shipments_invoice1_idx` (`invoice_id` ASC) ,
  CONSTRAINT `fk_shipments_invoice1`
    FOREIGN KEY (`invoice_id`)
    REFERENCES `team2`.`invoice` (`invoice_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `team2`.`vendor1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team2`.`vendor1` (
  `vendor_id` INT NOT NULL,
  `vendor_name` VARCHAR(45) NULL,
  `vendor_address` VARCHAR(45) NULL,
  `vendor_city` VARCHAR(45) NULL,
  `vendor_state` VARCHAR(45) NULL,
  `vendor_phone` VARCHAR(45) NULL,
  PRIMARY KEY (`vendor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `team2`.`purchase1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team2`.`purchase1` (
  `purchase_id` INT NOT NULL,
  `purchase_line` VARCHAR(45) NULL,
  `product_id` VARCHAR(45) NULL,
  `units` VARCHAR(45) NULL,
  `unit_price` VARCHAR(45) NULL,
  `purchase_date` VARCHAR(45) NULL,
  `vendor_vendor_id` INT NOT NULL,
  PRIMARY KEY (`purchase_id`, `vendor_vendor_id`),
  INDEX `fk_purchase_vendor1_idx` (`vendor_vendor_id` ASC) ,
  CONSTRAINT `fk_purchase_vendor1`
    FOREIGN KEY (`vendor_vendor_id`)
    REFERENCES `team2`.`vendor1` (`vendor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `team2`.`applicant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team2`.`applicant` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `hometown` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `ph` VARCHAR(45) NULL,
  `major` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `team2`.`U`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team2`.`U` (
  `applicant_id` INT NOT NULL,
  `h_school` VARCHAR(45) NULL,
  INDEX `fk_U_applicant1_idx` (`applicant_id` ASC) ,
  PRIMARY KEY (`applicant_id`),
  CONSTRAINT `fk_U_applicant1`
    FOREIGN KEY (`applicant_id`)
    REFERENCES `team2`.`applicant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `team2`.`G`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team2`.`G` (
  `applicant_id` INT NOT NULL,
  `u_school` VARCHAR(45) NULL,
  `u_major` VARCHAR(45) NULL,
  `u_GPA` VARCHAR(45) NULL,
  `g_score` VARCHAR(45) NULL,
  INDEX `fk_U_applicant1_idx` (`applicant_id` ASC) ,
  PRIMARY KEY (`applicant_id`),
  CONSTRAINT `fk_U_applicant10`
    FOREIGN KEY (`applicant_id`)
    REFERENCES `team2`.`applicant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `team2`.`line`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team2`.`line` (
  `units` INT NULL,
  `weight` VARCHAR(45) NULL,
  `product_id` INT NULL,
  `order_id` INT NOT NULL,
  INDEX `fk_line_inventory1_idx` (`product_id` ASC) ,
  INDEX `fk_line_order1_idx` (`order_id` ASC) ,
  CONSTRAINT `fk_line_inventory1`
    FOREIGN KEY (`product_id`)
    REFERENCES `team2`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_line_order1`
    FOREIGN KEY (`order_id`)
    REFERENCES `team2`.`order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `team2`.`invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team2`.`invoice` (
  `billing_address` VARCHAR(45) NULL,
  `shipping_address` VARCHAR(45) NULL,
  `total` DECIMAL NULL,
  `down_payment` DECIMAL NULL,
  `line_order_id` INT NOT NULL,
  `line_product_id` INT NOT NULL,
  INDEX `fk_invoice_line1_idx` (`line_order_id` ASC, `line_product_id` ASC) ,
  CONSTRAINT `fk_invoice_line1`
    FOREIGN KEY (`line_order_id` , `line_product_id`)
    REFERENCES `team2`.`line` (`order_id` , `product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `team2`.`surplus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team2`.`surplus` (
  `p_code` INT NULL,
  `date` DATETIME NULL,
  `reason` VARCHAR(45) NULL,
  CONSTRAINT `fk_surplus_equipment1`
    FOREIGN KEY (`p_code`)
    REFERENCES `team2`.`equipment` (`p_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `team2`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team2`.`payment` (
  `id` INT NOT NULL,
  `order_id` INT NOT NULL,
  `payment_date` VARCHAR(45) NULL,
  `amount_paid` VARCHAR(45) NULL,
  `payment_method` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_payment_order1_idx` (`order_id` ASC) ,
  CONSTRAINT `fk_payment_order1`
    FOREIGN KEY (`order_id`)
    REFERENCES `team2`.`order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
