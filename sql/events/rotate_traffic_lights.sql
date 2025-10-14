DELIMITER $$

CREATE EVENT IF NOT EXISTS rotate_traffic_lights
ON SCHEDULE EVERY 10 SECOND
DO
BEGIN
    DECLARE current_id INT;
    DECLARE next_id INT;

    -- Find the current green signal
    SELECT signal_id INTO current_id
    FROM traffic_signal
    WHERE signal_colour = 'GREEN'
    LIMIT 1;

    -- Determine the next signal in sequence (by signal_id)
    SELECT signal_id INTO next_id
    FROM traffic_signal
    WHERE signal_id > IFNULL(current_id, 0)
    ORDER BY signal_id ASC
    LIMIT 1;

    -- If no next signal, loop back to the first
    IF next_id IS NULL THEN
        SELECT MIN(signal_id) INTO next_id FROM traffic_signal;
    END IF;

    -- Set all signals to RED first
    UPDATE traffic_signal
    SET signal_colour = 'RED'
    WHERE intersection_id = (SELECT intersection_id FROM intersection WHERE location='Main Street & 1st Avenue');

    -- Set the next signal to GREEN
    UPDATE traffic_signal
    SET signal_colour = 'GREEN'
    WHERE signal_id = next_id;

END$$

DELIMITER ;
