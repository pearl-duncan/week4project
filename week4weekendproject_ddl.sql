CREATE TABLE customer(
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(15) NOT NULL UNIQUE,
    customer_address VARCHAR
);

CREATE TABLE car(
    car_id SERIAL PRIMARY KEY,
    car_modle VARCHAR NOT NULL,
    car_make VARCHAR NOT NULL,
    car_year INTEGER NOT NULL,
    car_color VARCHAR
);

CREATE TABLE salesperson(
    salesperson_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

CREATE TABLE parts(
    part_id SERIAL PRIMARY KEY,
    part_name VARCHAR UNIQUE,
    price NUMERIC(7,2),
    part_description VARCHAR
);

CREATE TABLE mechanic(
    mechanic_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    rate NUMERIC(7,2)
);

CREATE TABLE serv_mechanic(
    serv_mechanic_id SERIAL PRIMARY KEY,
    hours_worked NUMERIC(5,2),
    comment VARCHAR,
    part_id INTEGER,
    mechanic_id INTEGER,
    FOREIGN KEY (part_id) REFERENCES parts(part_id),
    FOREIGN KEY (mechanic_id) REFERENCES mechanic(mechanic_id)
);

CREATE TABLE sales_invoice(
    sales_invoice_id SERIAL PRIMARY KEY,
    sales_invoice_date DATE DEFAULT CURRENT_DATE,
    salesperson_id INTEGER,
    customer_id INTEGER,
    car_id INTEGER,
    car_total NUMERIC(6,2),
    quote BOOLEAN DEFAULT False,
    FOREIGN KEY (salesperson_id) REFERENCES salesperson(salesperson_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id), 
    FOREIGN KEY (car_id) REFERENCES car(car_id)
);

CREATE TABLE service_invoice(
    service_invoice_id SERIAL PRIMARY KEY,
    service_invoice_date DATE DEFAULT CURRENT_DATE,
    mechanic_id INTEGER, 
    customer_id INTEGER,
    car_id INTEGER,
    parts_total NUMERIC(6,2),
    quote BOOLEAN DEFAULT False,
    FOREIGN KEY (mechanic_id) REFERENCES mechanic(mechanic_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id), 
    FOREIGN KEY (car_id) REFERENCES car(car_id)
);

DROP TABLE mechanic CASCADE;
DROP TABLE invoice;