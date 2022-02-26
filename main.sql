/*TABLE CREATION*/


CREATE TABLE Hotel(
    hotelNo VARCHAR(4) PRIMARY KEY, 
    hotelName VARCHAR(25), 
    city VARCHAR(15)
);
CREATE TABLE Room(
  roomNo NUMERIC(3,0),
  hotelNo VARCHAR(4), 
  type_ CHAR(6),
  price NUMERIC(3,0),
  CHECK(roomNo >=1 AND roomNo <= 120),
  FOREIGN KEY(hotelNo) REFERENCES Hotel(hotelNo),
  PRIMARY KEY(roomNo, hotelNo),
  CHECK(type_ IN ('Single', 'Double', 'Family')),
  CHECK(price >= 10 AND price <= 100)
);

CREATE TABLE Guest (
  guestNo VARCHAR(4),
  guestName VARCHAR(35) NOT NULL,
  guestAdress VARCHAR(25) NOT NULL,
  PRIMARY KEY(guestNo)
);

CREATE TABLE Booking (
  hotelNo VARCHAR(4),
  guestNo VARCHAR(4),
  dateFrom DATE,
  dateTo DATE,
  roomNo NUMERIC(3,0),
  CHECK(roomNo >= 1 AND roomNo <= 120),
  FOREIGN KEY(hotelNo) REFERENCES Hotel(hotelNo),
  FOREIGN KEY(guestNo) REFERENCES Guest(guestNo),
  FOREIGN KEY(roomNo, hotelNo) REFERENCES Room(roomNo, hotelNo),
  CHECK (dateFrom > CURRENT_DATE AND dateto > CURRENT_DATE),
  PRIMARY KEY (hotelNo, guestNo, dateFrom)
);


/*DATA INSERTION*/

INSERT INTO Hotel(hotelNo, hotelName, city) VALUES ('H01', 'Hotel One', 'London');
INSERT INTO Hotel(hotelNo, hotelName, city) VALUES ('H03', 'Hotel Three', 'Berlin');
INSERT INTO Hotel(hotelNo, hotelName, city) VALUES ('H02', 'Hotel Two', 'Paris');
INSERT INTO Hotel(hotelNo, hotelName, city) VALUES ('H04', 'Hotel Four', 'Rome');
INSERT INTO Hotel(hotelNo, hotelName, city) VALUES ('H05', 'Hotel Five', 'New York');
INSERT INTO Hotel(hotelNo, hotelName, city) VALUES ('H06', 'Hotel Six', 'Madrid');
INSERT INTO Hotel(hotelNo, hotelName, city) VALUES ('H07', 'Hotel Seven', 'London');
INSERT INTO Hotel(hotelNo, hotelName, city) VALUES ('H08', 'Hotel Eight', 'Paris');
INSERT INTO Hotel(hotelNo, hotelName, city) VALUES ('H09', 'Hotel Nine', 'Berlin');
INSERT INTO Hotel(hotelNo, hotelName, city) VALUES ('H10', 'Hotel Ten', 'Rome');
INSERT INTO Hotel(hotelNo, hotelName, city) VALUES ('H11', 'Hotel Eleven', 'New York');
INSERT INTO Hotel(hotelNo, hotelName, city) VALUES ('H12', 'Hotel Twelve', 'Madrid');
INSERT INTO Hotel(hotelNo, hotelName, city) VALUES ('H13', 'Hotel Thirteen', 'London');
INSERT INTO Room VALUES (1, 'H01', 'Single', 20);
INSERT INTO Room VALUES (2, 'H01', 'Double', 30);
INSERT INTO Room VALUES (3, 'H02', 'Family', 40);
INSERT INTO Room VALUES (4, 'H02', 'Single', 20);
INSERT INTO Room VALUES (5, 'H03', 'Double', 30);
INSERT INTO Room VALUES (6, 'H03', 'Family', 40);
INSERT INTO Room VALUES (7, 'H04', 'Single', 20);
INSERT INTO Room VALUES (8, 'H04', 'Double', 30);
INSERT INTO Room VALUES (9, 'H05', 'Family', 40);
INSERT INTO Room VALUES (10, 'H05', 'Single', 20);
INSERT INTO Room VALUES (11, 'H06', 'Double', 30);
INSERT INTO Room VALUES (12, 'H06', 'Family', 40);
INSERT INTO Room VALUES (13, 'H01', 'Single', 20);
INSERT INTO Room VALUES (14, 'H01', 'Double', 30);
INSERT INTO Room VALUES (15, 'H01', 'Family', 40);
INSERT INTO Room VALUES (16, 'H01', 'Single', 20);
INSERT INTO Room VALUES (17, 'H01', 'Double', 30);
INSERT INTO Room VALUES (18, 'H01', 'Family', 40);
INSERT INTO Room VALUES (19, 'H01', 'Single', 20);
INSERT INTO Room VALUES (20, 'H01', 'Double', 30);
INSERT INTO Room VALUES (21, 'H01', 'Family', 40);
INSERT INTO Room VALUES (22, 'H01', 'Single', 20);
INSERT INTO Room VALUES (23, 'H01', 'Double', 30);
INSERT INTO Room VALUES (24, 'H01', 'Family', 40);
INSERT INTO Room VALUES (25, 'H02', 'Single', 20);
INSERT INTO Room VALUES (26, 'H02', 'Double', 30);
INSERT INTO Room VALUES (27, 'H02', 'Family', 40);
INSERT INTO Room VALUES (28, 'H02', 'Single', 20);
INSERT INTO Room VALUES (29, 'H02', 'Double', 30); 
INSERT INTO Guest VALUES (1, 'John', 'London');
INSERT INTO Guest VALUES (2, 'Jane', 'London');
INSERT INTO Guest VALUES (3, 'Jack', 'London');
INSERT INTO Guest VALUES (4, 'Jill', 'London');
INSERT INTO Guest VALUES (5, 'Joe', 'London');
INSERT INTO Guest VALUES (6, 'Jenny', 'London');
INSERT INTO Guest VALUES (7, 'Jim', 'London');
INSERT INTO Guest VALUES (8, 'Jem', 'London');
INSERT INTO Guest VALUES (9, 'Jan', 'London');
INSERT INTO Guest VALUES (10, 'Juan', 'London');
INSERT INTO Booking VALUES ('H01', '1', '2022-06-01', '2022-06-02', 1);
INSERT INTO Booking VALUES ('H01', '2', '2022-06-03', '2022-06-04', 2);
INSERT INTO Booking VALUES ('H02', '3', '2022-06-05', '2022-06-06', 3);
INSERT INTO Booking VALUES ('H02', '4', '2022-06-07', '2022-06-08', 4);
INSERT INTO Booking VALUES ('H03', '5', '2022-06-09', '2022-06-10', 5);
INSERT INTO Booking VALUES ('H03', '6', '2022-06-11', '2022-06-12', 6);
INSERT INTO Booking VALUES ('H04', '7', '2022-06-13', '2022-06-14', 7);
INSERT INTO Booking VALUES ('H04', '8', '2022-06-15', '2022-06-16', 8);
INSERT INTO Booking VALUES ('H05', '9', '2022-06-17', '2022-06-18', 9);
INSERT INTO Booking VALUES ('H05', '10', '2022-06-19', '2022-06-20', 10);

