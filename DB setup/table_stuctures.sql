-- drop tables coviddeaths, covidvaccinations;

/* CREATE TABLE */
CREATE TABLE CovidVaccinations(
iso_code VARCHAR(100),
continent VARCHAR(100),
location VARCHAR(100),
date VARCHAR(100),
population DOUBLE,
new_tests VARCHAR(100),
total_tests VARCHAR(100),
total_tests_per_thousand VARCHAR(100),
new_tests_per_thousand VARCHAR(100),
new_tests_smoothed VARCHAR(100),
new_tests_smoothed_per_thousand VARCHAR(100),
positive_rate VARCHAR(100),
tests_per_case VARCHAR(100),
tests_units VARCHAR(100),
total_vaccinations VARCHAR(100),
people_vaccinated VARCHAR(100),
people_fully_vaccinated VARCHAR(100),
new_vaccinations VARCHAR(100),
new_vaccinations_smoothed VARCHAR(100),
total_vaccinations_per_hundred VARCHAR(100),
people_vaccinated_per_hundred VARCHAR(100),
people_fully_vaccinated_per_hundred VARCHAR(100),
new_vaccinations_smoothed_per_million VARCHAR(100),
stringency_index DOUBLE,
population_density DOUBLE,
median_age DOUBLE,
aged_65_older DOUBLE,
aged_70_older DOUBLE,
gdp_per_capita DOUBLE,
extreme_poverty VARCHAR(100),
cardiovasc_death_rate DOUBLE,
diabetes_prevalence DOUBLE,
female_smokers VARCHAR(100),
male_smokers VARCHAR(100),
handwashing_facilities DOUBLE,
hospital_beds_per_thousand DOUBLE,
life_expectancy DOUBLE,
human_development_index DOUBLE,
excess_mortality VARCHAR(100)
);

/* CREATE TABLE */
CREATE TABLE CovidDeaths(
iso_code VARCHAR(100),
continent VARCHAR(100),
location VARCHAR(100),
date VARCHAR(100),
population DOUBLE,
total_cases DOUBLE,
new_cases DOUBLE,
new_cases_smoothed VARCHAR(100),
total_deaths VARCHAR(100),
new_deaths VARCHAR(100),
new_deaths_smoothed VARCHAR(100),
total_cases_per_million DOUBLE,
new_cases_per_million DOUBLE,
new_cases_smoothed_per_million VARCHAR(100),
total_deaths_per_million VARCHAR(100),
new_deaths_per_million VARCHAR(100),
new_deaths_smoothed_per_million VARCHAR(100),
reproduction_rate VARCHAR(100),
icu_patients VARCHAR(100),
icu_patients_per_million VARCHAR(100),
hosp_patients VARCHAR(100),
hosp_patients_per_million VARCHAR(100),
weekly_icu_admissions VARCHAR(100),
weekly_icu_admissions_per_million VARCHAR(100),
weekly_hosp_admissions VARCHAR(100),
weekly_hosp_admissions_per_million VARCHAR(100)
);

-- LOAD DATA LOCAL INFILE "E:\\GitHub\\Covid-19-Data-Analysis\\OWID dataset\\CovidVaccinations.csv" INTO TABLE covid19.covidvaccinations
-- FIELDS TERMINATED BY ','
-- LINES TERMINATED BY '\n'
-- IGNORE 1 LINES;

-- LOAD DATA LOCAL INFILE "E:\\GitHub\\Covid-19-Data-Analysis\\OWID dataset\\CovidDeaths.csv" INTO TABLE covid19.coviddeaths
-- FIELDS TERMINATED BY ','
-- LINES TERMINATED BY '\n'
-- IGNORE 1 LINES