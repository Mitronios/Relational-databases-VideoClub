drop schema if exists miguel_gonzales_videoclub cascade;

create schema miguel_gonzales_videoclub;

set schema 'miguel_gonzales_videoclub';

--Create tables

create table associates (
	id serial primary key,
	passport varchar(20) not null,
	first_name varchar(50) not null,
	last_name varchar(50) not null
);

create table membership (
	id serial primary key,
	associate_id integer not null,
	membership_number varchar(30) not null,
	issue_date date not null,
	expiration_date date not null
);

create table address (
	id serial primary key,
	associate_id integer not null,
	zip_code varchar(20) not null,
	street varchar(90) not null,
	number integer not null,
	apartment varchar(50)
);

create table genre (
	id serial primary key,
	genre_name varchar(50) not null
);

create table director (
	id serial primary key,
	director_name varchar(50)
);

create table movie (
	id serial primary key,
	title varchar(100) not null,
	genre_id integer not null,
	director_id integer not null,
	synopsis text not null
);

create table movie_copy (
	id serial primary key,
	movie_id integer not null,
	rented boolean not null,
	status varchar(80) not null
);

create table rental (
	id serial primary key,
	associate_id integer not null,
	copy_id integer not null,
	rental_date date not null,
	return_date date
);

create table available_copy (
	id serial primary key,
	movie_id integer not null,
	available_copies integer not null default 0
);

--Stablish relations

alter table membership
add constraint membership_member_fk
foreign key (associate_id)
references associates(id);

alter table address
add constraint address_member_fk
foreign key (associate_id)
references associates(id);

alter table movie 
add constraint movie_genre_fk
foreign key (genre_id)
references genre(id);

alter table movie
add constraint movie_director_fk
foreign key (director_id)
references director(id);

alter table movie_copy 
add constraint movie_copy_movie_fk
foreign key (movie_id)
references movie(id);

alter table available_copy 
add constraint available_copy_movie_fk
foreign key (movie_id)
references movie(id);

alter table rental 
add constraint rental_movie_copy_fk
foreign key (copy_id)
references movie_copy(id);

alter table rental
add constraint rental_associates_fk
foreign key (associate_id)
references associates(id);


--Data insert: manually

--Associates
insert into associates (passport, first_name, last_name) 
values
('A1234567', 'John', 'Doe'),
('A2345678', 'Jane', 'Smith'),
('C3456789', 'Alice', 'Johnson'),
('D4567890', 'Bob', 'Brown'),
('B5678901', 'Charlie', 'Davis'),
('G6789012', 'Diana', 'Miller'),
('J7890123', 'Ethan', 'Wilson'),
('H8901234', 'Fiona', 'Moore'),
('F9012345', 'George', 'Taylor'),
('F0123456', 'Hannah', 'Anderson');

--Membership
insert into membership (associate_id, membership_number, issue_date, expiration_date)
values
(1, 'M-0001', '2024-01-01', '2025-01-01'),
(2, 'M-0002', '2024-01-15', '2025-01-15'),
(3, 'M-0003', '2024-02-01', '2025-02-01'),
(4, 'M-0004', '2024-02-10', '2025-02-10'),
(5, 'M-0005', '2024-03-01', '2025-03-01'),
(6, 'M-0006', '2024-03-15', '2025-03-15'),
(7, 'M-0007', '2024-04-01', '2025-04-01'),
(8, 'M-0008', '2024-04-20', '2025-04-20'),
(9, 'M-0009', '2024-05-01', '2025-05-01'),
(10, 'M-0010', '2024-05-15', '2025-05-15');

--Address
insert into address (associate_id, zip_code, street, number, apartment) 
values
(1, '12345', 'Main St', 101, 'A'),
(2, '23456', 'Broadway', 202, 'B'),
(3, '34567', 'Elm St', 303, NULL),
(4, '45678', 'Pine St', 404, 'C'),
(5, '56789', 'Oak St', 505, NULL),
(6, '67890', 'Maple St', 606, 'D'),
(7, '78901', 'Cedar St', 707, NULL),
(8, '89012', 'Birch St', 808, 'E'),
(9, '90123', 'Walnut St', 909, NULL),
(10, '01234', 'Spruce St', 1010, 'F');

--Movies
--Genre
insert into genre (genre_name)
values
('Action'), ('Comedy'), ('Drama'), 
('Horror'), ('Sci-Fi'), ('Fantasy'), 
('Thriller'), ('Romance'), ('Documentary'), 
('Adventure');

--Director
insert into director (director_name)
values
('Steven Spielberg'), ('Christopher Nolan'), ('Martin Scorsese'), 
('Quentin Tarantino'), ('James Cameron'), ('Ridley Scott'), 
('Peter Jackson'), ('Tim Burton'), ('David Fincher'), ('Greta Gerwig');

