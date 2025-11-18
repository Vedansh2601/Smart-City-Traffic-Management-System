

DELIMITER $$

CREATE EVENT dynamic_congestion_control
ON SCHEDULE EVERY 10 SECOND
DO
BEGIN
    -- Declare ALL variables first
    DECLARE low_count INT DEFAULT 0;
    DECLARE total_count INT DEFAULT 0;
    DECLARE current_green INT DEFAULT NULL;
    DECLARE next_signal INT DEFAULT NULL;

    -- Only run if no emergency is active
    IF (SELECT COUNT(*) FROM smart_city_traffic.traffic_signal WHERE emergency_active = TRUE) = 0 THEN

        -- Count low congestion signals
        SELECT COUNT(*) INTO low_count
        FROM smart_city_traffic.traffic_signal
        WHERE vehicle_count < 40;

        -- Count total signals
        SELECT COUNT(*) INTO total_count
        FROM smart_city_traffic.traffic_signal;

        -- If no signals exist, simply do nothing
        IF total_count > 0 THEN

            -- NORMAL ROTATION MODE (all signals low congestion)
            IF low_count = total_count THEN

                -- Find current GREEN signal
                SELECT signal_id INTO current_green
                FROM smart_city_traffic.traffic_signal
                WHERE signal_colour = 'GREEN'
                LIMIT 1;

                -- Find next signal by ID
                SELECT signal_id INTO next_signal
                FROM smart_city_traffic.traffic_signal
                WHERE signal_id > IFNULL(current_green, 0)
                ORDER BY signal_id ASC
                LIMIT 1;

                -- If no next signal exists, wrap to first
                IF next_signal IS NULL THEN
                    SELECT MIN(signal_id) INTO next_signal
                    FROM smart_city_traffic.traffic_signal;
                END IF;

                -- Set all to RED
                UPDATE smart_city_traffic.traffic_signal
                SET signal_colour = 'RED';

                -- Set next signal to GREEN
                UPDATE smart_city_traffic.traffic_signal
                SET signal_colour = 'GREEN'
                WHERE signal_id = next_signal;

            ELSE
                -- HIGH/MEDIUM CONGESTION MODE
                -- Choose the most congested signal
                UPDATE smart_city_traffic.traffic_signal
                SET signal_colour = 'GREEN'
                WHERE signal_id = (
                    SELECT signal_id FROM (
                        SELECT signal_id
                        FROM smart_city_traffic.traffic_signal
                        ORDER BY vehicle_count DESC
                        LIMIT 1
                    ) AS x
                );

                UPDATE smart_city_traffic.traffic_signal
                SET signal_colour = 'RED'
                WHERE signal_id <> (
                    SELECT signal_id FROM (
                        SELECT signal_id
                        FROM smart_city_traffic.traffic_signal
                        ORDER BY vehicle_count DESC
                        LIMIT 1
                    ) AS y
                );
            END IF;
        END IF;
    END IF;
END$$

DELIMITER ;

