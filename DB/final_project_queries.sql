-- ================================================= Q1 ============================================= --
-- PART 1
SELECT DISTINCT rt.name as Type, rt.room_price as PricePerNight, 
(s.working_day*d.WorkingDays*rt.room_price + s.week_day*d.Weekends*rt.room_price) as TotalPrice, 
(rt.room_price / TIMESTAMPDIFF(DAY, '2020-12-15', '2020-12-17')) as AvgCostPerNight
-- This long equation calculates number of working days in provided day interval
FROM SEASON s, 
	(SELECT 5 * (DATEDIFF('2020-12-17', '2020-12-15') DIV 7) 
	+ MID('0123444401233334012222340111123400012345001234550', 7 * WEEKDAY('2020-12-15') 
	+ WEEKDAY('2020-12-17') + 1, 1) as WorkingDays,
		-- This part subtracts the number of working days from the total number of days in order to get the number of weekends 
		TIMESTAMPDIFF(DAY, '2020-12-15', '2020-12-17') - (5 * (DATEDIFF('2020-12-17', '2020-12-15') DIV 7) 
        + MID('0123444401233334012222340111123400012345001234550', 7 * WEEKDAY('2020-12-15') 
        + WEEKDAY('2020-12-17') + 1, 1)) as Weekends) d, 
        ROOM_TYPE rt
/* This part helps us find available room types. 
	First, we look at all reservations that are not available on that date. 
	Based on the results we find already reserved rooms. 
	And finally, using these results we find available rooms and output their type.
 */
WHERE ('2020-12-15' BETWEEN s.start_date AND s.end_date OR '2020-12-17' BETWEEN s.start_date AND s.end_date) 
AND rt.HotelID = 1
AND rt.name IN (SELECT DISTINCT r3.room_type_name FROM ROOM r3
				WHERE r3.room_number NOT IN (SELECT rr.room_number FROM ROOM_has_RESERVATION rr
											 WHERE rr.ReservationID IN (SELECT r.ReservationID FROM RESERVATION r
																		WHERE r.checkin BETWEEN '2020-12-15' AND '2020-12-17'
																		AND r.checkout BETWEEN '2020-12-15' AND '2020-12-17')) AND r3.HotelID = 1);
-- PART 2
/*  In our model, each room requires its own reservation, so reserving 3 rooms will result in 3 operations 
	For each reservation, we first update the reservation table, in which we store dates, reservation ID, guest ID, etc.
	Then, we update the room_has_reservation table, which stores the number of reserved room, its type, and guest ID.
 */
-- First Room
INSERT INTO `mydb`.`RESERVATION` 
(`numOfOccupants`, `checkin`, `checkout`, `ReservationID`, `GuestID`, `final_price`) 
VALUES ('3', '2020-12-15', '2020-12-17', '14', '3', '1000');
INSERT INTO `mydb`.`ROOM_has_RESERVATION` 
(`room_number`, `room_type_name`, `HotelID`, `ReservationID`, `GuestID`, `numberOfOccupants`) 
VALUES ('108', 'Double', '2', '14', '3', '3');
-- Second Room
INSERT INTO `mydb`.`RESERVATION` 
(`numOfOccupants`, `checkin`, `checkout`, `ReservationID`, `GuestID`, `final_price`) 
VALUES ('4', '2020-12-15', '2020-12-17', '15', '3', '1250');
INSERT INTO `mydb`.`ROOM_has_RESERVATION` 
(`room_number`, `room_type_name`, `HotelID`, `ReservationID`, `GuestID`, `numberOfOccupants`) 
VALUES ('109', 'Double', '2', '15', '3', '4');
-- Third Room
INSERT INTO `mydb`.`RESERVATION` 
(`numOfOccupants`, `checkin`, `checkout`, `ReservationID`, `GuestID`, `final_price`) 
VALUES ('2', '2020-12-15', '2020-12-17', '16', '3', '200');
INSERT INTO `mydb`.`ROOM_has_RESERVATION` 
(`room_number`, `room_type_name`, `HotelID`, `ReservationID`, `GuestID`, `numberOfOccupants`) 
VALUES ('103', 'Single', '2', '16', '3', '2');

