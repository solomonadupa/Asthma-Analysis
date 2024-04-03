# Asthma Risk Factors and Peak Flow Analysis
## Project Overview
This project involves finding any associations between Asthma and certain factors such as age, somking and also to analyse how different
factors affect Peak Flow.

## Objectives 
1. Find the correlation between Age, Sex, Smoking and being diagnosed with Asthma
2. To find how Age, Asthma and medication affect Peak Flow

## Tools
MySQL (Data importation and analysis )

## Data Source
The data set was downloaded from Kaggle

## Data Analysis
The following insights were pulled from the data set using SQL commands in the MySQL work bench;

1. Selecting all rows and columns to view the data for any errors and to have a better understanding of the data set
``` SQL
SELECT * 
FROM myp.asthma_dataset;
```
![1](https://github.com/solomonadupa/Asthma-Analysis/assets/160836596/2bf37c68-d3aa-422a-93fb-79c65d1d4a01)


2. Finding the number of people diagnosed with Asthma vs their smoking status
``` SQL
SELECT Smoking_status, COUNT(Asthma_diagnosis) as Num_of_Asthma_patients 
FROM myp.asthma_dataset
WHERE Asthma_diagnosis = 'Yes'
GROUP BY Smoking_status;
```
![2](https://github.com/solomonadupa/Asthma-Analysis/assets/160836596/55aec6d7-1c65-4298-8e20-b133e97f6ad0)


3. Tracing the top 10 ages with the highest prevelance of Asthma
``` SQL
SELECT Age, COUNT(Asthma_diagnosis) as Num_of_Asthma_patient
FROM myp.asthma_dataset
WHERE Asthma_diagnosis = 'Yes' 
GROUP BY Age
ORDER BY Num_of_Asthma_patients DESC
LIMIT 10;
```
![3](https://github.com/solomonadupa/Asthma-Analysis/assets/160836596/5800a0f6-81da-4aef-9211-ef39cf3c0a83)


4. Finding the Average Peak Flow in Asthma patients of different Ages
```SQL
SELECT Age, ROUND(AVG(Peak_Flow), 0) as Avg_Peak_Flow
FROM myp.asthma_dataset
WHERE Asthma_diagnosis = 'Yes'
GROUP BY Age
ORDER BY Age;
```


5.  Finding the Average Peak Flow in Non-Asthmatics of different Ages
```SQL
SELECT Age, ROUND(AVG(Peak_Flow), 0) as Avg_Peak_Flow
FROM myp.asthma_dataset
WHERE Asthma_diagnosis = 'No'
GROUP BY Age
ORDER BY Age;
```
![4](https://github.com/solomonadupa/Asthma-Analysis/assets/160836596/146b1c16-0096-4dd8-9cab-5b315991cae7)


6. Effect of Gender on Peak Flow
```SQL
SELECT Gender, ROUND(AVG(Peak_Flow), 0) as Avg_Peak_Flow
FROM myp.asthma_dataset
GROUP BY Gender;
```
![5](https://github.com/solomonadupa/Asthma-Analysis/assets/160836596/71c5b5de-a403-4c79-8b63-176212878ee4)


7. Average peak flow in Asthmatics vs Non Asthmatics
```SQL
SELECT Asthma_diagnosis, ROUND(Avg(Peak_Flow), 0) as Avg_Peak_Flow
FROM myp.asthma_dataset
GROUP BY Asthma_diagnosis;
```
![6](https://github.com/solomonadupa/Asthma-Analysis/assets/160836596/64b9da32-0b3d-4b26-8e32-5e0ebebe96c1)


8. How different medications affect Peak Flow
```SQL
SELECT Medication, ROUND(AVG(Peak_Flow), 0) as Avg_Peak_Flow
FROM myp.asthma_dataset
WHERE Asthma_diagnosis = 'Yes'
GROUP BY Medication;
```
![7](https://github.com/solomonadupa/Asthma-Analysis/assets/160836596/d6b5c789-81f6-45b4-b48a-6af58e6d9c95)


9. Disease Prevelance in Males vs Females
```SQL
SELECT Gender, COUNT(Asthma_diagnosis) as Num_of_Asthmatics
FROM myp.asthma_dataset
WHERE Asthma_diagnosis = 'Yes'
GROUP BY Gender;
```
![8](https://github.com/solomonadupa/Asthma-Analysis/assets/160836596/26a77165-c402-4d4c-9e88-c916530645e4)


## FINDINGS.
- Smoking is not a risk factor for developinf Asthma, this confirms the disease to be genetical in nature.
- There was no link between age and Asthma as well, this is shown by the relatively equal number of people with Asthma across the different ages.
- As per the data, there were more females having Asthma compared to men but the difference was very small.
- The data showed no clear/great difference in Peak flow across different ages, this was observed in both Asthma patients and non Asthma patients.
- On Average the Males have a higher Average peak rate than the females across the entire data set.
- Both Asthmatics and Non-asthmatics had the same average Peak flow. This could be due to effect of medication that increased peak flow in Asthmatis and also the reduction effect of smoking on the 
peak flow of non asthmatic people.
- Asthma patients on inhaler had a higher average Peak Flow compared to those who were on controller medication.

## RECOMMENDATIONS.
- Both Asthmatics and non asthmatics are advised not to smoke as smoking worsens lung function seen as reduction in peak flow.
- People of all ages and genders should be screened for Asthma as it is not age/gender specific.
- All Asthmatic patients should be properly managed on medications to improve lung function or avoid worsening it.
