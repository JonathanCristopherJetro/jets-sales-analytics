# 📊 Panduan Generate Data untuk Jets Sales Analytics

## 🎯 Pilihan Generate Data

Anda punya **2 opsi** untuk generate data:

### Opsi 1: Python Script (RECOMMENDED) ⭐
- ✅ Tidak perlu PostgreSQL
- ✅ Cepat dan mudah
- ✅ Langsung generate CSV
- ✅ 100 data customers
- ✅ 100 data products
- ✅ 100 data orders
- ✅ ~400 data order details

### Opsi 2: PostgreSQL Database
- ✅ Untuk yang sudah punya PostgreSQL
- ✅ Data tersimpan di database
- ✅ Export ke CSV
- ✅ Struktur database proper

---

## 🚀 OPSI 1: Generate dengan Python Script (MUDAH)

### Step 1: Pastikan Dependencies Terinstall
```bash
# Sudah terinstall dari requirements.txt
# Jika belum:
pip install pandas numpy
```

### Step 2: Jalankan Script
```bash
cd c:/Users/Jetro/Downloads/Jet/Jet
python generate_data.py
```

### Step 3: Lihat Hasil
```bash
# File CSV akan dibuat di folder data/:
# - data/customers.csv (100 records)
# - data/products.csv (100 records)
# - data/order_details.csv (~400 records)
```

### Step 4: Test Dashboard
```bash
streamlit run app.py
```

---

## 🗄️ OPSI 2: Generate dengan PostgreSQL Database

### Prerequisites
1. PostgreSQL terinstall
2. Database "jets" sudah dibuat
3. Update config di config.py

### Step 1: Buat Database
```sql
-- Di PostgreSQL psql atau pgAdmin
CREATE DATABASE jets;
```

### Step 2: Jalankan Script SQL
```bash
# Via psql
psql -U postgres -d jets -f create_database.sql

# Atau buka di pgAdmin dan execute
```

### Step 3: Export ke CSV (Windows)
**PENTING:** Update path di script SQL sesuai lokasi Anda!

Di file `create_database.sql`, bagian COPY TO, pastikan path sudah benar:
```sql
-- Contoh untuk Windows:
'C:/Users/Jetro/Downloads/Jet/Jet/data/customers.csv'

-- Atau gunakan path relative (jika PostgreSQL support):
'/path/to/data/customers.csv'
```

### Step 4: Jalankan Export
```sql
-- Di psql atau pgAdmin, jalankan bagian EXPORT DATA
-- Atau gunakan query manual:

\COPY customers TO 'data/customers.csv' WITH CSV HEADER;
\COPY products TO 'data/products.csv' WITH CSV HEADER;
\COPY (...) TO 'data/order_details.csv' WITH CSV HEADER;
```

---

## 📊 Struktur Data yang Dihasilkan

### customers.csv (100 records)
```csv
customer_id,name,email,phone,address,birthdate
1,Customer 1,customer1@email.com,081000000001,Jl. Sudirman, Jakarta No. 1,1985-03-15
2,Customer 2,customer2@email.com,081000000002,Jl. Thamrin, Surabaya No. 2,1990-07-22
...
```

### products.csv (100 records)
```csv
product_id,name,description,price,stock
1,Laptop 1 Series,High quality laptop with excellent features,8500000,45
2,Smartphone 1 Pro,High quality smartphone with excellent features,5200000,78
...
```

### order_details.csv (~400 records)
```csv
order_detail_id,order_id,order_date,product_id,product_name,quantity,unit_price,subtotal,customer_id,customer_name
1,1,2024-03-15 10:30:00,25,Monitor 2 Series,2,3500000,7000000,15,Customer 15
2,1,2024-03-15 10:30:00,45,Mouse 3 Gaming,3,400000,1200000,15,Customer 15
...
```

---

## ✅ Verifikasi Data

### Cek File CSV
```bash
# Lihat isi folder data
ls data/

# Hitung baris (Windows PowerShell)
(Get-Content data/customers.csv).Length
(Get-Content data/products.csv).Length
(Get-Content data/order_details.csv).Length

# Atau di bash/cmd
wc -l data/customers.csv
wc -l data/products.csv
wc -l data/order_details.csv
```

