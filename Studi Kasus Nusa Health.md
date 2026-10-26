# PANDUAN LAB HANDS-ON: DIMENSIONAL MODELLING — NUSAHEALTH

- Durasi Lab: 90 - 120 Menit
- Format: Individu atau Kelompok (2–3 Orang)
- Deliverables:
  1) Lembar Kerja Kimball 4-Step (Worksheet)
  2) Enterprise Bus Matrix NusaHealth
  3) Skrip DDL SQL (Dimension Tables, Fact Tables, & Constraints)
  4) Skrip DDL SQL OBT View (obt_prescriptions) & Kueri Analitik
 
## 1. SKENARIO BISNIS: NUSAHEALTH
NusaHealth adalah jaringan penyedia layanan kesehatan yang mengoperasikan Klinik Fisik dan Aplikasi Telemedisin. NusaHealth melayani pemeriksaan medis, peresepan obat, serta pemrosesan klaim asuransi (BPJS Kesehatan dan Asuransi Swasta).

Manajemen membutuhkan arsitektur Data Warehouse terintegrasi untuk menjawab kebutuhan analitis berikut:
- Analisis Profitabilitas Peresepan & Obat: Memantau tren penjualan resep, margin keuntungan (gross profit), dan efisiensi biaya HPP (COGS) per kategori obat, spesialisasi dokter, serta cabang.
- Histori Pasien & Skema Asuransi (SCD Type 2): Melacak jejak historis perubahan domisili pasien dan perubahan tingkatan asuransi (insurance tier) tanpa merusak data histori transaksi masa lalu.
- Siklus Klaim Asuransi (Accumulating Snapshot): Melacak durasi pemrosesan klaim dari pengajuan hingga persetujuan/penolakan, serta menganalisis rejection rate per mitra asuransi.
- Manajemen Persediaan Obat (Periodic Snapshot): Memantau saldo stok harian/bulanan di tiap apotek cabang untuk mendeteksi risiko kehabisan stok (stockout) dan obat kadaluwarsa.

## 2. DATASET MENTAH (SOURCE OLTP)
Peserta diberikan 7 tabel sumber dari database OLTP NusaHealth:
- raw_patients (patient_id, full_name, gender, dob, city, province, insurance_tier, updated_at)
- raw_doctors (doctor_id, doctor_name, specialization, license_number, employment_type)
- raw_medicines (medicine_id, medicine_name, category, dosage_form, unit_cost, unit_price)
- raw_branches (branch_id, branch_name, channel_type, branch_type, city, province)
- raw_insurance_providers (provider_id, provider_name, provider_type, settlement_term_days)
- raw_prescriptions (prescription_id, patient_id, doctor_id, branch_id, provider_id, transaction_timestamp)
- raw_prescription_items (item_id, prescription_id, medicine_id, quantity, unit_price, discount_amount)

## 3. TUGAS PARTICIPANT (LAB TASKS)
### TASK 1: Lengkapi Lembar Kerja Kimball 4-Step
Isi titik-titik di bawah ini untuk proses bisnis **Penjualan Resep & Dispensing Obat**:
- **Step 1: Select the Business Process**
  - Proses Bisnis Utama: ......................................................................
- **Step 2: Declare the Grain**
  - Deklarasi Grain: 1 baris di Fact Table secara tepat mewakili .....................................
- **Step 3: Identify the Dimensions**
Daftar Dimensi:
- dim_................... (Gunakan strategi SCD Type 2 untuk atribut city dan insurance_tier)
- dim_................... (Profil dan spesialisasi medis)
- dim_................... (Katalog obat, dosis, HPP, HET)
- dim_................... (Klinik fisik vs Telemedisin)
- dim_................... (BPJS vs Swasta vs Out-of-Pocket)
- dim_................... (Dimensi kalender statis)
- Degenerate Dimensions: ................... dan ...................

