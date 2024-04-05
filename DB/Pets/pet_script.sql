CREATE TABLE pet (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name_pet varchar(30),
    born_year INTEGER,
    color varchar(30),
    healthStatus varchar(30)
);

CREATE TABLE cat (
	id_cat INTEGER PRIMARY KEY AUTO_INCREMENT,
    breed varchar(30),
    id_pet INTEGER,
    FOREIGN KEY (id_pet) REFERENCES pet(id)
);

CREATE TABLE dog (
	id_dog INTEGER PRIMARY KEY AUTO_INCREMENT,
    breed varchar(30),
    pedigree varchar(30),
    id_pet INTEGER,
    FOREIGN KEY (id_pet) REFERENCES pet(id)
);

INSERT INTO pet(name_pet,born_year,color,healthStatus)
VALUES('Fluffy',2018,'Blanco','Saludable'),
	  ('Max',2019,'Marrón','Saludable'),
      ('Luna',2020,'Negro','Enfermo'),
      ('Firulais',2022,'Dorado','Enfermo'),
      ('Simba',2023,'Negro','Saludable');

select * from pet

INSERT INTO cat(breed,id_pet)
VALUES('Persa',1),
	  ('Maine Coon',3);

select * from CAT

INSERT INTO dog(breed,pedigree,id_pet)
VALUES ('Beagle','Mezclado',1),
	   ('Golden Retriever','Mezclado',4),
	   ('Labrador','Pura raza',5);
       
select * from DOG

SELECT name_pet, healthStatus
FROM pet
WHERE healthStatus = 'Saludable';

SELECT name_pet, healthStatus
FROM pet
WHERE healthStatus = 'Enfermo';

SELECT name_pet, breed
FROM pet
INNER JOIN cat ON pet.id = cat.id_pet;

SELECT name_pet, breed, pedigree
FROM pet
INNER JOIN dog ON pet.id = dog.id_pet;

SELECT name_pet, born_year, healthStatus
FROM pet
LEFT JOIN cat ON pet.id = cat.id_pet
LEFT JOIN dog ON pet.id = dog.id_pet;