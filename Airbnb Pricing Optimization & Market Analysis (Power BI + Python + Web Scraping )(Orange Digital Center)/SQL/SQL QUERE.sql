CREATE INDEX IX_Countery_Name_city ON Countery_Name(City);
CREATE INDEX IX_CityRatings_Safety_level ON CityRatings(Safety_level);
CREATE INDEX IX_transactions_room_type ON transactions(room_type);
-----------------------------------------------------------------------------

--view
CREATE VIEW vw_CityTransactions AS
SELECT 
    t.city, 
    c.Country, 
    cr.Housing_level, 
    cr.Safety_level,
    t.realSum,
    t.guest_satisfaction_overall
FROM transactions t
JOIN CityRatings cr ON t.city = cr.city
JOIN Countery_Name c ON cr.city = c.City;

select * from vw_CityTransactions

-----------------------------------------------------------------------------

--CTE

WITH AvgGuestSatisfaction AS (
    SELECT 
        city, 
        AVG(guest_satisfaction_overall) AS avg_satisfaction
    FROM transactions
    GROUP BY city
)
SELECT *
FROM AvgGuestSatisfaction
ORDER BY avg_satisfaction DESC;
-----------------------------------------------------------------------------
--Window Function

WITH CityRevenue AS (
    SELECT 
        city,
        SUM(realSum) AS total_revenue
    FROM transactions WITH (NOLOCK)
    GROUP BY city
)
SELECT 
    city,
    total_revenue,
    RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank
FROM CityRevenue;

------------------------------------------------------------------------------


SELECT TOP 5 city, AVG(guest_satisfaction_overall * 1.0) AS avg_satisfaction
FROM transactions WITH (NOLOCK)
GROUP BY city
ORDER BY avg_satisfaction DESC;


------------------------------------------------------------------------------

SELECT room_type, AVG(realSum * 1.0) AS avg_price
FROM transactions WITH (NOLOCK)
GROUP BY room_type
ORDER BY avg_price DESC;


-----------------------------------------------------------------



SELECT cr.Safety_level, COUNT(*) AS num_transactions
FROM transactions t WITH (NOLOCK)
INNER JOIN CityRatings cr ON t.city = cr.city
GROUP BY cr.Safety_level
ORDER BY num_transactions DESC;
-----------------------------------------------------------------


SELECT cr.Safety_level, COUNT(*) AS num_transactions
FROM transactions t
INNER JOIN CityRatings cr WITH (NOLOCK) ON t.city = cr.city
GROUP BY cr.Safety_level
ORDER BY num_transactions DESC;

----------------------------------------------------------------




SELECT c.Country, SUM(t.realSum) AS total_revenue
FROM transactions t WITH (NOLOCK)
INNER JOIN CityRatings cr ON t.city = cr.city
INNER JOIN Countery_Name c ON cr.city = c.City
GROUP BY c.Country
ORDER BY total_revenue DESC;


------------------------------------------------------------


SELECT room_type, AVG(bedrooms * 1.0) AS avg_bedrooms
FROM transactions WITH (NOLOCK)
GROUP BY room_type
ORDER BY avg_bedrooms DESC;
------------------------------------------------------------

SELECT t.city, COUNT(*) AS transaction_count
FROM transactions t WITH (NOLOCK)
GROUP BY t.city
ORDER BY transaction_count DESC;
------------------------------------------------------------


