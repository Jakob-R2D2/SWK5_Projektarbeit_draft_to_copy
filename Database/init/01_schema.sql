-- Datenbank sicherstellen (Compose setzt myapp, aber hier noch mal explizit)
CREATE DATABASE IF NOT EXISTS myapp CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE myapp;

-- Holiday
CREATE TABLE IF NOT EXISTS Holiday (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  start DATE NOT NULL,
  end DATE NOT NULL,
  is_school_holiday TINYINT(1) NOT NULL,
  UNIQUE KEY uq_holiday (name, start, end)
) ENGINE=InnoDB;

-- Station
CREATE TABLE IF NOT EXISTS Station (
  id INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  short_name VARCHAR(50),
  geo_latitude  DECIMAL(12,8),
  geo_longitude DECIMAL(12,8),
  FULLTEXT KEY ft_station_name (name) -- einfacher FTS-Ersatz
) ENGINE=InnoDB;

-- Route
CREATE TABLE IF NOT EXISTS Route (
  id INT AUTO_INCREMENT PRIMARY KEY,
  number INT NOT NULL,
  validity_start DATE NOT NULL,
  validity_end   DATE NOT NULL,
  valid_days INT NOT NULL,
  KEY ix_route_number (number)
) ENGINE=InnoDB;

-- Routestop
CREATE TABLE IF NOT EXISTS Routestop (
  id INT PRIMARY KEY,
  arrival_time TIME NOT NULL,
  route_id INT NOT NULL,
  station_id INT NOT NULL,
  route_stop_number INT NOT NULL,
  CONSTRAINT fk_rs_route   FOREIGN KEY (route_id)  REFERENCES Route(id)   ON DELETE CASCADE,
  CONSTRAINT fk_rs_station FOREIGN KEY (station_id) REFERENCES Station(id) ON DELETE RESTRICT,
  KEY ix_rs_route_stop (route_id, route_stop_number),
  KEY ix_rs_station   (station_id)
) ENGINE=InnoDB;

-- Delay
CREATE TABLE IF NOT EXISTS Delay (
  id INT PRIMARY KEY,
  routestop_id INT NOT NULL,
  route_id INT NOT NULL,
  check_in_time TIME NULL,
  check_in_day  DATE NOT NULL,
  planned_time  TIME NOT NULL,
  seconds_delay INT NULL,
  CONSTRAINT fk_delay_rs    FOREIGN KEY (routestop_id) REFERENCES Routestop(id) ON DELETE CASCADE,
  CONSTRAINT fk_delay_route FOREIGN KEY (route_id)     REFERENCES Route(id)      ON DELETE CASCADE,
  KEY ix_delay_lookup (route_id, routestop_id, check_in_day)
) ENGINE=InnoDB;

-- FTS_station (separat, falls ihr eine explizite FTS-Tabelle wie in SQLite hattet)
CREATE TABLE IF NOT EXISTS FTS_station (
  id INT AUTO_INCREMENT PRIMARY KEY,
  station_id INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  FULLTEXT KEY ft_name (name),
  CONSTRAINT fk_fts_station FOREIGN KEY (station_id) REFERENCES Station(id) ON DELETE CASCADE
) ENGINE=InnoDB;