-- PART 3
SELECT (price1.FinalPrice + price2.FinalPrice) as FinalPrice
/*  Here we calculate the price of two double rooms. 
	We use pattern, that is similar to the one, we used in the first part of this question. 
*/
FROM (SELECT DISTINCT rt.name, 2*(s.working_day*d.WorkingDays + s.week_day*d.Weekends)*rt.room_price*c.coefficient as FinalPrice
FROM ROOM_TYPE rt, 
	 -- Find number of working and weekend days
	 (SELECT 5 * (DATEDIFF('2020-12-17', '2020-12-15') DIV 7) + 
     MID('0123444401233334012222340111123400012345001234550', 7 * WEEKDAY('2020-12-15') + 
     WEEKDAY('2020-12-17') + 1, 1) as WorkingDays,
	 TIMESTAMPDIFF(DAY, '2020-12-15', '2020-12-17') - (5 * (DATEDIFF('2020-12-17', '2020-12-15') DIV 7) 
     + MID('0123444401233334012222340111123400012345001234550', 7 * WEEKDAY('2020-12-15') 
     + WEEKDAY('2020-12-17') + 1, 1)) as Weekends) d, 
     -- Check for current season
     (SELECT working_day, week_day 
     FROM SEASON 
     WHERE '2020-12-15' 
     BETWEEN start_date AND end_date 
     OR '2020-12-17' BETWEEN start_date AND end_date) s,
     -- Check for guest's category and coefficient
     (SELECT c.name, c.coefficient FROM CATEGORY c JOIN GUEST g ON c.name = g.category 
     WHERE g.name = 'Mona' AND g.surname = 'Rizvi') c
WHERE (rt.name = 'Double')
/*  Here we have the same algorithm, but calculate price of one single room.
	In both parts, we take into account current season, guest's coefficient and number of working and weekend days. 
*/
AND rt.HotelID = 2)  price1, 
(SELECT DISTINCT rt.name, 1*(s.working_day*d.WorkingDays + s.week_day*d.Weekends)*rt.room_price*c.coefficient as FinalPrice
FROM ROOM_TYPE rt, 
	 (SELECT 5 * (DATEDIFF('2020-12-17', '2020-12-15') DIV 7) 
     + MID('0123444401233334012222340111123400012345001234550', 7 * WEEKDAY('2020-12-15') 
     + WEEKDAY('2020-12-17') + 1, 1) as WorkingDays,
	 TIMESTAMPDIFF(DAY, '2020-12-15', '2020-12-17') - (5 * (DATEDIFF('2020-12-17', '2020-12-15') DIV 7) 
     + MID('0123444401233334012222340111123400012345001234550', 7 * WEEKDAY('2020-12-15') 
     + WEEKDAY('2020-12-17') + 1, 1)) as Weekends) d, 
     (SELECT working_day, week_day 
     FROM SEASON WHERE '2020-12-15' 
     BETWEEN start_date AND end_date OR '2020-12-17' 
     BETWEEN start_date AND end_date) s,
     (SELECT c.name, c.coefficient 
     FROM CATEGORY c JOIN GUEST g ON c.name = g.category 
     WHERE g.name = 'Mona' AND g.surname = 'Rizvi') c
WHERE (rt.name = 'Single')
AND rt.HotelID = 2) price2;


-- ================================================= Q2 ============================================= --

-- Part 1
select room_number 
from ROOM
where hotelID = 2 
and room_type_name = 'double' 
and cleaning = 'N' 
and occupance = 'N';

-- Part 2
-- 1)
select GuestID
from GUEST 
where IDNumber = 0981034156;

