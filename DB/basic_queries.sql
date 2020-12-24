-- =========================== basic insert statements ================================ --
insert into HOTEL(HotelID, name, address, country_code, city, pool, spa, restaurant, conference_facility, gym, aquapark)
values(1, 'A', 'Jl. Munduk Catu No.8, 80361 Canggu, Indonesia', 'ID', 'Canggu', 1, 1, 1, 0, 0, 0);

insert into HOTEL(HotelID, name, address, country_code, city, pool, spa, restaurant, conference_facility, gym, aquapark)
values(2, 'B', 'Seifullin Ave 350, Almaty, Kazakhstan', 'KZ', 'Almaty', 1, 1, 1, 0, 1, 0);

insert into CATEGORY (name, coefficient, HOTEL_HotelID) values ("gold", 1, 1);
insert into CATEGORY (name, coefficient, HOTEL_HotelID) values ("silver", 1.2, 1);
insert into CATEGORY (name, coefficient, HOTEL_HotelID) values ("bronze", 1.3, 1);
insert into CATEGORY (name, coefficient, HOTEL_HotelID) values ("gold", 1, 2);
insert into CATEGORY (name, coefficient, HOTEL_HotelID) values ("silver", 1.2, 2);
insert into CATEGORY (name, coefficient, HOTEL_HotelID) values ("bronze", 1.3, 2);


-- Inserting their room types
-- Bali
insert into ROOM_TYPE
values('Single', 45, 1, 'Ocean', 'One orthopedic queen-size bed', 200, 1);

insert into ROOM_TYPE
values('Double', 75, 4, 'Ocean', 'Two orthopedic queen-size beds', 500, 1);

-- Almaty
insert into ROOM_TYPE
values('Single', 40, 1, 'City', 'One orthopedic queen-size bed', 200, 2);

insert into ROOM_TYPE
values('Double', 50, 2, 'Mountain, City', 'One orthopedic queen-size beds', 300, 2);

-- Inserting rooms
-- Bali
-- Floor 1, Single rooms.
insert into ROOM
values(311, 1, 'N', 'N', 'Single', 1);

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
values(201, 2, 'N', 'N', 'Double', 1);

insert into ROOM
values(202, 2, 'N', 'N', 'Double', 1);

insert into ROOM
values(203, 2, 'N', 'N', 'Double', 1);

insert into ROOM
values(204, 2, 'N', 'N', 'Double', 1);

insert into ROOM
values(205, 2, 'N', 'N', 'Double', 1);

insert into ROOM
values(206, 2, 'N', 'N', 'Double', 1);

insert into ROOM
values(207, 2, 'N', 'N', 'Double', 1);

insert into ROOM
values(208, 2, 'N', 'N', 'Double', 1);

insert into ROOM
values(209, 2, 'N', 'N', 'Double', 1);

insert into ROOM
values(210, 2, 'N', 'N', 'Double', 1);

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
values(311, 1, 'N', 'N', 'Double', 2);

insert into ROOM
values(108, 1, 'N', 'N', 'Double', 2);

insert into ROOM
values(109, 1, 'N', 'N', 'Double', 2);

insert into ROOM
values(110, 1, 'N', 'N', 'Double', 2);

insert into ROOM
values(201, 1, 'N', 'N', 'Double', 2);


insert into SEASON values
	("new year", "2020-12-01", "2021-02-01", 1, 1, 1),
    ("new year", "2020-12-01", "2021-02-01", 1, 1, 2);
insert into SERVICES values 
	("breakfast", 20, 1),
    ("dinner", 20, 1),
    ("breakfast", 20, 2),
    ("dinner", 20, 2);

insert into GUEST (GuestID, username, password, IDtype, IDnumber) values 
	(1, "john", "valentine", "passport", 0123456789),
    (2, "lala", "george", "passport", 0123456788);

insert into GUEST (GuestID, username, password, IDtype, IDnumber, name, surname, category) values 
	(3, "mona", "rizvi", "passport", 0123456787, "mona", "rizvi", "gold"),
    (4, "alex", "shmidt", "paspport", 0356877458, "alex", "shmidt", "bronze"),
    (5, "james", "bond", "paspport", 0356877458, "james", "bond", "bronze"),
    (6, "carlos", "vega", "passport", 0564868897, "carlos", "vega", "bronze"),
    (7, "john", "smith", "passport", 0981034156, "john", "Smith", "silver");

    
insert into RESERVATION values 
	(1, "2020-10-14", "2020-10-16", 1, 1, 200),
    (1, "2020-10-14", "2020-10-16", 2, 2, 400),
    (1, "2020-10-14", "2020-10-16", 3, 2, 400),
    (1, "2020-10-15", "2020-10-18", 4, 4, 1000),
    (1, "2020-09-14", "2020-09-21", 5, 5, 400),
    (1, "2020-10-05", "2020-10-21", 6, 5, 1100),
    (1, "2020-09-11", "2020-09-21", 7, 6, 1001),
    (2, "2019-09-11", "2019-09-19", 8, 7, 999);
    
    
    
insert into ROOM_has_RESERVATION VALUES 
	(311, "Single", 1, 2, 2, 1),
    (311, "Double", 2, 3, 2, 1);
    
