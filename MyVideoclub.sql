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