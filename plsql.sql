-- show menu procedure
DECLARE
    CURSOR c IS 
        SELECT item_name, item_price FROM food;

    rec c%ROWTYPE;

    PROCEDURE show_menu IS
    BEGIN
        OPEN c;
        LOOP
            FETCH c INTO rec;
            EXIT WHEN c%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('Item: ' || rec.item_name || 
                                 ' Price: ' || rec.item_price);
        END LOOP;
        CLOSE c;
    END;
BEGIN
    show_menu;
END;
/

-- Get Customer ID Function
CREATE OR REPLACE FUNCTION get_cust_id(
    fname VARCHAR,
    lname VARCHAR,
    contact INTEGER
) RETURN INTEGER IS
    cid INTEGER;
BEGIN
    SELECT cust_id INTO cid
    FROM customer
    WHERE cust_fname = fname 
      AND cust_lname = lname 
      AND contact_no = contact;

    RETURN cid;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        SELECT NVL(MAX(cust_id),0) + 1 INTO cid FROM customer;

        INSERT INTO customer VALUES (cid, fname, lname, contact);
        RETURN cid;
END;
/

-- Trigger: Check Stock Before Insert
CREATE OR REPLACE TRIGGER in_stock
BEFORE INSERT ON contains
FOR EACH ROW
DECLARE
    stock INTEGER;
BEGIN
    SELECT item_stock INTO stock
    FROM food
    WHERE item_no = :NEW.item_no;

    IF stock <= 0 THEN
        RAISE_APPLICATION_ERROR(-20000, 'Out of Stock');
    ELSE
        DBMS_OUTPUT.PUT_LINE('In Stock');
    END IF;
END;
/

-- Trigger: Update Stock After Order
CREATE OR REPLACE TRIGGER after_order
AFTER INSERT ON contains
FOR EACH ROW
BEGIN
    UPDATE food
    SET item_stock = item_stock - 1
    WHERE item_no = :NEW.item_no;
END;
/

-- Place Order Function
DECLARE
    TYPE num_array IS VARRAY(50) OF INTEGER;
    items num_array := num_array(1,2);
    order_no INTEGER;

    FUNCTION place_order(
        cid INTEGER,
        items num_array,
        wid INTEGER
    ) RETURN INTEGER IS
    BEGIN
        SELECT NVL(MAX(ord_no),0) + 1 INTO order_no FROM ord;

        INSERT INTO ord VALUES (order_no, SYSDATE, cid, wid);

        FOR i IN 1..items.COUNT LOOP
            INSERT INTO contains VALUES (order_no, items(i));
        END LOOP;

        RETURN order_no;
    END;
BEGIN
    order_no := place_order(1, items, 1);
    DBMS_OUTPUT.PUT_LINE('Order No: ' || order_no);
END;
/

-- Add Items to Existing Order
DECLARE
    TYPE num_array IS VARRAY(50) OF INTEGER;
    items num_array := num_array(3);

    PROCEDURE add_order(
        order_no INTEGER,
        items num_array
    ) IS
    BEGIN
        FOR i IN 1..items.COUNT LOOP
            INSERT INTO contains VALUES (order_no, items(i));
        END LOOP;
    END;
BEGIN
    add_order(4, items);
END;
/

-- Display Bill Trigger
CREATE OR REPLACE TRIGGER display_bill
AFTER INSERT ON bill
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Total Price: ' || :NEW.tot_price);
    DBMS_OUTPUT.PUT_LINE('Tax: ' || :NEW.tax);
    DBMS_OUTPUT.PUT_LINE('Discount: ' || :NEW.discount);
    DBMS_OUTPUT.PUT_LINE('Net Payable: ' || :NEW.net_payable);
END;
/

-- Give Tip Procedure
CREATE OR REPLACE PROCEDURE give_tip(
    cid INTEGER,
    wid INTEGER,
    t INTEGER
) IS
BEGIN
    INSERT INTO tips VALUES (wid, cid, t);
    DBMS_OUTPUT.PUT_LINE('Waiter ' || wid || ' received ' || t || ' tip');
END;
/

-- Display Total Tips of Waiter
CREATE OR REPLACE PROCEDURE display_waiter_tip(
    wid INTEGER
) IS
    total INTEGER;
BEGIN
    SELECT SUM(tip) INTO total
    FROM tips
    WHERE waiter_id = wid;

    DBMS_OUTPUT.PUT_LINE('Total tip for waiter ' || wid || ' is ' || total);
END;
/