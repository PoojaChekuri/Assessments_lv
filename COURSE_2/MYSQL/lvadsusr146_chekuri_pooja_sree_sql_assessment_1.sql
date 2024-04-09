-- Lab 1: CustomerInteractions
CREATE TABLE IF NOT EXISTS CustomerInteractions (
    CustomerID INT,
    Month VARCHAR(10),
    Year INT,
    CallDuration INT,
    MessageCount INT,
    DataUsed FLOAT,
    PRIMARY KEY (CustomerID, Month, Year)
);

-- Adjusted sample data for CustomerInteractions
INSERT INTO CustomerInteractions (CustomerID, Month, Year, CallDuration, MessageCount, DataUsed) VALUES
    (201, 'March', 2024, 500, 80, 3.5),
    (202, 'March', 2024, 320, 40, 2.0),
    (203, 'February', 2024, 450, 120, 1.5),
    (204, 'February', 2024, 300, 100, 2.8),
    (205, 'March', 2024, 400, 60, 4.2),
    (206, 'February', 2024, 100, 150, 1.0),
    (206, 'March', 2024, 200, 100, 2.0); -- Adjusted for increased call duration and data usage with reduced messages

-- Lab 2: QuarterlySales
CREATE TABLE QuarterlySales (
    SaleID INT PRIMARY KEY,
    ProductTypeID INT,
    Quarter VARCHAR(10),
    Year INT,
    TotalSalesAmount INT,
    UnitsSold INT
);

INSERT INTO QuarterlySales (SaleID, ProductTypeID, Quarter, Year, TotalSalesAmount, UnitsSold)
VALUES
    (1, 1, 'Q1', 2024, 20000, 400),
    (2, 2, 'Q1', 2024, 25000, 350),
    (3, 3, 'Q1', 2024, 15000, 300),
    (4, 1, 'Q2', 2024, 22000, 420),
    (5, 2, 'Q2', 2024, 26000, 360);

-- Lab 3: SectorEnergyConsumption
CREATE TABLE IF NOT EXISTS SectorEnergyConsumption (
    RecordID INT PRIMARY KEY,
    Sector VARCHAR(20),
    Region VARCHAR(20),
    Month VARCHAR(10),
    Year INT,
    EnergySource VARCHAR(20),
    ConsumptionKWh INT
);

-- Adjusted sample data for SectorEnergyConsumption
INSERT INTO SectorEnergyConsumption (RecordID, Sector, Region, Month, Year, EnergySource, ConsumptionKWh) VALUES
    (1, 'Residential', 'East', 'March', 2024, 'Solar', 100000),
    (2, 'Commercial', 'West', 'February', 2024, 'Wind', 200000),
    (3, 'Industrial', 'North', 'February', 2024, 'Fossil Fuels', 400000),
    (4, 'Residential', 'South', 'March', 2024, 'Wind', 120000),
    (5, 'Commercial', 'East', 'March', 2024, 'Solar', 150000),
    (6, 'Residential', 'North', 'February', 2024, 'Solar', 50000), -- Added for rising energy usage scenario
    (7, 'Residential', 'North', 'March', 2024, 'Solar', 80000); -- Added for rising energy usage scenario

-- Lab 4: InsuranceActivities
CREATE TABLE InsuranceActivities (
    PolicyID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    PolicyType VARCHAR(20),
    AnnualPremium INT,
    ClaimsCount INT,
    Investigation VARCHAR(3),
    FeedbackScore INT
);

INSERT INTO InsuranceActivities (PolicyID, CustomerName, PolicyType, AnnualPremium, ClaimsCount, Investigation, FeedbackScore)
VALUES
    (301, 'Bob Smith', 'Auto', 1000, 2, 'No', 7),
    (302, 'Alice Jones', 'Health', 1200, 0, 'No', 9),
    (303, 'Carol Brown', 'Home', 800, 3, 'Yes', 8),
    (304, 'Dan Wilson', 'Auto', 950, 1, 'No', 6),
    (305, 'Eve Davis', 'Health', 1100, 4, 'No', 10);

SELECT CustomerID FROM customerinteractions 
WHERE Month="March" AND Year=2024 AND 
DataUsed>(SELECT AVG(DataUsed) FROM customerinteractions WHERE Month="March" AND Year=2024);
SELECT CustomerID FROM customerinteractions WHERE Month="March" AND Year=2024
group by CustomerID HAVING MAX(CallDuration) AND COUNT(*)>=2;


SELECT ProductTypeID,SUM(TotalSalesAmount) AS TOTAL_SALES FROM quarterlysales 
WHERE ProductTypeID=1 GROUP BY ProductTypeID;
SELECT ProductTypeID FROM quarterlysales 
WHERE TotalSalesAmount= (SELECT MAX(TotalSalesAmount) FROM quarterlysales WHERE Quarter="Q1");
SELECT TotalSalesAmount/UnitsSold AS average_sales_price FROM quarterlysales 
WHERE Quarter="Q2" AND ProductTypeID=1 AND Year=2024;
SELECT Region FROM sectorenergyconsumption 
WHERE ConsumptionKWh> (SELECT AVG(ConsumptionKWh) FROM sectorenergyconsumption WHERE EnergySource IN ("Solar","Wind"))
AND Month="March" AND Year=2024;
SELECT CustomerName FROM insuranceactivities
WHERE Investigation="No" AND
(FeedbackScore>(SELECT AVG(FeedbackScore) FROM insuranceactivities) OR ClaimsCount>(SELECT AVG(ClaimsCount) FROM insuranceactivities));
SELECT SUM(AnnualPremium) FROM insuranceactivities
WHERE Investigation="No" AND
(FeedbackScore>(SELECT AVG(FeedbackScore) FROM insuranceactivities) AND ClaimsCount>0);
SELECT PolicyType, AVG(FeedbackScore),ClaimsCount FROM insuranceactivities 
GROUP BY PolicyType,ClaimsCount;

SELECT EnergySource,SUM(ConsumptionKWh) FROM sectorenergyconsumption WHERE Month="February" and Year=2024 and EnergySource="Fossil Fuels"
group by EnergySource
union
SELECT GROUP_CONCAT(EnergySource SEPARATOR ","),SUM(ConsumptionKWh) FROM sectorenergyconsumption WHERE Month="February" and Year=2024 and EnergySource<>"Fossil Fuels";