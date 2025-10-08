---
id: pertemuan-4
title: Performing Basic Queries
sidebar_label: Pertemuan 4
sidebar_position: 5
slug: /pertemuan-4
---

> **Topik:** *Performing Basic Queries*
> **Platform:** Microsoft SQL Server (≥2019) & SSMS
> **DBMS** — diselenggarakan oleh Fakultas Teknologi Informasi dan Sains Data Universitas Sebelas Maret, Semester Ganjil
2025/2026

## Tujuan Pembelajaran
Mahasiswa mempelajari cara melakukan query sederhana (untuk mendapatkan informasi) dari satu tabel dengan menggunakan
berbagai klausa dan fungsi dasar SQL. Dalam prosesnya, mahasiswa tidak hanya memahami cara menampilkan data, tetapi juga
mempelajari bagaimana memfilter, mengurutkan, membatasi, dan memodifikasi hasil query agar sesuai dengan kebutuhan
analisis data.

## Evaluasi Hasil Latihan Lab 1

- Untuk tabel continents, cities, religions, organizations pada `primary key` tambahkan `IDENTITY (1,1)` yang artinya
nanti agar sql server otomatis mengisi primary key nya dengan awalan angka 1 dan kelipatan 1 untuk angka berikutnya.

## 🔽 Unduh File Lab 1

Kamu bisa mengunduh file SQL untuk latihan dari link berikut:

- [📄 Mondial_Ujian_schema-2.sql](/lab/lab1/Mondial_Ujian_schema-2.sql)
- [📄 Mondial_Ujian_data-2.sql](/lab/lab1/Mondial_Ujian_data-2.sql)


## SELECT

Pernyataan ‘SELECT’ digunakan untuk memilih atribut yang akan ditampilkan atau dimanipulasi dari tabel. Dengan ‘SELECT’,
kita dapat memilih satu atau lebih atribut dari satu atau lebih tabel, serta dapat memberikan alias pada atribut yang
dipilih. Pernyataan ini terdiri dari dua bagian utama, yaitu ‘SELECT’ dan ‘FROM’.

- SELECT: Menentukan atribut atau kolom yang ingin ditampilkan.
- FROM: Menentukan tabel asal dari atribut atau kolom yang dipilih. FROM sangat penting karena mengidentifikasi sumber
data yang akan diambil.

Contoh syntax Select:

```sql
SELECT first_name FROM actor;
```

Select pada contoh di atas digunakan untuk memilih ‘first_name’ dari tabel ‘actor’. Hasilnya adalah seluruh data yang
ada di dalam ‘first_name’. Berikut result yang akan muncul ketika dicoba dalam SSMS.

Latihan Syntax Select :

```sql
SELECT * FROM actor

SELECT first_name AS [Nama Depan], last_name AS Nama_Belakang FROM actor;
```
Cobalah kedua latihan di atas pada SSMS dan perhatikan hasilnya!

## WHERE

Pernyataan ‘WHERE’ digunakan untuk memfilter baris data berdasarkan kondisi tertentu. Dengan ‘WHERE’, kita dapat
menentukan kriteria yang harus dipenuhi agar data ditampilkan.

WHERE: Menentukan kondisi atau syarat yang harus dipenuhi oleh data yang diambil.

Contoh syntax:

```sql
SELECT first_name, last_name
FROM actor
WHERE first_name = 'Nick';
```

Pernyataan di atas akan menampilkan data first_name dan last_name dari tabel actor yang memiliki first_name bernilai
‘Nick’.
Hasilnya adalah hanya baris yang memenuhi kondisi tersebut.

## AND

Operator ‘AND’ digunakan untuk menggabungkan dua atau lebih kondisi dalam klausa WHERE. Semua kondisi yang dihubungkan
dengan AND harus benar agar baris data ditampilkan.

Contoh syntax:

```sql
SELECT * FROM actor WHERE first_name = 'Nick' AND last_name = 'Wahlberg';
```


Pernyataan di atas akan menampilkan data dari tabel actor yang memiliki first_name = 'Nick' dan last_name = 'Wahlberg'.
Hasilnya hanya satu atau beberapa baris yang memenuhi kedua kondisi sekaligus.

## OR

