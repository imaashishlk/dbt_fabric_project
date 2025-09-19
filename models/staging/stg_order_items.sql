with src as (
    select * from {{ ref('order_items') }}
)
select
  cast(order_item_id as int) as order_item_id,
  cast(order_id as int)      as order_id,
  cast(customer_id as int)   as customer_id, -- denormalized, okay
  cast(product_id as int)    as product_id,
  cast(quantity as int)      as quantity,
  cast(unit_price as decimal(18,2)) as unit_price,
  cast(discount as decimal(18,2))   as discount
from src
