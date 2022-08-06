-- 1.Get all the list of countries that are in the continent of Europe
SELECT * FROM country WHERE Continent = 'Europe';

-- 2.Get all the list of countries that are in the continent of North America and Africa
SELECT * FROM country WHERE Continent IN ('North America', 'Africa');

-- 3. Get all the list of cities that are part of a country with population greater than 100 millions.
SELECT CountryCode as country_code, country.Name AS country_name, continent, country.population AS country_population, city.Name as city FROM city LEFT JOIN country ON city.CountryCode = country.Code WHERE country.population> 100000000;

-- 4. Get all the list of countries (display the full country name) who speak 'Spanish' as their language
SELECT country.Name AS country, language FROM country LEFT JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE Language ='Spanish';

-- 5. Get all the list of countries (display the full country name) who speak 'Spanish' as their official language
SELECT country.Name AS country, language, IsOfficial AS isofficial FROM country LEFT JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE Language ='Spanish' AND IsOfficial='T';

-- 6. Get all the list of countries (display the full country name) who speak either 'Spanish' or 'English' as their official language
SELECT country.Name AS country, language FROM country LEFT JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE Language IN ('Spanish', 'English') AND IsOfficial='T';

-- 7. Get all the list of countries (display the full country name) where 'Arabic' is spoken by more than 30% of the population but where it's not the country's official language.
SELECT country.Name AS country, language, Percentage AS percentage, IsOfficial AS isofficial  FROM country LEFT JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE Language ='Arabic' AND IsOfficial='F' AND Percentage > 30.0;

-- 8. Get all the list of countries (display the full country name) where 'French' is the official language but where less than 50% of the population in that country actually speaks that language.
SELECT country.Name AS country, language, IsOfficial AS isofficial, Percentage AS percentage  FROM country LEFT JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE Language ='French' AND IsOfficial='T' AND Percentage < 50.0;

-- 9. Get all the list of countries (display the full country name and the full language name) and their official language.  Order the result so that those with the same official language are shown together.
SELECT country.Name AS country, language, IsOfficial AS isofficial FROM country LEFT JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE IsOfficial='T' ORDER BY Language;

-- 10. Get the top 100 cities with the most population.  Display the city's full country name also as well as their official language.
SELECT country.Name AS country_name, city.Name AS city, language, IsOfficial AS isofficial FROM city LEFT JOIN country ON city.CountryCode = country.Code LEFT JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE IsOfficial='T' ORDER BY city.Population DESC LIMIT 100;

-- 11. Get the top 100 cities with the most population where the life_expectancy for the country is less than 40.
SELECT country.Name AS country_name, country.LifeExpectancy AS lifeexpectancy, city.Name AS city, city.Population AS population FROM city LEFT JOIN country ON city.CountryCode = country.Code WHERE country.LifeExpectancy<40  ORDER BY city.Population DESC LIMIT 100;

-- 12. Get the top 100 countries who speak English and where life expectancy is highest.  Show the country with the highest life expectancy first.
SELECT country.Name AS country_name, city.Name AS city, country.LifeExpectancy AS lifeexpectancy FROM city LEFT JOIN country ON city.CountryCode = country.Code LEFT JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE Language='English'  ORDER BY country.LifeExpectancy DESC LIMIT 100;