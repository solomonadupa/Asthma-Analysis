---viewing the entire data_set
SELECT * 
FROM myp.asthma_dataset;

--Smoking_status vs Asthma Diagnosis
SELECT Smoking_status, COUNT(Asthma_diagnosis) as Num_of_Asthma_patients 
FROM myp.asthma_dataset
WHERE Asthma_diagnosis = 'Yes'
GROUP BY Smoking_status;

--Top 10 Age_groups most prevelant with Asthma
SELECT Age, COUNT(Asthma_diagnosis) as Num_of_Asthma_patients
FROM myp.asthma_dataset
WHERE Asthma_diagnosis = 'Yes' 
GROUP BY Age
ORDER BY Num_of_Asthma_patients DESC
LIMIT 10;

--Average Peak_Flow of Asthma_Patients by Age group
SELECT Age, ROUND(AVG(Peak_Flow), 0) as Avg_Peak_Flow
FROM myp.asthma_dataset
WHERE Asthma_diagnosis = 'Yes'
GROUP BY Age
ORDER BY Age;

--Average Peak_Flow of Non_asthmatics by Age group
SELECT Age, ROUND(AVG(Peak_Flow), 0) as Avg_Peak_Flow
FROM myp.asthma_dataset
WHERE Asthma_diagnosis = 'No'
GROUP BY Age
ORDER BY Age;

---Average Peak flow by Gender
SELECT Gender, ROUND(AVG(Peak_Flow), 0) as Avg_Peak_Flow
FROM myp.asthma_dataset
GROUP BY Gender;

---Average Peak_flow in Asthma patients vs Non Astmatics
SELECT Asthma_diagnosis, ROUND(Avg(Peak_Flow), 0) as Avg_Peak_Flow
FROM myp.asthma_dataset
GROUP BY Asthma_diagnosis;

---Peak_flow vs Medication
SELECT Medication, ROUND(AVG(Peak_Flow), 0) as Avg_Peak_Flow
FROM myp.asthma_dataset
WHERE Asthma_diagnosis = 'Yes'
GROUP BY Medication;

---Disease Prevelance in Males vs Females
SELECT Gender, COUNT(Asthma_diagnosis) as Num_of_Asthmatics
FROM myp.asthma_dataset
WHERE Asthma_diagnosis = 'Yes'
GROUP BY Gender;


