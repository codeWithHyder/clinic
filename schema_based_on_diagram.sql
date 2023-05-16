/* create database clinic  */
create database clinic;

/* create table patients */
CREATE TABLE patients (
    id int generated always as identity,
    name varchar(30),
    date_of_birth date,
    PRIMARY KEY (id)
);

/* create table patients_medical_history */

CREATE TABLE medical_histories (
   id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
   admitted_at TIMESTAMP,
   patient_id INT REFERENCES patients(id),
   status VARCHAR(30)
);

/* create table treatments */

CREATE TABLE treatments (
    id int generated always as identity PRIMARY KEY,
	type varchar(20),
	name varchar(30)
);

CREATE TABLE INVOICES (
ID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
TOTAL_AMOUNT DECIMAL,
GENERATED_AT TIMESTAMP,
PAYED_AT TIMESTAMP,
MEDICAL_HISTORY_ID INT REFERENCES MEDICAL_HISTORIES(ID)
);

CREATE TABLE INVOICE_ITEMS (
ID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
UNIT_PRICE DECIMAL,
QUANTITY INT,
TOTAL_PRICE DECIMAL,
INVOICE_ID INT REFERENCES INVOICES(ID),
TREATMENT_ID INT REFERENCES TREATMENTS(ID)
);