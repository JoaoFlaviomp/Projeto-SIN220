-- CARGA DO BANCO DE DADOS

INSERT INTO covid_dados.local(iso_code, location, continent) -- País
   SELECT distinct iso_code, location, continent
     FROM projetosin220.owid_covid;

INSERT INTO covid_dados.cases_covid(date, iso_code, total_cases, new_cases, new_cases_smoothed, total_cases_per_milion, new_cases_per_milion, new_cases_smoothed_per_milion)
	SELECT date, iso_code, total_cases, new_cases, new_cases_smoothed, total_cases_per_million, new_cases_per_million, new_cases_smoothed_per_million
		FROM projetosin220.owid_covid; -- Casos
	
INSERT INTO covid_dados.economy(iso_code, date, gdp_per_capita, extreme_poverty, human_development_index)
	SELECT iso_code, date, gdp_per_capita, extreme_poverty, human_development_index
		FROM projetosin220.owid_covid; -- Economia do Pais

INSERT INTO covid_dados.population(iso_code, date, population, population_density, median_age, aged_65_older, aged_70_older, life_expectancy, diabetes_prevalence, female_smokers, male_smokers)
	SELECT iso_code, date, population, population_density, median_age, aged_65_older, aged_70_older, life_expectancy, diabetes_prevalence, female_smokers, male_smokers
		FROM projetosin220.owid_covid; -- População
        
INSERT INTO covid_dados.hospital(iso_code, date, hosp_patients, hosp_patients_per_million, weekly_hosp_admissions, weekly_hosp_admissions_per_million, hospital_beds_per_thousand)
	SELECT iso_code, date, hosp_patients, hosp_patients_per_million, weekly_hosp_admissions, weekly_hosp_admissions_per_million, hospital_beds_per_thousand
		FROM projetosin220.owid_covid; -- Hospital
        
INSERT INTO covid_dados.icu(iso_code, date, icu_patients, icu_patients_per_million, weekly_icu_admissions, weekly_icu_admissions_per_million)
	SELECT iso_code, date, icu_patients, icu_patients_per_million, weekly_icu_admissions, weekly_icu_admissions_per_million
		FROM projetosin220.owid_covid; --  Icu
        
INSERT INTO covid_dados.mortality(iso_code, date, excess_mortality, excess_mortality_cumulative, excess_mortality_cumulative_absolute, excess_mortality_cumulative_per_million)
	SELECT iso_code, date, excess_mortality, excess_mortality_cumulative, excess_mortality_cumulative_absolute, excess_mortality_cumulative_per_million
		FROM projetosin220.owid_covid; -- Mortalidade

INSERT INTO covid_dados.rates(iso_code, date, reproduction_rate, positive_rate, cardiovasc_death_rate)
	SELECT iso_code, date, reproduction_rate, positive_rate, cardiovasc_death_rate
		FROM projetosin220.owid_covid; -- Taxas

INSERT INTO covid_dados.sanitation(iso_code, date, handwashing_facilities)
	SELECT iso_code, date, handwashing_facilities
		FROM projetosin220.owid_covid; -- Saneamento básico

INSERT INTO covid_dados.stringency(iso_code, date, stringency_index)
	SELECT iso_code, date, stringency_index
		FROM projetosin220.owid_covid; -- Rigor

INSERT INTO covid_dados.tests(iso_code, date, new_tests, total_tests, total_tests_per_thousand, new_tests_per_thousand, new_tests_smoothed, new_tests_smoothed_per_thousand, tests_per_case, tests_units)
	SELECT iso_code, date, new_tests, total_tests, total_tests_per_thousand, new_tests_per_thousand, new_tests_smoothed, new_tests_smoothed_per_thousand, tests_per_case, tests_units
		FROM projetosin220.owid_covid; -- Testes

INSERT INTO covid_dados.vaccinations(iso_code,date,total_vaccinations,people_vaccinated,people_fully_vaccinated,new_vaccinations,new_vaccinations_smoothed,total_vaccinations_per_hundred,people_fully_vaccinated_per_hundred,new_vaccinations_smoothed_per_million,new_people_vaccinated_smoothed,new_people_vaccinated_smoothed_per_hundred,total_boosters,total_boosters_per_hundred)
	SELECT iso_code,date,total_vaccinations,people_vaccinated,people_fully_vaccinated,new_vaccinations,new_vaccinations_smoothed,total_vaccinations_per_hundred,people_fully_vaccinated_per_hundred,new_vaccinations_smoothed_per_million,new_people_vaccinated_smoothed,new_people_vaccinated_smoothed_per_hundred,total_boosters,total_boosters_per_hundred
		FROM projetosin220.owid_covid; -- Vacinação

INSERT INTO covid_dados.deaths(iso_code, date, total_deaths,new_deaths,new_deaths_smoothed,total_deaths_per_million,new_deaths_per_million,new_deaths_smoothed_per_million)
	SELECT iso_code, date, total_deaths, new_deaths, new_deaths_smoothed, total_deaths_per_million,new_deaths_per_million, new_deaths_smoothed_per_million
		FROM projetosin220.owid_covid; -- Mortes