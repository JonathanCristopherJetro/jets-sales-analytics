# 📄 Cara Convert Laporan.md ke PDF

## Metode 1: Menggunakan VS Code (Recommended)

### Extension: Markdown PDF

1. **Install Extension:**
   - Buka VS Code
   - Tekan `Ctrl+Shift+X` untuk membuka Extensions
   - Cari "Markdown PDF"
   - Install extension by "yzane"

2. **Convert to PDF:**
   - Buka file `docs/laporan.md` di VS Code
   - Tekan `Ctrl+Shift+P` (Command Palette)
   - Ketik "Markdown PDF: Export (pdf)"
   - Pilih dan tekan Enter
   - PDF akan tersimpan di folder yang sama

---

## Metode 2: Menggunakan Online Converter

### Dillinger.io
1. Kunjungi: https://dillinger.io/
2. Copy seluruh isi `laporan.md`
3. Paste di Dillinger editor
4. Klik menu "Export As" → "Styled HTML" atau "PDF"

### Markdown to PDF
1. Kunjungi: https://www.markdowntopdf.com/
2. Upload file `laporan.md`
3. Klik "Convert"
4. Download PDF hasil konversi

---

## Metode 3: Menggunakan Pandoc (Advanced)

### Install Pandoc
```bash
# Windows (dengan Chocolatey)
choco install pandoc

# Atau download dari:
# https://pandoc.org/installing.html
```

### Convert Command
```bash
# Navigate to docs folder
cd docs

# Basic conversion
pandoc laporan.md -o laporan.pdf

# With custom styling
pandoc laporan.md -o laporan.pdf --pdf-engine=xelatex -V geometry:margin=1in

# With table of contents
pandoc laporan.md -o laporan.pdf --toc --pdf-engine=xelatex
```

---

## Metode 4: Menggunakan Chrome/Edge Browser

1. **Buka di GitHub:**
   - Push `laporan.md` ke GitHub
   - Buka di browser: `https://github.com/JonathanCristopherJetro/jets-sales-analytics/blob/main/docs/laporan.md`

2. **Print to PDF:**
   - GitHub akan render Markdown dengan baik
   - Tekan `Ctrl+P` (Print)
   - Pilih "Save as PDF" sebagai destination
   - Adjust settings (margins, scale, etc.)
   - Klik "Save"

---

## Metode 5: Menggunakan Python (Automated)

### Install Dependencies
```bash
pip install markdown
pip install pdfkit
pip install wkhtmltopdf
```

### Python Script
```python
import markdown
import pdfkit

# Read markdown file
with open('laporan.md', 'r', encoding='utf-8') as f:
    md_content = f.read()

# Convert to HTML
html_content = markdown.markdown(md_content)

# Add styling
styled_html = f"""
<html>
<head>
    <meta charset="utf-8">
    <style>
        body {{ font-family: Arial, sans-serif; margin: 40px; }}
        img {{ max-width: 100%; height: auto; }}
        table {{ border-collapse: collapse; width: 100%; }}
        th, td {{ border: 1px solid #ddd; padding: 8px; text-align: left; }}
        th {{ background-color: #4CAF50; color: white; }}
    </style>
</head>
<body>
    {html_content}
</body>
</html>
"""

# Convert to PDF
pdfkit.from_string(styled_html, 'laporan.pdf')
print("PDF created successfully!")
```

---

## 🎨 Tips untuk PDF yang Lebih Baik

### 1. Pastikan Gambar Ter-load
- Gunakan relative path yang benar: `../images/chart.png`
- Atau gunakan absolute URL dari GitHub

### 2. Formatting Tips
- Gunakan page breaks: `<div style="page-break-after: always;"></div>`
- Adjust margins untuk readability
- Use high-resolution images

### 3. Table of Contents
- Beberapa converter otomatis generate TOC
- Atau buat manual di awal dokumen

---

## ✅ Recommended Method

**Untuk Hasil Terbaik:**

1. **VS Code + Markdown PDF Extension** (Paling mudah)
2. **GitHub + Print to PDF** (Paling cepat, hasil bagus)
3. **Pandoc** (Most control, professional output)

---

## 📝 Checklist Sebelum Export

- [ ] Semua gambar sudah ada di folder `images/`
- [ ] Path gambar sudah benar (`../images/nama-file.png`)
- [ ] Link deployment sudah correct
- [ ] Spelling dan grammar sudah dicek
- [ ] Table formatting sudah rapi
- [ ] Code blocks sudah readable

---

## 🆘 Troubleshooting

### Gambar Tidak Muncul
**Solusi:**
- Gunakan absolute path atau URL lengkap
- Pastikan file gambar ada di lokasi yang tepat

### Format Rusak
**Solusi:**
- Check markdown syntax
- Validate dengan Markdown linter
- Preview di GitHub sebelum convert

### File Terlalu Besar
**Solusi:**
- Compress images sebelum embed
- Gunakan format WebP atau optimized PNG

---

**Good luck with your PDF conversion! 🎉**
