# Product-sales-by-region

## Executive Summary:
- **Revenue Growth**: Sales reached **$4.48M** over three years, with a healthy **4.28% YOY growth** from 2023 to 2024, signaling steady recovery and resilience.
- **Regional Strengths**: The **North region** is the top performer ($975,957 revenue), while product preferences vary significantly by geography (e.g., tablets in West/Central, laptops in South). This highlights the need for **region‑specific inventory strategies**.
- **Store Dynamics**: **Store A** excels in product variety (1,602 SKUs in 2023), while **Store D** dominates category sales but also leads in **returns and discounts**, suggesting both strong demand and margin pressure.
- **Customer Behavior**: Promotions drive engagement, with **FREESHIP** used 4.4K times, and **online payments** accounting for 22% of transactions ($971K). This underscores the importance of **digital channels and shipping incentives**.
- **Operational Risks**: High laptop returns (62 units) and heavy discounting in Store D point to **quality and margin challenges**. Addressing these issues will protect profitability.
- **Strategic Priorities**: Focus on **regional demand tailoring, margin management in discount-heavy stores, and digital channel optimization** to sustain growth and improve customer experience.

 
### Goals:
- **Benchmark successful sales strategies** by analyzing top‑performing stores and identifying replicable best practices.
- **Uncover key growth drivers** behind high‑revenue stores, including product mix, promotions, and customer behavior.
- **Map regional product demand** to determine which categories drive performance in specific geographies.
- **Enable cross‑store growth** by applying proven strategies to underperforming locations, targeting an initial **≥5% YOY uplift**.



### Key Takeaway: </br>
Sales performance shows **steady growth and strong regional demand diversification**, with the North region leading in revenue and Store D driving both category sales and discount activity. However, high product returns (especially laptops) and margin pressure from heavy discounting underscore the need for **quality control and more effective promotional strategies**. Digital channels and shipping incentives are emerging as key drivers of customer engagement, positioning the business to scale through **region‑specific inventory planning and margin optimization**.


### Key Insights:
| Category | Insight | Metric / Value | Business Implication | Query/dashboard results |
| -------- | ------- | -------------- | -------------------- | ----------------------- | 
| **Overall Sales** | Total revenue over 3 years | **≈ $4.40M** | Steady growth; +4.28% YOY (2023→2024) shows resilience post‑pandemic | <img width="191" height="163" alt="image" src="https://github.com/user-attachments/assets/c699a4e6-d570-442d-af83-32c7bfe38513" /> |
| **Regional Performance** |  North region leads | 3,442 units sold, $975,957 revenue | Strongest market; potential to expand product mix | <img width="360" height="255" alt="image" src="https://github.com/user-attachments/assets/fbb1f688-0765-4fc3-9bf0-89e35f9974a9" /> |
| **Product Leaders by Region** | Top sellers vary by geography | Tablets (West 636, Central 578), Desks (North 581), Laptops (South 544), Phones (East 539) | Regional demand diversification; tailor inventory by region | <img width="305" height="302" alt="image" src="https://github.com/user-attachments/assets/b9dd142f-9ebd-4abb-87e4-7be066237ac0" /> |
| **Store Performance** | Store A: peak product variety; Store D: peak category sales | Store A: **1,602 SKUs in 2023**; Store D: Tablets (68), Monitors (65), Laptops (64) | Store A excels in breadth, Store D in depth; different strategies | <img width="414" height="300" alt="image" src="https://github.com/user-attachments/assets/2dd45d1e-4a4d-4072-90c3-4f9c76107fe7" /> |
| **Returns** | Highest product returns | Store D: 100 returns; Store B: 98; Laptops: 62 | Returns concentrated in laptops; quality or customer fit issue | <img width="311" height="123" alt="image" src="https://github.com/user-attachments/assets/59f5c046-fc09-4ac9-ad4d-0a9c726dd12b" /> <img width="472" height="352" alt="image" src="https://github.com/user-attachments/assets/40728c8a-5936-4ac4-b8d1-92fc25e93767" /> |
| **Discounts & Promotions** | Store D leads in discounts; FREESHIP most used | Store D: $43,780 discounts (2024); FREESHIP: 4.4K uses | Discounts drive traffic but erode margin; shipping promos most effective | <img width="426" height="219" alt="image" src="https://github.com/user-attachments/assets/601456f9-2cc3-45a1-93d0-ead1555d6704" /> <img width="382" height="306" alt="image" src="https://github.com/user-attachments/assets/68fb47d8-5982-4471-8033-df1ce7f902c1" /> | 
| **Payment Behavior** | Online payments dominate | 22.17% share, $971,120 transactions | Digital adoption strong; optimize online checkout experience | <img width="483" height="292" alt="image" src="https://github.com/user-attachments/assets/94f02d83-1b6a-4541-b8bf-f3dbc9e23052" /> |
| **Quarterly Peak** | Highest quarterly sales | Q1 2025: **183 units sold** | Seasonal spike; opportunity to align promotions with demand cycles | <img width="846" height="293" alt="image" src="https://github.com/user-attachments/assets/196b90e0-3e08-4a26-85ad-8cf45610675d" /> |
| **Channel Mix** | Retail vs wholesale split | ~50/50 distribution | Balanced channel strategy; maintain dual focus | <img width="386" height="287" alt="image" src="https://github.com/user-attachments/assets/f4928513-6a01-465a-aa7c-c7981293b618" /> |
 

