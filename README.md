# Welcome to the Bingeflix Data Team

### Coding Conventions
#### General
- Use UPPER case for all keywords
- Use trailing commas in SELECT statements
- Use Snowflake dialect
- Use consistent style in GROUP BY and ORDER BY (either names or numbers, not both)


### Testing Conventions
#### Sources
- The primary key source column must have not_null and unique generic tests.
- All boolean columns must have an accepted_values schema test. The accepted values are true and false.
- Columns that contain category values must have an accepted_values schema test.
- Columns that should never be null must have a not_null schema test.
- Columns that should be unique must have a unique schema test.

#### Models
- The primary key column must have not_null and unique schema tests.
- All boolean columns must have an accepted_values schema test. The accepted values are true and false.
- Columns that contain category values must have an accepted_values schema test.
- Columns that should never be null must have a not_null schema test.
- Columns that should be unique must have a unique schema test.
- Where possible, use schema tests from the dbt_utils or dbt_expectations packages to perform extra verification.

#### Method for identifying redundant tests
- Start from the dim/fct marts models
- Identify what tests are being applied on a given column and if they are transformed
- If not transformed, thats a good column to investigate
- Explore the table dependencies of the column and confirm if transforms are being applied
- If not transformed, good column to remove tests
- A test can exist at source(.yml) or a model (stg,int,fct)
- If a test is being done at source and there is no transform at staging, remove tests at staging layer
