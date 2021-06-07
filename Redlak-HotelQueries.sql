use ReservationSchema;

-- 1. Write a query that returns a list of reservations that end in July 2023, including the name of the guest, the room number(s), and the reservation dates.

	SELECT 
		CONCAT( g.FirstName , " " , g.LastName ) AS Name,
		rr.RoomNumber,
		r.StartDate,
		r.EndDate
	FROM Reservation r 
	INNER JOIN RoomReservation rr ON r.ReservationId = rr.ReservationId
	INNER JOIN Guest g ON r.GuestId = g.GuestId
	WHERE r.EndDate BETWEEN '2023-07-01' AND '2023-07-31';
			
		-- Name, RoomNumber,StartDate,EndDate
		-- "Eric Redlak",205,2023-06-28,2023-07-02
		-- "Walter Holaway",204,2023-07-13,2023-07-14
		-- "Wilfred Vise",401,2023-07-18,2023-07-21
		-- "Bettyann Seery",303,2023-07-28,2023-07-29

-- 2. Write a query that returns a list of all reservations for rooms with a jacuzzi, displaying the guest's name, the room number, and the dates of the reservation.

	SELECT
		CONCAT( g.FirstName , " " , g.LastName ) AS Name,
		rr.RoomNumber,
		res.StartDate,
		res.EndDate
	FROM Reservation res
    INNER JOIN Guest g ON res.GuestId = g.GuestId
    INNER JOIN RoomReservation rr ON res.ReservationId = rr.ReservationId
    LEFT JOIN Room rm ON rm.RoomNumber = rr.RoomNumber
    LEFT JOIN RoomAmenity ra ON rm.RoomNumber = ra.RoomNumber
    WHERE ra.AmenityName LIKE 'Jacuzzi';
    
		-- Name,RoomNumber,StartDate,EndDate
		-- "Karie Yang",201,2023-03-06,2023-03-07
		-- "Bettyann Seery",203,2023-02-05,2023-02-10
		-- "Karie Yang",203,2023-09-13,2023-09-15
		-- "Eric Redlak",205,2023-06-28,2023-07-02
		-- "Wilfred Vise",207,2023-04-23,2023-04-24
		-- "Walter Holaway",301,2023-04-09,2023-04-13
		-- "Mack Simmer",301,2023-11-22,2023-11-25
		-- "Bettyann Seery",303,2023-07-28,2023-07-29
		-- "Duane Cullison",305,2023-02-22,2023-02-24
		-- "Bettyann Seery",305,2023-08-30,2023-09-01
		-- "Eric Redlak",307,2023-03-17,2023-03-20


