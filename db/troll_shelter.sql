DROP TABLE trolls;
DROP TABLE owners;

CREATE TABLE owners (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE trolls (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  breed VARCHAR(255),
  adoptable VARCHAR(255),
  admission_date VARCHAR(255),
  owner_id INT8 REFERENCES owners(id)
);
