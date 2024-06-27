select 
a.orderid,
a.orderdate,
a.shipdate,
a.shipmode,
a.ordersellingprice-a.ordercostprice as orderprofit,
a.ordercostprice,
a.ordersellingprice,
c.customername,
c.segment,
c.country,
b.category,
b.productname,
b.subcategory
from {{ ref('raw_orders') }} as a
left join {{ ref('raw_customer') }} as c
on a.customerid=c.customerid
left join {{ ref('raw_product') }} as b
on a.productid=b.productid
