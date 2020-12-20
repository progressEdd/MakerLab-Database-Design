CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `team2`@`%` 
    SQL SECURITY DEFINER
VIEW `staff_conversion` AS
    SELECT 
        `timesheet`.`employee_person_id` AS `employee_person_id`,
        `person`.`first_name` AS `first_name`,
        `person`.`last_name` AS `last_name`,
        `employee`.`postion` AS `postion`,
        SUM((TIME_TO_SEC(TIMEDIFF(`timesheet`.`end_datetime`,
                        `timesheet`.`start_datetime`)) / 3600)) AS `tot_hours`,
        `employee`.`start_date` AS `start_date`,
        `employee`.`end_date` AS `end_date`
    FROM
        ((`person`
        JOIN `employee` ON ((`person`.`id` = `employee`.`person_id`)))
        JOIN `timesheet` ON ((`employee`.`person_id` = `timesheet`.`employee_person_id`)))
    WHERE
        (`timesheet`.`employee_person_id` = (SELECT 
                `timesheet`.`employee_person_id`
            FROM
                `timesheet`
            WHERE
                (`timesheet`.`notes` = 'Promoted to Guru')))
    GROUP BY `timesheet`.`employee_person_id`