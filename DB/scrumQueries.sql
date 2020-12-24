select * from HOTEL;
select * from CATEGORY;
select * from EMPLOYEE;
select * from SCHEDULE;
select * from EMPLOYEE E join SCHEDULE S on E.EmployeeID = S.EmployeeID;
SELECT * FROM ROOM_TYPE;
SELECT * FROM ROOM;
select * from RESERVATION;
select * from RESERVATION R, ROOM_has_RESERVATION RH
where R.ReservationID = RH.ReservationID;
select * from SEASON;