-- 04_create_emergency_vehicle.sql
USE smart_city_traffic;

CREATE TABLE IF NOT EXISTS emergency_vehicle (
    vehicle_id INT PRIMARY KEY,
    intersection_id INT,
    signal_id INT,
    FOREIGN KEY (vehicle_id) REFERENCES vehicle(vehicle_id),
    FOREIGN KEY (intersection_id) REFERENCES intersection(intersection_id),
    FOREIGN KEY (signal_id) REFERENCES traffic_signal(signal_id)
);