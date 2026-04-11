/*

what are the 5 most optimal skills based on salary and demand and salary?

*/

--version 1
-- It is very organized and easy to read. It's the best choice for complex projects
--  where we want to keep different calculations separate.

with skills_demand as(
    SELECT
        skills_dim.skill_id,
        skills,
        count(job_postings_fact.job_id) as skill_count
    FROM
        job_postings_fact
    inner JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    inner JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' and salary_year_avg is not null
    GROUP BY
        skills,skills_dim.skill_id
) ,  average_salary as (
    SELECT 
        skills_dim.skill_id,
        skills ,
        count(job_postings_fact.job_id) AS job_count,
        ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS salary_year_avg

    FROM
        job_postings_fact
    inner join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id 
    inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_title_short = 'Data Analyst' and salary_year_avg is not null 
    GROUP BY skills_dim.skill_id, skills
    
)

SELECT
     skills_demand.skill_id,
     skills_demand.skills,
     skill_count,
     salary_year_avg
FROM
    skills_demand
inner join average_salary on skills_demand.skill_id = average_salary.skill_id
WHERE
   skill_count > 10
ORDER BY
    skill_count desc ,salary_year_avg desc
LIMIT 5;



--version 2
-- It shows the transition from a structured approach to a more direct one. 
-- It is good for showing how you filtered the data before doing the final math

with skills_demand as(
    SELECT
        skills_dim.skill_id,
        skills,
        count(job_postings_fact.job_id) as skill_count
    FROM
        job_postings_fact
    inner JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    inner JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' and salary_year_avg is not null
    GROUP BY
        skills,skills_dim.skill_id
) 

    SELECT 
        skills_dim.skill_id,
        skills ,
        count(job_postings_fact.job_id) AS job_count,
        ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS salary_year_avg

    FROM
        job_postings_fact
    inner join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id 
    inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_title_short = 'Data Analyst' and salary_year_avg is not null 
    GROUP BY skills_dim.skill_id, skills
    ORDER BY job_count desc ,salary_year_avg desc
    LIMIT 5





--version 3
-- It does all the math (counting and averaging) in one single block. 
-- It is the best choice for everyday tasks because the code is short, 
-- fast, and very clean.


SELECT 
    skills_dim.skill_id,
    skills,
    COUNT(job_postings_fact.job_id) AS job_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS salary_year_avg
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id 
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst' 
    AND salary_year_avg IS NOT NULL 
GROUP BY 
    skills_dim.skill_id, 
    skills
ORDER BY 
    job_count DESC, 
    salary_year_avg DESC
LIMIT 5;


/*

[
  {
    "skill_id": 0,
    "skills": "sql",
    "skill_count": "3083",
    "salary_year_avg": "96435"
  },
  {
    "skill_id": 181,
    "skills": "excel",
    "skill_count": "2143",
    "salary_year_avg": "86419"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "skill_count": "1840",
    "salary_year_avg": "101512"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "skill_count": "1659",
    "salary_year_avg": "97978"
  },
  {
    "skill_id": 5,
    "skills": "r",
    "skill_count": "1073",
    "salary_year_avg": "98708"
  }
]

SQL is the King of Demand: It is the most requested skill by far, appearing in 
over 3,000 jobs. If you want to be a Data Analyst, you must know SQL.

Python Pays the Most: Among the top 5 most popular skills, Python has the highest
average salary (over $101,000).

Excel is Essential but Pays Less: Many jobs ask for Excel, but it has the lowest
average salary on this list. It is a basic tool, not a "high-paying" specialty.

Tableau and R : are very popular for showing data.
Both offer good salaries, almost reaching $100,000.

R : is clearly in the top 5 for demand, appearing in more than 1,000 jobs.

*/