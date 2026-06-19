CREATE DATABASE project_data;



CREATE TABLE CityRatings (
    city VARCHAR(100) NOT NULL PRIMARY KEY,
    Housing_level VARCHAR(20) NOT NULL,
    [Cost of Living_level] VARCHAR(20) NOT NULL,
    Safety_level VARCHAR(20) NOT NULL,
    Healthcare_level VARCHAR(20) NOT NULL,
    Education_level VARCHAR(20) NOT NULL,
    [Environmental Quality_level] VARCHAR(20) NOT NULL,
    Economy_level VARCHAR(20) NOT NULL,
    Taxation_level VARCHAR(20) NOT NULL,
    [Internet Access_level] VARCHAR(20) NOT NULL,
    [Leisure & Culture_level] VARCHAR(20) NOT NULL
);

CREATE TABLE Countery_Name (
    City VARCHAR(100) NOT NULL PRIMARY KEY,
    Country VARCHAR(100) NOT NULL
);

CREATE TABLE transactions (
    city VARCHAR(100) NOT NULL,
    day VARCHAR(20) NOT NULL,
    realSum DECIMAL(10,2) NOT NULL,
    room_type VARCHAR(50),
    room_shared VARCHAR(20),
    person_capacity INT CHECK (person_capacity > 0),
    host VARCHAR(50),
    bedrooms INT CHECK (bedrooms >= 0),
    Multi_publish VARCHAR(20),
    buziness VARCHAR(20),
    cleanliness_rating INT CHECK (cleanliness_rating BETWEEN 0 AND 10),
    guest_satisfaction_overall INT CHECK (guest_satisfaction_overall BETWEEN 0 AND 100),
    dist DECIMAL(10,4),
    metro_dist DECIMAL(10,4),
    attr_index DECIMAL(10,4),
    attr_index_norm DECIMAL(10,4),
    rest_index DECIMAL(10,4),
    rest_index_norm DECIMAL(10,4),
    lng DECIMAL(9,6),
    lat DECIMAL(9,6)
);

ALTER TABLE CityRatings
ADD CONSTRAINT FK_City_Country
FOREIGN KEY (city) REFERENCES Countery_Name(City);

ALTER TABLE transactions
ADD CONSTRAINT FK_Transactions_City
FOREIGN KEY (city) REFERENCES CityRatings.city;



BULK INSERT Countery_Name
FROM 'D:\ãÔÇÑíÚ\project\SQL\Countery_Name.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

BULK INSERT CityRatings
FROM 'D:\ãÔÇÑíÚ\project\SQL\CityRatings.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);
BULK INSERT transactions
FROM 'D:\ãÔÇÑíÚ\project\SQL\transactions.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);
ALTER TABLE transactions
ALTER COLUMN lng DECIMAL(30,25);


select * from Countery_Name
select * from CityRatings
select * from transactions







