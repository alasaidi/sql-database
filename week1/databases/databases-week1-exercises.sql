-- 1. What are the names of countries with population greater than 8 million?
SELECT Name 
FROM country
WHERE Population > 8000000;

-- 2. What are the names of countries that have “land” in their names?
SELECT Name
FROM country
WHERE Name LIKE "%land%";

-- 3. What are the names of the cities with population in between 500,000 and 1 million?
SELECT Name 
FROM country
WHERE  500000< Population < 1000000;

-- 4. What's the name of all the countries on the continent ‘Europe’?
SELECT Name 
FROM country
WHERE  continent="Europe";

-- 5. What are the names of all the cities in the Netherlands?
SELECT Name
FROM city
WHERE  CountryCode ="NLD";

-- 6. What is the population of Rotterdam?
SELECT Population
FROM city
WHERE  CountryCode ="NLD" and Name="Rotterdam";

-- 7. Which countries don't have a head of state? Hint: looks for NULL and '' values
SELECT *
FROM country 
WHERE  HeadOfState =null or HeadOfState =""

-- 8. What's the top 10 least populated cities? Return the name and population
SELECT name, population
FROM city  
order by  Population asc limit 10;

-- 9. What countries in Africa have the local name the same as their common name?
SELECT Name 
FROM country   
where Continent ='Africa' and LocalName =Name 

-- 10. What countries have Spanish as official language? Hint: see countrylanguage table
SELECT name
FROM countrylanguage 
join country  
where language ="spanish" and countrylanguage.CountryCode =country.code and countrylanguage.IsOfficial="T"

-- 11. What countries have official languages spoken between 1% and 10% of the population?
SELECT name
FROM countrylanguage 
join country  
where countrylanguage.IsOfficial="T" and countrylanguage.CountryCode =country.Code and 1< countrylanguage.Percentage <10

-- 12. What languages are spoken by over 90% of the population of a country? Return just the language names, but don't repeat entries
select distinct language
FROM  countrylanguage
where countrylanguage.Percentage >90

-- 13. In which countries is 'Creole English' used? Order by descending percentage of speakers
SELECT name
FROM countrylanguage 
join country  
where countrylanguage.language='Creole English' order by countrylanguage.Percentage desc 

-- 14. What are the 5 oldest countries (by independence date) with some form of republic government? Tip: there are multiple types of republic
SELECT *
FROM  country  
where GovernmentForm="Republic" order by IndepYear asc limit 5

-- 15. For each country, how many people speak each language? Important: we want absolute values, not a percentage. Return the name of the country, the name of the language, and number of speakers of that language - Hint: you need both the country and countrylanguage tables - Hint: you can do calculations between columns, for example (SELECT a - b from table;)
SELECT name, language ,(country.Population *countrylanguage.Percentage) /100 as Speakers
FROM countrylanguage 
join country  
where countrylanguage.CountryCode =country.Code


-- BONUS
-- 1. What is the total population of the world?
select sum(Population) as totalPopilation from country 

-- 2. What is the average population of countries in Europe?
select avg(Population) as average_Popilation from country where Continent ='Europe' 

-- 3. How many *official* languages are spoken in Belgium (`BEL`)? Return the country code, and the number of languages as "Number of Languages"
select CountryCode , count(language) as Number_of_Languages from
countrylanguage where IsOfficial ="T" and CountryCode ="BEL"


-- MORE
-- 1. Retrieve the names of all the cities along with their respective country names, make sure the column names are easy to understand.
select city.name as city_Name, country.Name as country  from country join city where city.CountryCode =country.code

-- 2. Find the average life expectancy of countries in the continent 'Europe'.
select avg(lifeExpectancy) as average_life_expectancy from country where Continent='europe'

-- 3. Get the names and populations of cities in the district 'California'.
select name, population from city where District ='California'

-- 4. Retrieve the capital city of each country along with the country name.
SELECT ...

-- 5. Find the largest city by population in each country.
SELECT country.name, MAX(city.name) AS largest_city, MAX(city.population) AS city_population
FROM country
JOIN city ON city.CountryCode = country.Code
GROUP BY country.name;

-- 6. List the names of all cities with a population of over 1 million in the continent of 'Asia'.
select distinct city.name from city join country where city.Population >1000000 and country.Continent ='Asia' 

-- 7. Get the names and continents of countries that do not have an official language recorded in the database.
select name, Continent from country join countrylanguage where countrylanguage.IsOfficial ="F"

-- 8. List the countries in the 'Oceania' continent with an average life expectancy over 70.
select name from 
country where Continent ="Oceania" and LifeExpectancy >70

-- 9. Find the total number of languages spoken in the continent 'Africa'.
select count(language) from  country join countrylanguage where country.code=countrylanguage.countrycode and Continent ='Africa' 

-- 10. Retrieve the names and populations of cities located in countries with a surface area greater than 1 million square kilometers.
select city.name, city.population from city join country where country.surfacearea>1000000

-- 11. Retrieve the names and populations of capital cities with populations over 500,000.
select city.name, city.population from city join country where city.Population >500000 and country.Capital =city.ID  ;


-- 12. List the names and continents of countries where English is an official language.
select distinct country.name, country.Continent  from country join countrylanguage where language ="english" and isOfficial="T"

-- 13. Find the name of the country with the highest life expectancy.
select  name,max(LifeExpectancy) as Life_Expectancy from country GROUP BY country.name;  

-- 14. Get the names of countries in the 'South America' continent with cities having a population over 1 million.
select country.name from country join city where Continent ='Africa' and city.Population >1000000

-- 15. Find the name and population of the smallest city (by population) in the country 'India'.
select name, Population from city where CountryCode ='IND' order by Population asc limit 1;

-- 16. Retrieve the country name and its corresponding capital city's name where the capital's population is more than 1 million.
select city.name, country.name from city join country where city.Population >1000000 and country.Capital =city.ID  ;


-- 17. List the names of countries that have no cities in the database.
SELECT country.name
FROM country
LEFT JOIN city ON country.code = city.countrycode
WHERE city.id IS NULL

-- 18. Get the name and population of the largest city in the continent 'South America'.
select city.name, city.Population from city join country where country.Continent='South America' and country.Code=city.CountryCode order by Population desc limit 1;


-- 19. List the names and populations of all cities in countries where the official language is 'Spanish'.
select city.name, city.Population from city join country join countrylanguage  where country.code=countrylanguage.CountryCode and country.Code=city.CountryCode and language ="Spanish" and isofficial="t";


-- 20. Get the name of the country and the population of the city with the highest population in that country.
-- same as 5
 
