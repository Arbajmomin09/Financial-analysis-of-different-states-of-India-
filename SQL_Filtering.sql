create database project1;
use project1;

select * from social_sector_expenditure2;

DESCRIBE social_sector_expenditure2;

UPDATE social_sector_expenditure2
SET MyUnknownColumn = LEFT(MyUnknownColumn, 4)
WHERE MyUnknownColumn LIKE '____-__';

ALTER TABLE social_sector_expenditure2
RENAME COLUMN MyUnknownColumn TO Year_;


select * from social_sector_expenditure2;

-- Step 1: Add a new column TermGroup
ALTER TABLE social_sector_expenditure2
ADD COLUMN TermGroup VARCHAR(10);

-- Step 2: Update the TermGroup column based on the year ranges
UPDATE social_sector_expenditure2
SET TermGroup = 
    CASE 
        WHEN CAST(SUBSTRING(Year_, 1, 4) AS UNSIGNED) BETWEEN 1980 AND 1984 THEN '1980-84(CE)'
        WHEN CAST(SUBSTRING(Year_, 1, 4) AS UNSIGNED) BETWEEN 1985 AND 1989 THEN '1985-89(CE)'
        WHEN CAST(SUBSTRING(Year_, 1, 4) AS UNSIGNED) BETWEEN 1990 AND 1994 THEN '1990-94(CE)'
        WHEN CAST(SUBSTRING(Year_, 1, 4) AS UNSIGNED) BETWEEN 1995 AND 1999 THEN '1995-99(CE)'
        WHEN CAST(SUBSTRING(Year_, 1, 4) AS UNSIGNED) BETWEEN 2000 AND 2004 THEN '2000-04(CE)'
        WHEN CAST(SUBSTRING(Year_, 1, 4) AS UNSIGNED) BETWEEN 2005 AND 2009 THEN '2005-09(CE)'
        WHEN CAST(SUBSTRING(Year_, 1, 4) AS UNSIGNED) BETWEEN 2010 AND 2014 THEN '2010-14(CE)'
        WHEN CAST(SUBSTRING(Year_, 1, 4) AS UNSIGNED) BETWEEN 2015 AND 2019 THEN '2015-19(CE)'
        ELSE 'other'
    END;

select * from social_sector_expenditure2;

ALTER TABLE social_sector_expenditure2
DROP COLUMN date;

select * from social_sector_expenditure2;

-- Step 1: Drop the existing MyUnknownColumn column
ALTER TABLE social_sector_expenditure2
DROP COLUMN Year_;

-- Step 2: Rename the TermGroup column to MyUnknownColumn
ALTER TABLE social_sector_expenditure2
CHANGE COLUMN TermGroup Year_ VARCHAR(10);

select * from social_sector_expenditure2;

SELECT 
    Year_,
    AVG(`Andhra Pradesh`) AS Andhra_Pradesh,
    AVG(`Arunachal Pradesh`) AS Arunachal_Pradesh,
    AVG(Assam) AS Assam,
    AVG(Bihar) AS Bihar,
    AVG(Chhattisgarh) AS Chhattisgarh,
    AVG(Goa) AS Goa,
    AVG(Gujarat) AS Gujarat,
    AVG(Haryana) AS Haryana,
    AVG(`Himachal Pradesh`) AS Himachal_Pradesh,
    AVG(`Jammu & Kashmir`) AS Jammu_and_Kashmir,
    AVG(Jharkhand) AS Jharkhand,
    AVG(Karnataka) AS Karnataka,
    AVG(Kerala) AS Kerala,
    AVG(`Madhya Pradesh`) AS Madhya_Pradesh,
    AVG(Maharashtra) AS Maharashtra,
    AVG(Manipur) AS Manipur,
    AVG(Meghalaya) AS Meghalaya,
    AVG(Mizoram) AS Mizoram,
    AVG(Nagaland) AS Nagaland,
    AVG(Odisha) AS Odisha,
    AVG(Punjab) AS Punjab,
    AVG(Rajasthan) AS Rajasthan,
    AVG(Sikkim) AS Sikkim,
    AVG(`Tamil Nadu`) AS Tamil_Nadu,
    AVG(Telangana) AS Telangana,
    AVG(Tripura) AS Tripura,
    AVG(`Uttar Pradesh`) AS Uttar_Pradesh,
    AVG(Uttarakhand) AS Uttarakhand,
    AVG(`West Bengal`) AS West_Bengal,
    AVG(Delhi) AS Delhi,
    AVG(Puducherry) AS Puducherry
FROM social_sector_expenditure2
GROUP BY Year_;