INSERT INTO Booking(hotelNo, guestNo, dateFrom, dateTo, roomNo) VALUES ('H01', '1', TO_DATE('2022-06-01', 'YYYY-MM-DD'), TO_DATE('2022-06-02', 'YYYY-MM-DD'), 1);
INSERT INTO Booking(hotelNo, guestNo, dateFrom, dateTo, roomNo) VALUES ('H01', '2', TO_DATE('2022-06-03', 'YYYY-MM-DD'), TO_DATE('2022-06-04', 'YYYY-MM-DD'), 2);
INSERT INTO Booking(hotelNo, guestNo, dateFrom, dateTo, roomNo) VALUES ('H02', '3', TO_DATE('2022-06-05', 'YYYY-MM-DD'), TO_DATE('2022-06-06', 'YYYY-MM-DD'), 3);
INSERT INTO Booking(hotelNo, guestNo, dateFrom, dateTo, roomNo) VALUES ('H02', '4', TO_DATE('2022-06-07', 'YYYY-MM-DD'), TO_DATE('2022-06-08', 'YYYY-MM-DD'), 4);
INSERT INTO Booking(hotelNo, guestNo, dateFrom, dateTo, roomNo) VALUES ('H03', '5', TO_DATE('2022-06-09', 'YYYY-MM-DD'), TO_DATE('2022-06-10', 'YYYY-MM-DD'), 5);
INSERT INTO Booking(hotelNo, guestNo, dateFrom, dateTo, roomNo) VALUES ('H03', '6', TO_DATE('2022-06-11', 'YYYY-MM-DD'), TO_DATE('2022-06-12', 'YYYY-MM-DD'), 6);
INSERT INTO Booking(hotelNo, guestNo, dateFrom, dateTo, roomNo) VALUES ('H04', '7', TO_DATE('2022-06-13', 'YYYY-MM-DD'), TO_DATE('2022-06-14', 'YYYY-MM-DD'), 7);
INSERT INTO Booking(hotelNo, guestNo, dateFrom, dateTo, roomNo) VALUES ('H04', '8', TO_DATE('2022-06-15', 'YYYY-MM-DD'), TO_DATE('2022-06-16', 'YYYY-MM-DD'), 8);
INSERT INTO Booking(hotelNo, guestNo, dateFrom, dateTo, roomNo) VALUES ('H05', '9', TO_DATE('2022-06-17', 'YYYY-MM-DD'), TO_DATE('2022-06-18', 'YYYY-MM-DD'), 9);
INSERT INTO Booking(hotelNo, guestNo, dateFrom, dateTo, roomNo) VALUES ('H05', '10',TO_DATE('2022-06-19', 'YYYY-MM-DD'), TO_DATE('2022-06-20', 'YYYY-MM-DD'), 10);