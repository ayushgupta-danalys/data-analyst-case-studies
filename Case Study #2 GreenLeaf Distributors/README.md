# GreenLeaf Distributors - Warehouse Inventory Analysis

## Project Overview

This project is based on a real warehouse inventory dataset with **1,000 records**. The data contained missing values, category conflicts, inconsistent text, and other data quality issues.

The goal of this project was to clean the data using SQL, answer business questions, and build a Power BI dashboard to help the Operations Manager understand inventory performance.

---

## Dataset

- **Dataset:** `warehouse_inventory_dirty.csv`
- **Total Records:** 1,000
- **Warehouses:** 3
- **Suppliers:** 4

---

## Data Cleaning (SQL)

The following cleaning steps were performed:

- Removed extra spaces from product names.
- Standardized text values.
- Resolved category conflicts using the **Majority Vote** method.
- Converted text quantity values (e.g., `"two hundred"`) into numbers.
- Checked duplicate records using Product ID, Product Name, Warehouse, Category, Location, and Supplier *(no true duplicates found).*
- Kept missing prices as **NULL** and excluded them from inventory value calculations.
- Kept missing restock dates as **NULL** and excluded them only from restock analysis.

---

## Business Questions Solved

- What is the total inventory value?
- Which warehouse has the highest inventory value?
- Which category has the highest inventory value?
- What percentage of products are In Stock, Low Stock, and Out of Stock?
- Which supplier has the highest Out-of-Stock rate?
- Which warehouse/category has the oldest valid restock date?
- How many category conflicts were found and resolved?

---

## Power BI Dashboard

### Dashboard KPIs

-  **Total Inventory Value:** ₹2.9M
-  **Valid Records:** 661 / 1000
-  **Low Stock + Out of Stock:** 66%
-  **Category Conflicts Resolved:** 6 / 6 Categories

### Dashboard Visuals

- Inventory Value by Warehouse
- Inventory Value by Category
- Stock Status Distribution
- Out-of-Stock Rate by Supplier

---

## Key Insights

- Warehouse 2 has the highest inventory value, while Warehouse 3 has the lowest.
- Toys hold the highest inventory value, followed by Clothing. Electronics and Furniture contribute much less.
- 66% of valid products are either Low Stock or Out of Stock. This means only about one-third of products are currently available, which may affect customer demand.
- Supplier D has the highest Out-of-Stock rate among all suppliers. This may indicate slower deliveries, supply delays, or poor inventory planning for products supplied by Supplier D.
- All 6 categories had category conflicts, showing that product information was entered inconsistently across warehouses.

---

## Recommendations

### 1. Improve Stock Replenishment

Since 66% of products are either Low Stock or Out of Stock, the company should restock these items more quickly. Setting minimum stock levels and automatic reorder alerts can help avoid stock shortages.

### 2. Review Supplier Performance

Supplier D has the highest Out-of-Stock rate. The company should review its delivery performance, lead times, and order fulfillment. If the issue continues, consider sourcing some products from alternative suppliers.

### 3. Improve Master Data Management

Category conflicts were found in all categories. Each Product ID should be linked to only one approved category in a central product master. Users should select categories from a dropdown list instead of entering them manually.

### 4. Improve Data Quality

Missing prices and missing restock dates reduce the accuracy of business reports. Adding validation rules during data entry can help ensure important fields are always completed before records are saved.

---

## Tools Used

- MySQL – Data Cleaning & Business Analysis
- Power BI – Dashboard & Visualization
- Microsoft Excel – Initial Data Review

---

## File Contains

- `warehouse_inventory_dirty.csv`
- `warehouse_inventory_cleaned.csv`
- `warehouse_analysis.sql`
- `warehouse.pbix`
- `Dashboard.png`