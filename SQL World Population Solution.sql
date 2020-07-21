-- To find out the years covered in the dataset
SELECT DISTINCT year from population_years;


-- the largest population in Gabon country
select max(population)
from population_years
where country = 'Gabon';

-- the lowest 10 population countries in 2005
select country, min(population)
from population_years
group by country
order by 2
limit 10;

-- the countries with a population of over 100 million in the year 2010
select distinct country, population
from population_years
where population > 100 AND year = 2010
group by country
order by population;

-- the number of countries with islands in their name
select count(distinct country)
from population_years
where country like '%Islands%';

-- the difference in population between 2000 and 2010 in Indonesia
with table_1 as (
  select *
  from population_years
  where year = 2000 AND country = 'Indonesia'),
  table_2 as (
    select *
    from population_years
    where year = 2010 AND country = 'Indonesia')
select table_1.country as country, table_1.population as population_in_2000, table_2.population as population_in_2010, table_1.population - table_2.population as difference_population
from table_1
inner join table_2
on table_1.country = table_2.country;