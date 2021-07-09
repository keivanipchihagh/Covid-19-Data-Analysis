SELECT * FROM coviddeaths;

-- Get total cases, total deaths and the death/case ratio world-wise
SELECT SUM(new_cases) AS 'Total Cases', SUM(new_deaths) AS 'Total Deaths', ROUND(SUM(new_deaths) / SUM(new_cases) * 100, 2) AS 'Death Ratio'
FROM coviddeaths
WHERE continent != '';

-- Get total cases, total deaths for each continent
SELECT location, MAX(CAST(total_deaths AS SIGNED)) AS 'Total Deaths'
FROM coviddeaths
WHERE continent = '' AND location not in ('World', 'European Union', 'International')
GROUP BY location;

-- Get Infection information country-wise
SELECT location, date population, MAX(total_cases) AS 'Highest Infection Count', MAX(total_cases / population * 100) AS PercentPopulationInfected
FROM coviddeaths
GROUP BY location
ORDER BY PercentPopulationInfected DESC