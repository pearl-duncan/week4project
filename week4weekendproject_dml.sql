SELECT * FROM customer;
INSERT INTO customer(
    first_name,
    last_name,
    phone_number,
    customer_address
) VALUES(
    'Pearl',
    'Osborne',
    '(111) 111-1111',
    '123 Real St, Conway, AR'
), (
    'Sean',
    'Duncan',
    '(222) 222-2222',
    '234 Real St, Conway, AR'
), (
    'Megan',
    'Smith',
    '(333) 333-3333',
    '345 Real St, Conway, AR'
), (
    'Cole',
    'Welborn',
    '(444) 444-4444',
    '456 Real St, Conway, AR'
);
SELECT * FROM car;

INSERT INTO car(
    car_modle,
    car_make,
    car_year,
    car_color
) VALUES(
    'Toyota',
    'Camery',
    2022,
    'red'
),(
    'Kia',
    'Telluride',
    2024,
    'blue'
), (
    'Toyota',
    'Prius',
    2018,
    'black'
),(
    'Honda',
    'Accord',
    2012,
    'silver'
);

SELECT * FROM salesperson;
INSERT INTO salesperson(
    first_name,
    last_name
) VALUES(
    'John',
    'Smith'
), (
    'Mya',
    'Brown'
), (
    'jane',
    'Doe'
);

SELECT * FROM parts;
INSERT INTO parts(
    part_name,
    price,
    part_description
) VALUES(
    'transmission',
    600.00,
    'A car transmission is the gearbox of a vehicle. Its roughly analogous to the gear shifter and chain system that bicycles use.'
), (
    'battery',
    249.99,
    'The car battery is the essential piece of kit is the only power source used to get your vehicle started.'
), (
    'Catalytic Converter',
    999.98,
    'A catalytic converter is an exhaust emission control device that converts toxic gases and pollutants in exhaust gas from an internal combustion engine into less-toxic pollutants by catalyzing a redox reaction.'
), (
    'Wheel/Tire',
    150,
    'Every car has four wheels. The black part of the wheel, which is made out of rubber with air inside, is called a tire. Theyre where your tires are actually attached. The inner part of your car tire is attached to the rim. Youll often hear people use rims and wheels interchangeably, whereas decorative wheels are called rims. Some people may also say tire, when they actually mean wheel.'
);

SELECT * FROM serv_mechanic;
INSERT INTO serv_mechanic(
    hours_worked,
    comment,
    part_id,
    mechanic_id
) VALUES(
    3.50,
    'changed out transmission',
    1,
    1
), (
    2.00,
    'changed out catalytic converter',
    3,
    2
), (
    2.25,
    'changed out battery',
    2,
    3
);

SELECT * FROM mechanic;
--USE STORRED FUNCTION FOR THIS 
INSERT INTO mechanic(
    first_name,
    last_name,
    rate
) VALUES(
    'Brian',
    'Addams',
    35.00
), (
    'Greg',
    'Forman',
    25.00
), (
    'Josh',
    'Reems',
    30.00
);

SELECT * FROM sales_invoice;
INSERT INTO sales_invoice(
    salesperson_id,
    customer_id,
    car_id,
    car_total,
    quote
) VALUES(
    1,
    1,
    2,
    4500.00,
    False
), (
    2,
    3,
    1,
    2500.00,
    False
), (
    3,
    2,
    3,
    1500.00,
    False
);

SELECT * FROM service_invoice;
INSERT INTO service_invoice(
    mechanic_id,
    customer_id,
    car_id,
    parts_total,
    quote
) VALUES(
    1,
    4,
    4,
    249.99,
    False
), (
    2,
    2,
    3,
    600.00,
    True 
);

--STORED FUNCTION (STILL HAVE TO CREATE TABLE)
--coundn't get it to work

CREATE OR REPLACE FUNCTION create_mechanic(
    _first_name VARCHAR(50),
    _last_name VARCHAR(50),
    _rate NUMERIC(7,2)
) 
RETURNS void AS 
$$
BEGIN
    INSERT INTO mechanic(
        first_name,
        last_name,
        rate
    ) VALUES(
        _first_name,
        _last_name,
        _rate
    )
END
$$
LANGUAGE plpgsql;


CALL create_mechanic('Bob', 'Smith', 25.00);

