# Covid-19 Data Analysis
 Covid-19 country-wise analysis with up-to-date daily data from WHO until July, 7, 2021.

## DataBase Setup (MySQL)
Setting up the Database can be a bit tricky. For MySQL users, follow these instructions:
1. Create a Database Schema and name it **"covid19"**.
2. Run **"create_tables.sql"** query file located in the repo in order to create table structures.
3. Then use the following commans to import the data into your workbench:
```sql
LOAD DATA LOCAL INFILE "Absolute\\path\\to\\file\\CovidVaccinations.csv" INTO TABLE covid19.covidvaccination
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
```

```sql
LOAD DATA LOCAL INFILE "Absolute\\path\\to\\file\\CovidDeath.csv" INTO TABLE covid19.CovidDeath
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
```
4. In case you ran into an error that looked something like **"Loading local data is disabled; this must be enabled on both the client and server side"**, refer to [Enable Client-Server locals](https://stackoverflow.com/questions/59993844/error-loading-local-data-is-disabled-this-must-be-enabled-on-both-the-client#answer-62965185).
5. In case you ran into an error that looked something like **"LOAD DATA LOCAL INFILE file request rejected due to restrictions on access"**, refer to [Lift Local-Restrict](https://stackoverflow.com/questions/63361962/error-2068-hy000-load-data-local-infile-file-request-rejected-due-to-restrict#answer-64807264).
6. In case none of the steps worked, first RIP❤, then run your queries manually with [beautifytools](https://beautifytools.com/csv-to-sql-converter.php). (This can be quite time-consuming!)
