-- 02_create_traffic_signal.sql
USE smart_city_traffic;

CREATE TABLE IF NOT EXISTS traffic_signal (
    signal_id INT PRIMARY KEY AUTO_INCREMENT,
    intersection_id INT,
    signal_colour ENUM('RED', 'YELLOW', 'GREEN') DEFAULT 'RED',
    timer INT NOT NULL,
    location VARCHAR(100),
    vehicle_count INT DEFAULT 0,
    FOREIGN KEY (intersection_id) REFERENCES intersection(intersection_id)
);