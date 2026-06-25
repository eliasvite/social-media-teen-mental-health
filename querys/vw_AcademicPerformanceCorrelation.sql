CREATE VIEW vw_AcademicPerformanceCorrelation AS
/**
 * View Name: vw_AcademicPerformanceCorrelation
 * Description: Analyzes the relationship between school performance, digital addiction, and screen time.
 */
SELECT 
    t.academic_performance AS AcademicPerformance,
    COUNT(f.id_record) AS TotalStudents,
    ROUND(AVG(f.daily_social_media_hours), 2) AS AvgDailyHours,
    ROUND(AVG(CAST(f.addiction_level AS FLOAT)), 2) AS AvgAddictionLevel,
    ROUND(AVG(CAST(f.anxiety_level AS FLOAT)), 2) AS AvgAnxietyLevel
FROM [TeenMentalHealthDB].[dbo].[Fact_Mental_Health_Impact] f
JOIN [TeenMentalHealthDB].[dbo].[Dim_Teenager] t ON f.id_teenager = t.id_teenager
GROUP BY t.academic_performance;
GO