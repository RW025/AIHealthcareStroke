SELECT 
    SUBJECT_ID, -- Patient Identifier 
    AVG(CASE WHEN ITEMID = 50931 THEN valuenum END) AS glucose, -- Glucose Level
    AVG(CASE WHEN ITEMID = 50907 THEN valuenum END) AS cholesterol, -- Cholesterol Level
    AVG(CASE WHEN ITEMID = 51237 THEN valuenum END) AS inr -- International Normalized Ratio (Blood Clotting Time)
FROM physionet-data.mimiciii_clinical.labevents
WHERE ITEMID IN (50931, 50907, 51237)
GROUP BY SUBJECT_ID;

