# Growth Analysis for 365 Data Science

## Overview  
This project analyzes growth data for 365 Data Science and is divided into five main phases:  

1. **Planning Phase**:  
   - Identify required graphs, company terminologies, and main KPIs.  

2. **Data Extraction and Preparation**:  
   - Use SQL and Python to extract and prepare data for visualization.  

3. **Tableau Dashboard Creation**:  
   - Build dashboards featuring parameters, waterfall charts, and customizable filters.  

4. **Dashboard Organization**:  
   - Create a five-page dashboard with a homepage summarizing key KPIs and features.  

5. **Insights and Recommendations**:  
   - Provide actionable recommendations based on the analysis.  

---

## Components  

### 1. Data Files  
- **CSV Files**: Packaged in `Growth_data_files.zip`.  

### 2. SQL Scripts  
- **Folder**: `SQL.zip`.  
- **Description**: Contains SQL queries used for data preparation, leveraging techniques like `SELECT`, CTEs, `JOIN`, and date functions.  
- **Queries**:  
  - `Free_and_conversions.sql`: Calculate free-to-paid conversion rates.  
  - `Funnel.sql`: Analyze the visitor-to-paid funnel.  
  - `Paid_by_country.sql`: Analyze paid users by country.  
  - `Sessions_by_country.sql`: Analyze session distribution by country.  
  - `Visitors.sql`: Analyze new and returning visitors by month and week.  
  - `Waterfall_Subscriptions.sql`: Segment users for the waterfall chart.

### 3. Python Data Processing  
- **Problem**: Analyze subscription statuses for waterfall charts (e.g., active, churned, resurrected).  
- **Solution**:  
  - Python script with functions to segment users:  
    - `set_period`: Determine period start and end dates.  
    - `is_base`, `is_new`, `is_churned`, `is_resurrected`: Categorize users.  
    - `generate_user_tag`: Create a DataFrame with user tags.  

### 4. Integration with Tableau  
- **Visualizations**:  
  - Free-to-paid conversion rate.  
  - Subscription growth (waterfall chart).  
  - Website visitors.  
  - Geographic session distribution.  
  - Visitor-to-paid funnel.  
- **Homepage**: Includes key KPIs and metrics.  
- **Sample Dashboard**:  
  [View on Tableau Public](https://public.tableau.com/views/GrowthDataDashboard_17329849377290/DashboardHome?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

---

## Tools and Technologies  

- **Languages**: Python, SQL.  
- **Business Intelligence**: Tableau.  
- **Version Control**: GitHub.  
