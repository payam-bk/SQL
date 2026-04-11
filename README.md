# Introduction
Explore the data job market! This project looks at Data Analyst roles to find:

The highest-paying jobs.

The most popular skills.

The best skills for both high demand and high pay.

🔍 View the code: You can find the SQL queries in the [project_sql folder](/SQL_Project/)
# Goals
The questions I wanted to answer through my SQL queries were:
What are the top-paying data analyst jobs?
What skills are required for these top-paying jobs?
What skills are most in demand for data analysts?
Which skills are associated with higher salaries?
What are the most optimal skills to learn?
# Tools I Used
For this project, I used these key tools to analyze the data job market:

**SQL:** The main language I used to query data and find insights.

**PostgreSQL:** The database system I chose to manage the job posting data.

**Visual Studio Code:** My primary editor for writing and running SQL queries.

**Git & GitHub:** Used for saving my work, tracking changes, and sharing my scripts.
# The Analysis
Each query in this project answers a specific question about the job market. Here is my approach:

1. Top Paying Data Analyst Jobs
To find the highest-paying roles, I filtered for Data Analyst positions with a yearly salary. 

```sql
SELECT 
    job_id, 
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM 
    job_postings_fact 
LEFT JOIN company_dim On job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND 
    job_location='Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;
```
# What I Learned
# Conclusions
