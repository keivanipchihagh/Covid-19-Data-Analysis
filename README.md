# Covid-19 Data Analysis
 ☠ Covid-19 deaths & vaccination analysis with daily-updated data from OWID dataset.

## DataBase Setup (MySQL)
Setting up the Database can be a bit tricky. For MySQL users, follow these instructions:
1. Create a Database Schema and name it **"covid19"**.
2. Run **"table_stuctures.sql"** query file from *"DB setup" folder* to create table structures.
3. Then use the following commans to import the data into your workbench:
```sql
LOAD DATA LOCAL INFILE "Absolute\\path\\to\\file\\CovidVaccinations.csv" INTO TABLE covid19.covidvaccinations
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
```

```sql
LOAD DATA LOCAL INFILE "Absolute\\path\\to\\file\\CovidDeaths.csv" INTO TABLE covid19.CovidDeaths
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
```
4. In case you ran into an error that looked something like **"Loading local data is disabled; this must be enabled on both the client and server side"**, refer to [Enable Client-Server locals](https://stackoverflow.com/questions/59993844/error-loading-local-data-is-disabled-this-must-be-enabled-on-both-the-client#answer-62965185).
5. In case you ran into an error that looked something like **"LOAD DATA LOCAL INFILE file request rejected due to restrictions on access"**, refer to [Lift Local-Restriction](https://stackoverflow.com/questions/63361962/error-2068-hy000-load-data-local-infile-file-request-rejected-due-to-restrict#answer-64807264).
6. If you still had problem importing the data, run your queries manually with [beautifytools](https://beautifytools.com/csv-to-sql-converter.php). (This can be quite time-consuming!)

## Steps
1. SQL Data Exploration (Video based)
2. More Data Exploration
3. Data Visualization with Tableau

## Links
- [Data Analyst Portfolio Project](https://www.youtube.com/watch?v=qfyynHBFOsM&list=PLUaB-1hjhk8H48Pj32z4GZgGWyylqv85f&ab_channel=AlexTheAnalyst)
- [Original Data Source](https://ourworldindata.org/covid-deaths)
