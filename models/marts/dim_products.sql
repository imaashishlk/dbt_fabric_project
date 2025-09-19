select product_id, sku, product_name, category, unit_price
from {{ ref('stg_products') }}