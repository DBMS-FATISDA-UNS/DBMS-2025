---
id: pertemuan-2
title: Pertemuan 2 — DDL & DML Dasar (SQL Server)
sidebar_label: Pertemuan 2
sidebar_position: 3
slug: /pertemuan-2
---

> **Topik:** *Building a Simple Database*  
> **Platform:** Microsoft SQL Server (≥2019) & SSMS  
> **DBMS** — diselenggarakan oleh Fakultas Teknologi Informasi dan Sains Data Universitas Sebelas Maret, Semester Ganjil 2025/2026

## Tujuan Pembelajaran
- Memahami perbedaan **DDL** vs **DML** dan konteks penggunaannya.
- Mampu membuat, memodifikasi, dan menghapus **tabel** (CREATE/ALTER/DROP).  
- Memahami dan menerapkan **PRIMARY KEY**, **FOREIGN KEY**, serta **UNIQUE**.
- Melakukan operasi DML dasar: **SELECT**, **INSERT**, **UPDATE**, **DELETE**.
- Menggunakan fungsi **string**, **date/time**, dan **system** yang umum dipakai.

## Prasyarat
- SSMS sudah terpasang dan dapat terhubung ke instance SQL Server.

## Data Definition Language (DDL)
DDL adalah singkatan dari "Data Definition Language" dalam konteks basis data. Ini adalah bagian dari bahasa SQL (Structured Query Language) yang digunakan untuk mendefinisikan, mengubah, dan menghapus struktur objek dalam basis data, seperti tabel, indeks, dan tampilan.

DDL umumnya terdiri dari perintah-perintah seperti :

`CREATE (untuk membuat objek baru)`

`ALTER (untuk mengubah struktur objek yang sudah ada)`

`DROP (untuk menghapus objek dari basis data)`

Perintah-perintah ini memungkinkan pengguna untuk mendefinisikan skema basis data dan melakukan perubahan struktur yang diperlukan sesuai kebutuhan aplikasi atau perusahaan.

### Contoh ER Diagram 

![gambar](/img/p2/1.png)

### CREATE TABLE

Create table digunakan untuk membuat sebuah tabel baru pada database

```sql
CREATE TABLE
[database_name.][schema_name.]table_name (

pk_column data_type PRIMARY KEY,

column_1 data_type NOT NULL,

column_2 data_type,

...,

table_constraints

);
```

```sql
CREATE TABLE [PRODUCT] (
    [ID] INT,

    [SellerID] INT,
    [Name] VARCHAR(128),
    [Description] TEXT DEFAULT 'Tidak ada deskripsi',
    [Rating] REAL DEFAULT 0.0,
    [Price] INT,
    [Stock] INT DEFAULT 0,

    CONSTRAINT [PK_Product] PRIMARY KEY ([ID]),
    CONSTRAINT [FK_Product_SellerID] FOREIGN KEY ([SellerID]) REFERENCES [SELLER] ([UserID])
);
```

### Primary Key

PRIMARY KEY adalah kolom atau kombinasi kolom yang secara unik mengidentifikasi setiap baris dalam tabel. Hanya satu PRIMARY KEY yang dapat dibuat per tabel. Nilai pada PRIMARY KEY harus unik dan tidak boleh NULL. SQL Server secara otomatis membuat indeks pada kolom PRIMARY KEY untuk meningkatkan kinerja pencarian. 

Contoh penggunaan:

```sql
CREATE TABLE table_name (

pk_column data_type PRIMARY KEY,

...

);
```

```sql
CREATE TABLE table_name (

pk_column_1 data_type,

pk_column_2 data type,

...

PRIMARY KEY (pk_column_1, pk_column_2)

);
```

### Foreign Key

FOREIGN KEY adalah kolom atau kumpulan kolom yang merujuk ke PRIMARY KEY ke tabel lain, digunakan untuk menjaga integritas data antar tabel yang terkait dan membuat relasi antara dua tabel. Saat FOREIGN KEY didefinisikan,  setiap nilai di kolom tersebut harus ada sebagai nilai di kolom PRIMARY KEY di tabel lain. 

