with src as (
    select * FROM {{ ref('products') }}
)
select
    cast(product_id as int) as product_id,
    upper(sku) as sku,
    product_name,
    category,
    cast(unit_price as decimal(10, 2)) as unit_price
from src