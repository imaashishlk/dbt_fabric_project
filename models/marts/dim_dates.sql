with d as (select distinct order_date from {{ ref('stg_orders') }})
select
  order_date as date,
  datepart(year, order_date) as year,
  datepart(month, order_date) as month,
  datename(month, order_date) as month_name,
  datename(weekday, order_date) as weekday_name
from d
