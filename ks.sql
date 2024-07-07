
CREATE TABLE customer (
    customer_id int  NOT NULL primary key,
    first_name VARCHAR(20),
    last_name  VARCHAR(20),
    Gender VARCHAR(20),
    phone_number int ,
    city varchar(30),
    country varchar(30)
);

CREATE TABLE Booking (
    Booking_id  INTEGER NOT NULL PRIMARY KEY,
    Book_type VARCHAR(20),
    Book_date date ,
    Customer_id INT,
    FOREIGN KEY (Customer_id) REFERENCES customer(customer_id)
);
CREATE TABLE Reservation (
    Res_id int NOT NULL primary key,
    check_in_date date  ,
    check_out_date date  ,
     No_of_days int,
    Customer_id int  ,
    Booking_id  INTEGER,
    FOREIGN key(customer_id) references customer(customer_id),
    FOREIGN key(booking_id) references booking(booking_id)
);
CREATE TABLE Room (
    Room_no INTEGER NOT NULL ,
    Room_type varchar(20),
    Bed_type varchar(20),
    No_of_occupants int,
    Room_price int,
    Customer_id int  ,
    res_id int,
    FOREIGN key(customer_id) references Customer (customer_id),
    FOREIGN key(res_id) references Reservation (res_id)
);

CREATE TABLE Services (
    Service_id INTEGER NOT NULL primary key,
    Service_type varchar(20),
    Service_cost int
);

CREATE TABLE Invoice (
    Invoice_No INTEGER NOT NULL PRIMARY KEY,
    Res_id INTEGER,
    customer_id INT,
    Service_quantity INTEGER,
    Service_id INTEGER,
    FOREIGN KEY (Res_id) REFERENCES reservation(Res_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (Service_id) REFERENCES services(Service_id)
);


CREATE TABLE transactions (
    Trans_No int NOT NULL primary key,
    Payment_Method varchar(20),
    Payment_Date date ,
    Invoice_no integer,
    Customer_id int,
    FOREIGN key(invoice_no) references Invoice(invoice_no),
    FOREIGN key(customer_id) references Customer (customer_id) 
);
