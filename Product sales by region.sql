-- The dataset

SELECT *
FROM  product_sales_region
; 


-- Correcting date column error while querying

ALTER TABLE 
	product_sales_region 
ADD COLUMN Delivery_date_proper DATE
;
	
    
UPDATE product_sales_region
SET order_date_proper = STR_TO_DATE(`Date`, '%d-%m-%Y')
;


-- Checking whether the change made works

SELECT 
    COUNT(*) AS total_rows,
    COUNT(STR_TO_DATE(`Date`, '%d-%m-%Y')) AS successfully_converted,
    COUNT(*) - COUNT(STR_TO_DATE(`Date`, '%d-%m-%Y')) AS failed_to_convert
FROM product_sales_region
;


-- Removing the old date column renaming the new one

ALTER TABLE product_sales_region DROP COLUMN `Date`
;


ALTER TABLE product_sales_region 
RENAME COLUMN order_date_proper TO `OrderDate`
;


-- Changing the column position

ALTER TABLE product_sales_region
MODIFY COLUMN OrderDate DATE AFTER ShippingCost
;


-- Average days it takes for product delivery

SELECT 
    AVG(DATEDIFF(DeliveryDate, OrderDate)) AS avg_delivery_days
FROM product_sales_region
WHERE DeliveryDate IS NOT NULL 
  AND OrderDate IS NOT NULL
;
  
  
  -- Total products sold across stores
  
SELECT 
	SUM(Quantity) AS total_products_sold
FROM product_sales_region
;
	

-- Adding a new calculated column for total product cost to include the shippment cost 

ALTER TABLE product_sales_region
ADD COLUMN total_product_cost INT
;


UPDATE product_sales_region
SET total_product_cost = ROUND((TotalPrice + ShippingCost), 2)
;


ALTER TABLE product_sales_region
MODIFY COLUMN total_product_cost INT AFTER ShippingCost  
;


-- Total sales amount for years 2023-2025

SELECT
	SUM(total_product_cost) AS total_product_cost
FROM product_sales_region
;

SELECT 
	YEAR(OrderDate) AS Year,
    StoreLocation,
    ROUND(AVG(total_product_cost), 2) AS average_sale_price
FROM product_sales_region
WHERE YEAR(OrderDate) IN (2023, 2024)
GROUP BY 1, 2
;


-- Calculating year-over-year changes in growth percentage          

SELECT 
    YEAR(OrderDate) AS sales_year,
    SUM(total_product_cost) AS total_sales,
    LAG(SUM(total_product_cost)) OVER (ORDER BY YEAR(OrderDate)) AS prev_year_sales,
    
    ROUND(
        (SUM(total_product_cost) - LAG(SUM(total_product_cost)) OVER (ORDER BY YEAR(OrderDate))) /
        LAG(SUM(total_product_cost)) OVER (ORDER BY YEAR(OrderDate)) * 100,
        2
    ) AS yoy_growth_percentage

FROM product_sales_region
WHERE OrderDate IS NOT NULL
GROUP BY sales_year
ORDER BY sales_year
;


-- Total products returned

SELECT
	StoreLocation,
	SUM(Returned) Total_products_returned
FROM product_sales_region
GROUP BY 1
;


-- Calculating total unit cost 

SELECT 
	YEAR(OrderDate) Year,
	ROUND(SUM(UnitPrice), 2) AS Total_unit_price 
FROM product_sales_region
GROUP BY 1 
;


-- Total quantity sold and total cost by region

SELECT
	Region,
	SUM(Quantity) AS total_quantity,
	SUM(total_product_cost) AS total_cost
FROM product_sales_region
GROUP BY 1
ORDER BY 2 DESC
;
	

-- Wholesale and retail sales distribution

SELECT
	CustomerType,
    SUM(Quantity) AS total_sales
FROM product_sales_region
GROUP BY 1
;


-- Total sales of products in different regions

SELECT
	Region,
    Product,
    SUM(Quantity) AS total_sales
FROM product_sales_region
GROUP BY 1, 2
ORDER BY 3 DESC 
;


-- Total product quantities sold via different stores

SELECT 
	StoreLocation,
    YEAR(OrderDate) Year,
    SUM(Quantity) AS total_quatities_sold
FROM product_sales_region
GROUP BY 1, 2
ORDER BY 2, 3 DESC
;


-- Distribution of products sold from different store locations

SELECT
	StoreLocation,
  --  YEAR(OrderDate) AS Year,
    Product,
    COUNT(Product) AS total_sold
FROM product_sales_region
GROUP BY 1, 2
ORDER BY 3 DESC
;


-- Total amount of the discount offered to the customers using promotion codes

SELECT
	YEAR(OrderDate) Year,
    StoreLocation,
    Promotion,
	ROUND(SUM((Quantity * UnitPrice) - TotalPrice), 2) AS Total_discount_given
FROM product_sales_region
GROUP BY 1, 2, 3
ORDER BY 4 DESC
;


-- Total discounts cost

SELECT
	YEAR(OrderDate) Year,
    StoreLocation,
	ROUND(SUM((Quantity * UnitPrice) - TotalPrice), 2) AS Total_discount_given
FROM product_sales_region
GROUP BY 1, 2 
ORDER BY 3 DESC
;

-- Total number of different discounts on different products purchased by customers using promotional codes

SELECT 
	Product,
    Promotion,
	COUNT(Promotion) Count
FROM  product_sales_region
WHERE Promotion IS NOT NULL
GROUP BY 1, 2
ORDER BY 3 DESC
;


-- Total number of promotional codes used by customers in different stores

SELECT
-- 	YEAR(OrderDate) Year,
	StoreLocation,
    COUNT(Promotion) promotional_code_usage
FROM product_sales_region
GROUP BY 1
ORDER BY 2 DESC
;
