-- importing csv files into the database

DROP TABLE info;

CREATE TABLE info
(
    product_name VARCHAR(100),
    product_id VARCHAR(11) PRIMARY KEY,
    description VARCHAR(700)
);

DROP TABLE finance;

CREATE TABLE finance
(
    product_id VARCHAR(11) PRIMARY KEY,
    listing_price FLOAT,
    sale_price FLOAT,
    discount FLOAT,
    revenue FLOAT
);

DROP TABLE reviews;

CREATE TABLE reviews
(
    product_id VARCHAR(11) PRIMARY KEY,
    rating FLOAT,
    reviews FLOAT
);

DROP TABLE traffic;

CREATE TABLE traffic
(
    product_id VARCHAR(11) PRIMARY KEY,
    last_visited TIMESTAMP
);

DROP TABLE brands;

CREATE TABLE brands
(
    product_id VARCHAR(11) PRIMARY KEY,
    brand VARCHAR(7)
);

copy info FROM 'D:\Projects\Optimizing Online Sports Retail Revenue\Dataset\info.csv' DELIMITER ',' CSV HEADER;
copy finance FROM 'D:\Projects\Optimizing Online Sports Retail Revenue\Dataset\finance.csv' DELIMITER ',' CSV HEADER;
copy reviews FROM 'D:\Projects\Optimizing Online Sports Retail Revenue\Dataset\reviews.csv' DELIMITER ',' CSV HEADER;
copy traffic FROM 'D:\Projects\Optimizing Online Sports Retail Revenue\Dataset\traffic.csv' DELIMITER ',' CSV HEADER;
copy brands FROM 'D:\Projects\Optimizing Online Sports Retail Revenue\Dataset\brands.csv' DELIMITER ',' CSV HEADER;

-- retrieving all the tables
Select * from brands;
select * from info;
select * from finance;
select * from reviews;
select * from traffic;

-- 1. Counting missing values
select count(*) as total_rows,
count(info.description) as count_description, count(finance.listing_price) as count_listing_price,
count(traffic.last_visited) as count_last_visited
from info
inner join traffic
on traffic.product_id = info.product_id
inner join finance
on finance.product_id = info.product_id

-- 2. Nike vs Adidas pricing
select brands.brand, cast(finance.listing_price as INTEGER), count(finance.product_id)
from brands
inner join finance
on finance.product_id = brands.product_id
where finance.listing_price > 0
group by brands.brand, finance.listing_price
order by finance.listing_price DESC

-- 3. labeling price ranges
select b.brand, count(f.*), sum(f.revenue) as total_revenue,
case when f.listing_price < 42 then 'Budget'
	when f.listing_price >=42 and f.listing_price <74 then 'Average'
	when f.listing_price>=74 and f.listing_price < 129 then 'Expensive'
	else 'Elite' end as price_category
from finance as f
inner join brands as b
	on f.product_id = b.product_id
where b.brand is not null
GROUP By b.brand, price_category
order BY total_revenue DESC;

-- 4. Average discount by brand
select b.brand,
avg(discount) * 100 as average_discount
from finance f
inner join brands as b
	on f.product_id = b.product_id
where b.brand is not null
group by b.brand
order by average_discount;

-- 5. Correlation between revenue and reviews
select corr(reviews.reviews, revenue) as review_revenue_corr
from reviews
inner join finance
on finance.product_id = reviews.product_id

-- 6. Ratings and reviews by product description length
select TRUNC(length(i.description), -2) as description_length,
	round(AVG(r.rating::numeric), 2) as average_rating
from info as i
inner join reviews as r
	on i.product_id = r.product_id
where i.description is not null
group by description_length
order by description_length;

-- 7. Reviews by month and brand
select b.brand, DATE_PART('month', t.last_visited) as month, count(r.*) as num_reviews
from brands as b
inner join traffic as t
	on b.product_id = t.product_id
inner join reviews as r
	on r.product_id = t.product_id
group by b.brand, month
having b.brand is not null
	and DATE_PART('month', t.last_visited) is not null
order by b.brand, month;

-- 8. Footwear product performance
with footwear as
(
	select i.description, f.revenue
	from info as i
	inner join finance as f
		on f.product_id = i.product_id
	where i.description ILIKE '%shoe%'
		or i.description ILIKE '%trainer%'
		or i.description ILIKE '%foot%'
		and i.description is not null
)
select count(*) as num_footwear_products,
	percentile_disc(0.5) within group (order by revenue) as median_footwear_revenue
	from footwear;

-- 9. Clothing product performance
with footwear as
(
	select i.description, f.revenue
	from info as i
	inner join finance as f
		on f.product_id = i.product_id
	where i.description ILIKE '%shoe%'
		or i.description ILIKE '%trainer%'
		or i.description ILIKE '%foot%'
		and i.description is not null
)
select count(i.*) as num_clothing_prodcuts,
	percentile_disc(0.5) within group(order by f.revenue) as median_clothing_revenue
from info as i
inner join finance as f on
	f.product_id = i.product_id
where i.description not in (Select description from footwear);