-- let's see job titles with "data" having ratings above 4.0
SELECT 
	`Position`,
    `Job Title`,
    `Company Name`,
    `Location`,
    REPLACE(REPLACE(REPLACE(Salary, '$', ''), '(Glassdoor est.)', ''),'(Employer est.)', '') AS "Filtered Salary", -- removing the currency sign from their salaries
    `Company Rating`
FROM data_science_jobs
WHERE (`Job Title` LIKE "Data%" OR `Job Title` LIKE "%Data%") AND `Company Rating` > 4.0;



-- jobs in data science with duration of at least 30 days on the database
SELECT 
	Position,
    `Job Title`,
	REPLACE(REPLACE(REPLACE(Salary, '$', ''), '(Glassdoor est.)', ''),'(Employer est.)', '') AS Salary,
    Date,
    `Company Rating`
FROM data_science_jobs
WHERE Date = "30d+";



-- top 20 companies based on number of workers
SELECT DISTINCT `Company Name`, COUNT(Position) AS "No. of Workers" 
FROM projects.data_science_jobs
GROUP BY `Company Name`
ORDER BY COUNT(Position) DESC
LIMIT 20;


-- Querying jobs based on location
SELECT DISTINCT
	Location,
	COUNT(Position) "No. of workers"
FROM data_science_jobs
GROUP BY Location
ORDER BY COUNT(Position) DESC;

 
-- choosing jobs with salary above 100k
SELECT 
	Position,
    `Job Title`,
	REPLACE(REPLACE(REPLACE(Salary, '$', ''), '(Glassdoor est.)', ''),'(Employer est.)', '') AS Salary, -- filtering unwanted characters
    Location,
    Date,
    `Company Rating`
FROM data_science_jobs
WHERE REPLACE(REPLACE(REPLACE(Salary, '$', ''), '(Glassdoor est.)', ''),'(Employer est.)', '') > 100;