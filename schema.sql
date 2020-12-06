CREATE TABLE `attendance` (
  `event_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`person_id`,`event_id`),
  KEY `fk_event_has_person_person1_idx` (`person_id`),
  KEY `fk_event_has_person_event1_idx` (`event_id`),
  CONSTRAINT `fk_event_has_person_event1` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_has_person_person1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `birthday` (
  `event_person_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `number_attendees` int(11) DEFAULT NULL,
  KEY `fk_birthday_event1_idx` (`event_id`),
  CONSTRAINT `fk_birthday_event1` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `donations` (
  `donor_patron_person_id` int(11) NOT NULL,
  `date` varchar(45) DEFAULT NULL,
  `item_name` varchar(45) DEFAULT NULL,
  `item_desc` longtext,
  `value` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`donor_patron_person_id`),
  CONSTRAINT `fk_donations_donor1` FOREIGN KEY (`donor_patron_person_id`) REFERENCES `donor` (`patron_person_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `donor` (
  `patron_person_id` int(11) NOT NULL,
  `organization` varchar(45) DEFAULT NULL,
  KEY `fk_donor_patron1_idx` (`patron_person_id`),
  CONSTRAINT `fk_donor_patron1` FOREIGN KEY (`patron_person_id`) REFERENCES `patron` (`person_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `employee` (
  `person_id` int(11) NOT NULL,
  `employee_type` varchar(45) DEFAULT NULL,
  `hourly_wage` varchar(45) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `school_year` varchar(45) DEFAULT NULL,
  `major` varchar(45) DEFAULT NULL,
  `postion` varchar(45) DEFAULT NULL,
  KEY `fk_Employee_person_idx` (`person_id`),
  CONSTRAINT `fk_Employee_person` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `equipment` (
  `p_code` int(11) NOT NULL,
  `equipment_desc` varchar(45) DEFAULT NULL,
  `equipment_type` varchar(45) DEFAULT NULL,
  `equipment_note` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`p_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `event_type` varchar(45) DEFAULT NULL,
  `event_date` datetime DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_event_person1_idx` (`person_id`),
  CONSTRAINT `fk_event_person1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `line` (
  `units` int(11) DEFAULT NULL,
  `weight` varchar(45) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  KEY `fk_line_inventory1_idx` (`product_id`),
  KEY `fk_line_order1_idx` (`order_id`),
  CONSTRAINT `fk_line_inventory1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_line_order1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `maintenance` (
  `maint_id` int(11) NOT NULL,
  `equipment_p_code` int(11) NOT NULL,
  `employee_person_id` int(11) DEFAULT NULL,
  `maint_date` varchar(45) DEFAULT NULL,
  `maint_desc` longtext,
  PRIMARY KEY (`maint_id`),
  KEY `fk_maintenance_equipment1_idx` (`equipment_p_code`),
  KEY `fk_maintenance_employee1_idx` (`employee_person_id`),
  CONSTRAINT `fk_maintenance_employee1` FOREIGN KEY (`employee_person_id`) REFERENCES `employee` (`person_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_maintenance_equipment1` FOREIGN KEY (`equipment_p_code`) REFERENCES `equipment` (`p_code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `material` (
  `material_id` int(11) NOT NULL,
  `material_name` varchar(45) DEFAULT NULL,
  `material_desc` longtext,
  `donations_donor_patron_person_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`material_id`),
  KEY `fk_material_donations1_idx` (`donations_donor_patron_person_id`),
  CONSTRAINT `fk_material_donations1` FOREIGN KEY (`donations_donor_patron_person_id`) REFERENCES `donations` (`donor_patron_person_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `new_view`
--


SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `new_view` AS SELECT 
 1 AS `id`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `email`,
 1 AS `UIN`,
 1 AS `category`,
 1 AS `college`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `order_date` datetime DEFAULT NULL,
  `estimated_completion` varchar(45) DEFAULT NULL,
  `delivery_method` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_person1_idx` (`person_id`),
  CONSTRAINT `fk_order_person1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `payment_date` varchar(45) DEFAULT NULL,
  `amount_paid` varchar(45) DEFAULT NULL,
  `payment_method` varchar(45) DEFAULT NULL,
  `billing_address` varchar(45) DEFAULT NULL,
  `shipping_address` varchar(45) DEFAULT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  `down_payment` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_payment_order1_idx` (`order_id`),
  CONSTRAINT `fk_payment_order1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `person` (
  `id` int(11) NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `UIN` varchar(45) DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  `college` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `second` (`id`,`first_name`,`last_name`,`email`,`UIN`,`category`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `product_name` varchar(45) DEFAULT NULL,
  `desc` varchar(45) DEFAULT NULL,
  `minimum` varchar(45) DEFAULT NULL,
  `price_per_unit_sale` decimal(10,0) DEFAULT NULL,
  `QOH` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `purchase` (
  `id` int(11) NOT NULL,
  `date` varchar(45) DEFAULT NULL,
  `price_per_unit` decimal(10,0) DEFAULT NULL,
  `material_material_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `equipment_p_code` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_purchase_material1_idx` (`material_material_id`),
  KEY `fk_purchase_vendor1_idx` (`vendor_id`),
  KEY `fk_purchase_Product1_idx` (`product_id`),
  KEY `fk_purchase_equipment1_idx` (`equipment_p_code`),
  CONSTRAINT `fk_purchase_Product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_equipment1` FOREIGN KEY (`equipment_p_code`) REFERENCES `equipment` (`p_code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_material1` FOREIGN KEY (`material_material_id`) REFERENCES `material` (`material_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_vendor1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `surplus` (
  `p_code` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `reason` varchar(45) DEFAULT NULL,
  KEY `fk_surplus_equipment1` (`p_code`),
  CONSTRAINT `fk_surplus_equipment1` FOREIGN KEY (`p_code`) REFERENCES `equipment` (`p_code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `timesheet` (
  `employee_person_id` int(11) NOT NULL,
  `start_datetime` datetime DEFAULT NULL,
  `end_datetime` datetime DEFAULT NULL,
  `notes` longtext,
  `project` varchar(45) DEFAULT NULL,
  KEY `fk_timesheet_employee1_idx` (`employee_person_id`),
  CONSTRAINT `fk_timesheet_employee1` FOREIGN KEY (`employee_person_id`) REFERENCES `employee` (`person_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `vendor` (
  `id` int(11) NOT NULL,
  `company` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `contact` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

