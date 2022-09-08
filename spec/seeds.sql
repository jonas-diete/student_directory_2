TRUNCATE TABLE students, cohorts RESTART IDENTITY;

INSERT INTO cohorts (name, starting_date) VALUES ('August', '01-08-2022'), ('September', '01-09-2022');

INSERT INTO students (name, cohort_id) VALUES ('Jonas', 1), ('Sadat', 1), ('Jim', 2);