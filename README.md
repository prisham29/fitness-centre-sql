# Fitness Centre Management Database

A relational database portfolio project modelling members, trainers, fitness classes, rooms, class timetables, bank accounts and payments. Adapted from SQL coursework independently completed in 2023, for which I received **97%**.

## Skills demonstrated

- Relational database design with seven related tables
- Primary keys, foreign keys, `NOT NULL`, `UNIQUE` and `CHECK` constraints
- Multi-table joins, subqueries and `EXISTS`
- Filtering, grouping, aggregation and `HAVING`
- SQL views for reusable reporting

## Technology

**MySQL 8.0+** (SQL dialect). The scripts have been prepared for MySQL 8; execution against a running MySQL instance should be verified before presenting them as tested.

## Run locally

Install MySQL 8 and open a MySQL client (such as MySQL Workbench). Execute these files **in order**:

1. `schema.sql` — creates the `fitness_centre` database and seven tables.
2. `seed.sql` — inserts fictional demonstration records.
3. `queries.sql` — runs eight queries and creates a reporting view.

Alternatively, from a shell with the MySQL client installed:

```bash
mysql -u root -p < schema.sql
mysql -u root -p < seed.sql
mysql -u root -p < queries.sql
```

**Warning:** `schema.sql` drops and recreates the project's demonstration tables. Do not run it against a database containing data you need to keep.

## Data model

- `Member` → `Payment`: one-to-many
- `BankAccount` → `Payment`: one-to-many
- `Trainer` → `Class`: one-to-many
- `Class` → `Timetable`: one-to-many
- `Room` → `Timetable`: one-to-many
- `Class` → `Payment`: one-to-many

## Files

| File | Purpose |
| --- | --- |
| `schema.sql` | Database schema and constraints |
| `seed.sql` | Fictional sample data |
| `queries.sql` | Reporting queries based on Tasks 3–10 |

## Project background

The original coursework was completed independently in 2023 without AI coding assistance. This **portfolio adaptation** was subsequently revised with AI assistance to correct execution issues, add fictional seed data, improve constraints and documentation, and make the project easier to reproduce. The original submission is not included.

All names, phone numbers, email addresses and bank details in the sample dataset are fictional. This is an educational demonstration, not a production payment system.

Database Testing

The database was tested locally using MySQL Workbench.

Testing included:

Creating seven relational tables with primary and foreign key constraints.

Inserting fictional sample records.

Executing SQL queries involving joins, subqueries, filtering and aggregation.

Creating a SQL view to display trainer and workout information.

The project is based on independently completed university SQL coursework from 2023, for which I achieved 97%. The portfolio version includes subsequent corrections and improvements.
