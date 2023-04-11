CREATE TABLE Calendar
(
 order_date date NOT NULL,
 ship_date  date NOT NULL,
 Year       int4range NOT NULL,
 Quarter    varchar(15) NOT NULL,
 Week       int4range NOT NULL,
 Week_day   int4range NOT NULL,
 CONSTRAINT PK_1 PRIMARY KEY ( order_date, ship_date )
);


CREATE TABLE Client
(
 Customer_id   varchar(8) NOT NULL,
 Customer_name varchar(20) NOT NULL,
 CONSTRAINT PK_2 PRIMARY KEY ( Customer_id )
);

CREATE TABLE Geography
(
 geo_id      int NOT NULL,
 Country     varchar(13) NOT NULL,
 City        varchar(17) NOT NULL,
 "State"       varchar(11) NOT NULL,
 Region      varchar(7) NOT NULL,
 Postal_code int4range NOT NULL,
 CONSTRAINT PK_3 PRIMARY KEY ( geo_id )
);


CREATE TABLE Product
(
 product_id   int NOT NULL,
 Category     varchar(15) NOT NULL,
 Sub_category varchar(11) NOT NULL,
 Segment      varchar(11) NOT NULL,
 Product_name varchar(127) NOT NULL,
 CONSTRAINT PK_4 PRIMARY KEY ( product_id )
);



CREATE TABLE Shipping
(
 ship_id   int NOT NULL,
 Ship_mode varchar(14) NOT NULL,
 CONSTRAINT PK_5 PRIMARY KEY ( ship_id )
);

CREATE TABLE Sales
(
 row_id      int4range NOT NULL,
 order_date  date NOT NULL,
 sales       numeric(9,4) NOT NULL,
 quantity    int4range NOT NULL,
 discount    numeric(4,2) NOT NULL,
 profit      numeric(21,16) NOT NULL,
 geo_id      int NOT NULL,
 ship_id     int NOT NULL,
 product_id  int NOT NULL,
 Customer_id varchar(8) NOT NULL,
 ship_date   date NOT NULL,
 CONSTRAINT PK_6 PRIMARY KEY ( row_id ),
 CONSTRAINT FK_2 FOREIGN KEY ( order_date, ship_date ) REFERENCES Calendar ( order_date, ship_date ),
 CONSTRAINT FK_4 FOREIGN KEY ( geo_id ) REFERENCES Geography ( geo_id ),
 CONSTRAINT FK_5 FOREIGN KEY ( ship_id ) REFERENCES Shipping ( ship_id ),
 CONSTRAINT FK_3 FOREIGN KEY ( product_id ) REFERENCES Product ( product_id ),
 CONSTRAINT FK_6 FOREIGN KEY ( Customer_id ) REFERENCES Client ( Customer_id )
);

CREATE INDEX FK_1 ON Sales
(
 order_date,
 ship_date
);

CREATE INDEX FK_3 ON Sales
(
 geo_id
);

CREATE INDEX FK_4 ON Sales
(
 ship_id
);

CREATE INDEX FK_5 ON Sales
(
 product_id
);

CREATE INDEX FK_6 ON Sales
(
 Customer_id
);

