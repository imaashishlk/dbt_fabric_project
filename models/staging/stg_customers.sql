with src as (
    select * from {{ ref('customers') }}
)
select
    cast(customer_id as int) AS customer_id,
    first_name,
    last_name,
    lower(email) AS email,
    country,
    city
from src
