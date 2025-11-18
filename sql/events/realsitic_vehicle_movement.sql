drop event realistic_vehicle_movement;
DELIMITER $$

CREATE EVENT realistic_vehicle_movement
ON SCHEDULE EVERY 5 SECOND
DO
BEGIN
    -- Cars pass through GREEN signals (5–20 leave)
    UPDATE traffic_signal
    SET vehicle_count = GREATEST(vehicle_count - FLOOR(1 + RAND() * 15), 0)
    WHERE signal_colour = 'GREEN';

    -- Cars accumulate on RED signals (1–10 arrive)
    UPDATE traffic_signal
    SET vehicle_count = vehicle_count + FLOOR(1 + RAND() * 01)
    WHERE signal_colour = 'RED';
END$$

DELIMITER ;
