---
id: pertemuan-5
title: Performing Advanced Queries
sidebar_label: Pertemuan 5
sidebar_position: 6
slug: /pertemuan-5
---

> **Topik:** *Performing Advanced Queries*  
> **Platform:** Microsoft SQL Server (≥2019) & SSMS  
> **DBMS** — diselenggarakan oleh Fakultas Teknologi Informasi dan Sains Data Universitas Sebelas Maret, Semester Ganjil 2025/2026

## Agenda
- Advance Queries
- String Function
- Aggregate & Math Function
- Date Function

Pada materi kali ini menggunakan schema ini 

![sql](/img/p5/7.png)

:::info
Download file schema di Classroom masing" kelas
:::

## Advance Queries

![sql](/img/p5/1.png)

### INNER JOIN

INNER JOIN adalah salah satu jenis operasi JOIN dalam SQL yang digunakan untuk menggabungkan baris dari dua atau lebih tabel berdasarkan kondisi tertentu. Operasi ini hanya mengembalikan baris-baris di mana terdapat kecocokan (match) antara kolom pada tabel yang digabungkan.

Ciri utama INNER JOIN:
- Mengembalikan hanya data yang cocok di kedua tabel.
- Berguna untuk mengekstrak hubungan antar-tabel yang memiliki referensi satu sama lain, seperti relasi antara tabel pelanggan dengan pesanan.

![sql](/img/p5/2.png)

```sql
SELECT

select_list

FROM

T1

JOIN T2 ON join_predicate;

=================================================================

SELECT

*

FROM

SONG s

JOIN

ALBUM a

ON

s.AlbumID = a.ID
```

### LEFT JOIN

LEFT JOIN adalah jenis JOIN dalam SQL yang digunakan untuk menggabungkan data dari dua tabel. 

Dalam LEFT JOIN, semua baris dari tabel kiri (left table) akan ditampilkan dalam hasil, meskipun tidak ada data yang cocok di tabel kanan (right table). 

Jika tidak ada kecocokan, kolom dari tabel kanan akan diisi dengan nilai NULL.

![sql](/img/p5/3.png)

```sql
SELECT

select_list

FROM

T1

LEFT JOIN T2 ON join_predicate;

=================================================================

SELECT

*

FROM

SONG s

LEFT JOIN

ALBUM a

ON

s.AlbumID = a.ID
```

### RIGHT JOIN

RIGHT JOIN adalah jenis JOIN dalam SQL yang digunakan untuk menggabungkan data dari dua tabel. 

Dalam RIGHT JOIN, semua baris dari tabel kanan (right table) akan ditampilkan dalam hasil, meskipun tidak ada data yang cocok di tabel kiri (left table). 

Jika tidak ada kecocokan, kolom dari tabel kiri akan diisi dengan nilai NULL.

![sql](/img/p5/4.png)

```sql
SELECT

select_list

FROM

T1

RIGHT JOIN T2 ON join_predicate;

=================================================================

SELECT

*

FROM

SONG s

RIGHT JOIN

ALBUM a

ON

s.AlbumID = a.ID
```

### FULL OUTER JOIN

FULL OUTER JOIN mengembalikan semua baris dari tabel kanan dan baris dari tabel kiri.

Jika tidak ditemukan baris yang cocok dari tabel kiri maupun kanan, maka nilai kolom akan diisi
dengan NULL.

![sql](/img/p5/5.png)

```sql
SELECT

select_list

FROM

T1

FULL JOIN T2 ON join_predicate;

=================================================================

SELECT

*

FROM

SONG s

FULL JOIN

ALBUM a

ON

s.AlbumID = a.ID
```

### CROSS JOIN

CROSS JOIN menghasilkan _cartesian product_ antara dua tabel, yang berarti setiap baris dari tabel pertama akan digabungkan dengan setiap baris dari tabel kedua.

CROSS JOIN biasanya digunakan secara hati-hati karena dapat menghasilkan dataset yang sangat besar.

![sql](/img/p5/6.png)

```sql
SELECT

select_list

FROM

T1

CROSS JOIN T2;

=================================================================

SELECT

Customers.CustomerName, Orders.OrderID

FROM

Customers

CROSS JOIN

Orders
```

