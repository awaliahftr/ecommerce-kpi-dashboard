# 📊 E-Commerce KPI Dashboard

### End-to-End Data Analytics Project | PostgreSQL + Python + Tableau

![Dashboard Preview](<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/445d934b-c57e-4b32-9f68-9efb7d17252e" />)

## 🎯 Problem Statement
Manajemen membutuhkan visibilitas real-time terhadap performa penjualan, perilaku pelanggan, dan tren pertumbuhan untuk mendukung keputusan strategis.

## 🛠️ Tools & Technologies
| Tool        | Kegunaan                          |
|-------------|-----------------------------------|
| PostgreSQL  | Data storage & SQL transformation |
| Python      | EDA & data import                 |
| Tableau     | Interactive KPI Dashboard         |

## 📌 Key KPIs
- 📈 **Monthly Revenue & MoM Growth**
- 👥 **RFM Customer Segmentation** (6 segments)
- 🔁 **Cohort Retention Analysis**
- 🛒 **Average Order Value (AOV)**
- 🏆 **Top 10 Products by Revenue**

## 🗃️ Dataset
- Source: [Online Retail II - UCI ML Repository](https://archive.ics.uci.edu/dataset/502/online+retail+ii)
- Period: December 2009 – December 2011
- Records: ~1 million transactions after cleaning

## 🔍 Key Findings
- Revenue tertinggi pada November 2011 (periode pra-hari raya).
- Segmen 'Champions' hanya 12% pelanggan tapi berkontribusi 38% revenue.
- Cohort retention turun drastis di bulan ke-2 → peluang campaign retensi.

## 📂 Project Structure
'''
├── data/ ← CSV hasil ekspor dari PostgreSQL
├── tableau/ ← Tableau workbook (.twbx)
├── notebooks/ ← Python EDA (optional)
└── docs/ ← Screenshot dashboard
'''

## 🚀 How to Run
1. Clone repo: `git clone https://github.com/awaliahftr/ecommerce-kpi-dashboard.git`
2. Buka file Tableau di folder `tableau/`.
3. Jika perlu, refresh data dari CSV di folder `data/`.

## 📊 Dashboard Preview
Dashboard interaktif menampilkan KPI penjualan, segmentasi RFM, cohort retention, dan produk terlaris.

## 👤 Author
**Awaliah Fitri Nur Ananda** – [GitHub](https://github.com/awaliahftr)
