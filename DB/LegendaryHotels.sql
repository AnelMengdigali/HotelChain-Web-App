/*DELETE FROM ROOM;
DELETE FROM ROOM_TYPE;
delete from SCHEDULE;
delete from EMPLOYEE;
delete from CATEGORY;
delete from RESERVATION;
delete from GUEST;
DELETE FROM HOTEL;
*/


-- Inserting Hotels
insert into HOTEL(HotelID, name, address, country_code, city, pool, spa, restaurant, conference_facility, gym, aquapark)
values(1, 'Bali Resort', 'Jl. Munduk Catu No.8, 80361 Canggu, Indonesia', 'ID', 'Canggu', 1, 1, 1, 0, 0, 0);

insert into HOTEL(HotelID, name, address, country_code, city, pool, spa, restaurant, conference_facility, gym, aquapark)
values(2, 'Almaty Resort', 'Seifullin Ave 350, Almaty, Kazakhstan', 'KZ', 'Almaty', 1, 1, 1, 0, 1, 0);

insert into HOTEL(HotelID, name, address, country_code, city, pool, spa, restaurant, conference_facility, gym, aquapark)
values(3, 'Dubai Resort', 'UAE, Dubai, Al Falea Street, Jumeirah Beach', 'AE', 'Dubai', 1, 1, 0, 0, 0, 0);

-- Inserting their room types
-- Bali
insert into ROOM_TYPE
values('Single', 45, 1, 'Ocean', 'One orthopedic queen-size bed', 200, 1);

insert into ROOM_TYPE
values('Presidential', 75, 4, 'Ocean', 'Two orthopedic queen-size beds', 500, 1);

-- Almaty
insert into ROOM_TYPE
values('Single', 40, 1, 'City', 'One orthopedic queen-size bed', 200, 2);

insert into ROOM_TYPE
values('Double', 50, 2, 'Mountain, City', 'One orthopedic queen-size beds', 300, 2);

insert into ROOM_TYPE
values('Presidential', 90, 4, 'Mountain, City', 'Two orthopedic queen-size beds', 500, 2);

insert into ROOM_TYPE
values('VIP', 100, 4, 'Mountain', 'Two orthopedic queen-size beds, In-room safety deposit box', 600, 2);

-- Dubai
insert into ROOM_TYPE
values('Single', 50, 1, 'City', 'One orthopedic queen-size bed', 200, 3);

insert into ROOM_TYPE
values('Double', 60, 2, 'Ocean', 'One orthopedic queen-size beds', 300, 3);

insert into ROOM_TYPE
values('VIP', 90, 4, 'Ocean', 'Two orthopedic queen-size beds, In-room safety deposit box', 500, 3);

-- Inserting rooms
-- Bali
-- Floor 1, Single rooms.
insert into ROOM
values(101, 1, 'N', 'N', 'Single', 1);

insert into ROOM
values(102, 1, 'N', 'N', 'Single', 1);

insert into ROOM
values(103, 1, 'N', 'N', 'Single', 1);

insert into ROOM
values(104, 1, 'N', 'N', 'Single', 1);

insert into ROOM
values(105, 1, 'N', 'N', 'Single', 1);

insert into ROOM
values(106, 1, 'N', 'N', 'Single', 1);

insert into ROOM
values(107, 1, 'N', 'N', 'Single', 1);

insert into ROOM
values(108, 1, 'N', 'N', 'Single', 1);

insert into ROOM
values(109, 1, 'N', 'N', 'Single', 1);

insert into ROOM
values(110, 1, 'N', 'N', 'Single', 1);

-- Floor 2, Presidential rooms.
insert into ROOM
values(201, 2, 'N', 'N', 'Presidential', 1);

insert into ROOM
values(202, 2, 'N', 'N', 'Presidential', 1);

insert into ROOM
values(203, 2, 'N', 'N', 'Presidential', 1);

insert into ROOM
values(204, 2, 'N', 'N', 'Presidential', 1);

insert into ROOM
values(205, 2, 'N', 'N', 'Presidential', 1);

insert into ROOM
values(206, 2, 'N', 'N', 'Presidential', 1);

insert into ROOM
values(207, 2, 'N', 'N', 'Presidential', 1);

insert into ROOM
values(208, 2, 'N', 'N', 'Presidential', 1);

insert into ROOM
values(209, 2, 'N', 'N', 'Presidential', 1);

insert into ROOM
values(210, 2, 'N', 'N', 'Presidential', 1);

-- Almaty
-- Floor 1, Single/Double rooms.
insert into ROOM
values(101, 1, 'N', 'N', 'Single', 2);

