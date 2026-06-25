CREATE VIEW vw_DepressionDistributionByDemographics AS
/**
 * View Name: vw_DepressionDistributionByDemographics
 * Description: Provides a demographic overview (Gender & Age) associated with different depression indicator labels.
 */
SELECT 
    t.gender AS Gender,
    CASE 
        WHEN t.age < 14 THEN 'Early Adolescence (10-13)'
        WHEN t.age BETWEEN 14 AND 16 THEN 'Mid Adolescence (14-16)'
        ELSE 'Late Adolescence (17-19)'
    END AS AgeGroup,
    f.depression_label AS DepressionLabel,
    COUNT(*) AS CaseCount,
    ROUND(AVG(f.daily_social_media_hours), 2) AS AvgSocialMediaHours
FROM [TeenMentalHealthDB].[dbo].[Fact_Mental_Health_Impact] f
JOIN [TeenMentalHealthDB].[dbo].[Dim_Teenager] t ON f.id_teenager = t.id_teenager
GROUP BY t.gender, 
         CASE 
             WHEN t.age < 14 THEN 'Early Adolescence (10-13)'
             WHEN t.age BETWEEN 14 AND 16 THEN 'Mid Adolescence (14-16)'
             ELSE 'Late Adolescence (17-19)'
         END, 
         f.depression_label;
GO