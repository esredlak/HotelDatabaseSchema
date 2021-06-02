USE reservationschema;

INSERT IGNORE INTO Amenity (AmenityName, Description, AddCost) 
	VALUES 	('Microwave' , 'Nukes food', NULL),
			('Refrigerator' , 'Cools food' , NULL),
            ('Oven' , 'Warms food' , NULL),
            ('Jacuzzi' , 'Warms body', 25);
            
INSERT IGNORE INTO RoomType (RoomType, MaximumOccupancy, StandardOccupancy, BasePrice, PricePerAddAdult)
	VALUES 	('Single' , 2 , 2 , 149.99 , NULL ),
			('Double' , 4 , 2 , 174.99 , 10 ),
            ('Suite' , 8 , 3 , 399.99 , 20 );
            
INSERT IGNORE INTO Room (RoomNumber, RoomType, ADAAccessible)
	VALUES 	(201 , 'Double' , 0),
			(202 , 'Double' , 1),
            (203 , 'Double' , 0),
            (204 , 'Double' , 1),
            (205 , 'Single' , 0),
            (206 , 'Single' , 1),
            (207 , 'Single' , 0),
            (208 , 'Single' , 1),
            (301 , 'Double' , 0),
			(302 , 'Double' , 1),
            (303 , 'Double' , 0),
            (304 , 'Double' , 1),
            (305 , 'Single' , 0),
            (306 , 'Single' , 1),
            (307 , 'Single' , 0),
            (308 , 'Single' , 1),
            (401 , 'Suite' , 1),
            (402 , 'Suite' , 1);
            
INSERT IGNORE INTO RoomAmenity (RoomNumber , AmenityName)
	VALUES 	(201 , 'Microwave'),
			(201 , 'Jacuzzi'),
            (202 , 'Refrigerator'),
            (203 , 'Microwave'),
            (203 , 'Jacuzzi'),
            (204 , 'Refrigerator'),
            (205 , 'Microwave'),
            (205 , 'Refrigerator'),
            (205 , 'Jacuzzi'),
            (206 , 'Microwave'),
            (206 , 'Refrigerator'),
            (207 , 'Microwave'),
            (207 , 'Refrigerator'),
            (207 , 'Jacuzzi'),
            (208 , 'Microwave'),
            (208 , 'Refrigerator'),
            (301 , 'Microwave'),
			(301 , 'Jacuzzi'),
            (302 , 'Refrigerator'),
            (303 , 'Microwave'),
            (303 , 'Jacuzzi'),
            (304 , 'Refrigerator'),
            (305 , 'Microwave'),
            (305 , 'Refrigerator'),
            (305 , 'Jacuzzi'),
            (306 , 'Microwave'),
            (306 , 'Refrigerator'),
            (307 , 'Microwave'),
            (307 , 'Refrigerator'),
            (307 , 'Jacuzzi'),
            (308 , 'Microwave'),
            (308 , 'Refrigerator'),
            (401 , 'Microwave'),
            (401 , 'Refrigerator'),
            (401 , 'Oven'),
			(402 , 'Microwave'),
            (402 , 'Refrigerator'),
            (402 , 'Oven');
            
