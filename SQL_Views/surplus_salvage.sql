CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `team2`@`%` 
    SQL SECURITY DEFINER
VIEW `surplus_salvage` AS
    SELECT 
        `maintenance`.`equipment_p_code` AS `equipment_p_code`,
        `equipment`.`equipment_type` AS `equipment_type`,
        `maintenance`.`maint_desc` AS `maint_desc`
    FROM
        ((`maintenance`
        JOIN `equipment` ON ((`maintenance`.`equipment_p_code` = `equipment`.`p_code`)))
        JOIN `surplus` ON ((`equipment`.`p_code` = `surplus`.`p_code`)))
    WHERE
        (NOT ((`maintenance`.`maint_desc` LIKE `surplus`.`reason`)))