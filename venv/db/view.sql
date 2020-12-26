CREATE OR REPLACE VIEW `cov_data_per_day`
AS SELECT
   `cd`.`id` AS `id`,
   `cd`.`date` AS `date`,
   `cd`.`departament` AS `departament`,(`cd`.`confirmed` - `cd2`.`confirmed`) AS `confirmed`,if((`cd`.`deaths` > `cd2`.`deaths`),(`cd`.`deaths` - `cd2`.`deaths`),0) AS `deaths`,(`cd`.`recovered` - `cd2`.`recovered`) AS `recovered`,(`cd`.`suspects` - `cd2`.`suspects`) AS `suspects`,(`cd`.`discarded` - `cd2`.`discarded`) AS `discarded`,(`cd`.`total` - `cd2`.`total`) AS `total`
FROM (`cov_data` `cd` left join `cov_data` `cd2` on((((`cd2`.`date` + interval 1 day) = `cd`.`date`) and (`cd`.`departament` = `cd2`.`departament`)))) where (`cd2`.`id` is not null);