### GROUP BY

Klausa GROUP BY di SQL digunakan untuk mengelompokkan baris data berdasarkan nilai dalam satu atau lebih kolom. 

Setelah data dikelompokkan, fungsi agregat seperti `COUNT, SUM, AVG, MAX, atau MIN` sering digunakan untuk melakukan perhitungan pada setiap kelompok tersebut.

```sql
SELECT

select_list

FROM

T1

INNER JOIN T2 ON join_predicate

GROUP BY params;

=======================================================================

SELECT

brand_id,

MAX(list_price) MaxPrice

FROM

PRODUCTS

GROUP BY

brand_id
```

### HAVING

HAVING digunakan untuk memfilter hasil dari sebuah query yang melibatkan fungsi agregasi.

HAVING biasanya digunakan bersama dengan GROUP BY.

```sql
SELECT

B.brand_name,

AVG(P.list_price) AS avg_price

FROM

PRODUCTS P

JOIN

BRANDS B

ON

P.brand_id = B.brand_id

GROUP BY

B.brand_name

HAVING

AVG(P.list_price) > 1000;
```

### SUBQUERY

Subquery adalah sebuah perintah SQL yang digunakan untuk menanamkan (embed) suatu kueri di dalam kueri lain. 

Subquery sering digunakan untuk melakukan pemrosesan data yang lebih kompleks dengan cara membangun kueri dalam lapisan bertingkat. 

Subquery biasanya ditulis di dalam tanda kurung, dan hasil dari subquery akan digunakan oleh kueri utama untuk memproses data lebih lanjut.

SUBQUERY bisa berada di bagian SELECT, FROM, WHERE, atau HAVING dari query utama dan digunakan untuk menghasilkan nilai sementara yang bisa digunakan dalam query utama.

```sql
SELECT product_name,

model_year,

brand_id,

list_price

FROM PRODUCTS

WHERE list_price < (
SELECT AVG(list_price)

FROM PRODUCTS

)
```

## STRING FUNCTION

String function adalah built-in functions pada SQL Server yang memungkinkan users untuk memanipulasi data karakter ke beberapa cara.

String function memungkinkan users untuk melakukan berbagai operasi seperti menggabungkan, memotong, mengganti, mencari, atau mengubah format teks dalam suatu kolom atau nilai string.

Sumber belajar:

