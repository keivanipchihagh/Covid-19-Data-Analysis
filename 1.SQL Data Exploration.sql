-- Convert date into DATETIME format
UPDATE coviddeaths
SET date = str_to_date(date, '%m/%d/%Y');

UPDATE covidvaccinations
SET date = str_to_date(date, '%m/%d/%Y');

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
SELECT location, MAX(CAST(total_deaths AS SIGNED)) as 'total_deaths', population
FROM coviddeaths
WHERE continent != ''
GROUP BY location
ORDER BY total_deaths DESC;

-- Continents with highest death counts over population
SELECT continent, MAX(CAST(total_deaths AS SIGNED)) as 'total_deaths'
FROM coviddeaths
WHERE continent != ''
GROUP BY continent
ORDER BY total_deaths DESC;


-- Total cases & deaths for per date
SELECT date, SUM(new_cases) as total_cases, SUM(new_deaths) as total_deaths, SUM(new_deaths) / SUM(new_cases) * 100 AS death_percentage
FROM coviddeaths
WHERE continent IS NOT NULL
GROUP BY date
ORDER BY 1, 2;

-- JOINED deaths and vaccinations tables
SELECT *
FROM covidvaccinations AS vaccines
INNER JOIN coviddeaths AS deaths
	ON deaths.location = vaccines.location AND deaths.date = vaccines.date
WHERE continent != '';

-- Total population vs vaccinations
SELECT deaths.continent, deaths.location, deaths.date, deaths.population, vaccines.new_vaccinations,
	SUM(vaccines.new_vaccinations) OVER (PARTITION BY location ORDER BY deaths.location, deaths.date) AS 'rolling_vaccination'
FROM covidvaccinations AS vaccines
INNER JOIN coviddeaths AS deaths
	ON deaths.location = vaccines.location AND deaths.date = vaccines.date
WHERE deaths.continent != ''
ORDER BY 2, 3;

-- Rates
SELECT deaths.continent, deaths.location, deaths.date,
	ROUND(total_deaths / total_cases * 100, 2) AS death_rate, ROUND(total_vaccinations / deaths.population * 100, 2) AS vaccination_rate
FROM coviddeaths AS deaths
INNER JOIN covidvaccinations AS vaccines
	ON deaths.date = vaccines.date AND deaths.location = vaccines.location
ORDER BY location, date;

-- Population vs vaccinations
SELECT *, (rolling_vaccination / population * 100) AS 'PopvsVac' FROM (
	SELECT deaths.continent, deaths.location, deaths.date, deaths.population, vaccines.new_vaccinations,
		SUM(vaccines.new_vaccinations) OVER (PARTITION BY location ORDER BY deaths.location, deaths.date) AS 'rolling_vaccination'
	FROM covidvaccinations AS vaccines
	INNER JOIN coviddeaths AS deaths
		ON deaths.location = vaccines.location AND deaths.date = vaccines.date
	WHERE deaths.continent != ''
	ORDER BY 2, 3
) AS PopvsVac;

-- Create a view for Tableau visualization
CREATE VIEW percent_population_vaccinated AS
SELECT *, (rolling_vaccination / population * 100) AS 'PopvsVac' FROM (
	SELECT deaths.continent, deaths.location, deaths.date, deaths.population, vaccines.new_vaccinations,
		SUM(vaccines.new_vaccinations) OVER (PARTITION BY location ORDER BY deaths.location, deaths.date) AS 'rolling_vaccination'
	FROM covidvaccinations AS vaccines
	INNER JOIN coviddeaths AS deaths
		ON deaths.location = vaccines.location AND deaths.date = vaccines.date
	WHERE deaths.continent != ''
	ORDER BY 2, 3
) AS PopvsVac;