-- How many entries in the countries table are from Africa?
select continent, count(id)
from countries
where continent = 'Africa';

-- What was the total population of the continent of Oceania in 2005?
select a.continent, b.year, sum(b.population) as total_population 
from countries a
inner join population_years b
on a.id = b.country_id
where a.continent = 'Oceania' and b.year = 2005
group by a.continent, b.year;

-- What is the average population of countries in South America in 2003?
select a.continent, b.year, avg(b.population) as average_population 
from countries a
inner join population_years b
on a.id = b.country_id
where a.continent = 'South America' and b.year = 2003
group by a.continent, b.year;

-- What country had the smallest population in 2007?
select a. name, a.continent, b.year, b.population
from countries a
inner join population_years b
on a.id = b.country_id
where b.year = 2007 and b.population is not null
order by b.population asc
limit 5;

-- What is the average population of Poland during the time period covered by this dataset?
select a.name, a.continent, b.year, round(avg(b.population),2) as average_population
from countries a
inner join population_years b
on a.id = b.country_id
where b.population is not null and a.name = 'Poland'
group by a.name, a.continent, b.year
order by average_population asc;

-- How many countries have the word “The” in their name?
select count(*)
from countries
where name like '%The%';

-- What was the total population of each continent in 2010?
select a.continent, b.year, round(sum(b.population),2) as total_population
from countries a
inner join population_years b
on a.id = b.country_id
where b.population is not null and b.year = 2010
group by a.continent, b.year
order by total_population asc;
