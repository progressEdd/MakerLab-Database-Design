CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `team2`@`%` 
    SQL SECURITY DEFINER
VIEW `maintenance_log` AS
    SELECT 
        `equipment`.`equipment_type` AS `equipment_type`,
        `maintenance`.`equipment_p_code` AS `equipment_p_code`,
        `maintenance`.`maint_desc` AS `maint_desc`,
        `maintenance`.`maint_date` AS `maint_date`,
        `person`.`first_name` AS `first_name`,
        `person`.`last_name` AS `last_name`,
        `employee`.`postion` AS `postion`
    FROM
        (((`person`
        JOIN `employee` ON ((`person`.`id` = `employee`.`person_id`)))
        JOIN `maintenance` ON ((`employee`.`person_id` = `maintenance`.`employee_person_id`)))
        JOIN `equipment` ON ((`maintenance`.`equipment_p_code` = `equipment`.`p_code`)))
    ORDER BY `maintenance`.`maint_date` DESC