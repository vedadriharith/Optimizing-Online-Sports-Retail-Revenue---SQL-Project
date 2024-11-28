# Data Analyst With SQL: Optimizing Online Sports Retail Revenue

This project involves using SQL to analyze product data for an online sports retail company. The goal is to identify opportunities to optimize revenue by examining pricing, revenue, ratings, reviews, and website traffic data. By leveraging advanced SQL techniques, we generate actionable insights for improving product performance and customer experience.

---

## Project Overview

### Objectives:
- Analyze product data to optimize revenue.
- Uncover insights into pricing, reviews, ratings, and product descriptions.
- Provide actionable recommendations to marketing and sales teams.

### Dataset Details:
The dataset contains five tables with `product_id` as the primary key. Key attributes include:
- **Description**
- **Listing Price**
- **Discount**
- **Revenue**
- **Reviews**
- **Ratings**
- **Last Visited**

---

## Key Insights and Tasks

### 1. **Counting Missing Values**
- **Dataset Size**: 3,179 rows.
- Non-missing values:
  - `description`: 3,117 entries.
  - `listing_price`: 3,120 entries.
  - `last_visited`: 2,928 entries.
  
---

### 2. **Nike vs. Adidas Pricing**
- **Insights**:
  - Adidas has products across all price ranges, with significant revenue generated from the “Expensive” and “Elite” categories.
  - Nike’s products are predominantly in the “Budget” category, with lower revenue in high-end segments.

---

### 3. **Labeling Price Ranges**
- **Categories**: Budget, Average, Expensive, and Elite.
- **Revenue Insights**:
  - Adidas: Strong presence in high-revenue “Expensive” and “Elite” categories.
  - Nike: Majority of sales in the “Budget” category, with lower contributions from “Expensive” and “Elite” categories.

---

### 4. **Average Discount by Brand**
- **Findings**:
  - Adidas offers significant discounts, correlating with higher revenue.
  - Nike does not provide discounts, presenting an opportunity to experiment with small discounts to boost sales volume.

---

### 5. **Correlation Between Reviews and Revenue**
- **Result**: A moderate positive correlation (0.651) exists between reviews and revenue. Products with more reviews tend to generate higher revenue.

---

### 6. **Ratings and Reviews by Description Length**
- **Findings**:
  - Longer product descriptions are associated with higher average ratings.
  - Content guidelines for product descriptions could positively influence ratings and reviews.

---

### 7. **Monthly Reviews by Brand**
- **Insights**:
  - Adidas experiences higher monthly reviews compared to Nike.
  - Review counts peak in the first quarter, suggesting an opportunity to increase reviews during other months.

---

### 8. **Footwear Product Performance**
- **Results**:
  - Footwear accounts for ~85% of the company’s stock.
  - Median revenue for footwear products: $3,118.36.

---

### 9. **Clothing Product Performance**
- **Results**:
  - Clothing products represent the remaining 15% of stock.
  - Median revenue for clothing products: $503.82.
- **Comparison**:
  - Footwear products generate significantly higher median revenue than clothing.

---

## Conclusion and Recommendations
1. **Product Development**:
   - Expand offerings in the “Expensive” and “Elite” categories for higher revenue potential.
2. **Customer Engagement**:
   - Encourage more reviews through incentives like future discounts.
   - Optimize product descriptions for higher ratings and better customer experience.
3. **Marketing Strategy**:
   - Address monthly review fluctuations with targeted campaigns.
   - Explore discounts for Nike products to boost sales volume.
4. **Category Monitoring**:
   - Regularly analyze footwear and clothing performance to guide pricing and marketing adjustments.

---

## Tools Used
- **SQL**: For data analysis and insight generation.

---

## Project Files
- **SQL Scripts**: Queries used for analysis.
- **Documentation**: Detailed findings and recommendations.

---

### Author
- **Your Name**  
  Connect with me on [LinkedIn](https://www.linkedin.com/in/vedadriharith/) or visit my [Portfolio](https://vedadriharith.github.io/Portfolio/).
