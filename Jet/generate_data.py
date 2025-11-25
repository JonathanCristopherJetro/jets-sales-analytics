"""
Script Python untuk Generate Data CSV
Alternatif jika tidak menggunakan PostgreSQL
Run: python generate_data.py
"""

import pandas as pd
import numpy as np
from datetime import datetime, timedelta
import random

print("🚀 Generating data for Jets Sales Analytics Dashboard...")

# Set seed untuk reproducibility
np.random.seed(42)
random.seed(42)

# =====================================================
# GENERATE CUSTOMERS DATA (100 records)
# =====================================================
print("📊 Generating customers data...")

cities = [
    'Jl. Sudirman, Jakarta',
    'Jl. Thamrin, Surabaya',
    'Jl. Malioboro, Bandung',
    'Jl. Gajah Mada, Yogyakarta',
    'Jl. Diponegoro, Malang',
    'Jl. Ahmad Yani, Semarang',
    'Jl. Gatot Subroto, Medan',
    'Jl. Pahlawan, Padang',
    'Jl. Veteran, Makassar',
    'Jl. Sunset Road, Denpasar'
]

customers_data = []
for i in range(1, 101):
    customer_id = i
    name = f'Customer {i}'
    email = f'customer{i}@email.com'
    phone = f'08{str(1000000000 + i).zfill(10)}'
    address = f'{cities[i % 10]} No. {i}'
    
    # Random birthdate between 1960 and 2005
    start_date = datetime(1960, 1, 1)
    end_date = datetime(2005, 12, 31)
    days_between = (end_date - start_date).days
    random_days = random.randint(0, days_between)
    birthdate = start_date + timedelta(days=random_days)
    
    customers_data.append({
        'customer_id': customer_id,
        'name': name,
        'email': email,
        'phone': phone,
        'address': address,
        'birthdate': birthdate.strftime('%Y-%m-%d')
    })

df_customers = pd.DataFrame(customers_data)
print(f"✅ Generated {len(df_customers)} customers")

# =====================================================
# GENERATE PRODUCTS DATA (100 records)
# =====================================================
print("📊 Generating products data...")

product_types = [
    'Laptop', 'Smartphone', 'Tablet', 'Headphone', 'Smartwatch',
    'Camera', 'Printer', 'Monitor', 'Keyboard', 'Mouse',
    'Speaker', 'Charger', 'Power Bank', 'USB Cable', 'Hard Disk',
    'SSD', 'RAM', 'Graphics Card', 'Motherboard', 'Processor'
]