[Sumber 1](https://learn.microsoft.com/en-us/sql/t-sql/functions/string-functions-transact-sql?view=sql-server-ver16)

[Sumber 2](https://www.sqlservertutorial.net/sql-server-string-functions/)

### CONCAT

Fungsi CONCAT mengembalikan sebuah string hasil dari proses _concatenation_ atau penggabungan dari dua atau lebih string.

Jika users memasukkan hanya satu input string, CONCAT akan muncul error.

Jika users memasukkan non-character string, CONCAT akan secara implisit mengubahnya menjadi karakter string sebelum proses _concatenating_.

```sql
CONCAT ( input_string1, input_string2 [, input_stringN ] );

-----------

SELECT 'John' + ' ' + 'Doe' AS full_name;

full_name

---------

John Doe
```

### CONCAT_WS

Fungsi CONCAT_WS memungkinkan users untuk melakukan _concatenate_ lebih dari 1 string menjadi sebuah string dengan separator tertentu yang dispesifikkan .

CONCAT_WS membutuhkan separator argument dan minimum dua string argumen, jika tidak maka CONCAT_WS akan error.

Jika users memasukkan non-character string, CONCAT_WS akan secara implisit mengubahnya menjadi karakter string sebelum proses _concatenating_.

```sql
CONCAT_WS(separator,string1,string2,[...stringN]);

-----------

SELECT CONCAT_WS('-', 'John', 'Doe') full_name;

full_name

---------

John-Doe
```

### FORMAT

Fungsi FORMAT memformat suatu nilai menjadi nilai numerik, mata uang, tanggal ke dalam
format yang ditentukan.

[Lengkap ada disini](https://learn.microsoft.com/en-us/sql/t-sql/functions/format-transact-sql?view=sql-server-ver16) 

```sql
-----------

SELECT FORMAT(CAST('2024-10-11' AS datetime), 'dd/MM/yyyy') AS Date

--------------------

11/10/2024
```

### LEN

Fungsi LEN mengembalikan panjang string (jumlah karakter dalam string), KECUALI _trailing spaces_ (spasi di awal/di akhir).

Jika ingin menghitung _trailing spaces_, bisa menggunakan DATALENGTH yang tidak melakukan TRIM kepada argumen string.

Jika memproses string unicode, DATALENGTH akan mengembalikan angka yang mungkin tidak sama dengan jumlah karakter karena menghitung berdasarkan size in bytes.

```sql
LEN ( string_expression )

-----------

SELECT LEN('SQL Server LEN') length,

LEN('SQL Server LEN ') length_with_trailing_blanks;

length length_with_trailing_blanks

----------- ---------------------------

14 14
```

### REPLACES

Fungsi REPLACES mengganti semua kemunculan nilai string yang ditentukan dengan nilai string lain.

```sql
REPLACE(input_string, substring, new_substring);

-----------

SELECT REPLACE(

'It is a good tea at the famous tea store.',

'tea',

'coffee'

) result;

result

-------------

It is a good coffee at the famous coffee store.
```

### SUBSTRING

Digunakan untuk mengambil sebagian string dari sebuah kolom berdasarkan posisi awal dan panjang substring yang diinginkan.

```sql
SUBSTRING(input_string, start, length);
```

```sql
SELECT

SUBSTRING('SQL Server SUBSTRING', 5, 6) result;
```

```sql
result

------

Server

(1 row affected)
```

## Aggregate & Math Function

Aggregate function adalah fungsi yang melakukan perhitungan pada sekumpulan nilai dan mengembalikan satu nilai tunggal.

Kecuali fungsi COUNT(*), aggregate functions mengabaikan nilai NULL.

Fungsi-fungsi ini sering digunakan bersama dengan perintah GROUP BY untuk mengelompokkan data berdasarkan kolom tertentu dan melakukan operasi pada tiap kelompok data tersebut.

Sumber Belajar:

[Sumber 1](https://www.sqlservertutorial.net/sql-server-aggregate-functions/)

[Sumber 2](https://learn.microsoft.com/en-us/sql/t-sql/functions/aggregate-functions-transact-sql?view=sql-server-ver16)

### AVG

AVG merupakan fungsi untuk mencari nilai rata-rata dari suatu kolom/nilai.

Fungsi AVG() mengabaikan nilai NULL.

```sql
AVG([ALL | DISTINCT] expression)

-----------

SELECT AVG(Area) result

FROM country

result

-----------

569693.558571429
```

### COUNT

COUNT adalah fungsi agregasi untuk menghitung jumlah suatu item di dalam suatu kolom.

expression is an expression of any type but image, text, or ntext.

Mengabaikan NULL values 

```sql
COUNT([ALL | DISTINCT ] expression)

-----------

SELECT Country, COUNT(Name) AS CityCount

FROM city

GROUP BY Country;
```

### MAX

MAX mengembalikan nilai tertinggi (maksimum) dalam satu set nilai non-NULL.

```sql
MAX(expression)

-----------

SELECT e.Continent, MAX(c.Area)

FROM country c

JOIN encompasses e ON e.Country = c.Code

GROUP BY e.Continent
```

### MIN

MIN mengembalikan nilai terendah (minimum) dalam satu set nilai non-NULL.

```sql
MIN(expression)

-----------

SELECT e.Continent, MIN(c.Area)

FROM country c

JOIN encompasses e ON e.Country = c.Code

GROUP BY e.Continent
```

### SUM

Digunakan untuk menjumlahkan nilai-nilai numerik dalam satu grup. Ini sering digunakan untuk mendapatkan total dari kolom numerik seperti populasi, luas wilayah, atau jumlah penduduk di database.

```sql
SUM([ALL | DISTINCT ] expression)
```

```sql
SELECT

SUM(quantity) total_stocks

FROM

production.stocks;
```

```sql
total_stocks

------------

13511

(1 row affected)
```

### ABS

Digunakan untuk menghitung nilai absolut dari suatu bilangan, yaitu menghilangkan tanda negatif dari suatu angka.

```sql
ABS ( numeric_expression )
```

```sql
SELECT

recorded_at,

temperature,

ABS(temperature - 25) AS temperature_diff_from_ref

FROM

temperature_readings;
```

```sql
recorded_at | temperature | temperature_diff_from_ref

--------------------+-------------+--------------------------

2024-04-04 08:00:00 | 24.50 | 0.50

2024-04-04 08:15:00 | 25.20 | 0.20

2024-04-04 08:30:00 | 26.80 | 1.80

2024-04-04 08:45:00 | 23.90 | 1.10

2024-04-04 09:00:00 | 25.70 | 0.70

(5 rows)
```

### ROUND

Digunakan untuk membulatkan angka ke sejumlah digit desimal tertentu. Ini berguna ketika kita ingin mendapatkan hasil yang lebih ringkas atau sesuai dengan format pembulatan tertentu.

```sql
ROUND(number, length [, operation])
```

```sql
SELECT

ROUND(10.4567, 2) result;
```

```sql
result

-------

10.4600
```

```sql
SELECT

CAST(ROUND(10.4567, 2) AS DEC(6, 2)) result;
```

```sql
result

-------

10.46
```

## DATE FUNCTION

Date function adalah fungsi yang yang digunakan untuk mengelola dan memanipulasi data tanggal dan waktu.

Sumber Belajar:

[Sumber 1](https://www.sqlservertutorial.net/sql-server-date-functions/)

[Sumber 2](https://learn.microsoft.com/en-us/sql/t-sql/functions/date-and-time-data-types-and-functions-transact-sql?view=sql-server-ver16)

### CURRENT_TIMESTAMP

CURRENT_TIMESTAMP merupakan fungsi untuk mengembalikan waktu saat ini dari sistem operasi server tempat Basis Data SQL Server berjalan.

Waktu yang dikembalikan adalah nilai DATETIME tanpa offset zona waktu.

```sql
SELECT CURRENT_TIMESTAMP AS current_date_time;

-----------

current_date_time

-----------------------

2024-10-29 07:00:21.550
```

### GETDATE

GETDATE merupakan fungsi untuk mengembalikan tanggal dan waktu saat ini di zona waktu server.

Tidak seperti fungsi CURRENT_TIMESTAMP, GETDATE merupakan fungsi khusus SQL Server yang tidak selalu didukung pada platform basis data lain.

```sql
SELECT GETDATE() current_date_time;

-----------

current_date_time

-----------------------

2019-04-28 15:13:26.270
```

### DATENAME

DATENAME merupakan fungsi untuk mengembalikan STRING, tipe NVARCHAR, yang mewakili bagian tanggal tertentu, misalnya, tahun, bulan, dan hari dari tanggal tertentu.

```sql
SELECT DATENAME(YEAR, CURRENT_TIMESTAMP) 'Current Year'

-----------

Current Year

---------------------------

2024
```

### DATEPART

DATEPART merupakan fungsi untuk mengembalikan INTEGER yang mewakili bagian tanggal tertentu, misalnya, tahun, bulan, dan hari dari tanggal tertentu.

```sql
SELECT DATEPART(YEAR, CURRENT_TIMESTAMP) 'Current Year'

-----------

Current Year

---------------------------

2024
```

### DATEDIFF

DATEDIFF mengembalikan nilai selisih antara 2 tanggal dalam tahun, bulan, hari, dst.

```sql
DATEDIFF( date_part , start_date , end_date)

-----------

DECLARE

@start_dt DATETIME2= '2019-12-31 23:59:59.9999999',

@end_dt DATETIME2= '2020-01-01 00:00:00.0000000';

SELECT

DATEDIFF(year, @start_dt, @end_dt) diff_in_year,
result

-----------

1
```

## Kontributor

- Addin Hadi Rizal
- Clementine Dwayani Danitasari
- Mohammed Nasser

:::info
## Credits

Tutorial ini dikembangkan oleh Asisten Praktikum DBMS 2025. Segala tutorial serta instruksi yang dicantumkan pada repositori ini dirancang sedemikian rupa sehingga mahasiswa yang sedang mengambil mata kuliah Basis Data dapat menyelesaikan tutorial saat sesi lab berlangsung.
:::