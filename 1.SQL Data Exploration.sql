-- Let's see the data we are gonna be exploring
SELECT location, date, total_cases, total_deaths, new_cases, population
FROM coviddeaths
ORDER BY 1, 2;

-- Total Cases vs Total Deaths (Death Percentage)
SELECT total_cases, date, total_deaths, (total_deaths / total_cases * 100) AS death_percentage
FROM coviddeaths
WHERE location LIKE '%states%';

-- Total Cases vs Population (Infection percentage)
SELECT total_cases, date, population, (total_cases / population * 100) AS infection_percentage
FROM coviddeaths
WHERE location LIKE '%states%'
ORDER BY 1, 2;

-- Countries with highest infection rate over population
SELECT location, MAX(total_cases) AS max_cases, population, MAX(total_cases / population * 100) AS infection_percentage
FROM coviddeaths
GROUP BY location
ORDER BY infection_percentage DESC;

-- Countries with highest death counts over population
SELECT location, MAX(CAST(total_deaths AS SIGNED)), population
FROM coviddeaths
GROUP BY location
ORDER BY total_deaths DESC;