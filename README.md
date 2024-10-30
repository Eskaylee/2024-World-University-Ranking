# 2024-World-University-Ranking
# Project Overview
This project analyzes the World University Rankings dataset to uncover insights into factors impacting global university rankings. Using SQL, we explore data trends, examine country and university performances, and investigate correlations between ranking metrics such as research output, international outlook, and industry income.

# Objectives
The main objectives of this analysis are to:

Identify top universities by overall score.
Determine which countries excel in research performance.
Analyze the impact of international outlook on university rankings.
Examine the correlation between industry income and rankings.
Dataset
Name: World University Rankings (2024)
Columns:
Rank: University rank
University: University name
Country: Country of the university
Teaching: Teaching score
Research: Research score
International_Outlook: International outlook score
Industry_Income: Industry income score
Overall_Score: Overall ranking score
SQL Analysis Steps
Database Setup: Import the dataset into the SQL environment and create a table with the appropriate columns.

# Data Exploration:

View the structure and contents of the dataset.
Count rows and check for null values in each column.
Identify unique countries and their number of universities in the rankings.

# Key Analysis Questions:

Top Universities by Overall Score: Find universities with the highest overall scores.
Top Countries by Research Performance: Calculate the average research score by country to identify leading nations.
Impact of International Outlook on Rankings: Assess correlation between international outlook and rank.
Correlation Between Industry Income and Rankings: Determine if higher industry income correlates with better rankings.


# Results and Insights
# Top Universities: 
Leading institutions are mostly located in the U.A.E,Hong Kong, Switzerland and U.K., where balanced excellence across teaching, research, and international outlook is evident.

# Top Research Countries: 
The U.S., U.K., and Germany lead in research performance, likely due to robust research infrastructure and funding.

# International Outlook: 
Universities with higher international outlook scores tend to have better rankings, indicating a strong global presence is beneficial.
Industry Income Correlation: While high industry income is associated with better rankings, it’s more impactful in top-ranking universities and less so beyond the top 100.

# Requirements
# To run this project, you'll need:
SQL-compatible database software (e.g., MySQL, PostgreSQL).
The World University Rankings dataset (included in this repository).

# Usage
Load the Dataset: Import the dataset into your SQL database.
Run the Queries: Use the provided SQL queries to conduct each part of the analysis.
Review Insights: Examine query outputs to derive insights as outlined in the project steps.

# File Structure
uni_rankings2024.csv: Dataset file for World University Rankings.
analysis_queries.sql: SQL file containing all analysis queries for easy execution.
README.md: Project overview and usage information.