insert into ROOM
values(102, 1, 'N', 'N', 'Single', 2);

insert into ROOM
values(103, 1, 'N', 'N', 'Single', 2);

insert into ROOM
values(104, 1, 'N', 'N', 'Single', 2);

insert into ROOM
values(105, 1, 'N', 'N', 'Single', 2);

insert into ROOM
values(106, 1, 'N', 'N', 'Double', 2);

insert into ROOM
values(107, 1, 'N', 'N', 'Double', 2);

insert into ROOM
values(108, 1, 'N', 'N', 'Double', 2);

insert into ROOM
values(109, 1, 'N', 'N', 'Double', 2);

insert into ROOM
values(110, 1, 'N', 'N', 'Double', 2);

-- Floor 2, Presidential rooms.
insert into ROOM
values(201, 2, 'N', 'N', 'Presidential', 2);

insert into ROOM
values(202, 2, 'N', 'N', 'Presidential', 2);

insert into ROOM
values(203, 2, 'N', 'N', 'Presidential', 2);

insert into ROOM
values(204, 2, 'N', 'N', 'Presidential', 2);

insert into ROOM
values(205, 2, 'N', 'N', 'Presidential', 2);

insert into ROOM
values(206, 2, 'N', 'N', 'Presidential', 2);

insert into ROOM
values(207, 2, 'N', 'N', 'Presidential', 2);

insert into ROOM
values(208, 2, 'N', 'N', 'Presidential', 2);

insert into ROOM
values(209, 2, 'N', 'N', 'Presidential', 2);

insert into ROOM
values(210, 2, 'N', 'N', 'Presidential', 2);

-- Floor 3, VIP rooms.
insert into ROOM
values(301, 3, 'N', 'N', 'VIP', 2);

insert into ROOM
values(302, 3, 'N', 'N', 'VIP', 2);

insert into ROOM
values(303, 3, 'N', 'N', 'VIP', 2);

insert into ROOM
values(304, 3, 'N', 'N', 'VIP', 2);

insert into ROOM
values(305, 3, 'N', 'N', 'VIP', 2);

insert into ROOM
values(306, 3, 'N', 'N', 'VIP', 2);

insert into ROOM
values(307, 3, 'N', 'N', 'VIP', 2);

insert into ROOM
values(308, 3, 'N', 'N', 'VIP', 2);

insert into ROOM
values(309, 3, 'N', 'N', 'VIP', 2);

insert into ROOM
values(310, 3, 'N', 'N', 'VIP', 2);

-- Dubai
-- Floor 1, Single rooms.
insert into ROOM
values(101, 1, 'N', 'N', 'Single', 3);

insert into ROOM
values(102, 1, 'N', 'N', 'Single', 3);

insert into ROOM
values(103, 1, 'N', 'N', 'Single', 3);

insert into ROOM
values(104, 1, 'N', 'N', 'Single', 3);

insert into ROOM
values(105, 1, 'N', 'N', 'Single', 3);

insert into ROOM
values(106, 1, 'N', 'N', 'Single', 3);

insert into ROOM
values(107, 1, 'N', 'N', 'Single', 3);

insert into ROOM
values(108, 1, 'N', 'N', 'Single', 3);

insert into ROOM
values(109, 1, 'N', 'N', 'Single', 3);

insert into ROOM
values(110, 1, 'N', 'N', 'Single', 3);

-- Floor 2, Double rooms.
insert into ROOM
values(201, 2, 'N', 'N', 'Double', 3);

insert into ROOM
values(202, 2, 'N', 'N', 'Double', 3);

insert into ROOM
values(203, 2, 'N', 'N', 'Double', 3);

insert into ROOM
values(204, 2, 'N', 'N', 'Double', 3);

insert into ROOM
values(205, 2, 'N', 'N', 'Double', 3);

insert into ROOM
values(206, 2, 'N', 'N', 'Double', 3);

insert into ROOM
values(207, 2, 'N', 'N', 'Double', 3);

insert into ROOM
values(208, 2, 'N', 'N', 'Double', 3);

insert into ROOM
values(209, 2, 'N', 'N', 'Double', 3);

insert into ROOM
values(210, 2, 'N', 'N', 'Double', 3);

-- Floor 3, VIP rooms.
insert into ROOM
values(301, 3, 'N', 'N', 'VIP', 3);

insert into ROOM
values(302, 3, 'N', 'N', 'VIP', 3);

insert into ROOM
values(303, 3, 'N', 'N', 'VIP', 3);

