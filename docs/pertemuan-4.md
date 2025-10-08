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

## Agenda
- Evaluasi Hasil Latihan Lab 1
- Basic Queries

## Evaluasi Hasil Latihan Lab 1

- Untuk tabel continents, cities, religions, organizations pada `primary key` tambahkan `IDENTITY (1,1)` yang artinya
nanti agar sql server otomatis mengisi primary key nya dengan awalan angka 1 dan kelipatan 1 untuk angka berikutnya.

Temen" bisa mengunduh file SQL untuk latihan lab 1 dari link berikut:

- [📄 Mondial_Ujian_schema.sql](https://raw.githubusercontent.com/DBMS-FATISDA-UNS/DBMS-2025/refs/heads/main/static/lab/lab1/Mondial_Ujian_schema.sql)
- [📄 Mondial_Ujian_data.sql](https://raw.githubusercontent.com/DBMS-FATISDA-UNS/DBMS-2025/refs/heads/main/static/lab/lab1/Mondial_Ujian_data.sql)

### Hal Yang Perlu Diperhatikan

Ketika akan melakukan DDL (membuat tabel di database), pastikan terlebih dahulu membuat databasenya.
Di SQL Server, terdapat 4 buah database sistem yang mempunyai tugas
masing-masing. Lebih jelas bisa dibaca di link [berikut](https://www.careerride.com/SQL-Server-Master-MSDB-TEMPDB-Model.aspx).

:::warning
Oleh karena itu, jangan menjalankan query DDL ke dalam database master.
:::

Untuk mengecek database yang sedang kita gunakan bisa dilihat di sebelah kiri
tombol execute.

Atau untuk berpindah antar database menggunakan query bisa menggunakan syntax
berikut

```sql
USE <NAMA_DATABASE>;
```

Untuk memunculkan line number pada query bisa ikuti langkah [berikut](https://www.c-sharpcorner.com/article/how-to-enable-line-numbers-in-sql-server-management-studio-ssms/).

Ketika membuat file DDL, pastikan didalamnya terdapat migration up dan migration down.

Migration Up: adalah proses menerapkan perubahan skema ke basis data yang lebih baru. Ketika Anda melakukan migrasi "up", Anda menerapkan perubahan ke database untuk menyesuaikannya dengan definisi skema yang baru.

Migration Down: adalah proses membatalkan perubahan skema yang telah diterapkan sebelumnya. Ini digunakan untuk mengembalikan basis data ke versi sebelumnya dengan membatalkan perubahan yang telah diterapkan melalui migrasi "up".

Urutan ketika menyusun migration up:

__Dari tabel yang tidak mereferensi tabel lain dahulu.__

Urutan ketika menyusun migration down:

__Dari tabel tidak diferensi tabel lain dahulu.__

## Basic Queries

Pada materi kali ini menggunakan schema [mondial](https://www.dbis.informatik.uni-goettingen.de/Mondial/)

:::info
Download file schema dan data pada classroom kelas masing"
:::

![mondial](/img/p4/1.png)

### SELECT

Pernyataan ‘SELECT’ digunakan untuk memilih atribut yang akan ditampilkan atau dimanipulasi dari tabel. Dengan ‘SELECT’,
kita dapat memilih satu atau lebih atribut dari satu atau lebih tabel, serta dapat memberikan alias pada atribut yang
dipilih. Pernyataan ini terdiri dari dua bagian utama, yaitu ‘SELECT’ dan ‘FROM’.

- SELECT: Menentukan atribut atau kolom yang ingin ditampilkan.
- FROM: Menentukan tabel asal dari atribut atau kolom yang dipilih. FROM sangat penting karena mengidentifikasi sumber
data yang akan diambil.

Contoh syntax Select:

```sql
SELECT

nama_kolom1,

nama_kolom2

FROM

nama_tabel;
```

Contoh mengambil data pada semua kolom
```sql
SELECT

*

FROM

nama_tabel;
```

### SELECT DISTINCT

SELECT DISTINCT digunakan untuk mengambil satu-satunya nilai yang berbeda dalam daftar kolom tertentu.

Syntax:
```sql
SELECT DISTINCT nama_kolom1

FROM nama_tabel;
```

### NULL

NULL digunakan untuk menunjukkan tidak adanya nilai data apa pun.

```sql
SELECT nama_kolom1, nama_kolom2

FROM nama_tabel

WHERE condition [IS NULL | IS NOT NULL]
```

### WHERE

Pernyataan ‘WHERE’ digunakan untuk memfilter baris data berdasarkan kondisi tertentu. Dengan ‘WHERE’, kita dapat
menentukan kriteria yang harus dipenuhi agar data ditampilkan.

WHERE: Menentukan kondisi atau syarat yang harus dipenuhi oleh data yang diambil.

Syntax:
```sql
SELECT nama_kolom1, nama_kolom2

FROM nama_tabel

WHERE condition
```

Contoh syntax:

```sql
SELECT first_name, last_name
FROM actor
WHERE first_name = 'Nick';
```

Pernyataan di atas akan menampilkan data first_name dan last_name dari tabel actor yang memiliki first_name bernilai
‘Nick’.
Hasilnya adalah hanya baris yang memenuhi kondisi tersebut.

### AND

Operator ‘AND’ digunakan untuk menggabungkan dua atau lebih kondisi dalam klausa WHERE. Semua kondisi yang dihubungkan
dengan AND harus benar agar baris data ditampilkan.

Syntax:
```sql
SELECT nama_kolom1, nama_kolom2

FROM nama_tabel

WHERE condition1 AND condition2
```

Contoh syntax:

```sql
SELECT * FROM actor WHERE first_name = 'Nick' AND last_name = 'Wahlberg';
```


Pernyataan di atas akan menampilkan data dari tabel actor yang memiliki first_name = 'Nick' dan last_name = 'Wahlberg'.
Hasilnya hanya satu atau beberapa baris yang memenuhi kedua kondisi sekaligus.

### OR

Operator ‘OR’ digunakan untuk menampilkan data yang memenuhi salah satu dari beberapa kondisi.

Syntax:
```sql
SELECT nama_kolom1, nama_kolom2

FROM nama_tabel

WHERE condition1 OR condition2
```

Contoh Syntax :

```sql
SELECT * FROM actor WHERE first_name = 'Nick' OR first_name = 'Penelope';

```
Perintah di atas akan menampilkan semua aktor yang memiliki first_name = 'Nick' atau first_name = 'Penelope'.
Jika salah satu kondisi terpenuhi, baris data akan ditampilkan.

### IN

Operator ‘IN’ digunakan untuk memeriksa apakah nilai suatu kolom termasuk dalam daftar nilai tertentu.

Contoh syntax:

```sql
SELECT * FROM actor WHERE first_name IN ('Nick', 'Penelope', 'Ed');
```

Pernyataan tersebut akan menampilkan semua data dari tabel actor yang memiliki first_name bernilai Nick, Penelope, atau
Ed.
Hasilnya adalah baris yang sesuai dengan daftar nilai yang disebutkan.

### BETWEEN

Operator ‘BETWEEN’ digunakan untuk memfilter data berdasarkan rentang nilai (range), baik angka maupun tanggal.

Syntax:
```sql
SELECT nama_kolom1, nama_kolom2

FROM nama_tabel

WHERE expression BETWEEN start_expression AND end_expression
```

Contoh syntax:

```sql
SELECT * FROM payment WHERE amount BETWEEN 5 AND 10;
```

Pernyataan di atas akan menampilkan semua data dari tabel payment dengan nilai amount di antara 5 dan 10 (termasuk 5 dan
10). Hasilnya adalah baris dengan nilai amount ≥ 5 dan ≤ 10.

### LIKE

Operator ‘LIKE’ digunakan untuk pencarian pola (pattern matching) pada teks.
Simbol yang digunakan:

Pola / Pattern ini dapat menyertakan karakter wildcard yang valid berikut ini:
1. Karakter pengganti persen ‘%’: string apa pun yang terdiri dari nol karakter atau lebih.
2. Karakter pengganti garis bawah ‘_’: karakter tunggal apa pun.
3. Karakter pengganti [daftar karakter]: karakter tunggal apa pun dalam set yang ditentukan.
4. Karakter [karakter-karakter]: karakter tunggal apa pun dalam rentang yang ditentukan.
5. Tanda [^]: karakter apa pun yang tidak berada dalam daftar atau rentang.

Syntax:
```sql
column | expression LIKE pattern [ESCAPE escape_character]
```

Contoh syntax:

```sql
SELECT * FROM actor WHERE first_name LIKE 'A%';
```

Pernyataan di atas akan menampilkan semua aktor yang first_name-nya diawali huruf A.
Misalnya: Adam, Angela, Arthur, dll.

### COLUMN & TABEL ALIAS
Alias digunakan untuk memberikan nama sementara pada kolom agar hasil query lebih mudah dibaca. Alias dapat ditulis
dengan atau tanpa kata kunci AS.

Contoh syntax:
```sql
SELECT first_name AS [Nama Depan], last_name AS[Nama Belakang] FROM actor;
```

Pernyataan di atas menampilkan kolom first_name dan last_name, tetapi dengan judul kolom yang diubah menjadi Nama Depan dan Nama Belakang. Alias tidak mengubah nama kolom di tabel asli, hanya pada tampilan hasil query.

### ORDER BY

Pernyataan ‘ORDER BY’ digunakan untuk mengurutkan hasil query berdasarkan satu atau lebih kolom, baik secara `ASC (naik)` atau `DESC (turun)`.

Syntax:
```sql
SELECT

nama_kolom

FROM

nama_tabel

ORDER BY

nama_kolom [ASC | DESC];
```

:::note
Secara default tanpa pakai ASC / DESC sql server bakal mengurutkan data secara ASC (Ascending)
:::

Contoh syntax:
```sql
SELECT first_name, last_name FROM actor ORDER BY first_name ASC;
```

Perintah di atas akan menampilkan daftar aktor yang diurutkan berdasarkan first_name dari A ke Z.
Jika ingin urutan terbalik, gunakan DESC.

### TOP (khusus SQL Server)

Klausa ‘TOP’ digunakan untuk membatasi jumlah baris yang ditampilkan dari hasil query.

Contoh syntax:
```sql
SELECT TOP 5 * FROM actor;
```

Perintah ini akan menampilkan 5 baris pertama dari tabel actor.
Biasanya digunakan untuk melihat sebagian kecil data atau hasil dengan performa lebih cepat.

### OFFSET dan FETCH

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

:::info
Jika ingin menggunakan `FETCH`, harus menuliskan `OFFSET`.
:::

Pernyataan di atas akan melewati 10 baris pertama dan menampilkan 5 baris berikutnya dari tabel actor.
Cocok digunakan untuk fitur paging di aplikasi (misalnya halaman data ke-2, ke-3, dst).

## String Functions
[Link Materi](https://www.sqlservertutorial.net/sql-server-string-functions/)

## AggregateFunctions
[Link Materi](https://www.sqlservertutorial.net/sql-server-aggregate-functions/)

## Date Function
[Link Materi](https://www.sqlservertutorial.net/sql-server-date-functions/)

## Kontributor

- Addin Hadi Rizal
- Clementine Dwayani Danitasari
- Mohammed Nasser

:::warning
## Credits

Tutorial ini dikembangkan oleh Asisten Praktikum DBMS 2025. Segala tutorial serta instruksi yang dicantumkan pada repositori ini dirancang sedemikian rupa sehingga mahasiswa yang sedang mengambil mata kuliah Basis Data dapat menyelesaikan tutorial saat sesi lab berlangsung.
:::