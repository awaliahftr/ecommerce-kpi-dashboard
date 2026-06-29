# 📊 E-Commerce KPI Dashboard

[![Python](https://img.shields.io/badge/Python-3.11-blue.svg)](https://www.python.org/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-15-blue.svg)](https://www.postgresql.org/)
[![Tableau](https://img.shields.io/badge/Tableau-2026.2-blue.svg)](https://www.tableau.com/)

End-to-End Data Analytics Project | PostgreSQL + Python + Tableau

![Dashboard Preview](https://github.com/awaliahftr/ecommerce-kpi-dashboard/blob/84d5a5d2183ac292c80c121e77885551a3c96d4e/E-Commerce%20KPI%20Dashboard/docs/Dashboard%201.png
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

## 📂 Data Source
File CSV hasil ekspor dari PostgreSQL:
- `monthly_revenue.csv` → Revenue per bulan
- `rfm_summary.csv` → RFM customer segmentation
- `top_products.csv` → Top 10 products by revenue
- `cohort_retention.csv` → Cohort retention analysis

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

## 📊 Live Dashboard
[View on Tableau Public](https://public.tableau.com/views/E-CommerceKPIDashboard_17827279135500/Dashboard1)

## 👤 Author
**Awaliah Fitri Nur Ananda** – [GitHub](https://github.com/awaliahftr)
