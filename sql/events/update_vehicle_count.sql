DELIMITER $$

CREATE EVENT IF NOT EXISTS update_vehicle_count_by_signal
ON SCHEDULE EVERY 5 SECOND
DO
BEGIN
    -- GREEN signals: cars pass through (reduce count)
    UPDATE traffic_signal
    SET vehicle_count = GREATEST(vehicle_count - FLOOR(1 + RAND() * 5), 0)
    WHERE signal_colour = 'GREEN'
      AND intersection_id = (SELECT intersection_id FROM intersection WHERE location='Main Street & 1st Avenue');

    -- RED signals: cars accumulate (increase count)
    UPDATE traffic_signal
    SET vehicle_count = vehicle_count + FLOOR(1 + RAND() * 5)
    WHERE signal_colour = 'RED'
      AND intersection_id = (SELECT intersection_id FROM intersection WHERE location='Main Street & 1st Avenue');
END$$

DELIMITER ;