### Data & Modeling:
- Dataset: product_sales_region (1500 rows) covering the store location, customer type, payment method, promotion code, etc. 
- Tools: MySQL LAG window function, DATEDIFF,  aggregations (SUM, COUNT, AVG, MIN, MAX ), ALTER TABLE (ADD), Data Manipulation Language (MODIFY), Numeric function (ROUND), etc.
- Approach: corrected the order date column after getting the irregular date results when queried, applied the LAG window function to calculate year-over-year changes in growth percentage, and compared stores in various locations and regions for sales aspects.

### Sample SQL Highlights: -- Total amount of the discount offered to the customers using promotion codes
                        SELECT 
                            AVG(DATEDIFF(DeliveryDate, OrderDate)) AS avg_delivery_days
                        FROM product_sales_region
                        WHERE DeliveryDate IS NOT NULL 
                          AND OrderDate IS NOT NULL
                        ;            
                             

### Recommendations:
| Stakeholder | Recommended Action | Expected Impact |
|------------ | ------------------ | --------------- |
| **Store Management** | Reduce reliance on blanket discounts; invest in targeted **marketing & advertising campaigns** to drive sustainable demand. | Higher brand visibility, improved customer acquisition without eroding margins. | 
| **Operations & Merchandising** | Tailor **product mix by region** (e.g., tablets in the West/Central, laptops in the South, desks in the North). | Better alignment with local demand, reduced inventory waste, and higher sell‑through rates. |
| **Customer Experience Teams** |  Introduce **after‑sales services** (repairs, spare parts) and loyalty programs to strengthen retention. | New revenue streams, improved customer lifetime value, stronger brand loyalty. | 
| **Finance & Pricing Teams** | Concentrate **discounts/promotions in Q1** to leverage seasonal demand spikes, while monitoring ROI. | Boost quarterly sales while maintaining profitability across the year. | 
| **Digital & Payments** | Expand **online payment options** and streamline checkout processes. | Faster transactions, improved convenience, higher conversion rates. |
| **Quality Assurance** | Investigate high **laptop return rates** and implement stricter quality checks or extended warranties. | Lower return costs, improved customer satisfaction, and stronger trust in product quality. |
| **Executive Leadership** | Monitor **Store D’s heavy discounting** and set profitability thresholds; benchmark Store A’s product variety strategy. | Balanced growth across stores, reduced margin pressure, scalable best practices. |


### Limitations & Next Steps:
- Data is limited for 2025 for sales data.
- Some discounts given to customers had a null promotion code.
- Future: In-depth analysis with complete data for the year 2025, integrating Python/Power BI for interactive dashboards or ML predictions.


### How to Run:
- Clone the repository
- Import the database
- Explore the data
- Key insights
- That's it! You should now have a fully populated database ready for querying and further exploration. Feel free to modify the queries or extend the analysis. Contributions and suggestions are welcome!


### About Me:

Data Analyst, passionate about sustainable finance. Connect on [LinkedIn](https://www.linkedin.com/in/vivek-sharma-b74950241/)  | View more projects [here](https://github.com/Clefyvivek) Thanks for visiting!






