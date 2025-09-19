# dbt Warehouse Demo — SQL Server / Fabric → Power BI

A production-style dbt project that turns raw seed data into a clean star schema for Power BI.
It demonstrates a layered approach — raw → staging → marts with tests and documentations.

[ seeds (raw) ]  -->  [ staging ]  -->  [ marts (dims & fact) ]  -->  [ Power BI ]


---

## 🚀 Project Overview
- **Data Source**: Sample seed CSVs (Customers, Orders, Products, Order_Items, etc.)
- **Transformations**: dbt models to clean, join, and enrich raw data as seeds isolated in raw schema
- **Destination**: Microsoft Fabric SQL Endpoint with BI models (dims/fact) living in marts
- **Use Case**: Building an analytics layer for business insights in Power BI

## 🧱 Project Structure

├── dbt_project.yml
├── packages.yml
├── models
│   ├── staging/                 # thin, 1:1 cleansed views/tables
│   │   ├── stg_customers.sql
│   │   ├── stg_products.sql
│   │   ├── stg_orders.sql
│   │   └── stg_order_items.sql
│   │   └── schema.yml           # tests & docs
│   ├── marts/                   # BI-ready star schema
│   │   ├── dim_customers.sql
│   │   ├── dim_products.sql
│   │   ├── dim_dates.sql
│   │   └── fct_order_items.sql
│   │   └── schema.yml           # tests & docs
└── seeds/                       # demo CSVs (50 rows each)
    ├── customers.csv
    ├── products.csv
    ├── orders.csv
    └── order_items.csv

🗺️ Data Model (Star Schema)

#### Dimensions
  ##### dim_customers — name, country, city, first_order_date
  ##### dim_products — sku, product_name, category, unit_price
  ##### dim_dates — year/month/day, month_name, weekday_name

#### Fact

##### fct_order_items — one row per order item with measures — quantity, unit_price, discount, line_revenue = quantity * unit_price - discount




