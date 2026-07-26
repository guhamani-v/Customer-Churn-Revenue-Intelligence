# Customer-Churn-Revenue-Intelligence

Cleaning, answering and story telling of customers using Excel, SQL and Power BI

---

# Project Overview

Customer Churn & Revenue Intelligence is an end-to-end data analytics project that explores customer behavior, service usage, and churn patterns in a telecommunications company. 

The project demonstrates a complete analytics workflow by cleaning raw data in Excel using Power Query, analyzing business questions with SQL, and creating interactive dashboards in Power BI.

---

## Datasets: (excel > raw dataset)

- telecom_customer_churn.csv
- telecom_data_dictionary.csv
- telecom_zipcode_population.csv 

---

## Day 1 - Data cleaning (Excel and Power Query)

## Dataset used: telecom_customer_churn.csv (excel > raw dataset)

---

## Implementation:

Using telecom_customer_churn, raw dataset, cleaned the data of over 7,000 rows using Power Query in excel, identified null values, replaced the null values by investigating the data and provided the right replacement-- not for all columns. Some columns are still left with null values respective of the field

For example, customers without phone service naturally have no long-distance charges, and customers without internet service have no internet-related services. 

After cleaning, attached the dataset: cleaned_dataset_customer.xlsx (excel > cleaned dataset)

---

## Day 2 - SQL Database Setup & Exploratory Data Analysis (EDA)

## SQL Queries for Day2.1 (SQL > Day2.1 CCRI.sql)

---

## Implementation: 

- Created the customer_churn table in PostgreSQL using an appropriate database schema.
- Modified column data types to resolve schema mismatches before importing.
- Imported the cleaned dataset (7,043 records) using PostgreSQL's COPY command.
- Verified that all records were successfully imported.
- Audited duplicate Customer IDs to ensure record uniqueness.
- Audited missing Customer IDs to validate data integrity.
- Explored Customer Status distribution (Stayed, Churned, Joined).
- Explored Churn Category distribution to understand the available churn classifications before business analysis.

---

## Author *Guhamani V*
 Data Analyst | Turning Data into actionable insights | SQL | Excel | Power BI
