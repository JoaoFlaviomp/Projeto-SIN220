-- Criação do Banco de Dados.

DROP DATABASE IF EXISTS covid_dados;

CREATE DATABASE IF NOT EXISTS covid_dados;

-- Criaçao das tabelas.

CREATE TABLE IF NOT EXISTS covid_dados.local(
	
	`location` VARCHAR(150) NOT NULL,
    `iso_code` VARCHAR(150) NOT NULL,
    `continent` VARCHAR(150),
    PRIMARY KEY (iso_code)
);

CREATE TABLE IF NOT EXISTS covid_dados.VACCINATIONS(

    `id` INT NOT NULL AUTO_INCREMENT,
    `iso_code` VARCHAR(150) NOT NULL,
	`date` DATE,
    `total_vaccinations` DOUBLE,
    `people_vaccinated` DOUBLE,
    `people_fully_vaccinated` DOUBLE,
    `new_vaccinations` DOUBLE,
    `new_vaccinations_smoothed` DOUBLE,
    `total_vaccinations_per_hundred` DOUBLE,
    `people_fully_vaccinated_per_hundred` DOUBLE,
    `new_vaccinations_smoothed_per_million` DOUBLE,
    `new_people_vaccinated_smoothed` DOUBLE,
    `new_people_vaccinated_smoothed_per_hundred` DOUBLE,
    `total_boosters` DOUBLE,
    `total_boosters_per_hundred` DOUBLE,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS covid_dados.CASES_COVID(

    `id` INT NOT NULL AUTO_INCREMENT,
    `date` DATE,
    `iso_code` VARCHAR(150) NOT NULL,
    `total_cases` DOUBLE,
    `new_cases` DOUBLE,
    `new_cases_smoothed` DOUBLE,
    `total_cases_per_milion` DOUBLE,
    `new_cases_per_milion` DOUBLE,
    `new_cases_smoothed_per_milion` DOUBLE,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS covid_dados.RATES(

    `id` INT NOT NULL AUTO_INCREMENT,
    `iso_code` VARCHAR(150) NOT NULL,
	`date` DATE,
    `reproduction_rate` DOUBLE,
    `positive_rate` DOUBLE,
    `cardiovasc_death_rate` DOUBLE,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS covid_dados.ICU(

    `id` INT NOT NULL AUTO_INCREMENT,
    `iso_code` VARCHAR(150) NOT NULL,
	`date` DATE,
    `icu_patients` DOUBLE,
    `icu_patients_per_million` DOUBLE,
    `weekly_icu_admissions` VARCHAR(150),
    `weekly_icu_admissions_per_million` VARCHAR(150),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS covid_dados.HOSPITAL(

    `id` INT NOT NULL AUTO_INCREMENT,
    `iso_code` VARCHAR(150) NOT NULL,    
	`date` DATE,
    `hosp_patients` VARCHAR(150),
    `hosp_patients_per_million` VARCHAR(150),
    `weekly_hosp_admissions` VARCHAR(150),
    `weekly_hosp_admissions_per_million` VARCHAR(150),
    `hospital_beds_per_thousand` DOUBLE,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS covid_dados.TESTS(

    `id` INT NOT NULL AUTO_INCREMENT,
    `iso_code` VARCHAR(150) NOT NULL,
	`date` DATE,
    `new_tests` DOUBLE,
    `total_tests` DOUBLE,
    `total_tests_per_thousand` DOUBLE,
    `new_tests_per_thousand` DOUBLE,
    `new_tests_smoothed` DOUBLE,
    `new_tests_smoothed_per_thousand` DOUBLE,
    `tests_per_case` DOUBLE,
    `tests_units` VARCHAR(150),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS covid_dados.STRINGENCY(

    `id` INT NOT NULL AUTO_INCREMENT,
    `iso_code` VARCHAR(150) NOT NULL,	
    `date` DATE,
    `stringency_index` DOUBLE,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS covid_dados.POPULATION(

    `id` INT NOT NULL AUTO_INCREMENT,
    `iso_code` VARCHAR(150) NOT NULL,
	`date` DATE,
    `population` DOUBLE,
    `population_density` DOUBLE,
    `median_age` DOUBLE,
    `aged_65_older` DOUBLE,
    `aged_70_older` DOUBLE,
    `life_expectancy` DOUBLE,
	`diabetes_prevalence` DOUBLE,
    `female_smokers` DOUBLE,
    `male_smokers` DOUBLE,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS covid_dados.ECONOMY(

    `id` INT NOT NULL AUTO_INCREMENT,
    `iso_code` VARCHAR(150) NOT NULL,
	`date` DATE,
    `gdp_per_capita` DOUBLE,
    `extreme_poverty` DOUBLE,
    `human_development_index` DOUBLE,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS covid_dados.SANITATION(

    `id` INT NOT NULL AUTO_INCREMENT,
    `iso_code` VARCHAR(150) NOT NULL,
    `date` DATE,
    `handwashing_facilities` DOUBLE,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS covid_dados.MORTALITY(

    `id` INT NOT NULL AUTO_INCREMENT,
    `iso_code` VARCHAR(150) NOT NULL,
    `date` DATE,
    `excess_mortality` DOUBLE,
    `excess_mortality_cumulative` DOUBLE,
    `excess_mortality_cumulative_absolute` DOUBLE,
    `excess_mortality_cumulative_per_million` DOUBLE,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS covid_dados.DEATHS(

    `id` INT NOT NULL AUTO_INCREMENT,
    `iso_code` VARCHAR(150) NOT NULL,
    `date` DATE,
    `total_deaths` DOUBLE,
    `new_deaths` DOUBLE,
    `new_deaths_smoothed` DOUBLE,
    `total_deaths_per_million` DOUBLE,
    `new_deaths_per_million` DOUBLE,
    `new_deaths_smoothed_per_million` DOUBLE,
    PRIMARY KEY (id)
);

-- CRIAÇÃO DOS RELACIONAMENTOS

ALTER TABLE covid_dados.cases_covid
	ADD FOREIGN KEY (iso_code) REFERENCES local (iso_code);
 
 ALTER TABLE covid_dados.economy
	ADD FOREIGN KEY (iso_code) REFERENCES local (iso_code);
    
ALTER TABLE covid_dados.population
	ADD FOREIGN KEY (iso_code) REFERENCES local (iso_code);
    
ALTER TABLE covid_dados.hospital
	ADD FOREIGN KEY (iso_code) REFERENCES local (iso_code);

ALTER TABLE covid_dados.icu
	ADD FOREIGN KEY (iso_code) REFERENCES local (iso_code);
    
ALTER TABLE covid_dados.mortality
	ADD FOREIGN KEY (iso_code) REFERENCES local (iso_code);
    
ALTER TABLE covid_dados.rates
	ADD FOREIGN KEY (iso_code) REFERENCES local (iso_code);
    
ALTER TABLE covid_dados.sanitation
	ADD FOREIGN KEY (iso_code) REFERENCES local (iso_code);

ALTER TABLE covid_dados.stringency
	ADD FOREIGN KEY (iso_code) REFERENCES local (iso_code);
    
ALTER TABLE covid_dados.tests
	ADD FOREIGN KEY (iso_code) REFERENCES local (iso_code);

ALTER TABLE covid_dados.vaccinations
	ADD FOREIGN KEY (iso_code) REFERENCES local (iso_code);

ALTER TABLE covid_dados.deaths
	ADD FOREIGN KEY (iso_code) REFERENCES local (iso_code);
    
