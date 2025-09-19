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
CREATE TABLE sales.visits (

visit_id INT PRIMARY KEY IDENTITY (1, 1),

first_name VARCHAR (50) NOT NULL,

last_name VARCHAR (50) NOT NULL,

visited_at DATETIME,

phone VARCHAR(20),

store_id INT NOT NULL,

FOREIGN KEY (store_id) REFERENCES sales.stores (store_id)

);
```

### ALTER TABLE

ALTER TABLE digunakan untuk memodifikasi struktur tabel yang sudah ada tanpa harus menghapus dan membuat ulang tabel tersebut

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

## Data Manipulation Language (DML) Basic