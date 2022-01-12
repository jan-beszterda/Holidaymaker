--
-- File generated with SQLiteStudio v3.3.3 on Wed Jan 12 15:58:10 2022
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Booking
DROP TABLE IF EXISTS Booking;

CREATE TABLE Booking (
    Id          INTEGER  PRIMARY KEY AUTOINCREMENT
                         NOT NULL,
    Customer_Id INTEGER  REFERENCES Customers (Id) ON DELETE NO ACTION
                                                   ON UPDATE NO ACTION
                         NOT NULL,
    Timestamp   DATETIME NOT NULL
);

INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (7, 13, '2022-01-10 13:07:35');
INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (8, 19, '2022-01-10 13:24:41');
INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (9, 37, '2022-01-10 13:27:11');
INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (10, 41, '2022-01-10 13:30:24');
INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (11, 26, '2022-01-10 13:34:53');
INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (12, 9, '2022-01-10 13:38:20');
INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (13, 49, '2022-01-10 13:40:51');
INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (14, 4, '2022-01-10 13:42:38');
INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (15, 2, '2022-01-10 13:47:23');
INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (16, 50, '2022-01-12 10:52:04');
INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (17, 50, '2022-01-12 10:54:05');
INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (18, 3, '2022-01-12 10:58:41');
INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (19, 10, '2022-01-12 10:59:36');
INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (20, 6, '2022-01-12 11:00:51');
INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (21, 18, '2022-01-12 11:02:19');
INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (22, 30, '2022-01-12 11:03:11');
INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (23, 22, '2022-01-12 11:05:09');
INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (24, 15, '2022-01-12 11:39:42');
INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (25, 23, '2022-01-12 11:40:29');
INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (26, 35, '2022-01-12 11:41:40');
INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (27, 36, '2022-01-12 11:43:54');
INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (28, 41, '2022-01-12 11:46:45');
INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (29, 11, '2022-01-12 11:54:00');
INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (30, 42, '2022-01-12 12:26:11');
INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (31, 45, '2022-01-12 12:35:12');
INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (32, 27, '2022-01-12 12:36:47');
INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (33, 48, '2022-01-12 12:40:52');
INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (34, 46, '2022-01-12 12:48:04');
INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (35, 37, '2022-01-12 12:50:20');
INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (36, 14, '2022-01-12 12:52:33');
INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (37, 29, '2022-01-12 12:57:41');
INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (38, 33, '2022-01-12 13:00:29');
INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (39, 38, '2022-01-12 13:04:04');
INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (40, 47, '2022-01-12 14:12:19');
INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (41, 44, '2022-01-12 14:13:28');
INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (42, 5, '2022-01-12 14:18:05');
INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (43, 1, '2022-01-12 14:19:39');
INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (44, 7, '2022-01-12 14:21:28');
INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (45, 8, '2022-01-12 14:24:34');
INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (46, 12, '2022-01-12 14:26:33');
INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (47, 16, '2022-01-12 14:27:24');
INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (48, 20, '2022-01-12 14:29:33');
INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (49, 17, '2022-01-12 14:32:05');
INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (50, 25, '2022-01-12 14:32:50');
INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (51, 31, '2022-01-12 14:34:22');
INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (52, 34, '2022-01-12 14:36:30');
INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (53, 39, '2022-01-12 14:37:57');
INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (54, 32, '2022-01-12 14:40:29');
INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (55, 28, '2022-01-12 14:41:04');
INSERT INTO Booking (Id, Customer_Id, Timestamp) VALUES (56, 43, '2022-01-12 14:41:55');

-- Table: Booking_details
DROP TABLE IF EXISTS Booking_details;

CREATE TABLE Booking_details (
    Id         INTEGER PRIMARY KEY AUTOINCREMENT
                       NOT NULL,
    Booking_Id INTEGER REFERENCES Booking (Id) ON DELETE CASCADE
                       NOT NULL,
    Hotel_Id   INTEGER REFERENCES Hotel (Id) 
                       NOT NULL,
    Room_Id    INTEGER REFERENCES Room (Id) 
                       NOT NULL,
    Start_date DATE    NOT NULL,
    End_date   DATE    NOT NULL
);

INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (5, 7, 1, 2, '2022-06-21', '2022-06-24');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (6, 8, 4, 91, '2022-06-21', '2022-06-24');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (7, 9, 4, 112, '2022-06-21', '2022-06-24');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (8, 10, 4, 117, '2022-06-21', '2022-06-24');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (9, 11, 1, 23, '2022-06-21', '2022-06-24');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (10, 12, 4, 100, '2022-06-21', '2022-06-24');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (11, 13, 6, 176, '2022-06-24', '2022-06-27');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (12, 14, 4, 101, '2022-06-21', '2022-06-24');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (13, 15, 4, 93, '2022-06-21', '2022-06-24');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (14, 16, 6, 154, '2022-07-05', '2022-07-06');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (15, 17, 2, 55, '2022-06-04', '2022-06-10');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (16, 18, 3, 85, '2022-06-04', '2022-06-06');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (17, 19, 5, 145, '2022-07-05', '2022-07-08');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (18, 20, 4, 94, '2022-06-07', '2022-06-08');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (19, 20, 4, 95, '2022-06-07', '2022-06-08');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (20, 21, 6, 152, '2022-06-10', '2022-06-14');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (21, 22, 4, 112, '2022-07-01', '2022-07-03');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (22, 23, 1, 15, '2022-06-05', '2022-06-12');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (23, 24, 3, 84, '2022-06-28', '2022-06-30');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (24, 25, 3, 88, '2022-06-20', '2022-06-23');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (25, 26, 1, 14, '2022-07-21', '2022-07-25');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (26, 27, 2, 58, '2022-06-15', '2022-06-22');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (27, 28, 2, 60, '2022-06-21', '2022-06-24');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (28, 29, 6, 177, '2022-07-02', '2022-07-03');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (29, 30, 1, 17, '2022-07-12', '2022-07-15');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (30, 31, 1, 30, '2022-07-16', '2022-07-17');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (31, 32, 4, 111, '2022-07-03', '2022-07-05');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (32, 33, 3, 75, '2022-06-13', '2022-06-15');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (33, 34, 5, 139, '2022-06-06', '2022-06-07');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (34, 35, 4, 102, '2022-07-14', '2022-07-17');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (35, 36, 6, 177, '2022-07-10', '2022-07-16');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (36, 37, 4, 115, '2022-07-18', '2022-07-20');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (37, 38, 4, 112, '2022-06-01', '2022-06-08');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (38, 39, 4, 105, '2022-06-02', '2022-06-08');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (39, 40, 4, 92, '2022-06-03', '2022-06-10');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (40, 41, 2, 49, '2022-06-21', '2022-06-28');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (41, 42, 1, 17, '2022-07-21', '2022-07-28');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (42, 43, 5, 150, '2022-06-15', '2022-06-18');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (43, 44, 1, 11, '2022-06-08', '2022-06-15');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (44, 45, 6, 161, '2022-07-12', '2022-07-16');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (45, 46, 4, 107, '2022-06-27', '2022-06-30');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (46, 47, 1, 22, '2022-06-26', '2022-06-30');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (47, 48, 4, 112, '2022-07-23', '2022-07-25');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (48, 49, 4, 118, '2022-07-14', '2022-07-21');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (49, 50, 3, 83, '2022-07-16', '2022-07-18');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (50, 51, 2, 53, '2022-07-02', '2022-07-08');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (51, 52, 3, 78, '2022-06-23', '2022-06-24');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (52, 53, 1, 28, '2022-06-18', '2022-06-21');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (53, 54, 2, 39, '2022-06-20', '2022-06-24');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (54, 55, 1, 24, '2022-07-12', '2022-07-15');
INSERT INTO Booking_details (Id, Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES (55, 56, 6, 174, '2022-07-05', '2022-07-12');

-- Table: Customers
DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers (
    Id            INTEGER PRIMARY KEY AUTOINCREMENT
                          NOT NULL,
    First_name    VARCHAR NOT NULL,
    Last_name     VARCHAR NOT NULL,
    Date_of_birth DATE    NOT NULL,
    Phone_number  VARCHAR NOT NULL,
    Email_address VARCHAR NOT NULL
);

INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (1, 'Isadora', 'Arsmith', '2001-09-26', '+52 335 252 8239', 'iarsmith0@macromedia.com');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (2, 'Rochell', 'Barnwille', '1964-08-17', '+86 205 517 0859', 'rbarnwille1@naver.com');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (3, 'Ethelin', 'Girardy', '1998-09-12', '+86 665 325 5237', 'egirardy2@cargocollective.com');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (4, 'Pammie', 'Tolumello', '1939-07-16', '+86 400 821 2206', 'ptolumello3@blogtalkradio.com');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (5, 'Hercules', 'Skehan', '1939-01-04', '+63 954 819 5539', 'hskehan4@nhs.uk');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (6, 'Noland', 'Toffetto', '1930-10-25', '+46 653 370 8334', 'ntoffetto5@com.com');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (7, 'Amberly', 'Kenyam', '2003-02-11', '+62 692 404 2525', 'akenyam6@netlog.com');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (8, 'Gustave', 'De Mars', '1985-08-27', '+218 264 507 6325', 'gdemars7@phpbb.com');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (9, 'Dieter', 'Bowick', '1940-04-30', '+86 837 816 7832', 'dbowick8@dot.gov');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (10, 'Pammie', 'Laxtonne', '1984-12-18', '+62 846 586 0672', 'plaxtonne9@usatoday.com');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (11, 'Fonsie', 'Nesterov', '1996-09-10', '+1 666 753 3929', 'fnesterova@shop-pro.jp');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (12, 'Chan', 'Haggas', '1963-02-11', '+82 231 657 1534', 'chaggasb@e-recht24.de');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (13, 'Maren', 'Braghini', '1982-02-18', '+81 911 806 2423', 'mbraghinic@geocities.jp');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (14, 'Mimi', 'Gosswell', '1987-10-24', '+92 156 457 1762', 'mgosswelld@imgur.com');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (15, 'Ellary', 'McIlwaine', '1931-01-24', '+7 799 163 2490', 'emcilwainee@yellowpages.com');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (16, 'Holden', 'Bengochea', '1939-04-08', '+54 814 900 1256', 'hbengocheaf@abc.net.au');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (17, 'Sabrina', 'Gouda', '1974-07-29', '+269 290 411 8685', 'sgoudag@sogou.com');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (18, 'Oran', 'Bromehed', '1946-05-14', '+63 474 693 8276', 'obromehedh@seesaa.net');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (19, 'Wylma', 'Manuelli', '1934-08-20', '+1 701 931 0699', 'wmanuellii@phoca.cz');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (20, 'Joeann', 'Norgate', '1954-01-12', '+81 826 246 1012', 'jnorgatej@ovh.net');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (21, 'Christoper', 'Golbourn', '1993-02-17', '+234 689 340 0625', 'cgolbournk@apache.org');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (22, 'Rodd', 'Karlolak', '1936-06-12', '+54 564 758 8318', 'rkarlolakl@exblog.jp');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (23, 'Charlot', 'Vasilechko', '1967-01-01', '+46 672 349 6465', 'cvasilechkom@meetup.com');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (24, 'Westbrook', 'Lukovic', '1941-04-01', '+351 239 503 3566', 'wlukovicn@skype.com');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (25, 'Jamie', 'Troubridge', '1946-10-25', '+27 341 495 4340', 'jtroubridgeo@amazon.de');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (26, 'Marguerite', 'Horribine', '1961-11-07', '+47 242 981 5028', 'mhorribinep@privacy.gov.au');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (27, 'Jobyna', 'Curteis', '1948-10-11', '+1 210 544 2071', 'jcurteisq@twitpic.com');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (28, 'Madelene', 'Sivorn', '1993-02-28', '+81 125 335 0147', 'msivornr@tripadvisor.com');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (29, 'Sergei', 'Constantinou', '1940-11-05', '+86 386 134 6014', 'sconstantinous@vinaora.com');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (30, 'Pepillo', 'Oaker', '1932-01-17', '+86 482 181 0583', 'poakert@a8.net');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (31, 'Nickola', 'Twigg', '1988-07-18', '+223 158 888 7692', 'ntwiggu@unesco.org');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (32, 'Benny', 'McNuff', '1964-07-03', '+86 513 917 6835', 'bmcnuffv@wikispaces.com');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (33, 'Ferguson', 'Puckey', '1985-03-09', '+351 145 723 7956', 'fpuckeyw@cyberchimps.com');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (34, 'Nadine', 'Tadd', '1970-11-22', '+1 605 906 6006', 'ntaddx@apache.org');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (35, 'Griz', 'Sinnie', '1954-02-02', '+62 515 955 2758', 'gsinniey@zimbio.com');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (36, 'Tanya', 'Thunder', '1938-03-27', '+251 288 554 8496', 'tthunderz@ucoz.com');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (37, 'Lucho', 'Hewes', '1976-07-14', '+62 150 969 0906', 'lhewes10@imgur.com');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (38, 'Sampson', 'Carson', '1966-09-14', '+33 120 336 5256', 'scarson11@macromedia.com');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (39, 'Cindy', 'Edgworth', '1959-02-27', '+86 775 935 1608', 'cedgworth12@ucsd.edu');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (40, 'Anna-diane', 'Trueman', '1980-10-13', '+358 157 235 7910', 'atrueman13@gizmodo.com');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (41, 'Karlis', 'Sambell', '1960-04-23', '+351 156 470 1305', 'ksambell14@so-net.ne.jp');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (42, 'Dorothy', 'Cazereau', '1945-02-08', '+1 326 561 2345', 'dcazereau15@zimbio.com');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (43, 'Bernie', 'Woodes', '1965-09-20', '+1 512 248 6798', 'bwoodes16@spiegel.de');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (44, 'Emelita', 'Corneil', '1984-06-13', '+66 867 645 3368', 'ecorneil17@ning.com');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (45, 'Ken', 'Towersey', '1932-06-22', '+374 297 377 0124', 'ktowersey18@behance.net');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (46, 'Alane', 'Chichgar', '1991-09-18', '+86 938 760 9745', 'achichgar19@illinois.edu');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (47, 'Melba', 'Winkworth', '1971-10-31', '+7 533 490 0642', 'mwinkworth1a@livejournal.com');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (48, 'Aimil', 'Sprulls', '1939-02-20', '+49 636 371 5159', 'asprulls1b@github.io');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (49, 'Cristobal', 'Tondeur', '1993-07-23', '+86 547 487 0185', 'ctondeur1c@rakuten.co.jp');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (50, 'Frederico', 'Lanfer', '1946-07-01', '+57 923 411 0644', 'flanfer1d@flavors.me');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (53, 'Currie', 'Jeandon', '1997-07-16', '+86 623 972 6903', 'cjeandon4@guardian.co.uk');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (54, 'Tadeas', 'Hofton', '1976-03-31', '+63 676 629 0474', 'thofton5@mashable.com');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (55, 'Charo', 'Joblin', '1963-06-22', '+7 456 718 5668', 'cjoblin8@friendfeed.com');
INSERT INTO Customers (Id, First_name, Last_name, Date_of_birth, Phone_number, Email_address) VALUES (56, 'Laetitia', 'Sambiedge', '1945-03-04', '+504 171 402 9606', 'lsambiedge2@last.fm');

-- Table: Guests
DROP TABLE IF EXISTS Guests;

CREATE TABLE Guests (
    Id            INTEGER PRIMARY KEY AUTOINCREMENT
                          NOT NULL,
    Booking_Id    INTEGER REFERENCES Booking (Id) ON DELETE CASCADE,
    First_name    VARCHAR NOT NULL,
    Last_name     VARCHAR NOT NULL,
    Phone_number  VARCHAR NOT NULL,
    Email_address VARCHAR NOT NULL,
    Date_of_birth DATE    NOT NULL
);

INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (7, 7, 'Maren', 'Braghini', '+81 911 806 2423', 'mbraghinic@geocities.jp', '1982-02-18');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (8, 7, 'Vassili', 'De Malchar', '+58 973 516 5643', 'vdemalcharu@deviantart.com', '1988-07-18');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (9, 7, 'Audrie', 'Strettell', '+86 946 825 6041', 'astrettellw@berkeley.edu', '1931-08-07');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (10, 7, 'Traver', 'Lammerts', '+967 153 984 5852', 'tlammerts11@imgur.com', '1960-08-16');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (11, 8, 'Wylma', 'Manuelli', '+1 701 931 0699', 'wmanuellii@phoca.cz', '1934-08-20');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (12, 8, 'Giorgio', 'Cassey', '+66-461-272-8271', 'gcassey1m@dot.gov', '1986-06-07');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (13, 8, 'Ray', 'Giacovelli', '+62-988-804-0398', 'rgiacovelli1o@cloudflare.com', '1939-02-05');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (14, 8, 'Claudelle', 'Wragg', '+62-633-895-5396', 'cwragg18@com.com', '1958-02-06');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (15, 9, 'Lucho', 'Hewes', '+62 150 969 0906', 'lhewes10@imgur.com', '1976-07-14');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (16, 9, 'Bella', 'Siddons', '+62-589-508-5036', 'bsiddons1n@google.co.jp', '2000-05-03');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (17, 9, 'Corabel', 'Gillino', '+351-463-436-4085', 'cgillino1c@ucsd.edu', '1982-03-28');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (18, 9, 'Lani', 'Jeens', '+351-641-923-1310', 'ljeens1k@bbc.co.uk', '1957-04-19');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (19, 10, 'Karlis', 'Sambell', '+351 156 470 1305', 'ksambell14@so-net.ne.jp', '1960-04-23');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (20, 10, 'Ursola', 'Desvignes', '+86-877-818-3601', 'udesvignes20@statcounter.com', '2000-03-20');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (21, 10, 'Emilia', 'Woolley', '+86-157-804-1052', 'ewoolley28@oakley.com', '1965-02-11');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (22, 10, 'Kipp', 'Sibun', '+48-156-506-4597', 'ksibun2f@tuttocitta.it', '1984-11-09');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (23, 11, 'Marguerite', 'Horribine', '+47 242 981 5028', 'mhorribinep@privacy.gov.au', '1961-11-07');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (24, 11, 'Hal', 'Yirrell', '+52-583-246-6775', 'hyirrell2a@vimeo.com', '1978-06-09');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (25, 11, 'Othello', 'Crannach', '+351-991-924-0404', 'ocrannach2h@virginia.edu', '1973-10-03');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (26, 11, 'Mortimer', 'Maughan', '+55-476-355-6628', 'mmaughan1z@discovery.com', '1999-08-02');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (27, 12, 'Dieter', 'Bowick', '+86 837 816 7832', 'dbowick8@dot.gov', '1940-04-30');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (28, 12, 'Korney', 'Kulver', '+86-267-229-2805', 'kkulver1t@themeforest.net', '1941-10-07');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (29, 12, 'Catharine', 'Hillhouse', '+56-933-174-2524', 'chillhouseb@sun.com', '1962-09-25');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (30, 12, 'Konstanze', 'Brunsdon', '+84-917-459-5189', 'kbrunsdone@smugmug.com', '1996-06-08');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (31, 13, 'Cristobal', 'Tondeur', '+86 547 487 0185', 'ctondeur1c@rakuten.co.jp', '1993-07-23');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (32, 13, 'Nero', 'Ricca', '+62-235-186-6083', 'nriccaa@liveinternet.ru', '1941-12-05');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (33, 13, 'Paulina', 'Outlaw', '+48-290-301-5225', 'poutlawi@blogger.com', '1966-05-02');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (34, 13, 'Clotilda', 'Juza', '+62-381-403-3917', 'cjuzak@cargocollective.com', '1985-09-17');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (35, 14, 'Pammie', 'Tolumello', '+86 400 821 2206', 'ptolumello3@blogtalkradio.com', '1939-07-16');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (36, 14, 'Cordy', 'Bateson', '+420-498-264-7618', 'cbateson11@networksolutions.com', '1996-08-01');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (37, 14, 'Theodosia', 'Clubb', '+261-316-727-7545', 'tclubb12@usgs.gov', '1931-05-12');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (38, 14, 'Winny', 'Eubank', '+62-310-982-6505', 'weubank15@scientificamerican.com', '1972-02-08');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (39, 15, 'Rochell', 'Barnwille', '+86 205 517 0859', 'rbarnwille1@naver.com', '1964-08-17');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (40, 15, 'Marcella', 'Bridel', '+55-841-152-7790', 'mbridel1e@amazon.de', '1982-08-15');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (41, 15, 'Dael', 'Bramo', '+86-290-579-0999', 'dbramo1g@businesswire.com', '1998-12-09');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (42, 15, 'Magnum', 'Halewood', '+30-631-881-9777', 'mhalewood1h@free.fr', '1997-04-25');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (43, 16, 'Frederico', 'Lanfer', '+57 923 411 0644', 'flanfer1d@flavors.me', '1946-07-01');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (44, 16, 'Harriet', 'Haveline', '+351 641 407 9569', 'hhaveline0@fda.gov', '1956-04-11');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (45, 16, 'Bathsheba', 'Welbourn', '+7 218 613 6124', 'bwelbourn9@techcrunch.com', '1999-10-31');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (46, 17, 'Frederico', 'Lanfer', '+57 923 411 0644', 'flanfer1d@flavors.me', '1946-07-01');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (47, 17, 'Harriet', 'Haveline', '+351 641 407 9569', 'hhaveline0@fda.gov', '1956-04-11');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (48, 17, 'Bathsheba', 'Welbourn', '+7 218 613 6124', 'bwelbourn9@techcrunch.com', '1999-10-31');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (49, 18, 'Ethelin', 'Girardy', '+86 665 325 5237', 'egirardy2@cargocollective.com', '1998-09-12');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (50, 19, 'Pammie', 'Laxtonne', '+62 846 586 0672', 'plaxtonne9@usatoday.com', '1984-12-18');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (51, 19, 'Giralda', 'Worsalls', '+7 221 142 7715', 'gworsallsf@spiegel.de', '1948-04-11');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (52, 20, 'Noland', 'Toffetto', '+46 653 370 8334', 'ntoffetto5@com.com', '1930-10-25');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (53, 20, 'Korella', 'Kirkhouse', '+55 831 994 6360', 'kkirkhousej@51.la', '1978-06-08');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (54, 21, 'Oran', 'Bromehed', '+63 474 693 8276', 'obromehedh@seesaa.net', '1946-05-14');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (55, 22, 'Pepillo', 'Oaker', '+86 482 181 0583', 'poakert@a8.net', '1932-01-17');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (56, 22, 'Oriana', 'Sneller', '+46 360 758 1203', 'osnellerq@hostgator.com', '1944-01-07');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (57, 22, 'Kendricks', 'Matschuk', '+420 159 352 2834', 'kmatschukr@epa.gov', '1960-12-12');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (58, 22, 'Beverlee', 'Machon', '+86 150 186 6869', 'bmachons@home.pl', '2001-06-11');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (59, 23, 'Rodd', 'Karlolak', '+54 564 758 8318', 'rkarlolakl@exblog.jp', '1936-06-12');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (60, 23, 'Marcie', 'Bankes', '+351 755 246 2449', 'mbankest@dropbox.com', '1974-05-05');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (61, 24, 'Ellary', 'McIlwaine', '+7 799 163 2490', 'emcilwainee@yellowpages.com', '1931-01-24');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (62, 25, 'Charlot', 'Vasilechko', '+46 672 349 6465', 'cvasilechkom@meetup.com', '1967-01-01');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (63, 25, 'Gert', 'Skipping', '+86 866 982 2812', 'gskippingu@cdc.gov', '1984-12-20');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (64, 26, 'Griz', 'Sinnie', '+62 515 955 2758', 'gsinniey@zimbio.com', '1954-02-02');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (65, 26, 'Simonne', 'Duprey', '+1 865 264 1732', 'sdupreyv@berkeley.edu', '1953-09-18');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (66, 26, 'Vincents', 'Ropkes', '+48 864 210 8849', 'vropkesw@fema.gov', '1964-03-25');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (67, 27, 'Tanya', 'Thunder', '+251 288 554 8496', 'tthunderz@ucoz.com', '1938-03-27');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (68, 27, 'Christiano', 'Vasser', '+86 567 949 9345', 'cvasserx@dot.gov', '1990-12-18');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (69, 28, 'Karlis', 'Sambell', '+351 156 470 1305', 'ksambell14@so-net.ne.jp', '1960-04-23');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (70, 28, 'Zebulon', 'Tapsell', '+51 880 688 7774', 'ztapselly@linkedin.com', '1948-05-27');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (71, 28, 'Tommie', 'Ashling', '+351 131 436 6022', 'tashlingz@mayoclinic.com', '1972-02-14');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (72, 28, 'Adelice', 'Mattersey', '+86 867 668 8123', 'amattersey10@freewebs.com', '1941-07-10');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (73, 29, 'Fonsie', 'Nesterov', '+1 666 753 3929', 'fnesterova@shop-pro.jp', '1996-09-10');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (74, 30, 'Dorothy', 'Cazereau', '+1 326 561 2345', 'dcazereau15@zimbio.com', '1945-02-08');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (75, 30, 'Vivien', 'Zarb', '+62 707 867 1291', 'vzarb11@mapy.cz', '1990-08-24');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (76, 30, 'Eloisa', 'Cannovane', '+370 451 702 6817', 'eocannovane12@japanpost.jp', '1936-12-30');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (77, 31, 'Ken', 'Towersey', '+374 297 377 0124', 'ktowersey18@behance.net', '1932-06-22');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (78, 32, 'Jobyna', 'Curteis', '+1 210 544 2071', 'jcurteisq@twitpic.com', '1948-10-11');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (79, 32, 'Sissie', 'Tipling', '+31 756 533 2305', 'stipling13@exblog.jp', '1993-03-23');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (80, 33, 'Aimil', 'Sprulls', '+49 636 371 5159', 'asprulls1b@github.io', '1939-02-20');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (81, 33, 'Cazzie', 'Brodeur', '+86 635 752 9963', 'cbrodeur14@imgur.com', '1976-03-11');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (82, 33, 'Hali', 'Yockley', '+420 902 317 0042', 'hyockley15@nasa.gov', '1943-12-14');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (83, 33, 'Haskell', 'Philipsson', '+55 845 396 8571', 'hphilipsson16@homestead.com', '1975-09-07');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (84, 34, 'Alane', 'Chichgar', '+86 938 760 9745', 'achichgar19@illinois.edu', '1991-09-18');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (85, 35, 'Lucho', 'Hewes', '+62 150 969 0906', 'lhewes10@imgur.com', '1976-07-14');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (86, 35, 'Vidovic', 'Lau', '+358 138 418 3894', 'vlau17@usda.gov', '1983-08-31');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (87, 36, 'Mimi', 'Gosswell', '+92 156 457 1762', 'mgosswelld@imgur.com', '1987-10-24');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (88, 37, 'Sergei', 'Constantinou', '+86 386 134 6014', 'sconstantinous@vinaora.com', '1940-11-05');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (89, 37, 'Svend', 'Allsobrook', '+216 988 625 8007', 'sallsobrook18@vkontakte.ru', '1997-12-30');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (90, 37, 'Weidar', 'Maskell', '+95 431 475 3221', 'wmaskell19@geocities.jp', '1964-08-17');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (91, 38, 'Ferguson', 'Puckey', '+351 145 723 7956', 'fpuckeyw@cyberchimps.com', '1985-03-09');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (92, 38, 'Agatha', 'Faier', '+52 261 615 1290', 'afaier1a@gov.uk', '1939-05-22');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (93, 38, 'Mart', 'Donoghue', '+86 246 571 2093', 'mdonoghue1b@cdc.gov', '2000-03-30');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (94, 38, 'Carita', 'Loosmore', '+387 594 816 4100', 'cloosmore1c@soup.io', '1960-01-16');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (95, 39, 'Sampson', 'Carson', '+33 120 336 5256', 'scarson11@macromedia.com', '1966-09-14');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (96, 40, 'Melba', 'Winkworth', '+7 533 490 0642', 'mwinkworth1a@livejournal.com', '1971-10-31');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (97, 40, 'Yance', 'Finch', '+351 172 415 7161', 'yfinch1d@wikia.com', '1942-08-09');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (98, 41, 'Emelita', 'Corneil', '+66 867 645 3368', 'ecorneil17@ning.com', '1984-06-13');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (99, 42, 'Hercules', 'Skehan', '+63 954 819 5539', 'hskehan4@nhs.uk', '1939-01-04');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (100, 42, 'Carin', 'Lochet', '+56 511 706 1085', 'clochet1e@naver.com', '1999-05-03');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (101, 42, 'Doralynn', 'Lynock', '+7 396 714 4575', 'dlynock1f@histats.com', '1939-01-25');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (102, 43, 'Isadora', 'Arsmith', '+52 335 252 8239', 'iarsmith0@macromedia.com', '2001-09-26');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (103, 43, 'Ebeneser', 'Dick', '+383 561 881 7010', 'edick1g@hexun.com', '1965-09-03');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (104, 43, 'Dottie', 'Knell', '+62 281 820 6726', 'dknell1h@howstuffworks.com', '1977-11-01');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (105, 43, 'Edan', 'D''Angeli', '+55 194 142 3312', 'edangeli1i@amazon.de', '1994-02-19');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (106, 44, 'Amberly', 'Kenyam', '+62 692 404 2525', 'akenyam6@netlog.com', '2003-02-11');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (107, 44, 'Alana', 'Eliyahu', '+593 291 117 5635', 'aeliyahu1j@networksolutions.com', '1966-07-27');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (108, 45, 'Gustave', 'De Mars', '+218 264 507 6325', 'gdemars7@phpbb.com', '1985-08-27');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (109, 45, 'Toddy', 'Finnemore', '+7 615 373 6903', 'tfinnemore1k@mayoclinic.com', '1951-09-20');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (110, 45, 'Stefanie', 'Lashbrook', '+33 826 362 4023', 'slashbrook1l@miibeian.gov.cn', '1946-11-21');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (111, 46, 'Chan', 'Haggas', '+82 231 657 1534', 'chaggasb@e-recht24.de', '1963-02-11');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (112, 47, 'Holden', 'Bengochea', '+54 814 900 1256', 'hbengocheaf@abc.net.au', '1939-04-08');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (113, 47, 'Danell', 'Rusk', '+7 435 811 2203', 'drusk1m@engadget.com', '1994-05-08');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (114, 48, 'Joeann', 'Norgate', '+81 826 246 1012', 'jnorgatej@ovh.net', '1954-01-12');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (115, 48, 'Jonathan', 'Bain', '+244 795 364 8332', 'jbain0@ameblo.jp', '1970-06-30');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (116, 48, 'Eleanor', 'Impleton', '+420 248 678 6740', 'eimpleton1@dailymotion.com', '1932-08-09');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (117, 48, 'Marvin', 'Bedborough', '+351 974 414 2807', 'mbedborough2@clickbank.net', '1963-06-08');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (118, 49, 'Sabrina', 'Gouda', '+269 290 411 8685', 'sgoudag@sogou.com', '1974-07-29');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (119, 50, 'Jamie', 'Troubridge', '+27 341 495 4340', 'jtroubridgeo@amazon.de', '1946-10-25');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (120, 50, 'Alexandrina', 'Houlden', '+63 754 562 0471', 'ahoulden3@fastcompany.com', '1950-01-29');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (121, 50, 'Marnie', 'McCaughey', '+252 116 593 7678', 'mmccaughey4@microsoft.com', '1944-11-15');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (122, 51, 'Nickola', 'Twigg', '+223 158 888 7692', 'ntwiggu@unesco.org', '1988-07-18');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (123, 51, 'Danica', 'Hirtz', '+234 741 612 2068', 'dhirtz5@epa.gov', '1962-10-14');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (124, 51, 'Allistir', 'Stute', '+46 627 184 9985', 'astute6@npr.org', '1957-04-13');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (125, 52, 'Nadine', 'Tadd', '+1 605 906 6006', 'ntaddx@apache.org', '1970-11-22');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (126, 52, 'Juliane', 'Scarsbrook', '+86 202 513 8065', 'jscarsbrook7@people.com.cn', '1933-01-15');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (127, 53, 'Cindy', 'Edgworth', '+86 775 935 1608', 'cedgworth12@ucsd.edu', '1959-02-27');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (128, 53, 'Anastasia', 'Tarte', '+62 709 389 3389', 'atarte8@com.com', '1946-11-08');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (129, 54, 'Benny', 'McNuff', '+86 513 917 6835', 'bmcnuffv@wikispaces.com', '1964-07-03');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (130, 55, 'Madelene', 'Sivorn', '+81 125 335 0147', 'msivornr@tripadvisor.com', '1993-02-28');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (131, 55, 'Gerty', 'Derricoat', '+386 844 417 5096', 'gderricoat9@google.es', '1950-01-11');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (132, 56, 'Bernie', 'Woodes', '+1 512 248 6798', 'bwoodes16@spiegel.de', '1965-09-20');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (133, 56, 'Tremain', 'Threadgall', '+86 914 301 9237', 'tthreadgalla@buzzfeed.com', '1999-08-03');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (134, 56, 'Steffen', 'Dearnaly', '+46 764 336 3037', 'sdearnalyb@purevolume.com', '1979-02-18');
INSERT INTO Guests (Id, Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth) VALUES (135, 56, 'Jolynn', 'Cordes', '+992 741 271 9461', 'jcordesc@redcross.org', '2001-01-07');

-- Table: Hotel
DROP TABLE IF EXISTS Hotel;

CREATE TABLE Hotel (
    Id            INTEGER PRIMARY KEY AUTOINCREMENT
                          NOT NULL,
    Name          VARCHAR NOT NULL,
    Address       VARCHAR NOT NULL,
    Pool          BOOLEAN,
    Restaurant    BOOLEAN,
    Children_club BOOLEAN,
    Entertainment BOOLEAN
);

INSERT INTO Hotel (Id, Name, Address, Pool, Restaurant, Children_club, Entertainment) VALUES (1, 'The Cove at Atlantis', '1 Casino Drive, Paradise Island, NP N-4777 Nassau, Bahamas', 'Yes', 'Yes', 'Yes', 'Yes');
INSERT INTO Hotel (Id, Name, Address, Pool, Restaurant, Children_club, Entertainment) VALUES (2, 'Hilton San Francisco Union Square', '333 O''Farrell Street, Union Square, San Francisco, CA 94102, United States of America', 'Yes', 'Yes', 'No', 'No');
INSERT INTO Hotel (Id, Name, Address, Pool, Restaurant, Children_club, Entertainment) VALUES (3, 'Scandic Continental', 'Vasagatan 22, 111 20 Stockholm, Sweden', 'No', 'Yes', 'No', 'Yes');
INSERT INTO Hotel (Id, Name, Address, Pool, Restaurant, Children_club, Entertainment) VALUES (4, 'Gothia Towers Hotel', 'Mässans Gata 24, 402 26 Gothenburg, Sweden', 'Yes', 'Yes', 'Yes', 'Yes');
INSERT INTO Hotel (Id, Name, Address, Pool, Restaurant, Children_club, Entertainment) VALUES (5, 'Hotel Skt Petri', 'Krystalgade 22, 1172 Copenhagen, Denmark', 'No', 'Yes', 'Yes', 'No');
INSERT INTO Hotel (Id, Name, Address, Pool, Restaurant, Children_club, Entertainment) VALUES (6, 'Coco Key Hotel & Water Park Resort', '7400 International Drive, Orlando, FL 32819, United States of America', 'Yes', 'Yes', 'Yes', 'No');

-- Table: Room
DROP TABLE IF EXISTS Room;

CREATE TABLE Room (
    Id             INTEGER PRIMARY KEY AUTOINCREMENT
                           NOT NULL,
    Name           VARCHAR,
    Number_of_beds INTEGER NOT NULL,
    Hotel_Id       INTEGER REFERENCES Hotel (Id) 
                           NOT NULL,
    Number         INTEGER NOT NULL
);

INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (1, 'Double room', 2, 1, 274);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (2, 'Family room', 4, 1, 348);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (3, 'Single room', 1, 1, 326);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (4, 'Suite', 3, 1, 285);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (5, 'Double room', 2, 1, 250);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (6, 'Suite', 3, 1, 245);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (7, 'Double room', 2, 1, 125);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (8, 'Suite', 3, 1, 353);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (9, 'Suite', 3, 1, 231);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (10, 'Single room', 1, 1, 244);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (11, 'Double room', 2, 1, 168);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (12, 'Double room', 2, 1, 398);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (13, 'Single room', 1, 1, 198);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (14, 'Suite', 3, 1, 357);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (15, 'Double room', 2, 1, 329);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (16, 'Single room', 1, 1, 202);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (17, 'Suite', 3, 1, 400);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (18, 'Suite', 3, 1, 146);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (19, 'Single room', 1, 1, 337);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (20, 'Single room', 1, 1, 335);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (21, 'Suite', 3, 1, 372);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (22, 'Double room', 2, 1, 301);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (23, 'Family room', 4, 1, 286);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (24, 'Double room', 2, 1, 284);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (25, 'Double room', 2, 1, 148);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (26, 'Single room', 1, 1, 134);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (27, 'Double room', 2, 1, 390);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (28, 'Double room', 2, 1, 297);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (29, 'Double room', 2, 1, 298);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (30, 'Single room', 1, 1, 352);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (31, 'Family room', 4, 2, 315);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (32, 'Double room', 2, 2, 175);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (33, 'Family room', 4, 2, 354);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (34, 'Double room', 2, 2, 309);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (35, 'Suite', 3, 2, 334);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (36, 'Single room', 1, 2, 284);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (37, 'Single room', 1, 2, 364);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (38, 'Family room', 4, 2, 248);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (39, 'Single room', 1, 2, 112);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (40, 'Suite', 3, 2, 180);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (41, 'Family room', 4, 2, 257);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (42, 'Single room', 1, 2, 310);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (43, 'Family room', 4, 2, 150);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (44, 'Suite', 3, 2, 361);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (45, 'Family room', 4, 2, 236);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (46, 'Single room', 1, 2, 188);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (47, 'Double room', 2, 2, 160);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (48, 'Single room', 1, 2, 132);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (49, 'Single room', 1, 2, 311);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (50, 'Family room', 4, 2, 170);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (51, 'Double room', 2, 2, 226);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (52, 'Family room', 4, 2, 140);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (53, 'Suite', 3, 2, 220);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (54, 'Family room', 4, 2, 161);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (55, 'Suite', 3, 2, 230);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (56, 'Suite', 3, 2, 191);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (57, 'Family room', 4, 2, 169);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (58, 'Double room', 2, 2, 281);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (59, 'Suite', 3, 2, 345);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (60, 'Family room', 4, 2, 221);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (61, 'Double room', 2, 3, 244);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (62, 'Single room', 1, 3, 142);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (63, 'Family room', 4, 3, 235);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (64, 'Double room', 2, 3, 178);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (65, 'Double room', 2, 3, 315);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (66, 'Family room', 4, 3, 123);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (67, 'Suite', 3, 3, 132);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (68, 'Suite', 3, 3, 278);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (69, 'Double room', 2, 3, 298);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (70, 'Double room', 2, 3, 120);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (71, 'Family room', 4, 3, 101);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (72, 'Family room', 4, 3, 285);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (73, 'Double room', 2, 3, 190);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (74, 'Family room', 4, 3, 220);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (75, 'Family room', 4, 3, 381);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (76, 'Double room', 2, 3, 147);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (77, 'Family room', 4, 3, 255);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (78, 'Double room', 2, 3, 191);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (79, 'Family room', 4, 3, 114);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (80, 'Double room', 2, 3, 151);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (81, 'Single room', 1, 3, 234);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (82, 'Single room', 1, 3, 273);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (83, 'Suite', 3, 3, 128);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (84, 'Single room', 1, 3, 287);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (85, 'Single room', 1, 3, 243);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (86, 'Family room', 4, 3, 335);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (87, 'Family room', 4, 3, 113);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (88, 'Double room', 2, 3, 336);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (89, 'Family room', 4, 3, 374);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (90, 'Double room', 2, 3, 165);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (91, 'Family room', 4, 4, 133);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (92, 'Double room', 2, 4, 358);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (93, 'Family room', 4, 4, 325);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (94, 'Single room', 1, 4, 298);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (95, 'Single room', 1, 4, 256);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (96, 'Double room', 2, 4, 164);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (97, 'Double room', 2, 4, 261);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (98, 'Single room', 1, 4, 241);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (99, 'Single room', 1, 4, 174);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (100, 'Family room', 4, 4, 320);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (101, 'Family room', 4, 4, 356);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (102, 'Double room', 2, 4, 165);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (103, 'Double room', 2, 4, 166);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (104, 'Single room', 1, 4, 369);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (105, 'Single room', 1, 4, 359);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (106, 'Single room', 1, 4, 281);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (107, 'Single room', 1, 4, 163);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (108, 'Suite', 3, 4, 191);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (109, 'Single room', 1, 4, 231);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (110, 'Suite', 3, 4, 387);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (111, 'Double room', 2, 4, 195);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (112, 'Family room', 4, 4, 198);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (113, 'Single room', 1, 4, 383);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (114, 'Suite', 3, 4, 106);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (115, 'Suite', 3, 4, 127);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (116, 'Suite', 3, 4, 384);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (117, 'Family room', 4, 4, 240);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (118, 'Single room', 1, 4, 313);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (119, 'Double room', 2, 4, 278);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (120, 'Suite', 3, 4, 208);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (121, 'Double room', 2, 5, 217);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (122, 'Family room', 4, 5, 154);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (123, 'Double room', 2, 5, 173);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (124, 'Double room', 2, 5, 285);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (125, 'Suite', 3, 5, 159);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (126, 'Suite', 3, 5, 267);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (127, 'Family room', 4, 5, 338);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (128, 'Single room', 1, 5, 166);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (129, 'Family room', 4, 5, 375);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (130, 'Single room', 1, 5, 191);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (131, 'Family room', 4, 5, 273);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (132, 'Single room', 1, 5, 239);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (133, 'Family room', 4, 5, 203);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (134, 'Family room', 4, 5, 303);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (135, 'Suite', 3, 5, 357);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (136, 'Single room', 1, 5, 395);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (137, 'Single room', 1, 5, 225);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (138, 'Suite', 3, 5, 362);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (139, 'Single room', 1, 5, 234);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (140, 'Suite', 3, 5, 280);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (141, 'Single room', 1, 5, 201);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (142, 'Suite', 3, 5, 343);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (143, 'Single room', 1, 5, 302);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (144, 'Family room', 4, 5, 275);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (145, 'Double room', 2, 5, 256);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (146, 'Family room', 4, 5, 270);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (147, 'Suite', 3, 5, 138);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (148, 'Single room', 1, 5, 143);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (149, 'Single room', 1, 5, 292);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (150, 'Family room', 4, 5, 106);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (151, 'Double room', 2, 6, 290);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (152, 'Single room', 1, 6, 266);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (153, 'Single room', 1, 6, 198);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (154, 'Suite', 3, 6, 235);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (155, 'Family room', 4, 6, 268);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (156, 'Single room', 1, 6, 175);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (157, 'Double room', 2, 6, 373);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (158, 'Family room', 4, 6, 366);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (159, 'Single room', 1, 6, 211);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (160, 'Suite', 3, 6, 128);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (161, 'Suite', 3, 6, 293);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (162, 'Double room', 2, 6, 158);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (163, 'Suite', 3, 6, 106);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (164, 'Family room', 4, 6, 157);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (165, 'Family room', 4, 6, 339);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (166, 'Family room', 4, 6, 359);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (167, 'Single room', 1, 6, 331);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (168, 'Single room', 1, 6, 306);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (169, 'Family room', 4, 6, 256);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (170, 'Suite', 3, 6, 330);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (171, 'Single room', 1, 6, 269);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (172, 'Family room', 4, 6, 386);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (173, 'Family room', 4, 6, 125);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (174, 'Family room', 4, 6, 303);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (175, 'Double room', 2, 6, 267);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (176, 'Family room', 4, 6, 197);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (177, 'Single room', 1, 6, 148);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (178, 'Suite', 3, 6, 291);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (179, 'Double room', 2, 6, 378);
INSERT INTO Room (Id, Name, Number_of_beds, Hotel_Id, Number) VALUES (180, 'Double room', 2, 6, 232);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
