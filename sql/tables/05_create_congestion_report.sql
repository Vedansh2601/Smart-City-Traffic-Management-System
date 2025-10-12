-- 05_create_congestion_report.sql
USE smart_city_traffic;

CREATE TABLE IF NOT EXISTS congestion_report (
    report_id INT PRIMARY KEY AUTO_INCREMENT,
    intersection_id INT,
    signal_id INT,
    congestion_level ENUM('LOW', 'MEDIUM', 'HIGH'),
    time_stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (intersection_id) REFERENCES intersection(intersection_id),
    FOREIGN KEY (signal_id) REFERENCES traffic_signal(signal_id)
);
