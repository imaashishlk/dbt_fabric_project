-- CTE: Get all order items from the staging table
with oi as (select * from {{ ref('stg_order_items') }}),
     o  as (select * from {{ ref('stg_orders') }}),
     p  as (select * from {{ ref('stg_products') }})
select
  oi.order_item_id,      -- Unique identifier for the order item
  oi.order_id,           -- Identifier for the order
  o.customer_id,         -- Customer who placed the order
  oi.product_id,         -- Product in the order item
  o.order_date,          -- Date the order was placed
  oi.quantity,           -- Quantity of the product ordered
  oi.unit_price,         -- Price per unit of the product
  oi.discount,           -- Discount applied to the order item
  (oi.quantity * oi.unit_price) - oi.discount as line_revenue -- Calculated revenue for the line item
from oi
join o on o.order_id = oi.order_id         -- Join order items to orders
join p on p.product_id = oi.product_id     -- Join order items to products