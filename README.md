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

## Skills Demonstrated

- Data Cleaning
- Data Validation
- Exploratory Data Analysis (EDA)
- Business Analysis
- SQL Aggregations
- Common Table Expressions (CTEs)
- Window Functions
- Customer Segmentation
- Revenue Analysis

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

# Day 3 - SQL Business Analysis

## SQL Queries for Day3 (SQL > Day3 CCRI.sql)

---

## Implementation

- Calculated the overall customer churn rate.
- Identified the contract type with the highest churn rate.
- Analyzed customer churn by payment method.
- Compared churn rates across internet service types.
- Identified cities contributing the highest revenue loss due to customer churn.

# Day 4 - SQL Business Analysis 

## SQL Queries for Day4 (SQL > Day4 CCRI.sql)

---

## Implementation

- Grouped customers by tenure to identify early-stage churn patterns.
- Identified churn reasons responsible for the greatest revenue loss.
- Identified the highest-value customers lost due to churn.
- Segmented customers by gender, contract type, and internet type to identify high-risk customer groups.

---

## Key Business Insights

- Approximately 27% of customers have churned, indicating that nearly one in four customers has left the company.
- Month-to-Month contracts experience the highest churn rate among all contract types.
- Fiber Optic customers show significantly higher churn compared to other internet services.
- Customers within their first year account for the largest share of churned customers, highlighting the importance of early customer retention.
- Revenue loss is primarily driven by customers leaving due to competitors offering better deals and better devices.
- Customer segmentation identified high-risk customer groups that can be targeted with personalized retention strategies.

---

# Day 5 - Power BI Dashboard Development

## Dashboard 1 - Executive Overview (Power BI > Dashboard-CCRI-PBI.jpg)

## Implementation

Created an executive-level dashboard to provide a high-level overview of customer churn and business performance.

### KPIs

- Total Customers
- Active Customers
- Churned Customers
- Churn Rate
- Total Revenue
- Revenue Loss
- Average Customer Tenure
- Average Monthly Charge

### Visualizations

- Customer Status Distribution
- Revenue by Customer Status
- Why Customers Churned
- Contract Type Distribution
- Interactive Slicers

## Business Value

This dashboard enables decision-makers to quickly monitor customer health, understand overall churn performance, and identify major churn categories impacting the business.

---

# Day 6 - Power BI Customer Insights & Risk Analysis

## Dashboard 2 - Customer Insights & Risk Analysis (Power BI > Dashboard-CCRI-PBI-RA.jpg)

### Implementation

Designed a second dashboard focused on customer segmentation and identifying high-risk customer groups using interactive visualizations.

### Visualizations

- Age Group Distribution
- Churn Rate by Contract
- Risk Matrix (Contract × Internet Type)
- Average Monthly Charge by Tenure Group
- Top 5 Cities by Churn Rate
- Churn Rate by Tenure Group
- Interactive Slicers

## Business Value

This dashboard helps identify customer segments with the highest churn risk, allowing the business to prioritize targeted retention campaigns and improve customer lifetime value.

---

# Business Recommendations

### 1. Improve Early Customer Retention

Implement onboarding programs and personalized offers during customer's first year to reduce early churn.

### 2. Encourage Long-Term Contracts

Offer discounts or loyalty incentives to migrate Month-to-Month customers to One-Year or Two-Year contracts.

### 3. Improve Fiber Optic Customer Experience

Investigate service quality, pricing, and customer support for Fiber Optic users to reduce churn within this segment.

---

## Author *Guhamani V*
 Data Analyst | Turning Data into actionable insights | SQL | Excel | Power BI