INSERT IGNORE INTO Guest (FirstName , LastName , Street , City , State , ZIP, Phone)
	VALUES	('Eric' , 'Redlak' , '1337 Swashbuckler Way' , 'Pooler' , 'GA' , '31322' , '9126742203'),
			('Mack' , 'Simmer' , '379 Old Shore St' , 'Council Bluffs' , 'IA' , '51501' , '2915530508'),
            ('Bettyann' , 'Seery' , '750 Wintergreen Dr' , 'Wasilla' , 'AK' , '99654' , '4782779632'),
            ('Duane' , 'Cullison' , '9662 Foxrun Ln' , 'Harlingen' , 'TX' , '78552' , '3084940198'),
            ('Karie' , 'Yang' , '937 W. Augusta Ave' , 'West Deptford' , 'NJ' , '08096' , '2147300298'),
            ('Aurore' , 'Lipton' , '762 Wild Rose St' , 'Saginaw' , 'MI' , '48601' , '3775070974'),
            ('Zachery' , 'Luechtefeld' , '7 Poplar Dr' , 'Arvada' , 'CO' , '80003' , '8144852615'),
            ('Jeremiah' , 'Pendergrass' , '70 Oakwood St' , 'Zion' , 'IL' , '60099' , '2794910960'),
            ('Walter' , 'Holaway' , '7556 Arrowhead St' , 'Cumberland' , 'RI' , '02864' , '4463966785'),
            ('Wilfred' , 'Vise' , '77 West Surrey St' , 'Oswego' , 'NY' , '13126' , '8347271001'),
            ('Maritza' , 'Tilton' , '939 Linda Rd' , 'Burke' , 'VA' , '22015' , '4463516860'),
            ('Joleen' , 'Tison' , '87 Queen St' , 'Drexel Hill' , 'PA' , '19026' , '2318932755');
            
INSERT IGNORE INTO Reservation (GuestId , NumberAdults , NumberChildren , StartDate , EndDate )
	VALUES 	( (SELECT g.GuestId FROM Guest g WHERE g.FirstName = 'Mack' AND g.LastName = 'Simmer') , 1 , 0 , '2023-02-02' , '2023-02-04'),
            ( (SELECT g.GuestId FROM Guest g WHERE g.FirstName = 'Bettyann' AND g.LastName = 'Seery') , 2 , 1 , '2023-02-05' , '2023-02-10'),
            ( (SELECT g.GuestId FROM Guest g WHERE g.FirstName = 'Duane' AND g.LastName = 'Cullison') , 2 , 0 , '2023-02-22' , '2023-02-24'),
            ( (SELECT g.GuestId FROM Guest g WHERE g.FirstName = 'Karie' AND g.LastName = 'Yang') , 2 , 2 , '2023-03-06' , '2023-03-07'),
            ( (SELECT g.GuestId FROM Guest g WHERE g.FirstName = 'Eric' AND g.LastName = 'Redlak') , 1 , 1 , '2023-03-17' , '2023-03-20'),
            ( (SELECT g.GuestId FROM Guest g WHERE g.FirstName = 'Aurore' AND g.LastName = 'Lipton') , 3 , 0 , '2023-03-18' , '2023-03-23'),
            ( (SELECT g.GuestId FROM Guest g WHERE g.FirstName = 'Zachery' AND g.LastName = 'Luechtefeld') , 2 , 2 , '2023-03-29' , '2023-03-31'),
            ( (SELECT g.GuestId FROM Guest g WHERE g.FirstName = 'Jeremiah' AND g.LastName = 'Pendergrass') , 2 , 0 , '2023-03-31' , '2023-04-05'),
            ( (SELECT g.GuestId FROM Guest g WHERE g.FirstName = 'Walter' AND g.LastName = 'Holaway') , 1 , 0 , '2023-04-09' , '2023-04-13'),
            ( (SELECT g.GuestId FROM Guest g WHERE g.FirstName = 'Wilfred' AND g.LastName = 'Vise') , 1 , 1 , '2023-04-23' , '2023-04-24'),
            ( (SELECT g.GuestId FROM Guest g WHERE g.FirstName = 'Maritza' AND g.LastName = 'Tilton') , 2 , 4 , '2023-05-30' , '2023-06-02'),
            ( (SELECT g.GuestId FROM Guest g WHERE g.FirstName = 'Joleen' AND g.LastName = 'Tison') , 2 , 0 , '2023-06-10' , '2023-06-14'),
            ( (SELECT g.GuestId FROM Guest g WHERE g.FirstName = 'Joleen' AND g.LastName = 'Tison') , 1 , 0 , '2023-06-10' , '2023-06-14'),
            ( (SELECT g.GuestId FROM Guest g WHERE g.FirstName = 'Aurore' AND g.LastName = 'Lipton') , 3 , 0 , '2023-06-17' , '2023-06-18'),
            ( (SELECT g.GuestId FROM Guest g WHERE g.FirstName = 'Eric' AND g.LastName = 'Redlak') , 2 , 0 , '2023-06-28' , '2023-07-02'),
            ( (SELECT g.GuestId FROM Guest g WHERE g.FirstName = 'Walter' AND g.LastName = 'Holaway') , 3 , 1 , '2023-07-13' , '2023-07-14'),
            ( (SELECT g.GuestId FROM Guest g WHERE g.FirstName = 'Wilfred' AND g.LastName = 'Vise') , 4 , 2 , '2023-07-18' , '2023-07-21'),
            ( (SELECT g.GuestId FROM Guest g WHERE g.FirstName = 'Bettyann' AND g.LastName = 'Seery') , 2 , 1 , '2023-07-28' , '2023-07-29'),
            ( (SELECT g.GuestId FROM Guest g WHERE g.FirstName = 'Bettyann' AND g.LastName = 'Seery') , 1 , 0 , '2023-08-30' , '2023-09-01'),
            ( (SELECT g.GuestId FROM Guest g WHERE g.FirstName = 'Mack' AND g.LastName = 'Simmer') , 2 , 0 , '2023-09-16' , '2023-09-17'),
            ( (SELECT g.GuestId FROM Guest g WHERE g.FirstName = 'Karie' AND g.LastName = 'Yang') , 2 , 2 , '2023-09-13' , '2023-09-15'),
            ( (SELECT g.GuestId FROM Guest g WHERE g.FirstName = 'Duane' AND g.LastName = 'Cullison') , 2 , 2 , '2023-11-22' , '2023-11-25'),
            ( (SELECT g.GuestId FROM Guest g WHERE g.FirstName = 'Mack' AND g.LastName = 'Simmer') , 2 , 0 , '2023-11-22' , '2023-11-25'),
            ( (SELECT g.GuestId FROM Guest g WHERE g.FirstName = 'Mack' AND g.LastName = 'Simmer') , 2 , 2 , '2023-11-22' , '2023-11-25'),
            ( (SELECT g.GuestId FROM Guest g WHERE g.FirstName = 'Maritza' AND g.LastName = 'Tilton') , 2 , 0 , '2023-12-24' , '2023-12-28');
            
