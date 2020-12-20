CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `team2`@`%` 
    SQL SECURITY DEFINER
VIEW `popular_events` AS
    SELECT 
        `event`.`event_date` AS `event_date`,
        `event`.`event_type` AS `event_type`,
        COUNT(`attendance`.`person_id`) AS `visitors`
    FROM
        (`event`
        JOIN `attendance` ON ((`event`.`id` = `attendance`.`event_id`)))
    GROUP BY `event`.`event_type`
    ORDER BY COUNT(`attendance`.`person_id`) DESC