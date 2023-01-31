SELECT *
FROM data_analyst_jobs;

--1. How many rows are in the data_analyst_jobs table?
--Answer: 1793

--2a. Write a query to look at the first 10 rows.
SELECT *
FROM data_analyst_jobs
LIMIT 10;
--2b. What company is associated with job posting on the 10th row?
--Answer:ExxonMobile

--3a. How many postings are in Tennessee?
SELECT COUNT(location)
FROM data_analyst_jobs
WHERE location = 'TN';
--Answer:21
--3b. How many are in Tennessee or Kentucky?
SELECT COUNT (location)
FROM data_analyst_jobs
WHERE location = 'TN'
OR location = 'KY';
--ANSWER: 27

--4. How many postings in Tennessee have a star rating above 4?
SELECT COUNT(location)
FROM data_analyst_jobs
WHERE location = 'TN'
AND star_rating > 4;
--ANSWER: 3

--5. How many postings in the dataset have a review count between 500 and 1000?
SELECT COUNT(review_count)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 and 1000;
--ANSWER: 151

--6. Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`. Which state shows the highest average rating?
SELECT location AS state,AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
GROUP BY location;
--ANSWER: NE 4.1999

--7. Select unique job titles from the data_analyst_jobs table. How many are there?
SELECT DISTINCT title
FROM data_analyst_jobs;
--ANSWER: 881

--8. How many unique job titles are there for California companies?
SELECT DISTINCT title, location
FROM data_analyst_jobs
WHERE location = 'CA';
--ANSWER: 230

--9. Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?
SELECT AVG(star_rating), company, location
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY DISTINCT company, location;
--ANSWER: 80

--10. Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?
SELECT AVG(star_rating), company, location
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY DISTINCT company, location, star_rating
ORDER BY star_rating DESC;
--ANSWER: 4.199, AMERICAN EXPRESSS, AZ

--11.	Find all the job titles that contain the word ‘Analyst’. How many different job titles are there? 
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%';
--ANSWER: 774

--12.	How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?
SELECT DISTINCT title
FROM data_analyst_jobs
WHERE title NOT IN ('%Analyst%','%Analytics%');

--**BONUS:**You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks. Disregard any postings where the domain is NULL. Order your results so that the domain with the greatest number of `hard to fill` jobs is at the top. Which three industries are in the top 4 on this list? How many jobs have been listed for more than 3 weeks for each of the top 4?
SELECT COUNT(title), domain
FROM data_analyst_jobs
WHERE skill = 'SQL'
AND domain <> 'null'
AND days_since_posting >= 21
GROUP BY domain
ORDER BY COUNT(title) DESC;
--ANSWER: 1. Consulting and Business Services (5), Consumer Goods and Services(2), Computers and Electronics(1).
