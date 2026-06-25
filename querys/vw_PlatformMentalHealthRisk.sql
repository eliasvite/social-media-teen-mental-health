CREATE VIEW vw_PlatformMentalHealthRisk AS
/**
 * View Name: vw_PlatformMentalHealthRisk
 * Description: Calculates aggregated psychological risk metrics across different social media platforms.
 */
SELECT 
    p.platform_usage AS Platform,
    COUNT(f.id_record) AS TotalUsers,
    ROUND(AVG(f.daily_social_media_hours), 2) AS AvgDailyHours,
    ROUND(AVG(CAST(f.anxiety_level AS FLOAT)), 2) AS AvgAnxietyLevel,
    ROUND(AVG(CAST(f.stress_level AS FLOAT)), 2) AS AvgStressLevel,
    ROUND(AVG(CAST(f.addiction_level AS FLOAT)), 2) AS AvgAddictionLevel
FROM [TeenMentalHealthDB].[dbo].[Fact_Mental_Health_Impact] f
JOIN Dim_Platform p ON f.id_platform = p.id_platform
GROUP BY p.platform_usage;
GO