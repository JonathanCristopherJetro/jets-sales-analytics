-- =====================================================
-- JETS SALES ANALYTICS DATABASE
-- Script untuk membuat database dengan 100 data per tabel
-- =====================================================

-- Hapus tabel jika sudah ada (opsional)
DROP TABLE IF EXISTS order_details CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS customers CASCADE;

-- =====================================================
-- TABEL CUSTOMERS (100 data)
-- =====================================================
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address TEXT,
    birthdate DATE
);

-- Insert 100 customers
INSERT INTO customers (name, email, phone, address, birthdate)
SELECT 
    'Customer ' || i,
    'customer' || i || '@email.com',
    '08' || LPAD((1000000000 + i)::TEXT, 10, '0'),
    CASE (i % 10)
        WHEN 0 THEN 'Jl. Sudirman No. ' || i || ', Jakarta'
        WHEN 1 THEN 'Jl. Thamrin No. ' || i || ', Surabaya'
        WHEN 2 THEN 'Jl. Malioboro No. ' || i || ', Bandung'
        WHEN 3 THEN 'Jl. Gajah Mada No. ' || i || ', Yogyakarta'
        WHEN 4 THEN 'Jl. Diponegoro No. ' || i || ', Malang'
        WHEN 5 THEN 'Jl. Ahmad Yani No. ' || i || ', Semarang'
        WHEN 6 THEN 'Jl. Gatot Subroto No. ' || i || ', Medan'
        WHEN 7 THEN 'Jl. Pahlawan No. ' || i || ', Padang'
        WHEN 8 THEN 'Jl. Veteran No. ' || i || ', Makassar'
        ELSE 'Jl. Sunset Road No. ' || i || ', Denpasar'
    END,
    DATE '1960-01-01' + (RANDOM() * 20000)::INTEGER
FROM generate_series(1, 100) AS i;

-- =====================================================
-- TABEL PRODUCTS (100 data)
-- =====================================================
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    description TEXT,
    price DECIMAL(12, 2) NOT NULL,
    stock INTEGER NOT NULL DEFAULT 0
);

-- Insert 100 products dengan berbagai kategori
INSERT INTO products (name, description, price, stock)
SELECT 
    CASE (i % 20)
        WHEN 0 THEN 'Laptop ' || (i/20 + 1) || ' Series'
        WHEN 1 THEN 'Smartphone ' || (i/20 + 1) || ' Pro'
        WHEN 2 THEN 'Tablet ' || (i/20 + 1) || ' Air'
        WHEN 3 THEN 'Headphone ' || (i/20 + 1) || ' Max'
        WHEN 4 THEN 'Smartwatch ' || (i/20 + 1) || ' Elite'
        WHEN 5 THEN 'Camera ' || (i/20 + 1) || ' DSLR'
        WHEN 6 THEN 'Printer ' || (i/20 + 1) || ' LaserJet'
        WHEN 7 THEN 'Monitor ' || (i/20 + 1) || ' 4K'
        WHEN 8 THEN 'Keyboard ' || (i/20 + 1) || ' Mechanical'
        WHEN 9 THEN 'Mouse ' || (i/20 + 1) || ' Gaming'
        WHEN 10 THEN 'Speaker ' || (i/20 + 1) || ' Bluetooth'
        WHEN 11 THEN 'Charger ' || (i/20 + 1) || ' Fast Charge'
        WHEN 12 THEN 'Power Bank ' || (i/20 + 1) || ' 20000mAh'
        WHEN 13 THEN 'USB Cable ' || (i/20 + 1) || ' Type-C'
        WHEN 14 THEN 'Hard Disk ' || (i/20 + 1) || ' 1TB'
        WHEN 15 THEN 'SSD ' || (i/20 + 1) || ' NVMe'
        WHEN 16 THEN 'RAM ' || (i/20 + 1) || ' 16GB'
        WHEN 17 THEN 'Graphics Card ' || (i/20 + 1) || ' RTX'
        WHEN 18 THEN 'Motherboard ' || (i/20 + 1) || ' Gaming'
        ELSE 'Processor ' || (i/20 + 1) || ' i7'
    END,
    'High quality electronics product with excellent features and warranty',
    (RANDOM() * 19000000 + 1000000)::DECIMAL(12, 2),
    (RANDOM() * 100 + 10)::INTEGER
FROM generate_series(1, 100) AS i;

-- =====================================================
-- TABEL ORDERS (100 data)
-- =====================================================
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(customer_id),
    order_date TIMESTAMP NOT NULL,
    total_amount DECIMAL(12, 2) NOT NULL DEFAULT 0
);

-- Insert 100 orders dengan tanggal random dalam 1 tahun terakhir
INSERT INTO orders (customer_id, order_date, total_amount)
SELECT 
    (RANDOM() * 99 + 1)::INTEGER,
    TIMESTAMP '2024-01-01 00:00:00' + 
        (RANDOM() * 365 * 24 * 60 * 60)::INTEGER * INTERVAL '1 second',
    0  -- Will be updated after order_details
FROM generate_series(1, 100) AS i;

