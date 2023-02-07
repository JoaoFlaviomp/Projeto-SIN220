-- Consultas

-- Questão 1: 
 
SELECT DISTINCT COUNT(*) AS 'Países no banco de dados'
FROM local
WHERE iso_code NOT LIKE ('OWID%');

-- Questão 2: 

SELECT total_cases
FROM cases_covid
WHERE iso_code = "OWID_WRL" AND DATE = "2022-07-01";

-- Questão 3: 

SELECT DISTINCT L.location AS 'Países', L.continent AS 'Continente'
FROM local AS L JOIN  cases_covid AS CC ON L.iso_code = CC.iso_code
WHERE date LIKE '2022-07-%' AND L.iso_code NOT LIKE ('OWID%')
ORDER BY CC.total_cases DESC
LIMIT 10; 

-- Questão 4: Liste os 10 países com maior e os 10 com menor expectativa de vida.

SELECT Maiores, Menores
FROM (
    SELECT row_number() OVER (ORDER BY P.life_expectancy DESC) AS id, L.location AS Maiores
    FROM local AS L JOIN population AS P ON L.iso_code = P.iso_code
    WHERE L.iso_code NOT LIKE ('OWID%')
    GROUP BY L.location
    ORDER BY P.life_expectancy DESC
        LIMIT 10
    ) A
      JOIN 
      (
    SELECT row_number() OVER (ORDER BY P.life_expectancy) AS id, L.location AS Menores
    FROM local AS L JOIN population AS P ON L.iso_code = P.iso_code
    WHERE L.iso_code NOT LIKE ('OWID%')
    GROUP BY L.location
    ORDER BY P.life_expectancy
        LIMIT 10
     ) B ON A.id = B.id;
      
-- Questão 5: 

SELECT L.continent AS 'Continente', CC.total_cases AS 'Total de Casos'
FROM local AS L JOIN cases_covid AS CC ON L.iso_code = CC.iso_code
WHERE date LIKE "%2022-10-31" AND L.continent <> ''
GROUP BY L.continent;

-- Questão 6: 

SELECT L.location AS 'Países da Europa', 
     people_fully_vaccinated AS 'Totalmente Vacinadas', 
       people_fully_vaccinated_per_hundred AS 'Totalmente Vacinadas por 100'
FROM local L JOIN vaccinations v ON L.iso_code = V.iso_code
WHERE V.date = ('2022-10-31') AND L.continent = 'Europe'
ORDER BY people_fully_vaccinated_per_hundred DESC;

-- Questão 7: 

SELECT location AS 'Países', stringency_index AS 'Índice de Rigor', new_cases_per_milion AS 'Novos Casos por Milhão'
FROM local L JOIN stringency S ON L.iso_code = S.iso_code
             JOIN cases_covid C ON L.iso_code = C.iso_code
WHERE C.date = ('2022-07-31') AND S.date = ('2022-07-31') AND L.iso_code NOT LIKE ('OWID%');


-- Questão 8: 
 
SELECT DISTINCT L.location AS 'Países'
FROM local AS L JOIN icu AS I ON L.iso_code = I.iso_code
WHERE (I.icu_patients = 0) AND (date LIKE  '%2022-06-%') AND L.iso_code NOT LIKE ('OWID%');

-- Questão 9: 

SELECT date AS 'Data'
FROM cases_covid AS CC JOIN local AS L ON CC.iso_code = L.iso_code
WHERE L.iso_code = "BRA"
ORDER BY new_cases DESC
LIMIT 1;

-- Questão 10:

SELECT date AS 'Data'
FROM deaths AS D JOIN local L ON D.iso_code = L.iso_code
WHERE L.iso_code = "OWID_WRL"
ORDER BY total_deaths DESC
LIMIT 1;