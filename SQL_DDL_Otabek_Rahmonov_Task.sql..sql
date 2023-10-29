CREATE SCHEMA ClimbingDB;
USE ClimbingDB;

CREATE TABLE Climbers (
    climber_id INT AUTO_INCREMENT PRIMARY KEY,
    climber_name VARCHAR(100) NOT NULL,
    address VARCHAR(150),
    contact_details VARCHAR(100),
    record_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Mountains (
    mountain_id INT AUTO_INCREMENT PRIMARY KEY,
    mountain_name VARCHAR(100) NOT NULL,
    elevation INT,
    country VARCHAR(50),
    geographic_area VARCHAR(100),
    record_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE ClimbingPartners (
    partner_id INT AUTO_INCREMENT PRIMARY KEY,
    partner_name VARCHAR(100) NOT NULL,
    availability_status VARCHAR(50),
    record_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE ClimbingGroups (
    group_id INT AUTO_INCREMENT PRIMARY KEY,
    group_name VARCHAR(100) NOT NULL,
    record_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE ClimbingGroupMembers (
    group_member_id INT AUTO_INCREMENT PRIMARY KEY,
    climber_id INT,
    group_id INT,
    FOREIGN KEY (climber_id) REFERENCES Climbers(climber_id),
    FOREIGN KEY (group_id) REFERENCES ClimbingGroups(group_id),
    record_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Climbs (
    climb_id INT AUTO_INCREMENT PRIMARY KEY,
    climber_id INT,
    mountain_id INT,
    start_date DATE CHECK (start_date > '2000-01-01'),
    end_date DATE CHECK (end_date > start_date),
    FOREIGN KEY (climber_id) REFERENCES Climbers(climber_id),
    FOREIGN KEY (mountain_id) REFERENCES Mountains(mountain_id),
    record_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE ClimbingRoutes (
    route_id INT AUTO_INCREMENT PRIMARY KEY,
    route_name VARCHAR(100) NOT NULL,
    difficulty_level_id INT,
    record_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE ClimbersClimbingRoutes (
    climber_route_id INT AUTO_INCREMENT PRIMARY KEY,
    climber_id INT,
    route_id INT,
    FOREIGN KEY (climber_id) REFERENCES Climbers(climber_id),
    FOREIGN KEY (route_id) REFERENCES ClimbingRoutes(route_id),
    record_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE RouteDifficultyLevels (
    difficulty_level_id INT AUTO_INCREMENT PRIMARY KEY,
    difficulty_description VARCHAR(200) NOT NULL,
    record_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE ClimberAchievements (
    achievement_id INT AUTO_INCREMENT PRIMARY KEY,
    climber_id INT,
    achievement_name VARCHAR(150) NOT NULL,
    date_achieved DATE CHECK (date_achieved > '2000-01-01'),
    FOREIGN KEY (climber_id) REFERENCES Climbers(climber_id),
    record_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

ALTER TABLE Climbers
ADD COLUMN record_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE Mountains
ADD COLUMN record_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE ClimbingPartners
ADD COLUMN record_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE ClimbingGroups
ADD COLUMN record_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE ClimbingGroupMembers
ADD COLUMN record_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE Climbs
ADD COLUMN record_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE ClimbingRoutes
ADD COLUMN record_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE ClimbersClimbingRoutes
ADD COLUMN record_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE RouteDifficultyLevels
ADD COLUMN record_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE ClimberAchievements
ADD COLUMN record_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

