CREATE DATABASE Sales
USE Sales

-- PROFIT ANALYSIS

-- The profit worth of the Brewries in the last three years (Anglophone and Francophone territories inclusive)
SELECT 
    Years, SUM(Profit) AS Total_Profit
FROM
    salesrecords
GROUP BY Years
ORDER BY SUM(Profit) DESC

-- Comparison between the two territories on the Total_Profit 
SELECT 
    Territories, SUM(Profit) AS Total_Profit
FROM
    salesrecords
GROUP BY Territories
ORDER BY SUM(Profit) DESC

-- Country that generated the highest profit in 2019
SELECT 
    Countries, MAX(Profit) AS Max_Profit
FROM
    salesrecords
WHERE
    years = 2019

-- The year with the highest profit
SELECT 
    Years, MAX(Profit) AS Highest_Profit
FROM
    salesrecords

-- The months in three years that generated the least profit 
SELECT 
    Years, Months, MIN(Profit) AS Min_Profit
FROM
    salesrecords
GROUP BY years

-- The minimum profit in the month of December, 2018
SELECT 
    Years, Months, MIN(Profit) AS Min_Profit
FROM
    salesrecords
WHERE
    months = 'December' AND years = 2018

-- Profit in percentage for each of the month in 2019
SELECT 
    months,
    Profit,
    Profit * 100 / p.Total_Profit AS Percentage_Profit
FROM
    salesrecords
        CROSS JOIN
    (SELECT 
        SUM(Profit) AS Total_Profit
    FROM
        salesrecords) p
WHERE
    years = 2019
GROUP BY months

-- The brand that generated the highest profit in Senegal
SELECT 
    countries, brands, MAX(Profit) AS Max_Profit
FROM
    salesrecords
WHERE
    countries = 'Senegal'


-- BRAND ANALYSIS

-- The top three brands consumed in Francophone Countries within the last two years
SELECT 
    Years, Brands, SUM(Quantity) AS Total_Quantity
FROM
    salesrecords
WHERE
    Territories = 'Francophone'
GROUP BY years
ORDER BY years DESC
LIMIT 2

-- The top two choice of consumer brand in Ghana
SELECT 
    Brands
FROM
    salesrecords
WHERE
    countries = 'Ghana'
ORDER BY Quantity DESC
LIMIT 2

-- Details of beers consumed in the past three years in the most oil rich country in West Africa
SELECT 
    *
FROM
    salesrecords
WHERE
    region = 'west'
GROUP BY years

-- Favorites malt brand in Anglophone region between 2018 and 2019
SELECT 
    Brands, Territories, Years, Countries
FROM
    salesrecords
WHERE
    (territories = 'Anglophone')
        AND (years BETWEEN 2018 AND 2019)
        AND (brands LIKE '%malt') 

-- The Brand that sold the highest in 2019 in Nigeria?
SELECT 
    years, countries, brands, MAX(quantity) AS Max_Quantity
FROM
    salesrecords
WHERE
    years = 2019 AND countries = 'Nigeria'

-- Favorite brand in south south region in Nigeria
SELECT 
    brands, countries, region, MAX(quantity) AS Max_Quantity
FROM
    salesrecords
WHERE
    region = 'southsouth'
        AND countries = 'Nigeria'

-- Beer Consumption in Nigeria
SELECT 
    years, brands, countries, SUM(Quantity) AS Total_Quantity
FROM
    salesrecords
WHERE
    countries = 'Nigeria'
GROUP BY years

-- Level of consumption of budweiser in the regions in Nigeria
SELECT 
    region, countries, brands, SUM(quantity) AS Total_Quantity
FROM
    salesrecords
WHERE
    countries = 'Nigeria'
        AND brands = 'budweiser'
GROUP BY region

-- Level of consumption of budweiser in the regions in Nigeria in 2019 (decision on promo)
SELECT 
    years,
    region,
    countries,
    brands,
    SUM(quantity) AS Total_Quantity
FROM
    salesrecords
WHERE
    countries = 'Nigeria'
        AND brands = 'budweiser'
        AND years = 2019
GROUP BY region


-- GEO-LOCATION ANALYSIS

-- Country with the highest consumption of beer
SELECT 
    Countries, SUM(Quantity) AS Total_Quantity
FROM
    salesrecords
GROUP BY Countries
ORDER BY SUM(Quantity) DESC
LIMIT 1

-- Highest sales_personnel of budweiser in Senegal
SELECT 
    Sales_Rep, SUM(Quantity) AS Total_Quantity
FROM
    salesrecords
WHERE
    brands = 'budweiser'
        AND countries = 'Senegal'
GROUP BY Sales_Rep
ORDER BY SUM(Quantity)
LIMIT 1

-- Country with the highest profit of the first quarter in 2019
SELECT 
    Months, Countries, MAX(Profit) AS Highest_Profit
FROM
    salesrecords
WHERE
    years = 2019
        AND (Months = 'January' OR 'February'
        OR 'March'
        OR 'April')
GROUP BY Months
LIMIT 1