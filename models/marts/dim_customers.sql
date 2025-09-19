select
  c.customer_id,
  concat(c.first_name, ' ', c.last_name) as customer_name,
  c.country,
  c.city,
  min(o.order_date) as first_order_date
from {{ ref('stg_customers') }} c
left join {{ ref('stg_orders') }} o 
  on c.customer_id = o.customer_id
group by 
  c.customer_id, 
  c.first_name, 
  c.last_name, 
  c.country, 
  c.city
