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

### Rumusan Masalah Bisnis
1. **Efisiensi & Profitabilitas Peresepan Obat**
   - NusaHealth kesulitan mengidentifikasi **kategori obat** dan **spesialisasi dokter** mana yang menyumbang **margin gross profit** tertinggi serta mana yang memiliki **biaya HPP (COGS)** tinggi tetapi margin tipis.
   - Kurangnya visibilitas perbedaan kinerja penjualan resep antara **Klinik Fisik (Offline)** dan **Aplikasi Telemedisin (Online)**.
2. **Akurasi Data Histori Pasien & Skema Asuransi**
   - Perubahan **domisili pasien** dan kenaikan/penurunan **tingkatan asuransi (insurance tier)** sering kali menimpa data transaksi lama (overwriting), sehingga analisis historis perilaku pasien dan efektivitas skema asuransi menjadi tidak akurat.

### Pertanyaan Bisnis
- **Peresepan & Penjualan Obat**:
  - Berapa **total pendapatan bersih (net amount)** dan **gross profit** yang dihasilkan per **kategori obat** dan **per spesialisasi dokter** **setiap bulannya**?
  - Bagaimana perbandingan **volume penjualan** obat dan **profit margin** antara cabang **Klinik Fisik** dan **layanan Telemedisin**?
  - Berapa **rerata diskon** yang diberikan **per transaksi resep** dan bagaimana pengaruhnya terhadap **margin keuntungan**?
- **Pasien & Asuransi**
  - Bagaimana **tren penggunaan obat** dan **pengeluaran pasien** berdasarkan **tingkatan asuransi (insurance tier)** mereka pada saat transaksi berlangsung?
  - Apakah **perpindahan domisili** pasien (city/province) mempengaruhi **volume peresepan obat** di cabang tertentu?

### Key Performance Indicators (KPI)
| Kategori KPI | Nama KPI | Formulasi / Cara Hitung |
| --- | --- | --- |
| Financial / Profitability | Gross Profit Margin (%)              | (Net Amount - COGS Amount)/Net Amount x 100% |
| Financial / Profitability | Average Net Revenue per Prescription | SUM(Net Amount) / Jumlah Transaksi Resep     |
| Operational / Sales       | Prescription Line Item Volume        | SUM(Quantity)                                |
| Discount Tracking         | Discount Rate (%)                    | SUM(Discount Amount) / SUM(Gros Amount) x 100% |


## 2. DATASET (SOURCE OLTP)
Peserta diberikan 7 tabel sumber dari database OLTP NusaHealth:
- raw_patients (patient_id, full_name, gender, dob, city, province, insurance_tier, updated_at)
- raw_doctors (doctor_id, doctor_name, specialization, license_number, employment_type)
- raw_medicines (medicine_id, medicine_name, category, dosage_form, unit_cost, unit_price)
- raw_branches (branch_id, branch_name, channel_type, branch_type, city, province)
- raw_insurance_providers (provider_id, provider_name, provider_type, settlement_term_days)
- raw_prescriptions (prescription_id, patient_id, doctor_id, branch_id, provider_id, transaction_timestamp)
- raw_prescription_items (item_id, prescription_id, medicine_id, quantity, unit_price, discount_amount)

Keterangan
- raw_medicines.unit_cost : harga pokok obat per satuan
- raw_medicines.unit_price : harga jual obat per satuan
- raw_prescription_items.quantity : jumlah obat yang diresepkan
- raw_prescription_items.unit_price : harga obat per satuan
- raw_prescription_items.discount_amount : total potongan harga

## 3. TUGAS PARTICIPANT (LAB TASKS)
### TUGAS 1: Buat ER Diagram dari ke 7 dataset. 
Gunakan CREATE TABLE statement pada notebook ini sebagai referensi. Gambar dapat menggunakan **drawdb.app** atau program lain yang sejenis 
### TASK 2: Lengkapi Lembar Kerja Kimball 4-Step
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

- **Step 4: Identify the Facts**
  - Tentukan metrik/measures beserta sifat aditivitasnya (Additive / Non-Additive):
    - quantity → (Additive / Non-Additive)
    - gross_amount → Formula: ................... (Additive / Non-Additive)
    - discount_amount → (Additive / Non-Additive)
    - net_amount → Formula: ................... (Additive / Non-Additive)
    - cogs_amount → Formula: ................... (Additive / Non-Additive)
    - gross_profit → Formula: ................... (Additive / Non-Additive)
   
### TASK 2: Susun Kimball Enterprise Bus Matrix
Lengkapi matriks di bawah ini dengan memberikan tanda [X] pada hubungan antara Proses Bisnis dan Tabel Dimensi terkait:

### TASK 3: Skrip DDL SQL (Implementation)
Tuliskan skrip SQL terstruktur untuk:
1. dim_patient dengan kolom kontrol SCD Type 2 (effective_date, expiration_date, is_current).
2. fact_prescriptions dengan seluruh relasi Foreign Key ke tabel dimensi.
3. obt_prescriptions (One Big Table View) yang menggabungkan fact table dan seluruh dimensi aktif.
