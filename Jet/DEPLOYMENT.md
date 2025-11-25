# 🚀 Panduan Deploy Jets Sales Analytics Dashboard

## 📋 Daftar Isi
1. [Deploy ke Streamlit Cloud](#1-deploy-ke-streamlit-cloud-recommended)
2. [Deploy ke Railway](#2-deploy-ke-railway)
3. [Deploy ke Heroku](#3-deploy-ke-heroku)
4. [Deploy ke Render](#4-deploy-ke-render)

---

## 1. Deploy ke Streamlit Cloud (RECOMMENDED) ⭐

### Keuntungan:
- ✅ **GRATIS** untuk public apps
- ✅ Terintegrasi langsung dengan GitHub
- ✅ Auto-deploy saat push ke GitHub
- ✅ Mudah dan cepat
- ✅ Khusus untuk Streamlit apps

### Langkah-langkah:

#### A. Persiapan Repository GitHub

1. **Install Git** (jika belum ada)
   ```bash
   # Check apakah Git sudah terinstall
   git --version
   ```

2. **Buat Repository di GitHub**
   - Login ke https://github.com
   - Klik "New repository"
   - Nama: `jets-sales-analytics` (atau nama lain)
   - Pilih "Public"
   - Klik "Create repository"

3. **Upload Project ke GitHub**
   ```bash
   # Masuk ke folder project
   cd c:/Users/Jetro/Downloads/Jet/Jet
   
   # Initialize Git
   git init
   
   # Add semua file
   git add .
   
   # Commit
   git commit -m "Initial commit - Jets Sales Analytics Dashboard"
   
   # Add remote repository (ganti dengan URL repo Anda)
   git remote add origin https://github.com/USERNAME/jets-sales-analytics.git
   
   # Push ke GitHub
   git branch -M main
   git push -u origin main
   ```

#### B. Deploy di Streamlit Cloud

1. **Buka Streamlit Cloud**
   - Kunjungi: https://share.streamlit.io/
   - Klik "Sign in" dengan GitHub account

2. **Deploy New App**
   - Klik "New app"
   - Repository: pilih `USERNAME/jets-sales-analytics`
   - Branch: `main`
   - Main file path: `app.py`
   - (Optional) App URL: custom URL jika tersedia

3. **Deploy!**
   - Klik "Deploy!"
   - Tunggu 2-5 menit
   - Aplikasi akan live di: `https://USERNAME-jets-sales-analytics.streamlit.app`

4. **✅ Selesai!**
   - Share URL ke teman/dosen
   - Setiap kali push ke GitHub, app akan auto-update

---

## 2. Deploy ke Railway 🚂

### Keuntungan:
- ✅ Gratis $5 credit per bulan
- ✅ Support berbagai framework
- ✅ Auto-deploy dari GitHub
- ✅ Custom domain gratis

### Langkah-langkah:

1. **Upload ke GitHub** (ikuti langkah di atas)

2. **Deploy di Railway**
   - Kunjungi: https://railway.app/
   - Login dengan GitHub
   - Klik "New Project"
   - Pilih "Deploy from GitHub repo"
   - Pilih repository `jets-sales-analytics`
   - Railway akan auto-detect Streamlit

3. **Konfigurasi (jika perlu)**
   - Railway otomatis detect `requirements.txt`
   - Start command otomatis: `streamlit run app.py`

4. **Generate Domain**
   - Klik "Settings" → "Generate Domain"
   - App live di: `https://your-app.up.railway.app`

---

## 3. Deploy ke Heroku ☁️

### Keuntungan:
- ✅ Platform terpercaya
- ✅ Support banyak bahasa
- ✅ Gratis tier tersedia (dengan batasan)

### Langkah-langkah:

1. **Install Heroku CLI**
   - Download: https://devcenter.heroku.com/articles/heroku-cli
   - Install dan verify: `heroku --version`

2. **Login Heroku**
   ```bash
   heroku login
   ```

3. **Create App**
   ```bash
   cd c:/Users/Jetro/Downloads/Jet/Jet
   heroku create jets-sales-analytics
   ```

4. **Deploy**
   ```bash
   git push heroku main
   ```

5. **Open App**
   ```bash
   heroku open
   ```

---

## 4. Deploy ke Render 🎨

### Keuntungan:
- ✅ Gratis untuk static sites
- ✅ Auto-deploy dari GitHub
- ✅ Custom SSL gratis

### Langkah-langkah:

1. **Upload ke GitHub** (ikuti langkah di atas)

2. **Deploy di Render**
   - Kunjungi: https://render.com/
   - Login dengan GitHub
   - Klik "New +" → "Web Service"
   - Connect repository `jets-sales-analytics`

3. **Konfigurasi**
   - Name: `jets-sales-analytics`
   - Environment: `Python 3`
   - Build Command: `pip install -r requirements.txt`
   - Start Command: `streamlit run app.py --server.port=$PORT --server.address=0.0.0.0`

4. **Create Web Service**
   - Klik "Create Web Service"
   - Tunggu build selesai
   - App live di: `https://jets-sales-analytics.onrender.com`

---

## 📝 Checklist Sebelum Deploy

- [ ] Semua dependencies ada di `requirements.txt`
- [ ] Data folder `data/` berisi CSV files
- [ ] File `Procfile` ada (untuk Heroku)
- [ ] File `.gitignore` ada
- [ ] Test app lokal dulu: `streamlit run app.py`
- [ ] Tidak ada hardcoded passwords/secrets
- [ ] README.md lengkap dengan screenshots

---

## 🔧 Troubleshooting

### Error: "ModuleNotFoundError"
**Solusi:** Pastikan semua library ada di `requirements.txt`

### Error: "Port already in use"
**Solusi:** 
```bash
streamlit run app.py --server.port 8502
```

### Error: "FileNotFoundError: data/customers.csv"
**Solusi:** Pastikan folder `data/` di-upload ke GitHub

### App crash setelah deploy
**Solusi:** Check logs:
- Streamlit Cloud: Settings → Logs
- Heroku: `heroku logs --tail`
- Railway: Deployments → View Logs

---

## 💡 Tips Deployment

1. **Untuk Presentasi/Demo:**
   - Gunakan Streamlit Cloud (paling mudah)
   - Share URL langsung

2. **Untuk Production:**
   - Gunakan Railway atau Render
   - Setup custom domain

3. **Untuk Portfolio:**
   - Deploy di Streamlit Cloud
   - Tambahkan link di GitHub README
   - Screenshot dashboard untuk portfolio

4. **Optimasi Performance:**
   - Gunakan `@st.cache_data` untuk loading data
   - Compress images jika ada
   - Minimize dependencies

---

## 🌐 URL Setelah Deploy

Setelah berhasil deploy, aplikasi akan bisa diakses di:

- **Streamlit Cloud:** `https://[username]-jets-sales-analytics.streamlit.app`
- **Railway:** `https://jets-sales-analytics.up.railway.app`
- **Heroku:** `https://jets-sales-analytics.herokuapp.com`
- **Render:** `https://jets-sales-analytics.onrender.com`

---

## 📊 Monitoring

### Streamlit Cloud
- Dashboard: https://share.streamlit.io/
- View logs dan metrics
- Restart app jika perlu

### Railway
- Dashboard: https://railway.app/dashboard
- View logs real-time
- Monitor resource usage

### Heroku
- Dashboard: https://dashboard.heroku.com/
- Command: `heroku logs --tail`
- Metrics & monitoring

---

## ✅ Success Criteria

Deployment berhasil jika:
1. ✅ App bisa diakses via URL public
2. ✅ Semua halaman berfungsi normal
3. ✅ Data tampil dengan benar
4. ✅ Visualisasi chart muncul
5. ✅ Dropdown interactive viz bekerja
6. ✅ Export CSV berfungsi

---

**Selamat Deploy! 🚀**

Jika ada pertanyaan atau error, silakan check dokumentasi platform yang digunakan.