Contoh penggunaan:

```sql
CREATE TABLE [USER] (
    [ID] INT,

    [Type] VARCHAR(16),
    [Name] VARCHAR(128),
    [PhoneNo] VARCHAR(32),
    [Email] VARCHAR(254),
    [Password] CHAR(64),
    [RegisteredAt] DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT [PK_User] PRIMARY KEY ([ID]),
    CONSTRAINT [UQ_User_Email] UNIQUE ([Email])
);
```

```sql
CREATE TABLE [CUSTOMER] (
    [UserID] INT,

    [Balance] INT DEFAULT 0,

    CONSTRAINT [PK_Customer] PRIMARY KEY ([UserID]),
    CONSTRAINT [FK_Customer_UserID] FOREIGN KEY ([UserID]) REFERENCES [USER] ([ID])
);
```

### Referential actions

Hal apa yang dilakukan ketika suatu table dilakukan modifikasi

```sql
FOREIGN KEY (foreign_key_columns)

REFERENCES parent_table(parent_key_columns)

ON UPDATE action

ON DELETE action;
```

Action yang dilakukan antara lain:

`NO ACTION`, `CASCADE`, `SET NULL`, `SET DEFAULT`

### Unique Key

UNIQUE KEY memastikan semua nilai di kolom tertentu harus unik, tetapi berbeda dengan PRIMARY KEY karena kolom UNIQUE dapat berisi NULL. Suatu tabel bisa memiliki beberapa UNIQUE constraints. SQL Server membuat indeks unik secara otomatis untuk kolom dengan constraint UNIQUE. 

Contoh penggunaan:

```sql
CREATE TABLE [USER] (
    [ID] INT,

    [Type] VARCHAR(16),
    [Name] VARCHAR(128),
    [PhoneNo] VARCHAR(32),
    [Email] VARCHAR(254),
    [Password] CHAR(64),
    [RegisteredAt] DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT [PK_User] PRIMARY KEY ([ID]),
    CONSTRAINT [UQ_User_Email] UNIQUE ([Email])
);
```

```sql
CREATE TABLE [USER] (
    [ID] INT,

    [Type] VARCHAR(16),
    [Name] VARCHAR(128),
    [PhoneNo] VARCHAR(32),
    [Email] VARCHAR(254) UNIQUE,
    [Password] CHAR(64),
    [RegisteredAt] DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT [PK_User] PRIMARY KEY ([ID]),
);
```

### ALTER TABLE

ALTER TABLE digunakan untuk memodifikasi struktur tabel yang sudah ada tanpa harus menghapus dan membuat ulang tabel tersebut

Operasi umum: tambah/ubah/hapus kolom, tambah/hapus constraint.

```sql
ALTER TABLE table_name ALTER COLUMN column_name new_data_type(size);
```
```sql
ALTER TABLE table_name DROP COLUMN column_name_1, column_name_2,...;
```
```sql
ALTER TABLE table_name ADD column_name data_type column_constraint;
```

### DROP TABLE  

```sql
DROP TABLE [IF EXISTS] [database_name.][schema_name.]table_name;
```
```sql
DROP TABLE IF EXISTS sales.revenues;
```

## Data Types in SQL Server

Microsoft SQL Server memiliki beberapa tipe data yang bisa digunakan untuk menyimpan berbagai jenis data sesuai kebutuhan aplikasi. Berikut ini adalah kategori utama tipe data dalam SQL Server beserta contoh masing-masing:

### 1. Tipe Data Karakter (fixed vs variable, Unicode vs non‑Unicode)
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

### 2. Tipe Data Tanggal/Waktu *(penamaan di daftar isi tampak duplikat “Karakter”; di sini disajikan bagian tanggal/waktu)*
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

### 3. Tipe Data Numerik
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

## Data Manipulation Language (DML) Basic