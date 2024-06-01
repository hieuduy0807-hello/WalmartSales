select *
from walmart.sales;

CREATE TABLE walmart.sales_stagging
LIKE walmart.sales;

Insert walmart.sales_stagging
select *
from walmart.sales;

-- 1. Remove duplicates 
select *,
row_number() over (
partition by 'Invoice ID',Branch,City,'Customer type',Gender,'Product line','Unit Price',Quantity,'Tax5%',Total,'Date','Time',Payment,cogs,'gross margin percentage','gross income',rating) as row_num
from walmart.sales_stagging;

With duplicate_cte as 
(
select *,
row_number() over (
partition by 'Invoice ID',Branch,City,'Customer type',Gender,'Product line','Unit Price',Quantity,'Tax5%',Total,'Date','Time',Payment,cogs,'gross margin percentage','gross income',rating) as row_num
from walmart.sales_stagging
)
select *
from duplicate_cte
where row_num > 1;


