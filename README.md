# 📊 E-Commerce Dashboard - Customer Analysis with SQL
> This project focuses on analyzing the AdventureWorks2022 database to extract key insights about sales performance and customer behavior. The SQL queries provided are designed to be the backbone of a dynamic e-commerce dashboard, helping business stakeholders make data-driven decisions.

**🚀 Project Overview**
* The main objective is to query a relational database to uncover trends and metrics related to:
>* Overall Sales Performance
>* Product Popularity
>* Geographical Sales Distribution
>* Customer Value and Loyalty
* These insights are crucial for marketing strategies, inventory management, and identifying high-value customers.

## 📈 Key Performance Indicators (KPIs) for the Dashboard
> Here are the primary SQL queries to extract foundational KPIs for a sales overview dashboard.

**1. Total Sales Revenue**
>This is the most critical top-line metric, representing the total monetary value of all completed sales.
* 💡 Why it's important: It provides a quick snapshot of the business's overall financial health and scale.
* Dashboard Visualization: A single large number card (KPI Card).

**2. Sales Over Time**
> Tracking sales over time helps identify trends, seasonality, and the impact of marketing campaigns.
* 💡 Why it's important: Allows for forecasting and understanding business cycles.
* Dashboard Visualization: A line chart or a bar chart.
 
**3. Top 10 Selling Products**
> This query identifies the products that are sold most frequently by quantity.
* 💡 Why it's important: Essential for inventory management, marketing focus, and understanding customer preferences.
* Dashboard Visualization: A horizontal bar chart.
  
**4. Sales by Territory**
> This shows the geographical distribution of sales revenue.
* 💡 Why it's important: Helps identify high-performing regions and areas with growth potential. Useful for targeted marketing and logistics planning.
* Dashboard Visualization: A map chart, pie chart, or a bar chart.
  
**5. Average Order Value (AOV)**
> AOV measures the average amount a customer spends per transaction.
* 💡 Why it's important: Increasing AOV is a key strategy for boosting revenue without needing more customers. It can be influenced by upselling and cross-selling.
* Dashboard Visualization: A KPI Card.


## 🧑‍🤝‍🧑 Customer-Centric Analysis
> These queries dive deeper into customer behavior and value.

**A1. Total Unique Customers**
> This metric counts the number of distinct customers who have placed an order.
* 💡 Why it's important: Measures the size of the customer base and helps track customer acquisition efforts over time.
* Dashboard Visualization: A KPI Card.

**A2. Top 10 Customers by Total Spend**
> This identifies your most valuable customers (VIPs) based on their total lifetime spending.
* 💡 Why it's important: These customers are prime candidates for loyalty programs, special offers, and personalized marketing to ensure retention.
* Dashboard Visualization: A table or a horizontal bar chart.

**A3. Average Orders Per Customer**
> This KPI measures customer loyalty and the frequency of repeat business.
* 💡 Why it's important: A high number indicates strong customer retention. It's a key indicator of customer satisfaction and brand loyalty.
* Dashboard Visualization: A KPI Card.


# 📊 Live E-Commerce Dashboard - T-SQL Reporting Script
>* This repository contains a comprehensive T-SQL script designed to power a live e-commerce analysis dashboard. By querying the AdventureWorks2022 database, this single script efficiently returns multiple, pre-aggregated datasets ready for visualization in tools like Power BI, Tableau, or SSRS.
>* The primary advantage of this approach is efficiency. Instead of the dashboarding tool making multiple separate calls to the database, it makes one call and receives all the necessary data at once, reducing network latency and database load.

**✨ Key Features**
* Single Execution, Multiple Results: Returns five distinct data tables in one go.
* Optimized for Live Reporting: Designed to be run on a schedule (e.g., every hour) to keep dashboards fresh.
* Performance-Tuned: Uses READ UNCOMMITTED to prevent read queries from blocking operational transactions.
* Comprehensive Insights: Covers everything from high-level KPIs and sales trends to top products and customer segmentation.

**🛠️ Tech Stack**
* Database: Microsoft AdventureWorks2022
* Query Language: T-SQL
* IDE: SQL Server Management Studio (SSMS) v21+

## 🔌 How I Integrate with a BI Tool (I Used Power BI)
* 1.Connect to Data: In Power BI tool, select "SQL Server" as the data source. Enter your server and database (AdventureWorks2022) credentials.
* 2.Use the Script as a Query: In the connection options, instead of selecting tables, choose the "Advanced options" and paste the entire T-SQL script from above into the "SQL statement" box.
* 3.Load Data: When we connect, the Power BI tool will execute the script and recognize that it returns multiple tables (e.g., For my case Power BI's Navigator will show them as Query1, Result Set 2, Result Set 3, etc.).
* 4.Rename and Model: Load all the resulting tables. It is a best practice to rename them to something meaningful (e.g., KPIs, SalesOverTime, TopProducts).
* 5.Build Visuals: Drag and drop fields from each of your new tables onto the dashboard canvas to build your visuals.
>* KPIs table -> Use for KPI cards.
>* SalesOverTime table -> Use for a line chart.
>* TopProducts table -> Use for a horizontal bar chart.
>* And so on...
* 6.Schedule Refresh: Configure a scheduled refresh in the BI service to run the script periodically and keep your dashboard data up to date.
