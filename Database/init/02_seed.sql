USE myapp;

-- Holiday (id wird automatisch vergeben; Eindeutigkeit via UNIQUE(name,start,end))
INSERT INTO Holiday (name, start, end, is_school_holiday)
VALUES
  ('Neujahrstag', '2024-01-01', '2024-01-01', 1),
  ('Heilige Drei Könige', '2024-01-06', '2024-01-06', 1)
ON DUPLICATE KEY UPDATE
  is_school_holiday = VALUES(is_school_holiday);

-- Route (hier mit stabiler "number"-Kombination: wir lassen id autoincrement)
INSERT INTO Route (number, validity_start, validity_end, valid_days)
VALUES
  (1, '2024-01-01', '2025-12-31', 127),
  (2, '2024-01-01', '2025-12-31', 127)
ON DUPLICATE KEY UPDATE
  validity_start = VALUES(validity_start),
  validity_end   = VALUES(validity_end),
  valid_days     = VALUES(valid_days);

-- Station (id kommt aus euren Daten; Primary Key = id → idempotent)
INSERT INTO Station (id, name, short_name, geo_latitude, geo_longitude) VALUES
  (1, 'Oberlaa', 'OBERL', 48.14238889, 16.39954507),
  (2, 'Neulaa',  'NEUL',  48.14672858, 16.38233346)
ON DUPLICATE KEY UPDATE
  name = VALUES(name),
  short_name = VALUES(short_name),
  geo_latitude = VALUES(geo_latitude),
  geo_longitude = VALUES(geo_longitude);

-- FTS_station (eigene id, referenziert Station)
INSERT INTO FTS_station (station_id, name) VALUES
  (1, 'Oberlaa'),
  (2, 'Neulaa')
ON DUPLICATE KEY UPDATE
  name = VALUES(name);

-- Routestop (id aus euren Daten)
INSERT INTO Routestop (id, arrival_time, route_id, station_id, route_stop_number) VALUES
  (1, '10:00:00', 1, 1, 1),
  (2, '10:03:00', 1, 2, 2)
ON DUPLICATE KEY UPDATE
  arrival_time = VALUES(arrival_time),
  route_id = VALUES(route_id),
  station_id = VALUES(station_id),
  route_stop_number = VALUES(route_stop_number);

-- Delay (id aus euren Daten)
INSERT INTO Delay (id, routestop_id, route_id, check_in_time, check_in_day, planned_time, seconds_delay) VALUES
  (1, 1, 1, '10:00:00', '2024-12-01', '10:00:00', 0),
  (2, 2, 1, '10:03:00', '2024-12-01', '10:03:00', 0)
ON DUPLICATE KEY UPDATE
  routestop_id = VALUES(routestop_id),
  route_id     = VALUES(route_id),
  check_in_time= VALUES(check_in_time),
  check_in_day = VALUES(check_in_day),
  planned_time = VALUES(planned_time),
  seconds_delay= VALUES(seconds_delay);
