# 📊 dbt Warehouse Demo — SQL Server / Microsoft Fabric → Power BI  

A **production-style dbt project** showcasing modern analytics engineering practices.  
It demonstrates how to transform **raw CSV data** into a clean **star schema** for **Power BI** using dbt, Microsoft Fabric, and SQL Server.  

Pipeline:  

`[ seeds (raw) ] → [ staging ] → [ marts (dims & fact) ] → [ Power BI ]`  

---

## 🚀 Project Overview  

- **Data Source**: Sample seed CSVs (Customers, Orders, Products, Order_Items, etc.)  
- **Transformations**: dbt models for cleaning, joining, and enriching raw data  
- **Destination**: Microsoft Fabric SQL Endpoint (with BI-ready models in `marts`)  
- **Use Case**: Power BI dashboards built on a well-structured analytics layer  

---

## 🧱 Project Structure  

```bash
📂 dbt_fabric_project
├── 📄 dbt_project.yml
├── 📄 packages.yml
├── 📂 models
│   ├── 📂 staging/                 # thin, 1:1 cleansed views/tables
│   │   ├── 📄 stg_customers.sql
│   │   ├── 📄 stg_products.sql
│   │   ├── 📄 stg_orders.sql
│   │   ├── 📄 stg_order_items.sql
│   │   └── 📄 schema.yml           # tests & docs
│   ├── 📂 marts/                   # BI-ready star schema
│   │   ├── 📄 dim_customers.sql
│   │   ├── 📄 dim_products.sql
│   │   ├── 📄 dim_dates.sql
│   │   ├── 📄 fct_order_items.sql
│   │   └── 📄 schema.yml           # tests & docs
└── 📂 seeds/                       # demo CSVs (50 rows each)
    ├── 📄 customers.csv
    ├── 📄 products.csv
    ├── 📄 orders.csv
    └── 📄 order_items.csv

## 🗺️ Data Model (Star Schema)  

### 📐 Dimensions  
- **dim_customers** — customer profile (name, country, city, first_order_date)  
- **dim_products** — product details (sku, product_name, category, unit_price)  
- **dim_dates** — date intelligence (year, month, day, month_name, weekday_name)  

### 📦 Fact  
- **fct_order_items** — one row per order line with measures:  
  - `quantity`  
  - `unit_price`  
  - `discount`  
  - `line_revenue = quantity * unit_price - discount`  

---

## ✅ Features & Best Practices  

- **Layered modeling approach** (`raw → staging → marts`)  
- **Schema-based separation** for clarity (`raw`, `staging`, `marts`)  
- **Data quality tests** with `schema.yml` (uniqueness, not_null, relationships)  
- **Documentation** auto-generated via dbt Docs  
- **Star schema design** — BI-ready for Power BI dashboards  
