CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `team2`@`%` 
    SQL SECURITY DEFINER
VIEW `top_donor` AS
    SELECT 
        `donor`.`organization` AS `organization`,
        COUNT(`donor`.`organization`) AS `donations`,
        SUM(`donation`.`value`) AS `total_sum`
    FROM
        ((`person`
        JOIN `donor` ON ((`person`.`id` = `donor`.`person_id`)))
        JOIN `donation` ON ((`donation`.`donor_id` = `donor`.`id`)))
    GROUP BY `donor`.`organization`
    ORDER BY SUM(`donation`.`value`) DESC