### Preview Data dengan Python
```python
import pandas as pd

# Load dan preview
customers = pd.read_csv('data/customers.csv')
products = pd.read_csv('data/products.csv')
orders = pd.read_csv('data/order_details.csv')

print(f"Customers: {len(customers)} records")
print(f"Products: {len(products)} records")
print(f"Order Details: {len(orders)} records")

print("\nCustomers sample:")
print(customers.head())

print("\nProducts sample:")
print(products.head())

print("\nOrder Details sample:")
print(orders.head())
```

---

## 📈 Data Statistics

Setelah generate, Anda akan mendapat:

**Customers:**
- Total: 100 customers
- Age range: 1960-2005 (20-65 tahun)
- 10 kota berbeda di Indonesia

**Products:**
- Total: 100 products
- 20 kategori produk elektronik
- Price range: Rp 100K - Rp 20M
- Stock: 10-100 unit per produk

**Orders:**
- Total: 100 orders
- Date range: 2024-01-01 sampai 2024-12-31
- Random dates & times

**Order Details:**
- Total: ~400 records (3-5 items per order)
- Total Revenue: ~Rp 1-2 Miliar
- Average order value: ~Rp 10-20 Juta

---

## 🎨 Testing Dashboard dengan Data

### 1. Jalankan Dashboard
```bash
streamlit run app.py
```

### 2. Test Setiap Halaman

**Overview:**
- ✅ KPI metrics tampil
- ✅ Charts loaded
- ✅ Top 10 products visible

**Interactive Viz:**
- ✅ Dropdown works
- ✅ Bar chart shows Top 10
- ✅ Pie chart shows distribution
- ✅ Line chart shows trend
- ✅ Area chart works
- ✅ Map chart shows cities
- ✅ Download CSV works

**Customers:**
- ✅ 100 customers loaded
- ✅ Age distribution chart
- ✅ Filters work
- ✅ Search works

**Products:**
- ✅ 100 products loaded
- ✅ Sales analysis works
- ✅ Price analysis works
- ✅ Stock analysis works

**Sales Analytics:**
- ✅ Time series chart
- ✅ Top performers
- ✅ Time analysis
- ✅ Filters work

---

## 🔧 Troubleshooting

### Error: File not found
```
Solution:
1. Pastikan folder data/ ada
2. Jalankan generate_data.py dulu
3. Check path file CSV
```

### Error: Module not found (pandas/numpy)
```bash
Solution:
pip install pandas numpy
```

### PostgreSQL export error
```
Solution:
1. Check PostgreSQL user permissions
2. Update path di script SQL
3. Gunakan absolute path
4. Atau gunakan Python script (Opsi 1)
```

### Data tidak muncul di dashboard
```
Solution:
1. Check CSV files ada di folder data/
2. Check format CSV benar (ada header)
3. Restart streamlit app
4. Clear cache: Ctrl+Shift+R di browser
```

---

## 💡 Tips

### Custom Data Amount
Edit di `generate_data.py`:
```python
# Ganti range untuk jumlah data berbeda
for i in range(1, 101):  # 100 customers
# Jadi
for i in range(1, 201):  # 200 customers
```

### Custom Date Range
```python
start_date = datetime(2024, 1, 1)
end_date = datetime(2024, 12, 31)
# Bisa diganti sesuai kebutuhan
```

### Custom Products
Edit `product_types` list untuk kategori berbeda:
```python
product_types = [
    'Laptop', 'Smartphone', 'Tablet',
    # Tambah kategori baru di sini
]
```

---

## 🚀 Quick Start (Cara Tercepat)

```bash
# 1. Masuk ke folder project
cd c:/Users/Jetro/Downloads/Jet/Jet

# 2. Generate data
python generate_data.py

# 3. Jalankan dashboard
streamlit run app.py

# 4. Buka browser: http://localhost:8501

# 5. Test Interactive Viz page!
```

**⏱️ Total waktu: < 2 menit**

---

## 📋 Checklist

Setelah generate data, pastikan:

- [ ] Folder `data/` ada
- [ ] File `customers.csv` ada (100+ lines)
- [ ] File `products.csv` ada (100+ lines)
- [ ] File `order_details.csv` ada (400+ lines)
- [ ] Dashboard bisa dibuka
- [ ] Semua halaman load tanpa error
- [ ] Interactive Viz page works
- [ ] Charts tampil dengan benar
- [ ] Data download works

---

## ✅ Success!

Jika semua checklist ✅, maka:
- 🎉 Data berhasil di-generate
- 📊 Dashboard siap digunakan
- 🎨 Interactive Viz works
- 🚀 Ready untuk presentasi/deploy

**Selamat! Data Anda siap! 🎊**
