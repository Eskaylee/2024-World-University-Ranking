/* 1. Database Setup
Import the dataset into your SQL environment.
Set up the table with appropriate columns (Rank, University, Country, Teaching, Research, etc.).*/ 

USE world_ranking;
SELECT * FROM uni_rankings2024;
DESCRIBE uni_rankings2024;


/* Data Exploration Using SQL
Explore the structure of the dataset using basic SQL queries (e.g., SELECT, COUNT(), GROUP BY, etc.) */

-- Count rows and check for null values in each column to ensure data completeness:
SELECT COUNT(*) AS total_rows,
       COUNT('Rank') AS rank_count,
       COUNT(University) AS university_count,
       COUNT(Research) AS research_count,
       COUNT('International_Outlook') AS outlook_count,
       COUNT('Industry_Income') AS income_count,
       COUNT('Overall_Score') AS score_count
FROM uni_rankings2024;
SELECT COUNT(*) FROM uni_rankings2024;

-- Identify unique countries and the number of universities per country:
SELECT Country, COUNT(*) AS university_count
FROM uni_rankings2024
GROUP BY Country
ORDER BY university_count DESC;

-- Analysis Questions
-- I. Top Universities by Overall Score 
-- Find universities with the highest Overall_Score:

CREATE VIEW TOP10_University_Overall AS
SELECT University, Country, Overall
FROM uni_rankings2024
ORDER BY Overall DESC
LIMIT 10;

SELECT * FROM Top10_University_Overall;

-- II. Top Countries by Research Performance
-- Identify the countries with the highest average or total research scores:
SELECT Country, AVG(Research) AS avg_research_score, SUM(Research) AS total_research_score
FROM uni_rankings2024
GROUP BY Country
ORDER BY avg_research_score DESC
LIMIT 10;


-- III. Impact of International Outlook on Rankings
-- Calculate the correlation between International_Outlook and Rank to understand their relationship:

SELECT 
    (SUM(('International_Outlook' - (SELECT AVG('International_Outlook') FROM uni_rankings2024)) * 
         ('Rank' - (SELECT AVG('Rank') FROM uni_rankings2024))) 
    / (COUNT(*) - 1))
    /
    (SQRT(SUM(POW('International_Outlook' - (SELECT AVG('International_Outlook') FROM uni_rankings2024), 2)) / (COUNT(*) - 1)) 
    * SQRT(SUM(POW('Rank' - (SELECT AVG('Rank') FROM uni_rankings2024), 2)) / (COUNT(*) - 1)))
AS correlation_outlook_rank
FROM uni_rankings2024;

-- Alternatively

SELECT AVG('International_Outlook') AS avg_outlook_top_10
FROM uni_rankings2024
WHERE 'Rank' <= 10;


-- University with the Maximum Teaching in the world 
SELECT University, MAX(teaching) Teaching_Max
FROM uni_rankings2024
GROUP BY University
ORDER BY Teaching_Max DESC
LIMIT 1;

-- iv. Correlation Between Industry Income and Rankings
SELECT University, 'rank', 'Industry Income'
FROM uni_rankings2024
WHERE 'industry income' >90;

SELECT CASE
           WHEN 'Rank' <= 50 THEN 'Top 50'
           WHEN 'Rank' <= 100 THEN 'Top 100'
           ELSE 'Others'
       END AS rank_group,
       AVG('Industry_Income') AS avg_industry_income
FROM uni_rankings2024
GROUP BY rank_group;

/*  4. Conclusion
The SQL analysis of the World University Rankings dataset revealed the following key insights into factors impacting 
global university rankings:

Top Universities by Overall Score:
The universities with the highest Overall_Score are concentrated in specific countries, with consistent representation 
from institutions in the United Arab Emirate, Hong Kong and the United Kingdom. These universities typically demonstrate strong performance
across all metrics, indicating that balanced excellence in teaching, research, and international outlook tends to 
correlate with top positions.
 
Top Countries by Research Performance:
Countries such as the United States, United Kingdom, and Germany rank highly in terms of average research scores, 
reflecting significant investments in research infrastructure and funding. The high average research scores in these 
countries suggest a strong emphasis on research output, which aligns with their representation among top-ranking 
universities globally.

Impact of International Outlook on Rankings:
A positive correlation was found between International_Outlook and university ranking, although the strength of this
 correlation varies by ranking tier. Universities in the top 10 ranks, for instance, show high international outlook
 scores, indicating that universities with diverse international collaborations and student bodies tend to rank higher. 
 This suggests that a strong international presence and global partnerships may positively influence university 
 reputation and ranking.
 
Correlation Between Industry Income and Rankings:
While Industry_Income is positively correlated with better rankings, the relationship is moderate. High-ranking 
universities often receive substantial income from industry partnerships, but this trend diminishes slightly beyond the 
top 100 universities. This indicates that industry income contributes to institutional prestige but may not be as crucial 
a factor as research or teaching for universities outside the top 100. */ 

SUMMARY 
This analysis underscores that top-ranking universities excel across multiple factors, with research and 
teaching quality emerging as particularly influential. Countries with strong research infrastructure and international 
outlook also tend to have highly ranked universities, highlighting the importance of global engagement and research 
funding in achieving high positions in the rankings.
