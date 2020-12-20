CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `team2`@`%` 
    SQL SECURITY DEFINER
VIEW `birthday_party` AS
    SELECT 
        `person`.`first_name` AS `first_name`,
        `person`.`last_name` AS `last_name`,
        `person`.`email` AS `email`,
        `person`.`college` AS `college`,
        `person`.`category` AS `category`,
        `attendance`.`person_id` AS `person_id`,
        `attendance`.`event_id` AS `event_id`,
        `attendance`.`role` AS `role`,
        `event`.`event_type` AS `event_type`,
        `event`.`event_date` AS `event_date`,
        `birthday`.`number_attendees` AS `number_attendees`
    FROM
        (((`person`
        JOIN `attendance` ON ((`person`.`id` = `attendance`.`person_id`)))
        JOIN `event` ON ((`attendance`.`event_id` = `event`.`id`)))
        JOIN `birthday` ON ((`event`.`id` = `birthday`.`event_id`)))