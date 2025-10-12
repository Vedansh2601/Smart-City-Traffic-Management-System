-- 01_create_intersection.sql
USE smart_city_traffic;

CREATE TABLE IF NOT EXISTS intersection (
    intersection_id INT PRIMARY KEY AUTO_INCREMENT,
    location VARCHAR(100) NOT NULL
);