-- =====================================================
-- TABEL ORDER_DETAILS (300-500 data)
-- Rata-rata 3-5 items per order
-- =====================================================
CREATE TABLE order_details (
    order_detail_id SERIAL PRIMARY KEY,
    order_id INTEGER REFERENCES orders(order_id),
    product_id INTEGER REFERENCES products(product_id),
    quantity INTEGER NOT NULL,
    unit_price DECIMAL(12, 2) NOT NULL,
    subtotal DECIMAL(12, 2) NOT NULL
);

-- Insert 400 order details (rata-rata 4 items per order)
INSERT INTO order_details (order_id, product_id, quantity, unit_price, subtotal)
SELECT 
    (RANDOM() * 99 + 1)::INTEGER AS order_id,
    (RANDOM() * 99 + 1)::INTEGER AS product_id,
    (RANDOM() * 5 + 1)::INTEGER AS quantity,
    p.price AS unit_price,
    (RANDOM() * 5 + 1)::INTEGER * p.price AS subtotal
FROM generate_series(1, 400) AS i,
     LATERAL (SELECT price FROM products WHERE product_id = (RANDOM() * 99 + 1)::INTEGER LIMIT 1) AS p;

-- Update subtotal yang benar berdasarkan quantity * unit_price
UPDATE order_details od
SET subtotal = od.quantity * od.unit_price;

-- Update total_amount di tabel orders
UPDATE orders o
SET total_amount = (
    SELECT COALESCE(SUM(subtotal), 0)
    FROM order_details
    WHERE order_id = o.order_id
);

-- =====================================================
-- EXPORT DATA KE CSV
-- =====================================================
-- Untuk export ke CSV, jalankan query berikut:

-- Export customers
COPY (
    SELECT customer_id, name, email, phone, address, birthdate
    FROM customers
    ORDER BY customer_id
) TO 'C:/Users/Jetro/Downloads/Jet/Jet/data/customers.csv' 
WITH (FORMAT CSV, HEADER true, DELIMITER ',', ENCODING 'UTF8');

-- Export products
COPY (
    SELECT product_id, name, description, price, stock
    FROM products
    ORDER BY product_id
) TO 'C:/Users/Jetro/Downloads/Jet/Jet/data/products.csv' 
WITH (FORMAT CSV, HEADER true, DELIMITER ',', ENCODING 'UTF8');

-- Export order_details dengan join ke customers dan products
COPY (
    SELECT 
        od.order_detail_id,
        od.order_id,
        o.order_date,
        od.product_id,
        p.name AS product_name,
        od.quantity,
        od.unit_price,
        od.subtotal,
        o.customer_id,
        c.name AS customer_name
    FROM order_details od
    JOIN orders o ON od.order_id = o.order_id
    JOIN products p ON od.product_id = p.product_id
    JOIN customers c ON o.customer_id = c.customer_id
    ORDER BY o.order_date DESC
) TO 'C:/Users/Jetro/Downloads/Jet/Jet/data/order_details.csv' 
WITH (FORMAT CSV, HEADER true, DELIMITER ',', ENCODING 'UTF8');

-- =====================================================
-- QUERY UNTUK VERIFIKASI DATA
-- =====================================================

-- Cek jumlah data per tabel
SELECT 'customers' AS table_name, COUNT(*) AS total_records FROM customers
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'order_details', COUNT(*) FROM order_details;

-- Preview customers
SELECT * FROM customers LIMIT 10;

-- Preview products
SELECT * FROM products LIMIT 10;

-- Preview orders dengan customer name
SELECT 
    o.order_id,
    o.order_date,
    c.name AS customer_name,
    o.total_amount
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
ORDER BY o.order_date DESC
LIMIT 10;

-- Preview order_details lengkap
SELECT 
    od.order_detail_id,
    od.order_id,
    o.order_date,
    c.name AS customer_name,
    p.name AS product_name,
    od.quantity,
    od.unit_price,
    od.subtotal
FROM order_details od
JOIN orders o ON od.order_id = o.order_id
JOIN products p ON od.product_id = p.product_id
JOIN customers c ON o.customer_id = c.customer_id
ORDER BY o.order_date DESC
LIMIT 20;

-- Statistik penjualan
SELECT 
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(od.order_detail_id) AS total_items,
    SUM(od.subtotal) AS total_revenue,
    AVG(od.subtotal) AS avg_item_value,
    COUNT(DISTINCT o.customer_id) AS unique_customers,
    COUNT(DISTINCT od.product_id) AS products_sold
FROM order_details od
JOIN orders o ON od.order_id = o.order_id;

-- Top 10 products by revenue
SELECT 
    p.name AS product_name,
    SUM(od.quantity) AS total_quantity,
    SUM(od.subtotal) AS total_revenue
FROM order_details od
JOIN products p ON od.product_id = p.product_id
GROUP BY p.name
ORDER BY total_revenue DESC
LIMIT 10;

-- Top 10 customers by spending
SELECT 
    c.name AS customer_name,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(od.subtotal) AS total_spending
FROM order_details od
JOIN orders o ON od.order_id = o.order_id
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.name
ORDER BY total_spending DESC
LIMIT 10;

-- Revenue by month
SELECT 
    TO_CHAR(o.order_date, 'YYYY-MM') AS month,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(od.subtotal) AS revenue
FROM order_details od
JOIN orders o ON od.order_id = o.order_id
GROUP BY TO_CHAR(o.order_date, 'YYYY-MM')
ORDER BY month;
