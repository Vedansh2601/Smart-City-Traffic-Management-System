DELIMITER $$

CREATE EVENT IF NOT EXISTS report_congestion
ON SCHEDULE EVERY 5 SECOND
DO
BEGIN
    -- Insert a congestion report for any signal with vehicle_count > 15
    INSERT INTO congestion_report (intersection_id, signal_id, congestion_level)
    SELECT 
        intersection_id, 
        signal_id,
        CASE
            WHEN vehicle_count > 30 THEN 'HIGH'
            WHEN vehicle_count > 20 THEN 'MEDIUM'
            ELSE 'LOW'
        END AS congestion_level
    FROM traffic_signal
    WHERE vehicle_count > 15
      AND intersection_id = (SELECT intersection_id FROM intersection WHERE location='Main Street & 1st Avenue');
END$$

DELIMITER ;
