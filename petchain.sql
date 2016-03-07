CREATE TABLE petshops (
  id serial4 primary key,
  name varchar(255),
  address varchar(255),
  category varchar(255)    
);

CREATE TABLE pets (
  id serial4 primary key,
  petshop_id int4 references petshops(id),
  name varchar(255),
  pet_type varchar(255),
  picture varchar(255)
);




