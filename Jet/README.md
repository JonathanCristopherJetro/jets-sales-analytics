# ✈️ Jets Sales Analytics Dashboard

![Dashboard Preview](customer-analytics.png)

## 📋 Deskripsi Project

**Jets Sales Analytics Dashboard** adalah aplikasi web interaktif untuk analisis data penjualan dengan berbagai fitur visualisasi. Dashboard ini dibangun menggunakan Streamlit dan menyediakan insights mendalam tentang pelanggan, produk, dan penjualan.

### ✨ Fitur Utama

1. **🎨 Interactive Visualization**
   - Dropdown dengan 5 pilihan chart:
     - 📊 Bar Chart
     - 🥧 Pie Chart
     - 📈 Line Chart
     - 📉 Area Chart
     - 🗺️ Map Chart
   - Data Top 10 untuk setiap visualisasi
   - Deskripsi lengkap untuk setiap chart
   - Export data ke CSV

2. **📊 Business Overview**
   - KPI Metrics real-time
   - Revenue trends
   - Customer distribution
   - Best selling products

3. **👥 Customer Analytics**
   - Age distribution analysis
   - Customer segmentation
   - Top spenders
   - Interactive filters

4. **📦 Product Analytics**
   - Stock management
   - Sales performance
   - Price analysis
   - Low stock alerts

5. **💰 Sales Analytics**
   - Time series analysis
   - Revenue breakdown
   - Performance metrics
   - Detailed reports

## 🚀 Cara Menjalankan Aplikasi

### Prerequisites
- Python 3.8 atau lebih tinggi
- pip (Python package manager)

### Instalasi

1. **Clone atau Download Project**
   ```bash
   cd path/to/Jet
   ```

2. **Install Dependencies**
   ```bash
   pip install -r requirements.txt
   ```

3. **Jalankan Aplikasi**
   ```bash
   streamlit run app.py
   ```

4. **Buka Browser**
   - Aplikasi akan otomatis membuka di browser
   - Atau akses manual: `http://localhost:8501`

## 📦 Dependencies

```
streamlit==1.28.0
pandas==2.1.1
plotly==5.17.0
numpy==1.26.0
```

## 🌐 Deployment ke Cloud

### Deploy ke Streamlit Cloud (GRATIS)

1. **Push ke GitHub**
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git branch -M main
   git remote add origin https://github.com/username/repo-name.git
   git push -u origin main
   ```

2. **Deploy di Streamlit Cloud**
   - Kunjungi: https://share.streamlit.io/
   - Login dengan GitHub
   - Klik "New app"
   - Pilih repository Anda
   - Main file path: `app.py`
   - Klik "Deploy"

3. **Aplikasi Live!**
   - URL: `https://username-repo-name.streamlit.app`

### Deploy ke Heroku

1. **Buat file `Procfile`**
   ```
   web: streamlit run app.py --server.port=$PORT --server.address=0.0.0.0
   ```

2. **Buat file `setup.sh`**
   ```bash
   mkdir -p ~/.streamlit/
   echo "\
   [server]\n\
   headless = true\n\
   port = $PORT\n\
   enableCORS = false\n\
   \n\
   " > ~/.streamlit/config.toml
   ```

3. **Deploy**
   ```bash
   heroku login
   heroku create your-app-name
   git push heroku main
   ```

### Deploy ke Railway

1. Kunjungi: https://railway.app/
2. Login dengan GitHub
3. New Project → Deploy from GitHub
4. Pilih repository
5. Railway otomatis detect Streamlit
6. Deploy!

## 📊 Struktur Data

### customers.csv
- customer_id
- name
- email
- phone
- address
- birthdate

### products.csv
- product_id
- name
- description
- price
- stock

### order_details.csv
- order_id
- order_date
- customer_id
- customer_name
- product_id
- product_name
- quantity
- unit_price
- subtotal

## 🎯 Fitur Interactive Visualization

Dashboard ini memiliki halaman khusus **Interactive Viz** yang menampilkan:

1. **Dropdown Selection** - Pilih dari 5 jenis chart
2. **Top 10 Data** - Fokus pada data teratas
3. **Visual Descriptions** - Penjelasan untuk setiap chart
4. **Data Summary** - Ringkasan statistik
5. **Export Function** - Download data dalam CSV

## 📸 Screenshots

### Overview Dashboard
![Overview](overview.png)

### Customer Analytics
![Customers](customer-analytics.png)

### Product Analytics
![Products](product-analytics.png)

### Sales Analytics
![Sales](sales-analytics.png)

## 🛠️ Teknologi yang Digunakan

- **Frontend Framework**: Streamlit
- **Data Processing**: Pandas, NumPy
- **Visualization**: Plotly Express & Graph Objects
- **Styling**: Custom CSS
- **Data Source**: CSV Files

## 📝 Lisensi

Project ini dibuat untuk keperluan pendidikan dan analisis data.

## 👨‍💻 Developer

Dibuat dengan ❤️ menggunakan Streamlit

---

## 💡 Tips Penggunaan

1. **Filter Data**: Gunakan sidebar untuk filter data berdasarkan kriteria
2. **Export**: Setiap halaman memiliki tombol download untuk export data
3. **Interactive Charts**: Hover pada chart untuk detail informasi
4. **Responsive**: Dashboard responsive untuk berbagai ukuran layar

## 🔧 Troubleshooting

### Error: Module not found
```bash
pip install -r requirements.txt --upgrade
```

### Error: Port already in use
```bash
streamlit run app.py --server.port 8502
```

### Data tidak muncul
- Pastikan folder `data/` berisi file CSV
- Check format data sesuai struktur yang diminta

---

**Selamat Menggunakan Jets Sales Analytics Dashboard! 🚀**
