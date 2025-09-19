---
id: pertemuan-3
title: Pertemuan 2 — DDL & DML (Lengkap + Edukatif)
slug: /pertemuan-3
sidebar_label: Pertemuan 2 (DDL & DML Lengkap)
description: Kompilasi lengkap Bab II (DDL) dan Bab III (DML Basic) dari modul, termasuk seluruh sub-bab + penjelasan diperluas, contoh praktis, dan latihan.
---

> Target belajar: Memahami dan mempraktikkan **DDL** (membentuk struktur basis data) dan **DML** (mengelola isi data) di SQL Server — dengan contoh yang aman, idiomatik, dan mudah diikuti.

---

# BAB II — Data Definition Language (DDL)

## 2.1. Storage Database (MDF, LDF)
### 2.1.1. Pengertian MDF dan LDF
- **MDF (Main Data File)**: file utama yang menyimpan objek database (tabel, indeks, skema) dan datanya.
- **LDF (Log Data File)**: file log transaksi; memastikan **durability** dan **recovery**. Semua perubahan dicatat di sini sebelum dipersist ke MDF.
- Dampak praktis:
  - LDF dapat membengkak jika recovery model & backup tidak dikelola.
  - Pisahkan lokasi MDF/LDF untuk kinerja & keandalan.

### 2.1.2. Create Database dan Manage MDF dan LDF
Contoh pembuatan database dengan pengaturan ukuran & growth yang wajar:
```sql
CREATE DATABASE RentalMovie
ON PRIMARY (
  NAME = RentalMovie_mdf,
  FILENAME = 'C:\SQLData\RentalMovie.mdf',
  SIZE = 64MB, MAXSIZE = 1024MB, FILEGROWTH = 16MB
)
LOG ON (
  NAME = RentalMovie_log,
  FILENAME = 'C:\SQLLogs\RentalMovie.ldf',
  SIZE = 64MB, MAXSIZE = 2048MB, FILEGROWTH = 16MB
);
GO
```
> **Tips manajemen**: Kelola **recovery model**, lakukan **backup log** rutin, dan awasi pertumbuhan LDF.

## 2.2. Mengenali Tipe Data
Memilih tipe data yang tepat memengaruhi **kinerja, ruang simpan,** dan **kualitas data**.

### 2.2.1. Tipe Data Karakter (fixed vs variable, Unicode vs non‑Unicode)
| Tipe | Keterangan Singkat | Rentang/Ukuran | Catatan Praktis |
|---|---|---|---|
| `CHAR(n)` | Fixed-length non‑Unicode | 1–8000 | Stabil untuk panjang seragam (mis. kode negara `ID`). |
| `VARCHAR(n)` | Variable-length non‑Unicode | 1–8000 | Umum untuk teks pendek berbahasa Inggris. |
| `NCHAR(n)` | Fixed-length **Unicode** | 1–4000 | Gunakan bila perlu Unicode; 2 byte/char. |
| `NVARCHAR(n)` | Variable-length **Unicode** | 1–4000 | Pilihan umum untuk bahasa Indonesia & multi‑bahasa. |
| `VARCHAR(MAX)` / `NVARCHAR(MAX)` | Teks panjang | hingga ~2GB | Hati‑hati pada operasi yang memindahkan data ke **LOB storage**. |
| (Legacy) `TEXT`/`NTEXT` | *Deprecated* | — | **Hindari**; gunakan `VARCHAR(MAX)`/`NVARCHAR(MAX)`. |

Contoh:
```sql
CREATE TABLE contoh_karakter (
  kode CHAR(2) NOT NULL,         -- 'ID'
  nama NVARCHAR(100) NOT NULL    -- Nama mendukung Unicode
);
```

