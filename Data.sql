-- Insert values into Floors table
INSERT INTO floors(floor_id,number_of_room,description) values (0,1,'basement');
INSERT INTO floors(floor_id,number_of_room,description) values (1,3,'1F');
INSERT INTO floors(floor_id,number_of_room,description) values (2,2,'2F');

-- Insert values into Rooms table
INSERT INTO rooms(room_id,max_people,price,floor_id) values (101,2,800000,1);
INSERT INTO rooms(room_id,max_people,price,floor_id) values (102,1,500000,1);
INSERT INTO rooms(room_id,max_people,price,floor_id) values (103,4,1200000,1);
INSERT INTO rooms(room_id,max_people,price,floor_id) values (201,1,500000,2);
INSERT INTO rooms(room_id,max_people,price,floor_id) values (202,2,800000,2);

-- Insert values into Outdoor table
INSERT INTO outdoor(view,bancony,room_id) values ('yes','pool',101);
INSERT INTO outdoor(view,bancony,room_id) values ('yes','garden',102);
INSERT INTO outdoor(view,bancony,room_id) values ('no','sea',103);
INSERT INTO outdoor(view,bancony,room_id) values ('no','garden',201);
INSERT INTO outdoor(view,bancony,room_id) values ('yes','sea',202);

-- Insert values into Services table
INSERT INTO services(service_id,service_name,price) values (1,'car rental',500000);
INSERT INTO services(service_id,service_name,price) values (2,'oversea dial',100000);
INSERT INTO services(service_id,service_name,price) values (3,'fried rice',80000);

-- Insert values in to Facility Types table
INSERT INTO facilitytypes(facility_type_id,facility_name,quantity) values (1,'television',5);
INSERT INTO facilitytypes(facility_type_id,facility_name,quantity) values (2,'fridge',3);
INSERT INTO facilitytypes(facility_type_id,facility_name,quantity) values (3,'table',2);
INSERT INTO facilitytypes(facility_type_id,facility_name,quantity) values (4,'iron',2);

-- Insert values in to Facilities table
INSERT INTO facilities(facility_id,facility_type_id) values (101,1);
INSERT INTO facilities(facility_id,facility_type_id) values (102,1);
INSERT INTO facilities(facility_id,facility_type_id) values (103,1);
INSERT INTO facilities(facility_id,facility_type_id) values (104,1);
INSERT INTO facilities(facility_id,facility_type_id) values (105,1);
INSERT INTO facilities(facility_id,facility_type_id) values (201,2);
INSERT INTO facilities(facility_id,facility_type_id) values (202,2);
INSERT INTO facilities(facility_id,facility_type_id) values (203,2);
INSERT INTO facilities(facility_id,facility_type_id) values (301,3);
INSERT INTO facilities(facility_id,facility_type_id) values (302,3);
INSERT INTO facilities(facility_id,facility_type_id) values (401,4);
INSERT INTO facilities(facility_id,facility_type_id) values (402,4);

-- Insert into Facilities Applied table
INSERT INTO facilityapply(date,room_id,facility_id) values ('2022-06-02',101,101);
INSERT INTO facilityapply(date,room_id,facility_id) values ('2022-06-02',101,201);
INSERT INTO facilityapply(date,room_id,facility_id) values ('2022-06-02',101,301);
INSERT INTO facilityapply(date,room_id,facility_id) values ('2022-06-02',101,401);
INSERT INTO facilityapply(date,room_id,facility_id) values ('2022-06-10',201,401);
INSERT INTO facilityapply(date,room_id,facility_id) values ('2022-06-11',201,302);
INSERT INTO facilityapply(date,room_id,facility_id) values ('2022-06-11',201,103);
INSERT INTO facilityapply(date,room_id,facility_id) values ('2022-06-11',201,104);
INSERT INTO facilityapply(date,room_id,facility_id) values ('2022-06-17',102,102);
INSERT INTO facilityapply(date,room_id,facility_id) values ('2022-06-17',102,301);
INSERT INTO facilityapply(date,room_id,facility_id) values ('2022-06-17',202,103);
INSERT INTO facilityapply(date,room_id,facility_id) values ('2022-06-19',202,302);