INSERT IGNORE INTO RoomReservation (RoomNumber , ReservationId)
	VALUES 	(308 , (SELECT r.ReservationId FROM Reservation r 
                INNER JOIN Guest g ON g.GuestId = r.GuestId
                WHERE g.FirstName = 'Mack' AND g.LastName = 'Simmer' AND r.NumberAdults = 1 AND r.NumberChildren = 0 AND r.StartDate = '2023-02-02' )),
        	(203 , (SELECT r.ReservationId FROM Reservation r 
                INNER JOIN Guest g ON g.GuestId = r.GuestId
                WHERE g.FirstName = 'Bettyann' AND g.LastName = 'Seery' AND r.NumberAdults = 2 AND r.NumberChildren = 1 AND r.StartDate = '2023-02-05' )),
        	(305 , (SELECT r.ReservationId FROM Reservation r 
                INNER JOIN Guest g ON g.GuestId = r.GuestId
                WHERE g.FirstName = 'Duane' AND g.LastName = 'Cullison' AND r.NumberAdults = 2 AND r.NumberChildren = 0 AND r.StartDate = '2023-02-22' )),
            (201 , (SELECT r.ReservationId FROM Reservation r 
                INNER JOIN Guest g ON g.GuestId = r.GuestId
                WHERE g.FirstName = 'Karie' AND g.LastName = 'Yang' AND r.NumberAdults = 2 AND r.NumberChildren = 2 AND r.StartDate = '2023-03-06' )),
            (307 , (SELECT r.ReservationId FROM Reservation r 
                INNER JOIN Guest g ON g.GuestId = r.GuestId
                WHERE g.FirstName = 'Eric' AND g.LastName = 'Redlak' AND r.NumberAdults = 1 AND r.NumberChildren = 1 AND r.StartDate = '2023-03-17' )),
            (302 , (SELECT r.ReservationId FROM Reservation r 
                INNER JOIN Guest g ON g.GuestId = r.GuestId
                WHERE g.FirstName = 'Aurore' AND g.LastName = 'Lipton' AND r.NumberAdults = 3 AND r.NumberChildren = 0 AND r.StartDate = '2023-03-18' )),
            (202 , (SELECT r.ReservationId FROM Reservation r 
                INNER JOIN Guest g ON g.GuestId = r.GuestId
                WHERE g.FirstName = 'Zachery' AND g.LastName = 'Luechtefeld' AND r.NumberAdults = 2 AND r.NumberChildren = 2 AND r.StartDate = '2023-03-29' )),
            (304 , (SELECT r.ReservationId FROM Reservation r 
                INNER JOIN Guest g ON g.GuestId = r.GuestId
                WHERE g.FirstName = 'Jeremiah' AND g.LastName = 'Pendergrass' AND r.NumberAdults = 2 AND r.NumberChildren = 0 AND r.StartDate = '2023-03-31' )),
            (301 , (SELECT r.ReservationId FROM Reservation r 
                INNER JOIN Guest g ON g.GuestId = r.GuestId
                WHERE g.FirstName = 'Walter' AND g.LastName = 'Holaway' AND r.NumberAdults = 1 AND r.NumberChildren = 0 AND r.StartDate = '2023-04-09' )),
            (207 , (SELECT r.ReservationId FROM Reservation r 
                INNER JOIN Guest g ON g.GuestId = r.GuestId
                WHERE g.FirstName = 'Wilfred' AND g.LastName = 'Vise' AND r.NumberAdults = 1 AND r.NumberChildren = 1 AND r.StartDate = '2023-04-23' )),
            (401 , (SELECT r.ReservationId FROM Reservation r 
                INNER JOIN Guest g ON g.GuestId = r.GuestId
                WHERE g.FirstName = 'Maritza' AND g.LastName = 'Tilton' AND r.NumberAdults = 2 AND r.NumberChildren = 4 AND r.StartDate = '2023-05-30' )),
            (206 , (SELECT r.ReservationId FROM Reservation r 
                INNER JOIN Guest g ON g.GuestId = r.GuestId
                WHERE g.FirstName = 'Joleen' AND g.LastName = 'Tison' AND r.NumberAdults = 2 AND r.NumberChildren = 0 AND r.StartDate = '2023-06-10' )),
            (208 , (SELECT r.ReservationId FROM Reservation r 
                INNER JOIN Guest g ON g.GuestId = r.GuestId
                WHERE g.FirstName = 'Joleen' AND g.LastName = 'Tison' AND r.NumberAdults = 1 AND r.NumberChildren = 0 AND r.StartDate = '2023-06-10' )),
            (304 , (SELECT r.ReservationId FROM Reservation r 
                INNER JOIN Guest g ON g.GuestId = r.GuestId
                WHERE g.FirstName = 'Aurore' AND g.LastName = 'Lipton' AND r.NumberAdults = 3 AND r.NumberChildren = 0 AND r.StartDate = '2023-06-17' )),
            (205 , (SELECT r.ReservationId FROM Reservation r 
                INNER JOIN Guest g ON g.GuestId = r.GuestId
                WHERE g.FirstName = 'Eric' AND g.LastName = 'Redlak' AND r.NumberAdults = 2 AND r.NumberChildren = 0 AND r.StartDate = '2023-06-28' )),
            (204 , (SELECT r.ReservationId FROM Reservation r 
                INNER JOIN Guest g ON g.GuestId = r.GuestId
                WHERE g.FirstName = 'Walter' AND g.LastName = 'Holaway' AND r.NumberAdults = 3 AND r.NumberChildren = 1 AND r.StartDate = '2023-07-13' )),
            (401 , (SELECT r.ReservationId FROM Reservation r 
                INNER JOIN Guest g ON g.GuestId = r.GuestId
                WHERE g.FirstName = 'Wilfred' AND g.LastName = 'Vise' AND r.NumberAdults = 4 AND r.NumberChildren = 2 AND r.StartDate = '2023-07-18' )),
            (303 , (SELECT r.ReservationId FROM Reservation r 
                INNER JOIN Guest g ON g.GuestId = r.GuestId
                WHERE g.FirstName = 'Bettyann' AND g.LastName = 'Seery' AND r.NumberAdults = 2 AND r.NumberChildren = 1 AND r.StartDate = '2023-07-28' )),
            (305 , (SELECT r.ReservationId FROM Reservation r 
                INNER JOIN Guest g ON g.GuestId = r.GuestId
                WHERE g.FirstName = 'Bettyann' AND g.LastName = 'Seery' AND r.NumberAdults = 1 AND r.NumberChildren = 0 AND r.StartDate = '2023-08-30' )),
            (208 , (SELECT r.ReservationId FROM Reservation r 
                INNER JOIN Guest g ON g.GuestId = r.GuestId
                WHERE g.FirstName = 'Mack' AND g.LastName = 'Simmer' AND r.NumberAdults = 2 AND r.NumberChildren = 0 AND r.StartDate = '2023-09-16' )),
            (203 , (SELECT r.ReservationId FROM Reservation r 
                INNER JOIN Guest g ON g.GuestId = r.GuestId
                WHERE g.FirstName = 'Karie' AND g.LastName = 'Yang' AND r.NumberAdults = 2 AND r.NumberChildren = 2 AND r.StartDate = '2023-09-13' )),
            (401 , (SELECT r.ReservationId FROM Reservation r 
                INNER JOIN Guest g ON g.GuestId = r.GuestId
                WHERE g.FirstName = 'Duane' AND g.LastName = 'Cullison' AND r.NumberAdults = 2 AND r.NumberChildren = 2 AND r.StartDate = '2023-11-22' )),
            (206 , (SELECT r.ReservationId FROM Reservation r 
                INNER JOIN Guest g ON g.GuestId = r.GuestId
                WHERE g.FirstName = 'Mack' AND g.LastName = 'Simmer' AND r.NumberAdults = 2 AND r.NumberChildren = 0 AND r.StartDate = '2023-11-22' )),
            (301 , (SELECT r.ReservationId FROM Reservation r 
                INNER JOIN Guest g ON g.GuestId = r.GuestId
                WHERE g.FirstName = 'Mack' AND g.LastName = 'Simmer' AND r.NumberAdults = 2 AND r.NumberChildren = 2 AND r.StartDate = '2023-11-22' )),
            (302 , (SELECT r.ReservationId FROM Reservation r 
                INNER JOIN Guest g ON g.GuestId = r.GuestId
                WHERE g.FirstName = 'Maritza' AND g.LastName = 'Tilton' AND r.NumberAdults = 2 AND r.NumberChildren = 0 AND r.StartDate = '2023-12-24' ));
            
-- delete all reservations that have Jeremiah Pendergrass's guestId, then delete pendergrass

DELETE FROM RoomReservation rr
	WHERE rr.ReservationId = (
		SELECT r.ReservationId FROM Reservation r 
			INNER JOIN Guest g ON r.GuestId = g.GuestId
            WHERE g.FirstName = 'Jeremiah' AND g.LastName = 'Pendergrass');

DELETE FROM Reservation r
	WHERE r.GuestId = (
		SELECT g.GuestId FROM Guest g 
        WHERE g.FirstName = 'Jeremiah' AND g.LastName = 'Pendergrass');
    
    
    -- I'm trying to do this in a way that we don't need to know the auto incremented GuestId. 
    -- Keep getting error '1175 : You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column
    
SET SQL_SAFE_UPDATES = 0;

DELETE FROM Guest 
	WHERE GuestId = ( 
		SELECT GuestId 
		WHERE FirstName= 'Jeremiah' AND LastName = 'Pendergrass');

SET SQL_SAFE_UPDATES = 1;


