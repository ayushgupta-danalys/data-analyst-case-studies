create table supply(
Product_ID	varchar(50),
Product_Name	varchar(50),
Category	varchar(30),
Warehouse	varchar(40),
Location	varchar(30),
Quantity	varchar(30),
Price	varchar(30),
Supplier	varchar(30),
stock_status	varchar(40),
Last_Restocked varchar(40)
);



load data local infile "C:/Users/ayush kumar gupta/OneDrive/Desktop/warehouse_inventory_dirty.csv"
into table supply
fields terminated by ','
enclosed by'"'
lines terminated by '\n'
ignore 1 rows;

select*from supply;

update supply 
set Category= 
case
when lower(trim(product_name))in('gadget y' ,'widget b') then 'Cloths'
when lower(trim(product_name))in('gadget z','widget a' ) then 'Toys'
when lower(trim(product_name))='widget c' then 'Electronic'
when lower(trim(product_name))='gadget x'  then 'Furniture'
else null end ;


update supply
set Quantity=200
where Quantity="two hundred";

alter table supply
add column Total_inventory decimal(10,2);

update  supply
set Total_inventory=
case when Quantity="NaN" or Price="NaN" then null
else
Quantity*Price end;

-- Total inventory value
select sum(Total_inventory) from supply;

-- Warehouse-wise stock value
select Warehouse,sum(Total_inventory) as total_inventory
from supply
group by Warehouse ;

-- Category-wise breakdown
select Category,sum(Total_inventory) as total_inventory
from supply
group by Category
order by total_inventory desc;

-- Stock status analysis
select stock_status,count(*) as stock_count,
round(count(*)*100.0/sum(count(*))over(),2)as pct
from supply
group by stock_status;


-- Supplier analysis
select Supplier , round(count(
case when stock_status = 'Out of Stock' then 1 end) * 100.0 / count(*),2) as out_of_stock_rate
from supply
group by supplier
order by out_of_stock_rate desc;


-- Restock recency
select warehouse,category,
min(str_to_date(Last_Restocked, '%d-%m-%Y')) as last_restocked
from supply
where Last_Restocked <> 'NaN'
group by warehouse, category
order by last_restocked asc;