--Movie
insert into movie (title, genre_id, director_id, synopsis)
values
('Inception', 5, 2, 'A mind-bending thriller about dreams and the power of ideas.'),
('Titanic', 8, 5, 'A love story aboard the doomed ship, academy award winner.'),
('The Godfather', 3, 3, 'A crime saga of the mafia family, intriguing and full of emotions.'),
('The Dark Knight', 1, 2, 'Batman faces the Joker in Gotham, one of the best from Nolan.'),
('Pulp Fiction', 7, 4, 'A mix of interconnected crime stories, you will enjoy every second of it.'),
('The Martian', 5, 6, 'An astronaut stranded on Mars, great histoy of bravery and resilence.'),
('The Lord of the Rings the two towers', 6, 7, 'The epic journey continues, destroy the One Ring.'),
('Edward Scissorhands', 6, 8, 'A gentle man with scissors for hands, another great movie from Tim burton.'),
('Fight Club', 7, 9, 'An underground fight club forms, a true master piece.'),
('Barbie', 8, 10, 'A modern take on the famous doll, more than just dolls.');

--Copies (five per each)
insert into movie_copy (movie_id, rented, status)
values
(1, FALSE, 'Available'), (1, TRUE, 'Rented'), (1, FALSE, 'Available'), (1, FALSE, 'Available'), (1, TRUE, 'Lost'),
(2, FALSE, 'Available'), (2, TRUE, 'Rented'), (2, TRUE, 'Never Returned'), (2, FALSE, 'Available'), (2, TRUE, 'Rented'),
(3, FALSE, 'Available'), (3, TRUE, 'Rented'), (3, FALSE, 'Damaged'), (3, FALSE, 'Available'), (3, TRUE, 'Rented'),
(4, FALSE, 'Available'), (4, FALSE, 'Available'), (4, TRUE, 'Rented'), (4, FALSE, 'Available'), (4, TRUE, 'Rented'),
(5, FALSE, 'Available'), (5, TRUE, 'Rented'), (5, TRUE, 'Never Returned'), (5, FALSE, 'Available'), (5, TRUE, 'Lost'),
(6, FALSE, 'Available'), (6, TRUE, 'Rented'), (6, FALSE, 'Available'), (6, FALSE, 'Available'), (6, TRUE, 'Damaged'),
(7, FALSE, 'Available'), (7, TRUE, 'Rented'), (7, FALSE, 'Available'), (7, FALSE, 'Available'), (7, TRUE, 'Lost'),
(8, FALSE, 'Available'), (8, TRUE, 'Rented'), (8, FALSE, 'Available'), (8, TRUE, 'Never Returned'), (8, TRUE, 'Rented'),
(9, FALSE, 'Available'), (9, TRUE, 'Rented'), (9, FALSE, 'Available'), (9, TRUE, 'Damaged'), (9, TRUE, 'Lost'),
(10, FALSE, 'Available'), (10, TRUE, 'Rented'), (10, FALSE, 'Available'), (10, FALSE, 'Available'), (10, TRUE, 'Rented');

--Rentals
insert into rental (associate_id, copy_id, rental_date, return_date)
values
(1, 2, '2024-06-01', NULL), (2, 7, '2024-06-02', NULL), 
(3, 12, '2024-06-03', NULL), (4, 17, '2024-06-04', '2024-06-10'), 
(5, 22, '2024-06-05', NULL), (6, 27, '2024-06-06', NULL),
(7, 32, '2024-06-07', '2024-06-12'), (8, 37, '2024-06-08', NULL), 
(9, 42, '2024-06-09', NULL), (10, 47, '2024-06-10', NULL);

--Attemps to make queries

select * from movie;

select * from movie_copy where rented = false;

select * from available_copy;

--Available copies
select movie.title, movie.id, COUNT(*) 
from movie
join movie_copy on movie.id = movie_copy.movie_id
where movie_copy.rented = false
group by movie.id
order by id;

--Insert data to available_copy
insert into available_copy (movie_id, available_copies)
select movie.id, COUNT(*) 
from movie
join movie_copy on movie.id = movie_copy.movie_id
where movie_copy.rented = false
group by movie.id
order by id;


--Check number of copies

select movie.title, available_copy.available_copies
from available_copy
left join movie on available_copy.movie_id = movie.id;

--Check rented movies
select count(*) as rented_movies from movie_copy where rented = true;

select associates.first_name, associates.last_name, address.street, address.number, address.apartment, address.zip_code
from associates
left join address on associates.id = address.associate_id
order by associates.id;

--Available copies by title
select movie.title, available_copy.available_copies from available_copy
inner join movie ON available_copy.movie_id = movie.id
WHERE movie.title IN ('Titanic', 'The Dark Knight', 'Barbie');