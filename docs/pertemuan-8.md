---
id: pertemuan-8
title: Database Administration
sidebar_label: Pertemuan 8
sidebar_position: 9
slug: /pertemuan-8
---

> **Topik:** *Database Administration*  
> **Platform:** Microsoft SQL Server (≥2019) & SSMS  
> **DBMS** — diselenggarakan oleh Fakultas Teknologi Informasi dan Sains Data Universitas Sebelas Maret, Semester Ganjil 2025/2026

## Agenda
- Evaluasi lab 2 & 3
- Database Administration

## Evaluasi lab 2 & 3 

[Soal Ujian Praktikum Tahun Lalu 😴](https://drive.google.com/file/d/1hLhXXS9yx1t_K0aYOZ5DVBV-4Wqww8vT/view?usp=sharing)

## Database Administration

### Pengertian

Database administration pada SQL Server merujuk pada serangkaian tugas dan tanggung jawab yang terkait dengan pengelolaan dan pemeliharaan sistem basis data SQL Server. Ini mencakup berbagai aspek teknis dan administratif yang bertujuan untuk memastikan bahwa basis data berfungsi dengan baik, aman, dan efisien.

### Enable Login SQL Server

- Langkah 1. Login pada SSMS dan klik kanan **properties** pada server

![sql](/img/p6/1.png)

- Langkah 2. Pergi ke tab security dan pada bagian Server authentication pilih SQL Server dan Windows Auth mode, lalu klik OK

![sql](/img/p6/2.png)

- Langkah 3. Restart server, klik kanan pada server dan pilih restart

![sql](/img/p6/3.png)

### CREATE LOGIN

Login adalah kredensial yang digunakan untuk mengotentikasi pengguna saat mengakses SQL Server. Login dikelola pada tingkat server dan memberikan akses ke server SQL secara keseluruhan.

Contoh **CREATE LOGIN**
```sql
CREATE LOGIN login_name

WITH PASSWORD = password;

CREATE LOGIN bob

WITH PASSWORD='bobganteng';
```

CONTOH **ALTER LOGIN**
```sql
ALTER LOGIN login_name

WITH NAME = new_name;

ALTER LOGIN login_name

WITH PASSWORD = new_password;
```

Contoh **DROP LOGIN**
```sql
DROP LOGIN login_name

DROP LOGIN 
```

### CREATE USER

User adalah entitas di dalam database tertentu yang dihubungkan ke login yang sudah ada. User dikelola pada tingkat database dan memberikan izin akses ke objek-objek di dalam database.

Contoh **CREATE USER**
```sql
CREATE USER username

FOR LOGIN login_name;

CREATE USER bob

FOR LOGIN bob;
```

Contoh **ALTER USER**
```sql
ALTER USER user_name

WITH NAME new_name;

ALTER USER user_name

WITH LOGIN = new_login;
```

Contoh **DROP USER**
```sql
DROP USER username

DROP USER bob
```

### GRANT PERMISSION

Grant Permission adalah proses memberikan izin spesifik kepada USER atau ROLE untuk melakukan tindakan tertentu pada objek database seperti tabel, prosedur, dan lainnya.

```sql
GRANT jenis_permissions

ON nama_tabel TO nama_user/nama_role;

GRANT SELECT, UPDATE, INSERT, DELETE

ON ARTIKEL TO bob;
```

### REVOKE

Revoke adalah proses menghapus izin spesifik yang telah diberikan kepada USER atau ROLE untuk melakukan tindakan tertentu pada objek database seperti tabel.

```sql
REVOKE jenis_permissions

ON nama_tabel

FROM nama_user/nama_role;

REVOKE DELETE

ON ARTIKEL

FROM bob;
```

### ROLE

ROLE adalah sebuah grup atau kumpulan yang digunakan untuk mengelompokkan pengguna dan memberikan izin kepada seluruh grup pengguna tersebut. ROLE memungkinkan administrator database untuk mengelola izin secara efisien dengan memberikan izin kepada satu ROLE daripada memberikan izin kepada setiap pengguna secara individual.

Contoh **CREATE ROLE**
```sql
CREATE ROLE nama_role;

CREATE ROLE penulis;
```

Contoh **menambah member ke ROLE**
```sql
ALTER ROLE nama_role

ADD MEMBER nama_user;

ALTER ROLE penulis

ADD MEMBER bob;
```

Contoh **menghapus member ke ROLE**
```sql
ALTER ROLE nama_role

DROP MEMBER nama_user;

ALTER ROLE penulis

DROP MEMBER bob;
```

Contoh **menghapus ROLE**
```sql
DROP ROLE IF EXISTS nama_role;

DROP ROLE IF EXISTS penulis;
```






