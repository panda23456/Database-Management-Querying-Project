--Qn1 (Listing No. of Fresh Model and Finedtuned models)
SELECT 
  (SELECT COUNT(*) FROM Model WHERE Parent_Model_ID IS NULL) AS FreshModel,
  (SELECT COUNT(*) FROM Model WHERE Parent_Model_ID IS NOT NULL) AS FineTunedModel;

  --Qn2
  --Models that are not assigned to any order
SELECT 
    ModelType,
    COUNT(*) AS NumberUnassigned,
    CAST(ROUND(AVG(Accuracy), 1) AS DECIMAL(5,1)) AS MeanAccuracy,  -- Round the average accuracy to 1 decimal place and cast to remove trailing zeros
    ROUND(MAX(Accuracy), 1) AS MaxAccuracy
FROM 
    (
        SELECT 
            Model_Type AS ModelType,
            Accuracy
        FROM 
            Model
        WHERE 
            Model_ID NOT IN (SELECT DISTINCT Model_ID FROM Solution)
    ) AS Subquery
GROUP BY 
    ModelType
HAVING 
    COUNT(*) >= 1
ORDER BY 
    ModelType;


--Qn3
SELECT
	e.First_Name + ' ' + e.Last_Name AS FullName,
	e.Contact,
	e.Gender
FROM
	employee e
JOIN
    (
    SELECT
        Employee_ID,
        Order_ID
    FROM
        solution
    GROUP BY
        Employee_ID,
        Order_ID
    HAVING
        COUNT(*) > 1
    ) AS subquery ON e.Employee_ID = subquery.Employee_ID
ORDER BY
    FullName;
	
--Qn 4.
SELECT
    COUNT (*) AS NumberAccepted
FROM
    (
        SELECT
            s.Order_ID,
            s.Date_Assigned,
            co.Completion_Date,
            co.Model_Type AS Customer_Model_Type,
            s.Model_ID,
            m.Model_Type AS Model_Type,
            m.Accuracy AS Model_Accuracy,
            co.Accuracy AS Customer_Accuracy
        FROM
            customer_order co
        INNER JOIN
            solution s ON s.Order_ID = co.Order_ID
        INNER JOIN
            model m ON s.Model_ID = m.Model_ID
		WHERE
            s.Date_Assigned <= co.Completion_Date
			AND (co.Model_Type = m.Model_Type OR co.Model_Type IS NULL)
			AND m.Accuracy >= co.Accuracy
    ) AS subquery;