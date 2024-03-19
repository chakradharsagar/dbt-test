{{ config(materialized='view') }}

with source_data as (

   select * 
   from {{ source('democlient_tf', 'ORDERS') }} orders
   join {{ source('democlient_tf', 'CUSTOMER') }} cust
   on orders.O_CUSTKEY = cust.C_CUSTKEY

)

select *
from source_data limit 100