-- Insert values into Master Customer table
INSERT INTO mastercustomers(customer_id,master_customer_name,phone_number,number_of_people) values (1,'Lê Văn Ngọc','0944081535',1);
INSERT INTO mastercustomers(customer_id,master_customer_name,phone_number,number_of_people) values (2,'Nguyễn Đăng Quang','0855948455',2);
INSERT INTO mastercustomers(customer_id,master_customer_name,phone_number,number_of_people) values (3,'Lê Công Hậu','01234546578',4);
INSERT INTO mastercustomers(customer_id,master_customer_name,phone_number,number_of_people) values (4,'Nguyễn Xuân Quang Trung','01234546578',7);
INSERT INTO mastercustomers(customer_id,master_customer_name,phone_number,number_of_people) values (5,'Tôn Thất Anh Minh','085985757',2);
INSERT INTO mastercustomers(customer_id,master_customer_name,phone_number,number_of_people) values (6,'Đỗ Trọng Nam','0154786258',4);
INSERT INTO mastercustomers(customer_id,master_customer_name,phone_number,number_of_people) values (7,'Nguyễn Văn Hiếu','07865486245',1);
INSERT INTO mastercustomers(customer_id,master_customer_name,phone_number,number_of_people) values (8,'Nguyễn Đăng Quang','0855948455',2);
INSERT INTO mastercustomers(customer_id,master_customer_name,phone_number,number_of_people) values (9,'Lê Văn Ngọc','0944081535',1);
INSERT INTO mastercustomers(customer_id,master_customer_name,phone_number,number_of_people) values (10,'Đỗ Trọng Nam','0154786258',3);

-- Insert into Reservations table
INSERT INTO reservations(reservation_id,check_in_date,est_check_out_date,real_check_out_date,number_people,create_at,delete_at,room_amount,service_amount,price_per_night,customer_id,room_id) 
values (1,'2022-06-01','2022-06-04','2022-06-04',1,'2022-06-01',null,null,null,500000,1,102);
INSERT INTO reservations(reservation_id,check_in_date,est_check_out_date,real_check_out_date,number_people,create_at,delete_at,room_amount,service_amount,price_per_night,customer_id,room_id) 
values (2,'2022-06-02','2022-06-03','2022-06-03',2,'2022-06-02',null,null,null,800000,2,101);
INSERT INTO reservations(reservation_id,check_in_date,est_check_out_date,real_check_out_date,number_people,create_at,delete_at,room_amount,service_amount,price_per_night,customer_id,room_id) 
values (3,'2022-06-02','2022-06-06','2022-06-06',4,'2022-06-02',null,null,null,1200000,3,103);
INSERT INTO reservations(reservation_id,check_in_date,est_check_out_date,real_check_out_date,number_people,create_at,delete_at,room_amount,service_amount,price_per_night,customer_id,room_id) 
values (4,'2022-06-07','2022-06-11','2022-06-11',4,'2022-06-05',null,null,null,1200000,4,103);
INSERT INTO reservations(reservation_id,check_in_date,est_check_out_date,real_check_out_date,number_people,create_at,delete_at,room_amount,service_amount,price_per_night,customer_id,room_id) 
values (5,'2022-06-07','2022-06-11','2022-06-11',2,'2022-06-05',null,null,null,800000,4,202);
INSERT INTO reservations(reservation_id,check_in_date,est_check_out_date,real_check_out_date,number_people,create_at,delete_at,room_amount,service_amount,price_per_night,customer_id,room_id) 
values (6,'2022-06-07','2022-06-11','2022-06-11',1,'2022-06-05',null,null,null,500000,4,201);
INSERT INTO reservations(reservation_id,check_in_date,est_check_out_date,real_check_out_date,number_people,create_at,delete_at,room_amount,service_amount,price_per_night,customer_id,room_id) 
values (7,'2022-06-08','2022-06-10','2022-06-10',2,'2022-06-08',null,null,null,800000,5,101);
INSERT INTO reservations(reservation_id,check_in_date,est_check_out_date,real_check_out_date,number_people,create_at,delete_at,room_amount,service_amount,price_per_night,customer_id,room_id) 
values (8,'2022-06-11','2022-06-14','2022-06-14',4,'2022-06-11',null,null,null,1200000,6,103);
INSERT INTO reservations(reservation_id,check_in_date,est_check_out_date,real_check_out_date,number_people,create_at,delete_at,room_amount,service_amount,price_per_night,customer_id,room_id) 
values (9,'2022-06-12','2022-06-15','2022-06-15',1,'2022-06-11',null,null,null,500000,7,102);
INSERT INTO reservations(reservation_id,check_in_date,est_check_out_date,real_check_out_date,number_people,create_at,delete_at,room_amount,service_amount,price_per_night,customer_id,room_id) 
values (10,'2022-06-12','2022-06-15','2022-06-15',2,'2022-06-11',null,null,null,800000,8,202);
INSERT INTO reservations(reservation_id,check_in_date,est_check_out_date,real_check_out_date,number_people,create_at,delete_at,room_amount,service_amount,price_per_night,customer_id,room_id) 
values (11,'2022-06-12','2022-06-16','2022-06-16',1,'2022-06-12',null,null,null,500000,9,201);
INSERT INTO reservations(reservation_id,check_in_date,est_check_out_date,real_check_out_date,number_people,create_at,delete_at,room_amount,service_amount,price_per_night,customer_id,room_id) 
values (12,'2022-06-15','2022-06-19','2022-06-19',1,'2022-06-15',null,null,null,500000,10,102);
INSERT INTO reservations(reservation_id,check_in_date,est_check_out_date,real_check_out_date,number_people,create_at,delete_at,room_amount,service_amount,price_per_night,customer_id,room_id) 
values (13,'2022-06-15','2022-06-19','2022-06-19',2,'2022-06-15',null,null,null,800000,10,101);

