select 
    ID as payment_id,
    ORDERID as order_id,
    Paymentmethod as Payment_method,
    status as payment_status,
    amount/100 as payment_amount,
    created as created_date,
    _batched_at as updated_at
from raw.stripe.payment