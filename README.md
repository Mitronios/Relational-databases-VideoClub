# Oldie but goldie, 90's style video club model

This repository contains the files for a relational database project, designed as a practice exercise for the Relational Databases module at KeepCoding Web Development Bootcamp. 
It models a classic 90's style video club, capturing information about associates, memberships, addresses, rentals, and movies.

## Project Overview

The project consists of:

* **UML Diagram (`videoclub_diagram.drawio`):** A visual representation of the database schema, created using draw.io.
* **SQL Script (`videoclub_schema.sql`):** A PostgreSQL script to create the database tables and populate them with sample data.

## Database Schema

The database schema includes the following entities:

* **Associates:** Stores information about video club members (name, contact details, etc.).
* **Membership:** Tracks membership details (start date, end date, membership type).
* **Address:** Stores address information for associates.
* **Rental:** Records rental transactions, linking associates, movies, and rental dates.
* **Movie:** Contains details about the movies available for rent (title, genre, release year, etc.).
* **Others:** Additional tables, Genre, Director, Movie_copy and Available_copy for normalisation purposes.

## UML Diagram

The `videoclub_diagram.drawio` file provides a visual representation of the database schema, including:

* Tables and their attributes.
* Relationships between tables (primary keys, foreign keys).
* Cardinality of relationships.

You can open this file using draw.io (diagrams.net) to view and modify the diagram.

## SQL Script

The `videoclub_schema.sql` script performs the following actions:

1.  **Creates tables:** Defines the structure of each table, including data types and constraints.
2.  **Inserts sample data:** Populates the tables with initial data for testing and demonstration purposes.

### How to Run the SQL Script

To run the SQL script, you will need a PostgreSQL database server and DBeaver. Follow these steps:

1.  **Install PostgreSQL and DBeaver:** If you don't have any installed, download and install it from the official website.
2.  **Create a database:** Create a new database for this project. For example:

    ```sql
    CREATE DATABASE videoclub;
    ```

3.  **Connect to the database:** Connect to the `videoclub` database using your preferred PostgreSQL client (e.g., `psql`, pgAdmin).
4.  **Execute the script:** Run the `videoclub_schema.sql` script. For example, using `psql`:

    ```bash
    psql -d videoclub -f videoclub_schema.sql
    ```

## Technologies Used

* PostgreSQL
* draw.io (diagrams.net)

## Contributing

Feel free to contribute to this project by:

* Improving the database schema.
* Adding more sample data.
* Creating queries to retrieve specific information.
* Adding more documentation.
