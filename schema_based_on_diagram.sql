CREATE TABLE patients ( 
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255),
  date_of_birth DATE
);

CREATE TABLE medical_history (
  id SERIAL PRIMARY KEY NOT NULL,
  admitted_at TIMESTAMP,
  patients_id INTEGER NOT NULL REFERENCES patients(id),
  status VARCHAR(50)
);

CREATE TABLE treatments (
  id SERIAL PRIMARY KEY, 
  type VARCHAR(255), 
  name VARCHAR(255)
);

CREATE TABLE medical_treatments ( 
  medical_history_id INTEGER NOT NULL REFERENCES medical_history(id), 
  treatments_id INTEGER NOT NULL REFERENCES treatments(id)
);

CREATE TABLE invoices (
  id SERIAL PRIMARY KEY NOT NULL, 
  total_amount DECIMAL NOT NULL, 
  generated_at TIMESTAMP NOT NULL, 
  payed_at TIMESTAMP NOT NULL, 
  mediacl_history_id INTEGER NOT NULL REFERENCES medical_history(id)
);

CREATE TABLE invoice_items (
  id SERIAL PRIMARY KEY, 
  unit_price DECIMAL NOT NULL, 
  quantity INTEGER, 
  total_price DECIMAL, 
  invoice_id INTEGER NOT NULL REFERENCES invoices(id), 
  treatment_id INTEGER NOT NULL REFERENCES treatments(id)
);