-- 3. Write a query that returns all the rooms reserved for a specific guest, including the guest's name, the room(s) reserved, 
-- the starting date of the reservation, and how many people were included in the reservation. (Choose a guest's name from the existing data.)

SELECT 
	CONCAT( g.FirstName , " " , g.LastName ) AS Name,
	rr.RoomNumber,
    res.StartDate,
    res.NumberAdults + res.NumberChildren AS 'Total Guests'
FROM RoomReservation rr
LEFT JOIN Reservation res ON rr.ReservationId = res.ReservationId
INNER JOIN Guest g ON g.GuestId = res.GuestId
WHERE CONCAT( g.FirstName , " " , g.LastName ) LIKE 'Mack Simmer';
    
		-- Name,RoomNumber,StartDate,"Total Guests"
		-- "Mack Simmer",308,2023-02-02,1
		-- "Mack Simmer",208,2023-09-16,2
		-- "Mack Simmer",206,2023-11-22,2
		-- "Mack Simmer",301,2023-11-22,4


-- 4. Write a query that returns a list of rooms, reservation ID, and per-room cost for each reservation. 
-- The results should include all rooms, whether or not there is a reservation associated with the room.

SELECT DISTINCT
	rm.RoomNumber,
	res.ReservationId,
    ( rt.BasePrice + ( COALESCE(rt.PricePerAddAdult,0) * GREATEST(( res.NumberAdults - rt.StandardOccupancy ),0)) + COALESCE(a.AddCost, 0) ) AS 'Price Per Night'
    -- COALESCE finds the first value that is not null (replaces null with zero here). GREATEST is used to ignore negatives (we don't give discounts for having lower than StandardOccupancy)
FROM Room rm
INNER JOIN RoomType rt ON rm.RoomType = rt.RoomType
LEFT JOIN RoomReservation rr ON rm.RoomNumber = rr.RoomNumber
LEFT JOIN Reservation res ON res.ReservationId = rr.ReservationId
INNER JOIN RoomAmenity ra ON ra.RoomNumber = rm.RoomNumber
INNER JOIN Amenity a ON ra.AmenityName = a.AmenityName
GROUP BY res.ReservationId, rm.RoomNumber
ORDER BY RoomNumber ASC;

		# RoomNumber, ReservationId, Price Per Night
		# '201', '4', '199.9900'
		# '202', '7', '174.9900'
		# '203', '2', '199.9900'
		# '203', '21', '199.9900'
		# '204', '16', '184.9900'
		# '205', '15', '174.9900'
		# '206', '12', '149.9900'
		# '206', '23', '149.9900'
		# '207', '10', '174.9900'
		# '208', '13', '149.9900'
		# '208', '20', '149.9900'
		# '301', '9', '199.9900'
		# '301', '24', '199.9900'
		# '302', '6', '184.9900'
		# '302', '25', '174.9900'
		# '303', '18', '199.9900'
		# '304', '14', '184.9900'
		# '305', '3', '174.9900'
		# '305', '19', '174.9900'
		# '306', NULL, NULL
		# '307', '5', '174.9900'
		# '308', '1', '149.9900'
		# '401', '11', '399.9900'
		# '401', '17', '419.9900'
		# '401', '22', '399.9900'
		# '402', NULL, NULL


-- 5. Write a query that returns all the rooms accommodating at least three guests and that are reserved on any date in April 2023.

SELECT
	rr.RoomNumber,
    (res.NumberAdults + res.NumberChildren) AS 'Total Number of Guests'
    FROM RoomReservation rr
    LEFT JOIN Reservation res ON res.ReservationId = rr.ReservationId
    WHERE ((res.StartDate BETWEEN '2023-04-01' AND '2023-05-01') OR (res.EndDate BETWEEN '2023-04-01' AND '2023-05-01'))
		AND (res.NumberAdults + res.NumberChildren) >= 3;
        
		-- The results for this query are blank because the only two reservations in April are for either 1 or 2 guests.

-- 6. Write a query that returns a list of all guest names and the number of reservations per guest, 
-- sorted starting with the guest with the most reservations and then by the guest's name.

SELECT
	CONCAT( g.FirstName , " " , g.LastName ) AS Name,
    COUNT( res.ReservationId ) As 'Number of Reservations'
FROM Reservation res
LEFT JOIN Guest g ON g.GuestId = res.GuestId
GROUP BY g.FirstName , g.LastName 
ORDER BY COUNT( res.ReservationId ) DESC, g.FirstName , g.LastName ;

		-- Name, # of Reservations
		-- 'Mack Simmer', '4'
		-- 'Bettyann Seery', '3'
		-- 'Aurore Lipton', '2'
		-- 'Duane Cullison', '2'
		-- 'Eric Redlak', '2'
		-- 'Joleen Tison', '2'
		-- 'Karie Yang', '2'
		-- 'Maritza Tilton', '2'
		-- 'Walter Holaway', '2'
		-- 'Wilfred Vise', '2'
		-- 'Zachery Luechtefeld', '1'


-- 7. Write a query that displays the name, address, and phone number of a guest based on their phone number. (Choose a phone number from the existing data.)

SELECT
	CONCAT( g.FirstName , " " , g.LastName ) AS Name,
    g.Street,
    g.City,
    g.State,
    g.ZIP,
    g.Phone
FROM Guest g
WHERE g.Phone = '4463516860';

		-- Name, Street, City, State, ZIP, Phone
		-- 'Maritza Tilton', '939 Linda Rd', 'Burke', 'VA', '22015', '4463516860'


