CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `team2`@`%` 
    SQL SECURITY DEFINER
VIEW `order_totals` AS
    SELECT 
        `order`.`id` AS `id`,
        SUM(`line`.`units`) AS `tot_units`,
        SUM((`line`.`units` * `product`.`price_per_unit_sale`)) AS `tot_cost`
    FROM
        ((`order`
        JOIN `line` ON ((`order`.`id` = `line`.`order_id`)))
        JOIN `product` ON ((`line`.`product_id` = `product`.`id`)))
    GROUP BY `order`.`id`
    ORDER BY `order`.`id`