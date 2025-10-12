-- 03_create_vehicle.sql
USE smart_city_traffic;

CREATE TABLE IF NOT EXISTS vehicle (
    vehicle_id INT PRIMARY KEY AUTO_INCREMENT,
    vehicle_type ENUM('CAR', 'BUS', 'TRUCK', 'BIKE', 'AMBULANCE', 'POLICE', 'FIRE_TRUCK') NOT NULL,
    arrival_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    exit_time DATETIME NULL,
    signal_id INT,
    intersection_id INT,
    FOREIGN KEY (signal_id) REFERENCES traffic_signal(signal_id),
    FOREIGN KEY (intersection_id) REFERENCES intersection(intersection_id)
);