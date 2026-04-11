
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns


# 10_top_paying_jobs_skill

df = pd.read_csv('Results_Plots/10_top_paying_jobs_skill.csv')

df.info()

plt.figure(figsize=(12, 6))
sns.barplot(x='salary_year_avg', y='job_title', data=df)
plt.title('Top 10 Highest Paying Data Analyst Jobs', fontsize=16)
plt.xlabel('Average Yearly Salary ($)', fontsize=12)
plt.ylabel('')
plt.tight_layout()
plt.show()


# Top_paying_jobs_skills

df = pd.read_csv('Results_Plots/Top_paying_jobs_skills.csv')

skill_counts = df['skills'].value_counts().head(10)
print(skill_counts)

plt.figure(figsize=(10, 6))
sns.barplot(x=skill_counts.values, y=skill_counts.index)
plt.title('Skill Count for Top 10 Paying Data Analyst Jobs', fontsize=16)
plt.xlabel('Frequency', fontsize=12)
plt.ylabel('') # We leave this empty to keep it clean
plt.tight_layout()
plt.show()


# Most_in_demand_skills

df = pd.read_csv('Results_Plots/Most_in_demand_skills.csv')
df

# Top_skills_salary

df = pd.read_csv('Results_Plots/Top_skills_salary.csv')
df

# Most_optimal_skills

df = pd.read_csv('Results_Plots/Most_optimal_skills.csv')
df