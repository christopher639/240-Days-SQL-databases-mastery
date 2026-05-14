create
database
shop;
use shop;

create table products(
id int auto_increment primary key,
product_name varchar(100) not null,
quantity int not null,
buying_price decimal(10,2),
selling_price decimal(10,2)
);

insert into products(product_name,quantity,buying_price,selling_price)
values ('pen',5,10.44,15),
		('Calculator',50,1000.44,1500.89),
        ('Rubber',5,9.44,13.90),
        ('Shapener',89,30.94,45.23);
        
select * from products;

select 
id,product_name,
quantity,
buying_price,
selling_price,
buying_price * quantity  as buying_value,
quantity * selling_price as selling_value,
(quantity * selling_price) - (buying_price * quantity ) as expected_Product_profit

from products;

create table sales(
id int auto_increment primary key,
product_id int not null,
quantity int not null,
amount decimal(10,2),
foreign key (product_id) references products(id)
);


insert into sales(product_id,quantity)
values(2,34),
		(1,3),
        (3,3),
        (4,58);
        
        select * from sales;
        
select 
products.id,
products.product_name,
products.selling_price,
sales.quantity,
(products.selling_price* products.quantity) as Amount
from products
inner join sales
on products.id = sales.product_id;


select 
products.id,
products.product_name,
products.selling_price,
products.quantity as Original_quantity,
sales.quantity as sold,
(products.quantity - sales.quantity) as remaining,
(products.selling_price* products.quantity) as Amount

from products
inner join sales
on products.id = sales.product_id;

insert into sales(product_id,quantity)
values(2,14),
		(1,1),
        (3,1),
        (4,18);


select 
products.id,
products.product_name,
products.selling_price,
products.quantity as Original_quantity,
sum(sales.quantity) as sold,
(products.quantity - sum(sales.quantity)) as remaining,
(products.selling_price* sum(sales.quantity)) as Amount
from products
inner join sales
on products.id = sales.product_id
group by 
products.id,
products.product_name,
products.selling_price,
products.quantity;



select 
products.id,
products.product_name,
products.selling_price,
products.quantity as Original_quantity,
sum(sales.quantity) as sold,
(products.quantity - sum(sales.quantity)) as remaining,
(products.selling_price* sum(sales.quantity)) as Amount
from products
inner join sales
on products.id = sales.product_id
group by 
products.id,
products.product_name,
products.selling_price,
products.quantity;























        
        