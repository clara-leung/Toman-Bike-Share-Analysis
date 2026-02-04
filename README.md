# Toman-Bike-Share-Analysis
**Data-driven revenue optimization and rider behavior insights for strategic business growth.**

## Project Overview
In the urban mobility sector, balancing service accessibility with profitability is a constant challenge. For Toman Bike Share, understanding how temporal factors, seasonal changes, and rider demographics influence the bottom line is essential for making informed pricing decisions. And Toman Bike Share reached out with a critical question: *Is there room to increase our prices next year without driving our customers away?* To answer this, I moved beyond basic data visualization to perform a deep-dive into the company's financial health, rider behavior, and market positioning.

This project provides a comprehensive end-to-end analysis of over two years of bike-share data. By integrating SQL-based data engineering with interactive Power BI visualizations, the analysis evaluates the feasibility of a price increase for the upcoming fiscal year. The goal is to maximize revenue while maintaining the high customer loyalty observed in the registered rider segment.

## Objectives
- **Analyze Financial Performance**: Evaluate hourly, monthly, and seasonal revenue trends to identify peak profitability windows.

- **Segment Rider Demographics**: Distinguish between casual and registered users to understand price sensitivity and usage patterns.

- **Data Pipeline Development**: Build a robust ETL process using SQL to consolidate disparate yearly datasets into a unified reporting structure.

- **Strategic Pricing Recommendation**: Provide a data-backed recommendation on price adjustments to optimize 2023 profit margins.

## Tools and Technologies
- Languages: SQL

- Visualization: Power BI

- Database Management: Microsoft SQL Server

- Analysis: Revenue Modeling & Trend Forecasting

## Data Source
The analysis utilizes three primary datasets:
1. *bike_share_yr_0.csv*: Historical rider and environmental data for the first year.
2. *bike_share_yr_1.csv*: Historical rider and environmental data for the second year.
3. *cost_table.csv*: Internal records of pricing and Cost of Goods Sold (COGS) mapped by fiscal year.

## SQL Development: Data Transformation
I developed a SQL script utilizing Common Table Expressions (CTEs) to join multi-year transaction data with internal cost tables:

```
WITH cte AS (
    SELECT * FROM bike_share_yr_0
    UNION ALL
    SELECT * FROM bike_share_yr_1
)
SELECT 
    dteday, season, a.yr, weekday, hr, rider_type, riders, price, COGS,
    riders * price AS revenue,
    (riders * price) - (riders * COGS) AS profit
FROM cte a
LEFT JOIN cost_table b ON a.yr = b.yr;
```

## Key Findings
- **Profitability**: Total revenue reached $15M with a healthy $10M profit, maintaining a 0.45 profit margin.

- **The "Loyalty" Buffer**: My analysis identified that 81.17% of users are Registered. This segment represents a stable revenue stream with higher brand loyalty, allowing us to implement a pricing strategy that targets higher margins from casual users while rewarding our core members.
  
- **Temporal Demand**: Peak revenue hits between 17:00 and 19:00 on weekdays. This suggests that Toman is a commute utility, which is traditionally less sensitive to price changes than purely recreational services.
  
- **Seasonal Variance**: With a massive gap between Season 3 ($4.9M) and Season 1 ($2.2M), I identified that a "one-size-fits-all" price increase must be balanced with seasonal promotions to prevent churn during the colder months.

## Recommendation for 2023

Based on a deep dive into Toman Bike Share’s 45% profit margin and a robust volume of 3.3M total riders, there is a clear opportunity for revenue expansion. To maximize the bottom line while maintaining market share, I recommend a **Conservative Price Increase of 10–15%** ($5.49 – $5.74) governed by the following strategic pillars:

**1. Proven Resilience and Demand Elasticity**

The data reveals a remarkable trend from 2021 to 2022: despite a 25% price increase (from $3.99 to $4.99), demand did not drop—it surged by 64%. This suggests that the service is currently an "inelastic good" for the majority of users, meaning our value proposition far outweighs the current cost.

**2. Segmented Value Proposition**

With 81.17% of users being Registered, our revenue base is highly "sticky" and likely consists of utility-driven commuters. The Registered Riders segment represents a stable revenue stream that has already demonstrated a willingness to absorb a 25% hike. While the Casual Riders group is traditionally more sensitive to price, the overall growth trend suggests that Toman is capturing a larger share of the local mobility market regardless of rider type.

**3. Operational Synchronization**

Data reveals peak revenue windows between 17:00 and 19:00 on weekdays. Since the demand is highest during these "essential" commute hours, a 10–15% increase is unlikely to trigger a "substitution effect" (users switching to walking or transit). Price increases should be paired with guaranteed bike availability during these peak windows to maintain high perceived value.

**4. The "Agile Implementation" Execution Plan**

- Benchmark Pricing: Using the 2022 baseline of $4.99, a 10% increase to $5.49 targets low-risk revenue growth, while a 15% shift to $5.74 tests the upper bounds of the current market.

- Risk Mitigation: Despite the strong 64% demand growth, we must avoid hitting a "price ceiling". I recommend a conservative approach for 2023 to protect the massive gains in rider volume made over the last 12 months.

- Post-Launch KPI Monitoring: We must implement real-time tracking of the Rider-to-Revenue ratio. If the total rider volume drops by more than 5% within the first fiscal quarter, we should pivot toward seasonal promotions to stabilize cash flow.

## Author

**Clara Leung**

📧 Email: claraleung.lcl@gmail.com

📫 [LinkedIn](https://www.linkedin.com/in/clara-leung-89809b397/)

💼 [GitHub](https://github.com/clara-leung)
