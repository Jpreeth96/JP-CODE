/* 
Q: What are the top paying analyst jobs?
- Identify the top 20 highest paying Data Analyst roles that are available in India and Australia.
- Focuses on job posting with specified salaries ( NO NULLS )
- Why? Highlight the top paying opportunities for Data Analysts, offering insights into salary, location, Qualification requirement etc
*/



SELECT
    job_id,
    job_title,
    job_no_degree_mention,
    job_location,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN
    company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    (job_location LIKE '%India%' OR job_location LIKE '%Australia%') AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 20;

