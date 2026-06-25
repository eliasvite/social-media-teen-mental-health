USE [TeenMentalHealthDB];
GO

CREATE OR ALTER VIEW vw_GlobalKPIs AS
/**
  - View Name: vw_GlobalKPIs
  - Description: Summary of high-level global metrics for the main executive dashboard card component.
*/
SELECT 
    COUNT(id_record) AS TotalTeensEvaluated,
    ROUND(AVG(daily_social_media_hours), 2) AS GlobalAvgDailyHours,
    ROUND(AVG(sleep_hours), 2) AS GlobalAvgSleepHours,
    ROUND(AVG(CAST(anxiety_level AS FLOAT)), 2) AS GlobalAvgAnxiety,
    ROUND(AVG(CAST(stress_level AS FLOAT)), 2) AS GlobalAvgStress,
    ROUND(AVG(CAST(addiction_level AS FLOAT)), 2) AS GlobalAvgAddiction
FROM [TeenMentalHealthDB].[dbo].[Fact_Mental_Health_Impact];
GO