/*
what are the top 5 skills that have the highest average salary for Data Analyst positions?
*/


SELECT 
    skills_dim.skill_id,
    skills as skill_name,
    count(job_postings_fact.job_id) AS job_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS salary_year_avg

FROM
    job_postings_fact
inner join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id 
inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst' and salary_year_avg is not null
GROUP BY skills_dim.skill_id, skills
having count(job_postings_fact.job_id) > 10
order by salary_year_avg desc
LIMIT 5;

/*
 we set count(job_postings_fact.job_id) > 10 to make sure that the average salary
 is based on a reasonable number of job postings, which can help to ensure that the results 
 are more reliable and less likely to be skewed by outliers or small sample sizes. 


[
  {
    "skill_id": 98,
    "skill_name": "kafka",
    "job_count": "40",
    "salary_year_avg": "129999"
  },
  {
    "skill_id": 101,
    "skill_name": "pytorch",
    "job_count": "20",
    "salary_year_avg": "125226"
  },
  {
    "skill_id": 31,
    "skill_name": "perl",
    "job_count": "20",
    "salary_year_avg": "124686"
  },
  {
    "skill_id": 99,
    "skill_name": "tensorflow",
    "job_count": "24",
    "salary_year_avg": "120647"
  },
  {
    "skill_id": 63,
    "skill_name": "cassandra",
    "job_count": "11",
    "salary_year_avg": "118407"
  }
]

Big Data & Real-time Tools: Kafka and Cassandra are at the top. This shows that 
knowing how to handle large, fast-moving data leads to higher pay.

Machine Learning (ML): PyTorch and TensorFlow are both on the list. 
High salaries are tied to analysts who can build and use AI models.


Reliable Averages: Since Kafka appears in 40 job postings, the $130k average salary
 is a strong and dependable indicator of its true market value.

Specialized Languages: Perl is an older language, but its high salary suggests 
it is still needed for specific, well-paying system

 */