-- Insert into Service Orders table
INSERT INTO serviceorders(create_date,delete_date,quantity,service_id,booking_id) values ('2022-06-02',null,2,1,1);
INSERT INTO serviceorders(create_date,delete_date,quantity,service_id,booking_id) values ('2022-06-02',null,3,3,1);
INSERT INTO serviceorders(create_date,delete_date,quantity,service_id,booking_id) values ('2022-06-02',null,1,1,3);
INSERT INTO serviceorders(create_date,delete_date,quantity,service_id,booking_id) values ('2022-06-02',null,2,2,3);
INSERT INTO serviceorders(create_date,delete_date,quantity,service_id,booking_id) values ('2022-06-07',null,1,1,4);
INSERT INTO serviceorders(create_date,delete_date,quantity,service_id,booking_id) values ('2022-06-08',null,2,3,4);
INSERT INTO serviceorders(create_date,delete_date,quantity,service_id,booking_id) values ('2022-06-07',null,2,3,5);
INSERT INTO serviceorders(create_date,delete_date,quantity,service_id,booking_id) values ('2022-06-07',null,1,1,5);
INSERT INTO serviceorders(create_date,delete_date,quantity,service_id,booking_id) values ('2022-06-09',null,3,2,5);
INSERT INTO serviceorders(create_date,delete_date,quantity,service_id,booking_id) values ('2022-06-10',null,1,3,6);
INSERT INTO serviceorders(create_date,delete_date,quantity,service_id,booking_id) values ('2022-06-13',null,4,2,8);
INSERT INTO serviceorders(create_date,delete_date,quantity,service_id,booking_id) values ('2022-06-14',null,3,3,11);
INSERT INTO serviceorders(create_date,delete_date,quantity,service_id,booking_id) values ('2022-06-17',null,1,1,12);
INSERT INTO serviceorders(create_date,delete_date,quantity,service_id,booking_id) values ('2022-06-18',null,1,2,12);
INSERT INTO serviceorders(create_date,delete_date,quantity,service_id,booking_id) values ('2022-06-17',null,1,2,13);


