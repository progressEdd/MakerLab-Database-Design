CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `team2`@`%` 
    SQL SECURITY DEFINER
VIEW `specific_donor` AS
    SELECT 
        `donor`.`person_id` AS `person_id`,
        `person`.`first_name` AS `first_name`,
        `person`.`last_name` AS `last_name`,
        `donor`.`organization` AS `organization`,
        `donation`.`date` AS `date`,
        `donation`.`item_name` AS `item_name`,
        `donation`.`item_desc` AS `item_desc`,
        `donation`.`value` AS `value`
    FROM
        ((`person`
        JOIN `donor` ON ((`person`.`id` = `donor`.`person_id`)))
        JOIN `donation` ON ((`donation`.`donor_id` = `donor`.`id`)))
    WHERE
        (`donor`.`id` = 1010)