### 2.2.2. Tipe Data Tanggal/Waktu *(penamaan di daftar isi tampak duplikat “Karakter”; di sini disajikan bagian tanggal/waktu)*
| Tipe | Keterangan | Presisi |
|---|---|---|
| `DATE` | Tanggal (YYYY‑MM‑DD) | Hari |
| `TIME(p)` | Waktu | 0–7 digit pecahan detik |
| `DATETIME` | Tanggal & waktu | ~3ms, rentang 1753–9999 |
| `SMALLDATETIME` | Tgl & waktu ringkas | Menit, 1900–2079 |
| `DATETIME2(p)` | Tgl & waktu modern | Presisi s/d 100ns |
| `DATETIMEOFFSET(p)` | DATETIME2 + zona | Simpan offset zona waktu |

Contoh default & audit waktu:
```sql
CREATE TABLE log_sesi (
  id INT IDENTITY PRIMARY KEY,
  mulai DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME()
);
```

### 2.2.3. Tipe Data Numerik
| Tipe | Keterangan | Rentang/Presisi | Catatan |
|---|---|---|---|
| `BIT` | Boolean 0/1 | — | Efisien untuk flag. |
| `TINYINT`/`SMALLINT`/`INT`/`BIGINT` | Bilangan bulat | 0–255 / ±32K / ±2.1B / ±9e18 | Pilih sesuai rentang data. |
| `DECIMAL(p,s)` / `NUMERIC(p,s)` | Presisi tetap | p≤38 | **Untuk uang**/nilai presisi. |
| `FLOAT`/`REAL` | Pecahan biner | — | Hindari untuk uang (ada *rounding error*). |
| `MONEY`/`SMALLMONEY` | Tipe khusus uang | — | Lebih baik gunakan `DECIMAL` untuk kontrol presisi. |

Contoh:
```sql
CREATE TABLE transaksi (
  id INT IDENTITY PRIMARY KEY,
  total DECIMAL(12,2) NOT NULL,
  diskon REAL NULL -- contoh floating; paham konsekuensi pembulatan
);
```

## 2.3. Create Table
Prinsip desain:
- Tetapkan **PK** yang sempit & stabil (INT/ BIGINT).
- Gunakan **DEFAULT** untuk kolom audit (`create_date`, `last_update`).
- Tambahkan **UNIQUE** untuk mencegah duplikasi penting (mis. `email`).

Contoh (studi kasus *RentalMovie*):
```sql
CREATE TABLE dbo.Language (
  language_id INT IDENTITY(1,1) PRIMARY KEY,
  name        NVARCHAR(20) NOT NULL,
  last_update DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME()
);

CREATE TABLE dbo.Film (
  film_id          INT IDENTITY(1,1) PRIMARY KEY,
  title            NVARCHAR(255) NOT NULL,
  description      NVARCHAR(MAX) NULL,
  release_year     INT NULL,
  language_id      INT NOT NULL,
  rental_duration  INT NOT NULL DEFAULT 3,
  rental_rate      DECIMAL(4,2) NOT NULL DEFAULT 2.99,
  [length]         INT NULL,
  replacement_cost DECIMAL(6,2) NOT NULL DEFAULT 19.99,
  rating           NVARCHAR(5) NULL,
  last_update      DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
  CONSTRAINT UQ_Film_Title UNIQUE (title),
  CONSTRAINT FK_Film_Language FOREIGN KEY (language_id)
    REFERENCES dbo.[Language](language_id)
);
```

### 2.3.1. Penggunaan Primary Key
- PK wajib **unik** dan **not null**. Umumnya `INT IDENTITY` atau `BIGINT`.
- Pertimbangkan surrogate key vs natural key sesuai kebutuhan.

### 2.3.2. Penggunaan Foreign Key
- Menjaga **integritas referensial** antar tabel.
- Opsi: `ON UPDATE/DELETE CASCADE|NO ACTION|SET NULL` sesuai kebijakan data.

### 2.3.3. Penggunaan Unique Key
- Memastikan kolom (atau kombinasi kolom) **tidak duplikat**.
- Dapat dibuat sebagai **constraint** atau **unique index**.

## 2.4. Alter Table
Operasi umum: tambah/ubah/hapus kolom, tambah/hapus constraint.
```sql
ALTER TABLE dbo.Film ADD special_features NVARCHAR(255) NULL;
ALTER TABLE dbo.Film ALTER COLUMN rental_duration INT NOT NULL;
ALTER TABLE dbo.Film DROP CONSTRAINT UQ_Film_Title;
```

