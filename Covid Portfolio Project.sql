select * 
  from CovidDeaths$
  order by 3,4

  select * 
  from CovidVaccinations$
  order by 3,4

  --select data

  select location, date, total_cases, new_cases, total_deaths, population
  from CovidDeaths$
  order by 1,2

  --Looking at Total Cases vs Total Deaths

    select location, date, total_cases, total_deaths, 
	(total_deaths/total_cases)*100 as DeathPercentage
  from CovidDeaths$
  where location = 'India'
  order by 1,2

  --Looking Total Cases vs Population

   select location, date, population, total_cases, 
   (total_cases/population)*100 as PercentPopulationInfected
  from CovidDeaths$
  where location = 'India'
  order by 1,2
  
  --Looking at Countries with Highest Infection Rate 
   
   select location, population, MAX(total_cases) AS HighestInfectionCount,
   MAX((total_cases/population))*100 as PercentPopulationInfected
  from CovidDeaths$
  --where location = 'India'
  group by location,population
  order by PercentPopulationInfected desc

  --Showing Countries with Highest Deaths Count

  select location, MAX(cast(total_deaths AS int)) AS TotalDeathCount
  from CovidDeaths$
  where continent is not null
  group by location
  order by TotalDeathCount desc

  --Showing Continent with Highest Deaths Count

  
  select location, MAX(cast(total_deaths AS int)) AS TotalDeathCount
  from CovidDeaths$
  where continent is null
  group by location
  order by TotalDeathCount desc

  
  select date, sum(new_cases) as NewCases, sum(cast(new_deaths as int)) as NewDeaths,
  sum(cast(new_deaths as int))/sum(new_cases)*100 as DeathPercentage
  from CovidDeaths$
  where continent is not null
  group by date
  order by 1,2

   select sum(new_cases) as NewCases, sum(cast(new_deaths as int)) as NewDeaths,
  sum(cast(new_deaths as int))/sum(new_cases)*100 as DeathPercentage
  from CovidDeaths$
  where continent is not null
  order by 1,2

  -- Joins of two Table

  select * 
  from CovidDeaths$ join CovidVaccinations$
  on CovidDeaths$.location = CovidVaccinations$.location
  and CovidDeaths$.date = CovidVaccinations$.date


  select CovidDeaths$.continent, CovidDeaths$.location, CovidDeaths$.date, 
  CovidDeaths$.population, CovidVaccinations$.new_vaccinations
  from CovidDeaths$ join CovidVaccinations$
  on CovidDeaths$.location = CovidVaccinations$.location
  and CovidDeaths$.date = CovidVaccinations$.date
  where CovidDeaths$.continent is not null
  order by 2,3

   select CovidDeaths$.continent, CovidDeaths$.location, CovidDeaths$.date, 
  CovidDeaths$.population, CovidVaccinations$.new_vaccinations, sum(Convert(int,CovidVaccinations$.new_vaccinations)) 
  over (Partition by CovidDeaths$.location order by CovidDeaths$.location, CovidDeaths$.date) AS RollingPeopleVaccinated
  from CovidDeaths$ join CovidVaccinations$
  on CovidDeaths$.location = CovidVaccinations$.location
  and CovidDeaths$.date = CovidVaccinations$.date
  where CovidDeaths$.continent is not null
  order by 2,3


  --Using CTE

  With PopvsVac (continent, location, date, population, new_vaccinations, RollingPeopleVaccinated)
  AS
  (
  select CovidDeaths$.continent, CovidDeaths$.location, CovidDeaths$.date, 
  CovidDeaths$.population, CovidVaccinations$.new_vaccinations, sum(Convert(int,CovidVaccinations$.new_vaccinations)) 
  over (Partition by CovidDeaths$.location order by CovidDeaths$.location, CovidDeaths$.date) AS RollingPeopleVaccinated
  from CovidDeaths$ join CovidVaccinations$
  on CovidDeaths$.location = CovidVaccinations$.location
  and CovidDeaths$.date = CovidVaccinations$.date
  where CovidDeaths$.continent is not null
  )
  select *, (RollingPeopleVaccinated/population)*100 as PercentRollingPeopleVaccinated
  from PopvsVac


  --Temp Table

  drop table if exists #PercentPopulationVaccinated
  Create Table #PercentPopulationVaccinated
  (
  continent nvarchar(255),
  location nvarchar(255),
  date datetime,
  population numeric,
  new_vaccinations numeric,
  RollingPeopleVaccinated numeric
  )
  insert into #PercentPopulationVaccinated
  select CovidDeaths$.continent, CovidDeaths$.location, CovidDeaths$.date, 
  CovidDeaths$.population, CovidVaccinations$.new_vaccinations, sum(Convert(int,CovidVaccinations$.new_vaccinations)) 
  over (Partition by CovidDeaths$.location order by CovidDeaths$.location, CovidDeaths$.date) AS RollingPeopleVaccinated
  from CovidDeaths$ join CovidVaccinations$
  on CovidDeaths$.location = CovidVaccinations$.location
  and CovidDeaths$.date = CovidVaccinations$.date
  where CovidDeaths$.continent is not null

   select *, (RollingPeopleVaccinated/Population)*100 as PercentRollingPeopleVaccinated
  from #PercentPopulationVaccinated


  --create view to store data for later Vizualization 

  create view PrecentPopulationVaccinated as
   select CovidDeaths$.continent, CovidDeaths$.location, CovidDeaths$.date, 
  CovidDeaths$.population, CovidVaccinations$.new_vaccinations, sum(Convert(int,CovidVaccinations$.new_vaccinations)) 
  over (Partition by CovidDeaths$.location order by CovidDeaths$.location, CovidDeaths$.date) AS RollingPeopleVaccinated
  from CovidDeaths$ join CovidVaccinations$
  on CovidDeaths$.location = CovidVaccinations$.location
  and CovidDeaths$.date = CovidVaccinations$.date
  where CovidDeaths$.continent is not null
  --order by 2,3

  select *
  from PrecentPopulationVaccinated