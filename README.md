# DVD Rental Database Operations

## Overview

This repository holds SQL Data Manipulation Language (DML) operations intended for the DVD Rental sample database, which is a part of the PostgreSQL tutorial. The repository features SQL scripts to insert, update, and delete records within the sample database, as well as the corresponding Entity-Relationship Diagram (ERD).

## Contents

- `SQL_DML.sql` - This text file contains SQL statements for performing insert, update, and delete operations on the DVD rental database.
- `dvdrental` - The database backup file from PostgreSQL's sample DVD rental database.
- `dvd-rental-sample-database-diagram.png` - The ERD for the DVD rental database.

## Detailed Operations

The SQL scripts in `SQL_DML.sql` accomplish the following tasks:

1. Insert new films and actors into the database if they do not already exist.
2. Link actors to their respective films in the `film_actor` table.
3. Update customer records with new information.
4. Delete specific records from the `payment` and `rental` tables based on given conditions.
5. Insert new rental records for favorite movies and corresponding payment records to capture rental activities.

## Using the Scripts

To utilize the SQL scripts, follow these steps:

1. Restore the `dvdrental` backup file to your PostgreSQL installation.
2. Open the `SQL_DML.sql` with a SQL client of your choice that's connected to the `dvdrental` database.
3. Execute the SQL statements in the script to modify the database as described above.

## Entity-Relationship Diagram

Refer to the `dvd-rental-sample-database-diagram.png` for a visual representation of the database schema. This ERD will assist in understanding how the database tables are structured and how they relate to each other.

## Contributing

If you find any issues with the SQL scripts or have suggestions for additional DML operations, please feel free to open an issue or submit a pull request.
