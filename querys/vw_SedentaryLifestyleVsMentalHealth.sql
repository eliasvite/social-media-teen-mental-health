CREATE VIEW vw_SedentaryLifestyleVsMentalHealth AS
/**
 * View Name: vw_SedentaryLifestyleVsMentalHealth
 * Description: Correlates daily physical activity scores with social media addiction and psychological strain.
 */
SELECT 
    CASE 
        WHEN f.physical_activity < 1.0 THEN 'Sedentary (< 1 hour/day)'
        WHEN f.physical_activity BETWEEN 1.0 AND 2.5 THEN 'Moderately Active (1 - 2.5 hours/day)'
        ELSE 'Highly Active (> 2.5 hours/day)'
    END AS PhysicalActivityLevel,
    COUNT(*) AS TeenCount,
    ROUND(AVG(f.daily_social_media_hours), 2) AS AvgSocialMediaHours,
    ROUND(AVG(CAST(f.addiction_level AS FLOAT)), 2) AS AvgAddictionLevel,
    ROUND(AVG(CAST(f.anxiety_level AS FLOAT)), 2) AS AvgAnxietyLevel
FROM [TeenMentalHealthDB].[dbo].[Fact_Mental_Health_Impact] f
GROUP BY 
    CASE 
        WHEN f.physical_activity < 1.0 THEN 'Sedentary (< 1 hour/day)'
        WHEN f.physical_activity BETWEEN 1.0 AND 2.5 THEN 'Moderately Active (1 - 2.5 hours/day)'
        ELSE 'Highly Active (> 2.5 hours/day)'
    END;
GO