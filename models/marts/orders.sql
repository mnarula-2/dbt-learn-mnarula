with orders as (
    select * from {{ ref('stg_orders') }}
),
payments as (
    select * from {{ ref('stg_payments') }}
),
final as (
    select 
        o.order_id,
        o.customer_id,
        o.order_date,
        sum(payment_amount) as amount
    from orders o
    join payments on o.order_id = payments.order_id
    where payments.payment_status = 'success'
    group by o.order_id,       o.customer_id, o.order_date
)

select * from final

