-- =========================
-- TABLE CREATION
-- =========================

CREATE TABLE waiter(
    waiter_id INTEGER PRIMARY KEY,
    waiter_fname VARCHAR(50) NOT NULL,
    waiter_lname VARCHAR(50)
);

CREATE TABLE customer(
    cust_id INTEGER PRIMARY KEY,
    cust_fname VARCHAR(50) NOT NULL,
    cust_lname VARCHAR(50),
    contact_no INTEGER
);

CREATE TABLE tips(
    waiter_id INTEGER REFERENCES waiter(waiter_id),
    cust_id INTEGER REFERENCES customer(cust_id),
    tip INTEGER
);

CREATE TABLE ord(
    ord_no INTEGER PRIMARY KEY,
    ord_date DATE NOT NULL,
    cust_id INTEGER REFERENCES customer(cust_id),
    waiter_id INTEGER REFERENCES waiter(waiter_id)
);

CREATE TABLE chef(
    chef_id INTEGER PRIMARY KEY,
    chef_fname VARCHAR(50) NOT NULL,
    chef_lname VARCHAR(50),
    chef_type VARCHAR(50) NOT NULL
);

CREATE TABLE food(
    item_no INTEGER PRIMARY KEY,
    item_name VARCHAR(50) NOT NULL,
    item_type VARCHAR(50) NOT NULL,
    item_price INTEGER NOT NULL,
    item_stock INTEGER
);

CREATE TABLE contains(
    ord_no INTEGER REFERENCES ord(ord_no),
    item_no INTEGER REFERENCES food(item_no)
);

CREATE TABLE prepares(
    item_type VARCHAR(50) PRIMARY KEY,
    chef_id INTEGER REFERENCES chef(chef_id)
);

CREATE TABLE bill(
    bill_no INTEGER PRIMARY KEY,
    tot_price INTEGER NOT NULL,
    tax FLOAT DEFAULT 5,
    discount INTEGER DEFAULT 0,
    net_payable FLOAT GENERATED ALWAYS AS 
        (tot_price + (tot_price * tax / 100) - (tot_price * discount / 100)) VIRTUAL,
    ord_no INTEGER REFERENCES ord(ord_no)
);

-- =========================
-- INSERT DATA
-- =========================

-- Waiter
INSERT INTO waiter VALUES (1,'John','Doe');
INSERT INTO waiter VALUES (2,'Jane','Smith');
INSERT INTO waiter VALUES (3,'Bob','Johnson');

-- Customer
INSERT INTO customer VALUES (1,'Alice','Brown',900000001);
INSERT INTO customer VALUES (2,'Bob','Green',900000002);
INSERT INTO customer VALUES (3,'Charlie','Blue',900000003);

-- Orders
INSERT INTO ord VALUES (1, DATE '2023-04-15',1,1);
INSERT INTO ord VALUES (2, DATE '2023-04-16',2,2);
INSERT INTO ord VALUES (3, DATE '2023-04-17',3,1);

-- Chef
INSERT INTO chef VALUES (1,'John','Wick','Head_Chef');
INSERT INTO chef VALUES (2,'Sarah','Curry','Sous_Chef');
INSERT INTO chef VALUES (3,'Robert','Gun','Sous_Chef');

-- Prepares
INSERT INTO prepares VALUES ('Main_course',1);
INSERT INTO prepares VALUES ('Appetizer',2);
INSERT INTO prepares VALUES ('Dessert',3);

-- Food
INSERT INTO food VALUES (1,'Cheeseburger','Main_course',100,50);
INSERT INTO food VALUES (2,'French_Fries','Appetizer',50,100);
INSERT INTO food VALUES (3,'Chocolate_cake','Dessert',80,30);

-- Contains
INSERT INTO contains VALUES (1,1);
INSERT INTO contains VALUES (1,2);
INSERT INTO contains VALUES (2,2);
INSERT INTO contains VALUES (2,3);
INSERT INTO contains VALUES (3,1);
INSERT INTO contains VALUES (3,3);

-- Tips
INSERT INTO tips VALUES (1,1,10);
INSERT INTO tips VALUES (1,3,20);

-- =========================
-- SAMPLE QUERIES
-- =========================

SELECT * FROM waiter;
SELECT * FROM customer;
SELECT * FROM ord;
SELECT * FROM chef;
SELECT * FROM prepares;
SELECT * FROM food;
SELECT * FROM contains;
SELECT * FROM tips;