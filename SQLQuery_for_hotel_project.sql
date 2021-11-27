--Select all rows from each of the years and alias as hotels
with hotels as (
SELECT * 
FROM dbo.['2018$']
UNION
SELECT *
FROM dbo.['2019$']
UNION
SELECT *
FROM dbo.['2020$']
)

--joining market segment and meals to learn if there are any trends
SELECT * 
FROM hotels
LEFT JOIN dbo.market_segment$
ON hotels.market_segment = market_segment$.market_segment
LEFT JOIN dbo.meal_cost$
ON meal_cost$.meal = hotels.meal


--Is our hotel revenue growing by year?
--Sorting by year and hotel type, calculating total stays multiplied ADR, rounded, for revenue.
SELECT 
arrival_date_year,
hotel,
round(sum((stays_in_week_nights + stays_in_weekend_nights)*adr),2) as revenue
FROM hotels
GROUP BY arrival_date_year, hotel