DROP DATABASE IF EXISTS ReservationSchema;

CREATE DATABASE ReservationSchema;

USE ReservationSchema;

CREATE TABLE `RoomType` (
    `RoomType` CHAR(10) NOT NULL,
    `StandardOccupancy` int NOT NULL,
    `MaximumOccupancy` int NOT NULL,
    `BasePrice` DECIMAL(19,4) NOT NULL,
    `PricePerAddAdult` DECIMAL(19,4),
    PRIMARY KEY (`RoomType`)
);

CREATE TABLE `Amenity` (
	`AmenityName` CHAR(30) NOT NULL,
    `AddCost` DECIMAL(19,4),
    `Description` VARCHAR(50),
	PRIMARY KEY (`AmenityName`)
);

CREATE TABLE `Room` (
	`RoomNumber` int NOT NULL,
    `RoomType` CHAR(10) NOT NULL,
    `ADAAccessible` BIT(1) NOT NULL,
    PRIMARY KEY (`RoomNumber`)
);

ALTER TABLE `Room`
	ADD CONSTRAINT `fk_RoomRoomType` FOREIGN KEY (`RoomType`) REFERENCES `RoomType` (`RoomType`);
    
CREATE TABLE `RoomAmenity` (
	`RoomNumber` INT NOT NULL,
    `AmenityName` Char(30) NOT NULL,
    PRIMARY KEY pk_RoomAmenity (RoomNumber, AmenityName),
		FOREIGN KEY fk_RoomAmenity_Room (RoomNumber)
			REFERENCES Room(RoomNumber),
		FOREIGN KEY fk_RoomAmenity_Amenity (AmenityName)
			REFERENCES Amenity(AmenityName)
);
CREATE TABLE `Guest` (
	`GuestId` int NOT NULL AUTO_INCREMENT,
    `FirstName` CHAR(20) NOT NULL,
    `LastName` CHAR(30) NOT NULL,
    `Phone` CHAR(10) NOT NULL,
    `Street` CHAR(50) NOT NULL,
    `ZIP` CHAR(5) NOT NULL,
    `City` CHAR(50) NOT NULL,
    `State` CHAR(15) NOT NULL,
    PRIMARY KEY (`GuestId`)
);

CREATE TABLE `Reservation` (
	`ReservationId` int NOT NULL AUTO_INCREMENT,
    `GuestId` int NOT NULL,
    `NumberAdults` int NOT NULL,
    `NumberChildren` int,
    `StartDate` DATE NOT NULL,
    `EndDate` DATE NOT NULL,
    PRIMARY KEY (`ReservationId`)
);

ALTER TABLE `Reservation`
   ADD CONSTRAINT `fk_ReservationGuestId` FOREIGN KEY (`GuestId`) REFERENCES `Guest` (`GuestId`);

CREATE TABLE `RoomReservation` (
	`RoomNumber` int NOT NULL,
    `ReservationId` int NOT NULL
);

ALTER TABLE `RoomReservation`
	ADD PRIMARY KEY `pk_RoomRervation` (RoomNumber, ReservationId),
	ADD CONSTRAINT `fk_RRReservationId` FOREIGN KEY (`ReservationId`) REFERENCES `Reservation` (`ReservationId`),
    ADD CONSTRAINT `fk_RRRoomNumber` FOREIGN KEY (`RoomNumber`) REFERENCES `Room` (`RoomNumber`);