CREATE DATABASE Papollo_Hospital_Analytics;
USE Papollo_Hospital_Analytics;

SELECT * FROM hospital_patient_data;

#1. Retrieve all patient records:
CREATE VIEW Patient_Records AS
SELECT *
FROM hospital_patient_data;

#1. Retrieve all patient records:
SELECT * FROM Patient_Records;


#2. Calculate the total billing amount for each diagnosis:
CREATE VIEW Billing_By_Diagnosis AS
SELECT Diagnosis,
       SUM(`Billing Amount`) AS Total_Billing
FROM hospital_patient_data
GROUP BY Diagnosis;

#2. Calculate the total billing amount for each diagnosis:
SELECT * FROM Billing_By_Diagnosis;


#3. Find the total number of patients for each diagnosis:
CREATE VIEW Patients_By_Diagnosis AS
SELECT Diagnosis,
       COUNT(Patient_ID) AS Total_Patients
FROM hospital_patient_data
GROUP BY Diagnosis;

#3. Find the total number of patients for each diagnosis:
SELECT * FROM Patients_By_Diagnosis;


#4. Calculate the total billing amount handled by each doctor:
CREATE VIEW Billing_By_Doctor AS
SELECT Doctor,
       SUM(`Billing Amount`) AS Total_Billing
FROM hospital_patient_data
GROUP BY Doctor;

#4. Calculate the total billing amount handled by each doctor:
SELECT * FROM Billing_By_Doctor;


#5. Find the number of patients admitted in each bed occupancy category:
CREATE VIEW Bed_Occupancy_Summary AS
SELECT Bed_Occupancy,
       COUNT(Patient_ID) AS Total_Patients
FROM hospital_patient_data
GROUP BY Bed_Occupancy;

#5. Find the number of patients admitted in each bed occupancy category:
SELECT * FROM Bed_Occupancy_Summary;


#6. Calculate the average billing amount for each medical test:
CREATE VIEW Average_Bill_By_Test AS
SELECT Test,
       ROUND(AVG(`Billing Amount`),2) AS Average_Billing
FROM hospital_patient_data
GROUP BY Test;

#6. Calculate the average billing amount for each medical test:
SELECT * FROM Average_Bill_By_Test;


#7. Find the total health insurance amount claimed for each medical test:
CREATE VIEW Insurance_By_Test AS
SELECT Test,
       SUM(`Health Insurance Amount`) AS Total_Insurance
FROM hospital_patient_data
GROUP BY Test;

#7. Find the total health insurance amount claimed for each medical test:
SELECT * FROM Insurance_By_Test;


#8. Calculate the average feedback score for each doctor:
CREATE VIEW Doctor_Feedback AS
SELECT Doctor,
       ROUND(AVG(Feedback),2) AS Average_Feedback
FROM hospital_patient_data
GROUP BY Doctor;

#8. Calculate the average feedback score for each doctor:
SELECT * FROM Doctor_Feedback;


#9. Find the top 5 doctors based on patient count:
CREATE VIEW Top_Doctors AS
SELECT Doctor,
       COUNT(Patient_ID) AS Total_Patients
FROM hospital_patient_data
GROUP BY Doctor
ORDER BY Total_Patients DESC
LIMIT 5;

#9. Find the top 5 doctors based on patient count:
SELECT * FROM Top_Doctors;


#10. Calculate the total billing amount by bed occupancy type:
CREATE VIEW Billing_By_Bed_Type AS
SELECT Bed_Occupancy,
       SUM(`Billing Amount`) AS Total_Billing
FROM hospital_patient_data
GROUP BY Bed_Occupancy;

#10. Calculate the total billing amount by bed occupancy type:
SELECT * FROM Billing_By_Bed_Type;


#11. Find the top 5 patients with the highest billing amount:
CREATE VIEW Highest_Billing_Patients AS
SELECT Patient_ID,
       `Billing Amount`
FROM hospital_patient_data
ORDER BY `Billing Amount` DESC
LIMIT 5;

#11. Find the top 5 patients with the highest billing amount:
SELECT * FROM Highest_Billing_Patients;


#12. Calculate the total billing amount and health insurance amount:
CREATE VIEW Hospital_Revenue AS
SELECT
SUM(`Billing Amount`) AS Total_Billing,
SUM(`Health Insurance Amount`) AS Total_Insurance
FROM hospital_patient_data;

#12. Calculate the total billing amount and health insurance amount:
SELECT * FROM Hospital_Revenue;


#13. Find the total number of patients handled by each doctor:
CREATE VIEW Doctor_Patient_Count AS
SELECT Doctor,
       COUNT(Patient_ID) AS Patient_Count
FROM hospital_patient_data
GROUP BY Doctor;

#13. Find the total number of patients handled by each doctor:
SELECT * FROM Doctor_Patient_Count;


#14. Find the diagnosis with the highest billing amount:
CREATE VIEW Highest_Billing_Diagnosis AS
SELECT Diagnosis,
       SUM(`Billing Amount`) AS Total_Billing
FROM hospital_patient_data
GROUP BY Diagnosis
ORDER BY Total_Billing DESC
LIMIT 1;

#14. Find the diagnosis with the highest billing amount:
SELECT * FROM Highest_Billing_Diagnosis;


#15. Retrieve patients whose billing amount is greater than ₹40,000:
CREATE VIEW High_Billing_Patients AS
SELECT Patient_ID,
       Diagnosis,
       Doctor,
       `Billing Amount`
FROM hospital_patient_data
WHERE `Billing Amount` > 40000;

#15. Retrieve patients whose billing amount is greater than ₹40,000:
SELECT * FROM High_Billing_Patients;