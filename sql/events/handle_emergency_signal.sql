DELIMITER $$

CREATE EVENT handle_emergency_signal
ON SCHEDULE EVERY 3 SECOND
DO
BEGIN
    IF (SELECT COUNT(*) FROM traffic_signal WHERE emergency_active = TRUE) > 0 THEN

        -- GREEN for the lowest-congestion emergency signal
        UPDATE traffic_signal
        SET signal_colour = 'GREEN'
        WHERE signal_id = (
            SELECT signal_id FROM (
                SELECT signal_id
                FROM traffic_signal
                WHERE emergency_active = TRUE
                ORDER BY vehicle_count ASC
                LIMIT 1
            ) AS t1
        );

        -- RED for other emergency signals
        UPDATE traffic_signal
        SET signal_colour = 'RED'
        WHERE emergency_active = TRUE
        AND signal_id <> (
            SELECT signal_id FROM (
                SELECT signal_id
                FROM traffic_signal
                WHERE emergency_active = TRUE
                ORDER BY vehicle_count ASC
                LIMIT 1
            ) AS t2
        );

        -- RED for all non-emergency signals
        UPDATE traffic_signal
        SET signal_colour = 'RED'
        WHERE emergency_active = FALSE;

    END IF;
END$$

DELIMITER ;
