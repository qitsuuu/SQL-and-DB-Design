-- PART 1
-- 1. How many countries in each continent, have life expectancy greater than 70?
SELECT Continent AS continent, count(*) AS total_countries, LifeExpectancy AS lifeexpectancy FROM country WHERE country.LifeExpectancy > 70 GROUP BY Continent ORDER BY LifeExpectancy DESC, total_countries DESC;

-- 2. How many countries in each continent have life expectancy between 60 and 70?
SELECT Continent AS continent, count(*) AS total_countries, LifeExpectancy as lifeexpectancy FROM country WHERE country.LifeExpectancy BETWEEN 60 AND 70 GROUP BY Continent;

-- 3. How many countries have life expectancy greater than 75?
SELECT Name AS country_name, LifeExpectancy AS lifeexpectancy FROM country WHERE country.LifeExpectancy > 75;

-- 4. How many countries have life expectancy less than 40
SELECT Name AS country_name, LifeExpectancy AS lifeexpectancy FROM country WHERE country.LifeExpectancy < 40;

-- 5. How many people live in the top 10 countries with the most population?
SELECT Name AS country, sum(Population) AS populations FROM country GROUP BY country.Name ORDER BY populations DESC LIMIT 10; 

-- 6. According to the world database, how many people are there in the world?
SELECT sum(Population) AS total_population FROM country;

-- 7. Show results for continents where it shows the continent name and the total population.  Only show results where the total_population for the continent is more than 500,000,000.  If. the continent doesn't have 500,000,000 people, do NOT show the result.
SELECT Continent AS continent, sum(Population) AS total_population FROM country GROUP BY Continent HAVING sum(Population) > 500000000 ORDER BY total_population DESC;

-- 8. Show results of all continents that has average life expectancy for the continent to be less than 71.  Show each of these continent name, how many countries there are in each of the continent, total population for the continent, as well as the life expectancy of this continent.  For example, as Europe and North America both have continent life expectancy greater than 71, these continents shouldn't show up in your sql results.
SELECT Continent AS continent, count(country.Name) AS country, sum(Population) AS total_population, AVG(LifeExpectancy) AS life_expectancy FROM country GROUP BY Continent HAVING AVG(LifeExpectancy)<71;

-- PART 2
-- 1. How many cities are there for each of the country?  Show the total city count for each country where you display the full country name.
SELECT country.Name AS country, count(*) FROM country LEFT JOIN city ON country.Code = city.CountryCode GROUP BY country;

-- 2. For each language, find out how many countries speak each language.
SELECT country.Name AS country, Language, count(*) AS number_of_countries FROM countrylanguage LEFT JOIN country ON country.Code = countrylanguage.CountryCode GROUP BY language ORDER BY country, Language;

-- 3. For each language, find out how many countries use that language as the official language.
SELECT Language, count(country.Name) as countries, IsOfficial AS isofficial FROM countrylanguage LEFT JOIN country ON country.Code = countrylanguage.CountryCode WHERE IsOfficial='T' GROUP BY language ORDER BY Language;

-- 4. For each continent, find out how many cities there are (according to this database) and the average population of the cities for each continent.  For example, for continent A, have it state the number of cities for that continent, and the average city population for that continent.
SELECT Continent AS continent, Count(*) AS total_cities, AVG(city.Population) AS average_cities_population FROM city LEFT JOIN country ON country.Code = city.CountryCode GROUP BY Continent;

-- 5. (Advanced) Find out how many people in the world speak each language.  Make sure the total sum of. this number is comparable to the total population in the world.
SELECT Language AS language, sum(country.Population * (Percentage/100)) AS total_population FROM countrylanguage LEFT JOIN country ON country.Code = countrylanguage.CountryCode GROUP BY Language ORDER BY total_population DESC;