drop event report_congestion;

DELIMITER $$

CREATE EVENT report_congestion
ON SCHEDULE EVERY 5 SECOND
DO
BEGIN
    INSERT INTO congestion_report (intersection_id, signal_id, congestion_level)
    SELECT 
        intersection_id,
        signal_id,
        CASE
            WHEN vehicle_count >= 80 THEN 'HIGH'
            WHEN vehicle_count >= 40 THEN 'MEDIUM'
            ELSE 'LOW'
        END AS congestion_level
    FROM traffic_signal
    WHERE vehicle_count > 35;
END$$

DELIMITER ;