Operator ‘OR’ digunakan untuk menampilkan data yang memenuhi salah satu dari beberapa kondisi.

Contoh Syntax :

```sql
SELECT * FROM actor WHERE first_name = 'Nick' OR first_name = 'Penelope';

```
Perintah di atas akan menampilkan semua aktor yang memiliki first_name = 'Nick' atau first_name = 'Penelope'.
Jika salah satu kondisi terpenuhi, baris data akan ditampilkan.

## IN

Operator ‘IN’ digunakan untuk memeriksa apakah nilai suatu kolom termasuk dalam daftar nilai tertentu.

Contoh syntax:

```sql
SELECT * FROM actor WHERE first_name IN ('Nick', 'Penelope', 'Ed');
```

Pernyataan tersebut akan menampilkan semua data dari tabel actor yang memiliki first_name bernilai Nick, Penelope, atau
Ed.
Hasilnya adalah baris yang sesuai dengan daftar nilai yang disebutkan.

## BETWEEN

Operator ‘BETWEEN’ digunakan untuk memfilter data berdasarkan rentang nilai (range), baik angka maupun tanggal.

Contoh syntax:

```sql
SELECT * FROM payment WHERE amount BETWEEN 5 AND 10;
```

Pernyataan di atas akan menampilkan semua data dari tabel payment dengan nilai amount di antara 5 dan 10 (termasuk 5 dan
10). Hasilnya adalah baris dengan nilai amount ≥ 5 dan ≤ 10.

## LIKE

Operator ‘LIKE’ digunakan untuk pencarian pola (pattern matching) pada teks.
Simbol yang digunakan:

- % : mewakili sembarang jumlah karakter.

- _ : mewakili satu karakter saja.

Contoh syntax:

```sql
SELECT * FROM actor WHERE first_name LIKE 'A%';
```

Pernyataan di atas akan menampilkan semua aktor yang first_name-nya diawali huruf A.
Misalnya: Adam, Angela, Arthur, dll.

## COLUMN ALIAS
Alias digunakan untuk memberikan nama sementara pada kolom agar hasil query lebih mudah dibaca. Alias dapat ditulis
dengan atau tanpa kata kunci AS.

Contoh syntax:
```sql
SELECT first_name AS [Nama Depan], last_name AS[Nama Belakang] FROM actor;
```

Pernyataan di atas menampilkan kolom first_name dan last_name, tetapi dengan judul kolom yang diubah menjadi Nama Depan
dan Nama Belakang.
Alias tidak mengubah nama kolom di tabel asli, hanya pada tampilan hasil query.

## ORDER BY

Pernyataan ‘ORDER BY’ digunakan untuk mengurutkan hasil query berdasarkan satu atau lebih kolom, baik secara ASC (naik)
atau DESC (turun).

Contoh syntax:
```sql
SELECT first_name, last_name FROM actor ORDER BY first_name ASC;
```

Perintah di atas akan menampilkan daftar aktor yang diurutkan berdasarkan first_name dari A ke Z.
Jika ingin urutan terbalik, gunakan DESC.

## TOP (khusus SQL Server)

Klausa ‘TOP’ digunakan untuk membatasi jumlah baris yang ditampilkan dari hasil query.

Contoh syntax:
```sql
SELECT TOP 5 * FROM actor;
```

Perintah ini akan menampilkan 5 baris pertama dari tabel actor.
Biasanya digunakan untuk melihat sebagian kecil data atau hasil dengan performa lebih cepat.

## OFFSET dan FETCH

Klausa ‘OFFSET’ dan ‘FETCH’ digunakan untuk menampilkan data secara bertahap (pagination).

OFFSET menentukan berapa banyak baris yang akan dilewati.

FETCH menentukan berapa banyak baris yang akan diambil setelahnya.

Contoh syntax:
```sql
SELECT *
FROM actor
ORDER BY actor_id
OFFSET 10 ROWS FETCH NEXT 5 ROWS ONLY;
```
Pernyataan di atas akan melewati 10 baris pertama dan menampilkan 5 baris berikutnya dari tabel actor.
Cocok digunakan untuk fitur paging di aplikasi (misalnya halaman data ke-2, ke-3, dst).
