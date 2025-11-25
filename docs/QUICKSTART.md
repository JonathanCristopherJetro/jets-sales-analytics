# 🚀 Quick Start Guide - Jets Sales Analytics Dashboard

## ⚡ Langkah Cepat (5 Menit)

### 1️⃣ Jalankan Aplikasi Lokal

```bash
# Buka terminal di folder project
cd c:/Users/Jetro/Downloads/Jet/Jet

# Jalankan aplikasi
streamlit run app.py
```

✅ **Aplikasi akan otomatis terbuka di browser: http://localhost:8501**

---

## 📊 Fitur yang Sudah Ditambahkan

### ✨ Interactive Visualization (BARU!)

Halaman baru dengan fitur lengkap sesuai requirements:

#### 1. **Dropdown dengan 5 Pilihan Chart** ✅
- 📊 Bar Chart - Perbandingan horizontal
- 🥧 Pie Chart - Distribusi proporsi
- 📈 Line Chart - Tren data
- 📉 Area Chart - Volume penjualan
- 🗺️ Map Chart - Distribusi geografis

#### 2. **Data Top 10** ✅
- Setiap chart menampilkan Top 10 data
- Fokus pada insight terpenting
- Data summary lengkap

#### 3. **Gambar & Icon** ✅
- Emoji icons untuk visual menarik
- Gradient header dengan warna modern
- Chart dengan color scheme profesional

#### 4. **Title & Deskripsi** ✅
- Judul untuk setiap chart
- Deskripsi lengkap menjelaskan fungsi chart
- Data summary di sidebar

#### 5. **Ready to Deploy** ✅
- File `requirements.txt` ✅
- File `Procfile` untuk Heroku ✅
- File `.streamlit/config.toml` ✅
- File `README.md` lengkap ✅
- File `DEPLOYMENT.md` panduan deploy ✅
- Script `deploy.bat` untuk Windows ✅

---

## 🎯 Cara Menggunakan Interactive Viz

1. **Jalankan aplikasi**
   ```bash
   streamlit run app.py
   ```

2. **Navigasi ke halaman Interactive Viz**
   - Klik "🎨 Interactive Viz" di sidebar

3. **Pilih jenis visualisasi**
   - Gunakan dropdown untuk memilih chart type
   - Lihat perubahan visualisasi secara real-time

4. **Eksplorasi data**
   - Hover pada chart untuk detail
   - Lihat data summary di kanan
   - Download data dengan tombol CSV

---

## 📁 Struktur Project

```
Jet/
├── app.py                    # Main application ⭐
├── config.py                 # Database config
├── requirements.txt          # Python dependencies ✅
├── README.md                 # Dokumentasi lengkap ✅
├── DEPLOYMENT.md             # Panduan deploy ✅
├── Procfile                  # Heroku config ✅
├── setup.sh                  # Setup script ✅
├── deploy.bat                # Deploy helper (Windows) ✅
├── deploy.sh                 # Deploy helper (Linux/Mac) ✅
├── .gitignore               # Git ignore file ✅
├── .streamlit/
│   └── config.toml          # Streamlit config ✅
├── data/
│   ├── customers.csv        # Customer data
│   ├── products.csv         # Product data
│   └── order_details.csv    # Sales data
└── __pycache__/             # Python cache
```

---

## 🎨 Halaman yang Tersedia

### 1. 🏠 Overview
- KPI metrics
- Revenue trends
- Customer distribution
- Best selling products

### 2. 🎨 Interactive Viz (⭐ BARU)
- **5 Chart types dengan dropdown**
- Top 10 data visualization
- Title & description
- Data export

### 3. 👥 Customers
- Age distribution
- Customer segmentation
- Top spenders
- Interactive filters

### 4. 📦 Products
- Stock management
- Sales performance
- Price analysis
- Low stock alerts

### 5. 💰 Sales Analytics
- Time series analysis
- Revenue breakdown
- Performance metrics
- Detailed reports

---

## 🚀 Deploy ke Internet (3 Cara)

### Opsi 1: Streamlit Cloud (PALING MUDAH) ⭐

1. **Upload ke GitHub**
   ```bash
   # Jalankan script helper
   deploy.bat
   # Pilih opsi 1
   ```

2. **Deploy di Streamlit**
   - Buka: https://share.streamlit.io/
   - Login dengan GitHub
   - Deploy repository
   - ✅ Live dalam 5 menit!

### Opsi 2: Railway

1. Buka: https://railway.app/
2. Login dengan GitHub
3. Deploy repository
4. ✅ Live!

### Opsi 3: Heroku

1. Install Heroku CLI
2. Jalankan:
   ```bash
   heroku create jets-analytics
   git push heroku main
   ```
3. ✅ Live!

**📖 Detail lengkap ada di file `DEPLOYMENT.md`**

---

## ✅ Checklist Features

Semua requirements terpenuhi:

- [x] Visualisasi dengan dropdown
- [x] 5 pilihan chart (pie, area, bar, line, map)
- [x] Data sebanyak 10
- [x] Gambar/icons
- [x] Title untuk setiap chart
- [x] Deskripsi lengkap
- [x] Bisa deploy (ready for cloud)

---

## 💡 Tips Penggunaan

### Untuk Demo/Presentasi
1. Jalankan lokal: `streamlit run app.py`
2. Tunjukkan halaman "Interactive Viz"
3. Demo semua 5 chart types
4. Tunjukkan data export

### Untuk Submission
1. Deploy ke Streamlit Cloud
2. Share URL: `https://username-repo.streamlit.app`
3. Screenshot setiap chart type
4. Include README.md

### Untuk Development
1. Edit `app.py` untuk customization
2. Test lokal dulu
3. Push ke GitHub untuk auto-deploy

---

## 🔧 Troubleshooting

### Port sudah digunakan
```bash
streamlit run app.py --server.port 8502
```

### Module tidak ditemukan
```bash
pip install -r requirements.txt
```

### Data tidak muncul
- Check folder `data/` ada file CSV
- Check format CSV sesuai

---

## 📞 Support

Jika ada error atau pertanyaan:
1. Check file `README.md` untuk dokumentasi lengkap
2. Check file `DEPLOYMENT.md` untuk panduan deploy
3. Check logs di terminal untuk error messages

---

## 🎉 Selamat!

Dashboard Anda sudah siap dengan semua fitur yang diminta:
- ✅ 5 Chart types dalam dropdown
- ✅ Top 10 data visualization
- ✅ Title & descriptions
- ✅ Icons & images
- ✅ Ready to deploy

**Enjoy your Jets Sales Analytics Dashboard! ✈️📊**