products_data = []
for i in range(1, 101):
    product_id = i
    product_type = product_types[i % 20]
    series = (i // 20) + 1
    name = f'{product_type} {series} Series'
    description = f'High quality {product_type.lower()} with excellent features and warranty'
    
    # Price based on product type
    base_prices = {
        'Laptop': 8000000, 'Smartphone': 5000000, 'Tablet': 3000000,
        'Headphone': 500000, 'Smartwatch': 2000000, 'Camera': 7000000,
        'Printer': 2500000, 'Monitor': 3500000, 'Keyboard': 800000,
        'Mouse': 400000, 'Speaker': 1500000, 'Charger': 150000,
        'Power Bank': 300000, 'USB Cable': 100000, 'Hard Disk': 1200000,
        'SSD': 1800000, 'RAM': 1000000, 'Graphics Card': 6000000,
        'Motherboard': 4000000, 'Processor': 5500000
    }
    
    base_price = base_prices.get(product_type, 1000000)
    price = base_price + random.randint(-500000, 2000000)
    stock = random.randint(10, 100)
    
    products_data.append({
        'product_id': product_id,
        'name': name,
        'description': description,
        'price': price,
        'stock': stock
    })

df_products = pd.DataFrame(products_data)
print(f"✅ Generated {len(df_products)} products")

# =====================================================
# GENERATE ORDERS DATA (100 records)
# =====================================================
print("📊 Generating orders data...")

orders_data = []
start_date = datetime(2024, 1, 1)
end_date = datetime(2024, 12, 31)

for i in range(1, 101):
    order_id = i
    customer_id = random.randint(1, 100)
    
    # Random date in 2024
    days_between = (end_date - start_date).days
    random_days = random.randint(0, days_between)
    random_hours = random.randint(0, 23)
    random_minutes = random.randint(0, 59)
    
    order_date = start_date + timedelta(days=random_days, hours=random_hours, minutes=random_minutes)
    
    orders_data.append({
        'order_id': order_id,
        'customer_id': customer_id,
        'order_date': order_date,
        'total_amount': 0  # Will be calculated from order_details
    })

df_orders = pd.DataFrame(orders_data)
print(f"✅ Generated {len(df_orders)} orders")

# =====================================================
# GENERATE ORDER_DETAILS DATA (400 records)
# =====================================================
print("📊 Generating order details data...")

order_details_data = []
order_detail_id = 1

for order in orders_data:
    # Each order has 3-5 items
    num_items = random.randint(3, 5)
    order_total = 0
    
    for _ in range(num_items):
        product_id = random.randint(1, 100)
        product = df_products[df_products['product_id'] == product_id].iloc[0]
        
        quantity = random.randint(1, 5)
        unit_price = product['price']
        subtotal = quantity * unit_price
        order_total += subtotal
        
        order_details_data.append({
            'order_detail_id': order_detail_id,
            'order_id': order['order_id'],
            'order_date': order['order_date'],
            'product_id': product_id,
            'product_name': product['name'],
            'quantity': quantity,
            'unit_price': unit_price,
            'subtotal': subtotal,
            'customer_id': order['customer_id'],
            'customer_name': df_customers[df_customers['customer_id'] == order['customer_id']].iloc[0]['name']
        })
        
        order_detail_id += 1
    
    # Update order total_amount
    df_orders.loc[df_orders['order_id'] == order['order_id'], 'total_amount'] = order_total

df_order_details = pd.DataFrame(order_details_data)
print(f"✅ Generated {len(df_order_details)} order details")

# =====================================================
# SAVE TO CSV
# =====================================================
print("\n💾 Saving data to CSV files...")

# Create data folder if not exists
import os
data_folder = 'data'
if not os.path.exists(data_folder):
    os.makedirs(data_folder)
    print(f"📁 Created folder: {data_folder}")

# Save customers
df_customers.to_csv(f'{data_folder}/customers.csv', index=False, encoding='utf-8')
print(f"✅ Saved customers.csv ({len(df_customers)} records)")

# Save products
df_products.to_csv(f'{data_folder}/products.csv', index=False, encoding='utf-8')
print(f"✅ Saved products.csv ({len(df_products)} records)")

# Save order_details
df_order_details.to_csv(f'{data_folder}/order_details.csv', index=False, encoding='utf-8')
print(f"✅ Saved order_details.csv ({len(df_order_details)} records)")

# =====================================================
# STATISTICS
# =====================================================
print("\n📊 DATA STATISTICS:")
print("=" * 60)
print(f"Total Customers:      {len(df_customers)}")
print(f"Total Products:       {len(df_products)}")
print(f"Total Orders:         {len(df_orders)}")
print(f"Total Order Details:  {len(df_order_details)}")
print(f"Total Revenue:        Rp {df_order_details['subtotal'].sum():,.0f}")
print(f"Average Order Value:  Rp {df_orders['total_amount'].mean():,.0f}")
print(f"Total Items Sold:     {df_order_details['quantity'].sum():,}")
print("=" * 60)

print("\n🔝 TOP 10 PRODUCTS BY REVENUE:")
top_products = df_order_details.groupby('product_name')['subtotal'].sum().sort_values(ascending=False).head(10)
for idx, (product, revenue) in enumerate(top_products.items(), 1):
    print(f"{idx:2d}. {product:30s} - Rp {revenue:,.0f}")

print("\n🔝 TOP 10 CUSTOMERS BY SPENDING:")
top_customers = df_order_details.groupby('customer_name')['subtotal'].sum().sort_values(ascending=False).head(10)
for idx, (customer, spending) in enumerate(top_customers.items(), 1):
    print(f"{idx:2d}. {customer:20s} - Rp {spending:,.0f}")

print("\n✅ Data generation complete!")
print("📁 Files saved in 'data/' folder")
print("🚀 You can now run: streamlit run app.py")
