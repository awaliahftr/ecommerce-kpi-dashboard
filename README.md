# 📊 E-Commerce KPI Dashboard

### End-to-End Data Analytics Project | PostgreSQL + Python + Tableau

![Dashboard Preview](https://github.com/awaliahftr/ecommerce-kpi-dashboard/blob/e6c7c8f7851674d212e539cefc6ea0d9d1b1f6b0/E-Commerce%20KPI%20Dashboard/docs/dashboard.png
)

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
- Revenue tertinggi pada November 2011 (periode pre-holiday).
- Segmen 'Champions' hanya 12% pelanggan tapi berkontribusi 38% revenue.
- Cohort retention turun drastis di bulan ke-2 → peluang campaign retensi.

## 📂 Project Structure
```
├── data/ ← CSV hasil ekspor dari PostgreSQL
├── tableau/ ← Tableau workbook (.twbx)
├── notebooks/ ← Python EDA 
└── docs/ ← Screenshot dashboard
```

## 🚀 How to Run
1. Clone repo: `git clone https://github.com/awaliahftr/ecommerce-kpi-dashboard.git`
2. Buka file Tableau di folder `tableau/`.
3. Jika perlu, refresh data dari CSV di folder `data/`.

## 📊 Dashboard Preview
Dashboard interaktif menampilkan KPI penjualan, segmentasi RFM, cohort retention, dan produk terlaris.

## 👤 Author
**Awaliah Fitri Nur Ananda** – [GitHub](https://github.com/awaliahftr)