## 2.5. Drop Table
```sql
DROP TABLE IF EXISTS dbo.Film; -- hati‑hati dependensi (FK, View, dsb.)
```
**Praktik aman**: rename → uji dampak → baru hapus di produksi.

## 2.6. Latihan Data Definition Language (DDL)
1. Buat tabel `Customer` lengkap dengan PK dan kolom: `store_id`, `first_name`, `last_name`, `email` (UNIQUE), `address_id`, `active` (BIT default 1), `create_date` dan `last_update` (default `GETDATE()`).
2. Tambahkan FK `address_id → Address(address_id)` dan `store_id → Store(store_id)`.
3. Tambahkan constraint `UNIQUE(email)` dan uji input duplikat.

---

# BAB III — Data Manipulation Language (DML) Basic

## 3.1. Select
Konsep inti `SELECT ... FROM ...` + alias.
```sql
SELECT actor_id AS Kode, first_name AS [Nama Depan]
FROM actor;
```

## 3.2. Insert
```sql
INSERT INTO actor (first_name, last_name) VALUES ('JAMES','HUNT');
-- Multi-row
INSERT INTO actor (first_name, last_name)
VALUES ('NIKI','LAUDA'), ('AYRTON','SENNA');
```

## 3.3. Update
```sql
UPDATE actor
SET last_name = 'LAUDA'
WHERE actor_id = 201;
```

## 3.4. Delete
```sql
DELETE FROM actor WHERE actor_id = 201;
-- Hindari tanpa WHERE! bisa menghapus seluruh baris.
```

## 3.5. Penggunaan Functional
Fungsi sering dipakai di `SELECT`, `WHERE`, `ORDER BY`.

### 3.5.1. Penggunaan Functional String
Contoh yang sering dipakai (ringkas):
```sql
SELECT 
  UPPER(first_name) AS NamaCaps,
  LEFT(last_name,3) AS TigaHuruf,
  CONCAT(first_name,' ',last_name) AS NamaLengkap
FROM actor;
```

### 3.5.2. Penggunaan Functional Date
```sql
SELECT 
  GETDATE() AS NowLocal,
  SYSUTCDATETIME() AS NowUTC,
  DATEDIFF(DAY, '2024-01-01', GETDATE()) AS SelisihHari,
  DATEPART(MONTH, GETDATE()) AS BulanIni;
```

### 3.5.3. Penggunaan Functional System
```sql
SELECT 
  CAST('123' AS INT) AS CastInt,
  TRY_CONVERT(INT, 'abc') AS TryConvertGagal, -- NULL
  ISNULL(NULL, 'fallback') AS NilaiDefault
;
```

## 3.6. Pengurutan (ORDER BY)
```sql
SELECT actor_id, first_name, last_name, last_update
FROM actor
ORDER BY last_update DESC, first_name ASC;
```

## 3.7. Latihan DML Basic
1. Tampilkan title dan deskripsi untuk film rating ‘PG‑17’; urutkan berdasarkan **length**.
2. Naikkan `replacement_cost` sebesar 1 untuk film dengan `rental_rate > 2.99` dan `rental_duration > 5`.
3. Tampilkan “Film Pendek” untuk film `length < 60` dengan kolom *Deskripsi* dan *Durasi (menit)*; urutkan menurun berdasarkan durasi.
4. Hapus **customer** yang terdaftar di store 2 dan **tidak aktif** (uji dependensi FK terlebih dahulu).

---

## Ringkasan
- **DDL** membentuk kerangka (tabel, tipe data, constraint). Pilih tipe data **tepat**, gunakan **PK/FK/UNIQUE**, serta **DEFAULT** untuk audit.
- **DML** memanipulasi isi data. Pastikan **WHERE** selektif pada `UPDATE/DELETE` dan manfaatkan fungsi bawaan secara tepat.
- Latihan di akhir bab membantu memperkuat konsep untuk studi kasus *RentalMovie*.