-- 2)
select ReservationID, checkin, checkout
from RESERVATION
where GuestID = 7;

-- 3)
insert into ROOM_has_RESERVATION
values(201, 'Double', 2, 8, 7, 2);



-- ================================================= Q3 ============================================= --

/*  In this nested query we first look for the ID of the reservation, that was made on the required date. 
	Using that information, we can find the ID of the guest that made this reservation. 
	Finally, we output all available information about that guest.
 */
SELECT * FROM GUEST WHERE GuestID IN 
(SELECT GuestID FROM ROOM_has_RESERVATION 
  WHERE ReservationID IN 
  (SELECT ReservationID FROM RESERVATION
	  WHERE '2020-10-15' BETWEEN checkin AND checkout) 
	  AND room_number = 311);


-- ================================================= Q4 ============================================= --

--  Part 1. Assuming that we know the hotelID (here = 1) 
-- we can get all services that are available to anyone in the hotel by following query:
select name from SERVICES where HotelID = 1;


-- Part 2. we record services on the SERVICES_HISTORY that has an attribute of ReservationID
-- and RESERVATION is mapped to a single known room (here it is 101). 
-- 1. getting the reservationID using room number (need to check by checkin checkout dates)
-- 2. insert service into history (here we assumed that guests ordered 2 breakfasts)
-- 3. Update price in reservation - add breakfast prices

insert into SERVICES_HISTORY 
values (2, "breakfast", 2, (select R.ReservationID
from RESERVATION R join ROOM_has_RESERVATION RR
on R.ReservationID = RR.ReservationID 
and room_number = 108 and HotelID = 2
and checkin <= "2020-12-16" and checkout >= "2020-12-16"));
-- change the price in reservation id
-- firstly get reservationID
-- then update price
select R.ReservationID
from RESERVATION R join ROOM_has_RESERVATION RR
on R.ReservationID = RR.ReservationID 
and RR.room_number = 108 and RR.HotelID = 2
and R.checkin <= "2020-12-16" and R.checkout >= "2020-12-16";
-- produces 14 
update RESERVATION 
set final_price = final_price
+ 2*
(select price from SERVICES 
where HotelID = 2 and name = "breakfast")
where ReservationID = 14;



-- Part 3.
-- 1. get reservationID by room number (101), hotel ID (1)
-- 2. get all services linked to that reservation from SERVICES_HISTORY
-- 3. choose name, count of ordered service, prices for single service, total price for the service (count * price)
-- 4. Get final price connected to the reservation

select SH.name, count, price
from SERVICES_HISTORY SH join SERVICES S
where SH.HotelID = 2 and SH.name = S.name 
and ReservationID = 
(select R.ReservationID
from RESERVATION R join ROOM_has_RESERVATION RR
on R.ReservationID = RR.ReservationID 
and room_number = 108 and HotelID = 2
and checkin <= "2020-12-16" and checkout >= "2020-12-16");

-- get final_price
select final_price
from RESERVATION R join ROOM_has_RESERVATION RR
on R.ReservationID = RR.ReservationID 
and room_number = 108 and HotelID = 2
and checkin <= "2020-12-16" and checkout >= "2020-12-16";

-- ================================================= Q5 ============================================= --
/*
First, we create a table named table1 with GuestID of guests and sum of spent money of reservations after ‘2019-12-31’ by each of these guests. 
Then, We take IDs of only those guests who spent more than 1000 dollars since 1 January, 2020. During the update of the categories, 
We place the condition that guestID should be in the list of returned guestIDs in the previous sentence. 
Also, we place the condition that the current category of guest should be bronze.
*/
update GUEST
set category = 'silver'
where GuestID in (
	select GuestID 
	from (select GuestID, sum(final_price) as totalSpentMoney
		from RESERVATION 
		where checkin > '2019-12-31'
		group by GuestID) as table1
where totalSpentMoney > 1000) and category = 'bronze';



