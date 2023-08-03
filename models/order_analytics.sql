with orders as (
    select 
    order_timestamp,
    quantity,
    price_per_unit
    from TOOY_DEMO_DB.PROD_REPL.ORDERS
),
final as (
    select date_trunc(day, order_timestamp) as day_of_order,
    sum(quantity * price_per_unit) as total_order_amount
    from orders
    group by 1
    order by 1
)

select * from final