/*
what are the 5 most in-demand skills for the role Data Analyst in the job market?
*/

--CTE Version:

with top_skills_job as(
select 
    skill_id,
    count(job_postings_fact.job_id) as skill_count
from 
    job_postings_fact    
inner JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
WHERE 
    job_title_short = 'Data Analyst'
group by
     skill_id
)
select top_skills_job.*,skills
from skills_dim
inner JOIN top_skills_job on skills_dim.skill_id = top_skills_job.skill_id
order by skill_count desc
LIMIT 5;


--simple version:

SELECT
    skills as skill_name,
    count(job_postings_fact.job_id) as skill_count
FROM
    job_postings_fact
inner JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
inner JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    skills
ORDER BY
    skill_count DESC
LIMIT 5;