CREATE database People;
use People;

CREATE TABLE person (
	id INTEGER PRIMARY KEY,
	first_name VARCHAR(50),
    last_NAME VARCHAR(50),
    age INTEGER
);

CREATE TABLE pets (
	id INTEGER PRIMARY KEY,
    pet_name VARCHAR(50),
    breed VARCHAR(50),
    age INTEGER,
    dead INTEGER
);

CREATE TABLE person_pet (
	person_id INTEGER,
    pet_id INTEGER
);

insert into person values (1, 'Dave','Wolf',99);
insert into person values (2, 'Bart', 'Simpson', 10);
insert into person values (3, 'Cat Lady', '',99);
select * from person;

insert into pets values (10, 'fifi', 'dog',4,1);
insert into pets values (11, 'toto', 'dog',8,1);
insert into pets values (12, 'cat1', 'cat',5,1);
insert into pets values (13, 'kitten', 'cat', 2,1);
insert into pets values (14, 'Mr. Fluffy', 'cat',9,1);
insert into pets values (15, 'Snoogums','dog',5,1);
insert into pets values (16, 'DonkeyOtey','donkey',14,1);
select * from pets;

insert into person_pet values (1,10);
insert into person_pet values (2,11);
-- oops, accidentally gave fifi to two people
insert into person_pet values (2,10);
insert into person_pet values (3,12);
insert into person_pet values (3,13);
insert into person_pet values (3,14);
insert into person_pet values (3,15);
insert into person_pet values (1,16);
select * from person_pet;

update person_pet set person_id = 2 WHERE pet_id = 16;

select * from person inner join
person_pet on person.id = person_pet.person_id
inner join pets on person_pet.pet_id = pets.id;

select first_name, last_name, pet_name as 'Pet Name', pets.age as 'Peg Age'
from person inner join
person_pet on person.id = person_pet.person_id
inner join pets on person_pet.pet_id = pets.id;

-- now we move on to INSERT ing data some more
INSERT INTO person (id, first_name, last_name, age)
	VALUES (0, 'Dave', 'Wolfe',25);
    
INSERT INTO pets (id, pet_name, breed, age, dead)
	VALUES (19, 'Fluffy','Univorn',1000,0);
    
INSERT INTO pets VALUES (1, 'Gigantor','Robot',1,1);

INSERT INTO pets (id, pet_name, breed, age, dead)
	VALUES (21, 'Nova','dog',8,0);

INSERT INTO person (id, first_name, last_name, age)
	VALUES (100, 'Cameron','.Cn',24);
    
insert into person_pet values (100,21);

---

SELECT * FROM person;
SELECT pet_name, age FROM pets;

SELECT pet_name, age FROM pets WHERE dead = 0;

SELECT * FROM person WHERE first_name != 'Dave';

SELECT * FROM pets WHERE age > 10;

SELECT * FROM person WHERE age < 21;

SELECT * FROM pets WHERE pet_name != 'Fluffy' AND dead !=0;

SELECT * FROM person WHERE age > 11 AND first_name != 'Dave' AND first_name != 'Bart';



-- To find out which pets belong to David
SELECT pets.id, pets.pet_name, pets.age, pets.dead
    FROM pets, person_pet, person
    WHERE
    pets.id = person_pet.pet_id AND
    person_pet.person_id = person.id AND
    person.first_name = 'Dave';
    