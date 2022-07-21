-- Create Database
CREATE DATABASE HOTELMANAGER ;

-- Create Tables
CREATE TABLE IF NOT EXISTS FLOORS
(
  floor_id INT NOT NULL,
  number_of_room INT NOT NULL,
  description VARCHAR(50) NOT NULL,
  PRIMARY KEY (floor_id)
);

CREATE TABLE IF NOT EXISTS ROOMS 
(
  room_id INT NOT NULL,
  max_people INT NOT NULL,
  price FLOAT NOT NULL,
  floor_id INT NOT NULL,
  PRIMARY KEY (room_id),
  FOREIGN KEY (floor_id) REFERENCES FLOORS(floor_id)
);

CREATE TABLE IF NOT EXISTS OUTDOOR
(
  view VARCHAR(50) NOT NULL,
  bancony VARCHAR(50) NOT NULL,
  room_id INT NOT NULL,
  PRIMARY KEY (room_id),
  FOREIGN KEY (room_id) REFERENCES ROOMS(room_id)
);

CREATE TABLE IF NOT EXISTS FACILITYTYPES
(
  facility_type_id INT NOT NULL,
  facility_name VARCHAR(20) NOT NULL,
  quantity INT NOT NULL,
  PRIMARY KEY (facility_type_id)
);

CREATE TABLE IF NOT EXISTS FACILITIES 
(
  facility_id INT NOT NULL,
  facility_type_id INT NOT NULL,
  PRIMARY KEY (facility_id),
  FOREIGN KEY (facility_type_id) REFERENCES FACILITYTYPES(facility_type_id)
);

CREATE TABLE IF NOT EXISTS FACILITYAPPLY 
(
  date DATE NOT NULL,
  room_id INT NOT NULL,
  facility_id INT NOT NULL,
  PRIMARY KEY (date, facility_id),
  FOREIGN KEY (room_id) REFERENCES ROOMS(room_id),
  FOREIGN KEY (facility_id) REFERENCES FACILITIES(facility_id)
);

CREATE TABLE IF NOT EXISTS MASTERCUSTOMERS 
(
  customer_id INT NOT NULL,
  master_customer_name VARCHAR(50) NOT NULL,
  phone_number VARCHAR(50) NOT NULL,
  number_of_people INT NOT NULL,
  PRIMARY KEY (customer_id)
);

CREATE TABLE IF NOT EXISTS RESERVATIONS 
(
  reservation_id INT NOT NULL,
  check_in_date DATE NOT NULL,
  est_check_out_date DATE NOT NULL,
  real_check_out_date DATE,
  number_people INT NOT NULL,
  create_at DATE NOT NULL,
  delete_at DATE,
  room_amount FLOAT,
  service_amount FLOAT,
  price_per_night FLOAT NOT NULL,
  customer_id INT NOT NULL,
  room_id INT NOT NULL,
  PRIMARY KEY (reservation_id),
  FOREIGN KEY (customer_id) REFERENCES MASTERCUSTOMERS(customer_id),
  FOREIGN KEY (room_id) REFERENCES ROOMS(room_id)
);

CREATE TABLE IF NOT EXISTS SERVICES 
(
  service_id INT NOT NULL,
  service_name VARCHAR(50) NOT NULL,
  price FLOAT NOT NULL,
  PRIMARY KEY (service_id)
);

CREATE TABLE IF NOT EXISTS SERVICEORDERS 
(
  create_date DATE NOT NULL,
  delete_date DATE,
  quantity INT NOT NULL,
  service_id INT NOT NULL,
  reservation_id INT NOT NULL,
  PRIMARY KEY (create_date, service_id, reservation_id),
  FOREIGN KEY (service_id) REFERENCES SERVICES(service_id),
  FOREIGN KEY (reservation_id) REFERENCES RESERVATIONS(reservation_id)
);

CREATE TABLE IF NOT EXISTS INVOICES 
(
  invoice_id INT NOT NULL,
  total_amount INT NOT NULL,
  date_create DATE NOT NULL,
  customer_id INT NOT NULL,
  PRIMARY KEY (invoice_id),
  FOREIGN KEY (customer_id) REFERENCES MASTERCUSTOMERS(customer_id)
);