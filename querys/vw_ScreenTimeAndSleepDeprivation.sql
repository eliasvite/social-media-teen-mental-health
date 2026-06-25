CREATE VIEW vw_ScreenTimeAndSleepDeprivation AS
/**
 * View Name: vw_ScreenTimeAndSleepDeprivation
 * Description: Segments adolescents by pre-sleep screen time thresholds and measures impact on sleep duration and stress.
 */
SELECT 
    CASE 
        WHEN f.screen_time_before_sleep < 1.0 THEN 'Low Risk (< 1 hour)'
        WHEN f.screen_time_before_sleep BETWEEN 1.0 AND 2.5 THEN 'Moderate Risk (1 - 2.5 hours)'
        ELSE 'High Risk (> 2.5 hours)'
    END AS ScreenTimeCategory,
    COUNT(*) AS TotalTeens,
    ROUND(AVG(f.sleep_hours), 2) AS AvgSleepHours,
    ROUND(AVG(CAST(f.stress_level AS FLOAT)), 2) AS AvgStressLevel
FROM [TeenMentalHealthDB].[dbo].[Fact_Mental_Health_Impact] f
GROUP BY 
    CASE 
        WHEN f.screen_time_before_sleep < 1.0 THEN 'Low Risk (< 1 hour)'
        WHEN f.screen_time_before_sleep BETWEEN 1.0 AND 2.5 THEN 'Moderate Risk (1 - 2.5 hours)'
        ELSE 'High Risk (> 2.5 hours)'
    END;
GO