insert into ROOM
values(304, 3, 'N', 'N', 'VIP', 3);

insert into ROOM
values(305, 3, 'N', 'N', 'VIP', 3);

insert into ROOM
values(306, 3, 'N', 'N', 'VIP', 3);

insert into ROOM
values(307, 3, 'N', 'N', 'VIP', 3);

insert into ROOM
values(308, 3, 'N', 'N', 'VIP', 3);

insert into ROOM
values(309, 3, 'N', 'N', 'VIP', 3);

insert into ROOM
values(310, 3, 'N', 'N', 'VIP', 3);

insert into CATEGORY (name, coefficient, HOTEL_HotelID) values ("general", 1, 1);
insert into CATEGORY (name, coefficient, HOTEL_HotelID) values ("VIP", 1, 1);
insert into CATEGORY (name, coefficient, HOTEL_HotelID) values ("government", 1, 1);
insert into CATEGORY (name, coefficient, HOTEL_HotelID) values ("military", 1, 1);
insert into EMPLOYEE(EmployeeID, JobTitle, HotelID, ManagerID, name, surname, username, password) 
values 
	(1, "manager", 1, null, "a", "b", "a_b", "pass"),
    (2, "manager", 2, null, "c", "d", "c_d", "pass"),
    (3, "manager", 3, null, "e", "f", "e_f", "pass"),
    (4, "cleaner", 1, 1, "g", "h", null, null),
    (5, "cleaner", 2, 2, "i", "j", null, null),
    (6, "cleaner", 3, 3, "k", "l", null, null);
insert into SCHEDULE 
(mo, tu, we, th, fr, sa, su, from_time, to_time, scheduleID, EmployeeID, HotelID, salaryPerHour)
values 
	(1,1,1,1,1,1,0, "12:00", "5:00", 1, 1, 1, 50),
    (1,1,1,1,1,1,0, "12:00", "5:00", 2, 2, 2, 50),
    (1,1,1,1,1,1,0, "12:00", "5:00", 3, 3, 3, 50),
    (1,1,1,1,1,1,0, "12:00", "5:00", 4, 4, 1, 50),
    (1,1,1,1,1,1,0, "12:00", "5:00", 5, 5, 2, 50),
    (1,1,1,1,1,1,0, "12:00", "5:00", 6, 6, 3, 50);

insert into GUEST (GuestID, username, password) values 
	(1, "anel", "anel"),
    (2, "mohi", "mohi"),
    (3, "vlad", "vlad"),
    (4, "rakhat", "rakhat"), 
    (5, "adil", "adil");
    
insert into RESERVATION values 
	/*(1, "2020-11-23", "2020-11-24", 1, 1, 200, 1, 0),*/
    (1, "2020-11-23", "2020-11-24", 2, 1, 200, 1, 0),
    (1, "2020-11-23", "2020-11-24", 3, 2, 200, 1, 0),
    (1, "2020-11-23", "2020-11-24", 4, 2, 200, 1, 0),
    (1, "2020-11-23", "2020-11-24", 5, 3, 200, 1, 0),
    (1, "2020-11-23", "2020-11-24", 6, 3, 200, 1, 0),
    (1, "2020-11-23", "2020-11-24", 7, 4, 200, 1, 0),
    (1, "2020-11-23", "2020-11-24", 8, 4, 200, 1, 0),
    (1, "2020-11-23", "2020-11-24", 9, 5, 200, 1, 0),
    (1, "2020-11-23", "2020-11-24", 10, 5, 200, 1, 0);
    
insert into ROOM_has_RESERVATION VALUES 
	(101, "Single", 1, 1, 1, 1),
    (102, "Single", 1, 2, 1, 1),
    (101, "Single", 2, 3, 2, 1),
    (102, "Single", 2, 4, 2, 1),
    (103, "Single", 2, 5, 3, 1),
    (104, "Single", 2, 6, 3, 1),
    (101, "Single", 3, 7, 4, 1),
    (101, "Single", 3, 8, 4, 1),
    (101, "Single", 3, 9, 5, 1),
    (101, "Single", 3, 10, 5, 1);
    
insert into SEASON values
	("new year", "2021-01-01", "2021-02-01", 1, 1, 1), 
    ("nauryz", "2021-03-01", "2021-04-01", 1, 1, 1), 
    ("summer", "2021-06-01", "2021-09-01", 1, 1, 1), 
    ("halloween", "2021-11-01", "2021-12-01", 1, 1, 2), 
    ("new year", "2021-01-01", "2021-02-01", 1, 1, 3);