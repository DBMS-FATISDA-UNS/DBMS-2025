---
sidebar_label: Kontrak Kuliah Praktikum
sidebar_position: 2
Path: docs/kontrak-kuliah
---

# Kontrak Kuliah: Praktikum Database Management System

DBMS — diselenggarakan oleh Fakultas Teknologi Informasi dan Sains Data Universitas Sebelas Maret, Semester Ganjil 2025/2026

---

## Tujuan Pembelajaran

Setelah menyelesaikan tutorial ini, mahasiswa diharapkan untuk dapat:

- Mengetahui cara instalasi IDE atau aplikasi untuk keperluan praktikum
- Mengetahui materi apa saja yang akan dipelajari selama praktikum dbms
- Menjalankan aplikasi yang diperlukan di laptop / komputer local masing" mahasiswa

## Requirements Tools

Aplikasi yang digunakan dalam praktikum ini adalah SQL Server dan SQL Server Manager Studio (SSMS). SQL Server digunakan untuk minimal versi 2016. Sedangkan SSMS digunakan minimal juga versi 2016. Berikut link untuk instalasi kedua aplikasi tersebut.

| **_Nama File_**           | **_Fungsi_**                                            | **_Link Download_** |
| ------------------------- | ------------------------------------------------------- | ------------------- |
| **SQL2022-SSEI-Dev.exe**  | SQL Server Installer                                    | [Download the SQL Server](https://www.microsoft.com/en-us/sql-server/sql-server-downloads) |
| **SSMS-Setup-ENU.exe**    | SQL Server Manager Studio Installer                     | [Download SSMS](https://learn.microsoft.com/en-us/ssms/install/install?view=sql-server-ver16#download-ssms) |


## Langkah 1: Instalasi _SQL Server_

Langkah-langkah Instalasi SQL Server hampir sama untuk semua versinya. Namun, dalam praktikum ini, contoh Instalasi dalam praktikum ini menggunakan SQL Server 2019 Developer Edition. Berikut langkah-langkah instalasinya:

#### a.	Pilih installer “Developer” seperti pada gambar berikut:

![gambar](/img/kontrak/1.png)

#### b.	Setelah mendownload installer, maka akan muncul pilihan seperti berikut. Pilih opsi _Download Media_.

![gambar](/img/kontrak/2.png)

#### c.	Pilih bahasa “English”, Package: ISO (1367 MB), dan tentukan lokasi instalasi (Bebas).

![gambar](/img/kontrak/3.png)

#### d.	Tunggu hingga proses download selesai

![gambar](/img/kontrak/4.png)

#### e.	Setelah selesai, tekan ‘Open Folder’

![gambar](/img/kontrak/5.png)

#### f.	Cari file “SQLServer2019-x64-ENU-Dev.iso” Mount file ISO

![gambar](/img/kontrak/6.png)

#### g.	Buka setup.exe

![gambar](/img/kontrak/7.png)

#### h.	Setelah membuka setup.exe, akan muncul window seperti di bawah. Klik “Installation” pada bagian kiri.

![gambar](/img/kontrak/8.png)

#### i.	Klik link paling atas seperti pada gambar di bawah.

![gambar](/img/kontrak/9.png)

#### j.	Klik “Specify a free edition:” dan masukkan “Developer”

![gambar](/img/kontrak/10.png)

#### k.	Cheklist “I accept the license terms and Privacy Statement” lalu klik next.

![gambar](/img/kontrak/11.png)

#### l.	Uncheck tombol “Use Microsoft Update to check for updates (Recommended) jika anda tidak ingin mendapatkan update SSMS melalui Windows Update (Otomatis).

![gambar](/img/kontrak/12.png)

#### m.	Jika semua Status telah “Passed” maka anda dapat klik “Next”.

![gambar](/img/kontrak/13.png)

#### n.	Pilih fitur yang anda inginkan. Untuk keperluan praktikum, hanya “Database Engine Services” saja yang dibutuhkan. Setelah ceklis, lalu anda dapat klik “Next”.

![gambar](/img/kontrak/14.png)

#### o.	Masukkan Instance ID untuk SQL Server. Instance ID bisa mengikuti nama pada gambar saja, yaitu “MSSQLSERVER”.

![gambar](/img/kontrak/15.png)

#### p.	Opsi “Mixed Mode” TIDAK WAJIB. Untuk keperluan praktikum, anda dapat menggunakan opsi “Windows authentication mode” kemudian add Current User.

![gambar](/img/kontrak/16.png)

#### q.	Verifikasi ulang fitur-fitur yang diinstal dan jika telah sesuai, klik “Install” untuk menyelesaikan instalasi.

![gambar](/img/kontrak/17.png)

#### r.	Setelah semua status “Succeeded” maka anda dapat klik “Close” dan instalasi SSMS telah sukses.

![gambar](/img/kontrak/18.png)


**Catatan:**

- Pastikan kamu memilih IDE yang sesuai dengan jenis proyek yang akan dikerjakan.
- Jangan ragu untuk mengeksplorasi fitur-fitur IDE (contoh: _extensions_ atau _plugin_) dan memanfaatkan sumber daya pendukung, seperti dokumentasi dan tutorial, untuk meningkatkan produktivitas dalam pengembangan perangkat lunak.

## Extension Yang Diperlukan

Sementara temen" mungkin butuh extension ini dan mungkin beberapa dari kalian sudah ada yang punya:

1. Code Runner, Extension ID -> **`formulahendry.code-runner`**
2. Live Server, Extension ID -> **`ritwickdey.LiveServer`**
3. HTML CSS Support, Extension ID -> **`ecmel.vscode-html-css`**
4. Auto Rename Tag, Extension ID -> **`formulahendry.auto-rename-tag`**

## Rencana Materi Pembelajaran

Berikut tabel Rencana Materi Pembelajaran :

| **_Pertemuan_**    | **_Materi_**                                            |
| ------------------ | ------------------------------------------------------- |
| **Pertemuan - 1**  | Kontrak Praktikum dan Instalasi Web Server              |
| **Pertemuan - 2**  | HTML                                                    |
| **Pertemuan - 3**  | CSS                                                     |
| **Pertemuan - 4**  | Javascript                                              |
| **Pertemuan - 5**  | JQuery                                                  |
| **Pertemuan - 6**  | Ajax                                                    |
| **Pertemuan - 7**  | PHP Native & Database MySQL                             |
| **Pertemuan - 8**  | OOP (Object Oriented Programming) + Form Validation     |
| **Pertemuan - 9**  | Session & Cookie                                        |
| **Pertemuan - 10** | Laravel 1 (MVC Routes)                                  |
| **Pertemuan - 11** | Laravel 2 (Migration Seeder Factory) & (Authentication) |
| **Pertemuan - 12** | Laravel 3 (Create, Read, Update, Delete)                |
| **Pertemuan - 13** | Laravel 4 (Search Function)                             |
| **Pertemuan - 14** | Checking Tugas Besar dan Pengumpulan Akhir Tugas        |

## Instalasi Web Server

### Langkah 1: Pemilihan App buat akses web server

Pilihlah _Aplikasi_ yang sesuai dengan preferensimu (Composer membutuhkan PHP. Pastikan kamu sudah memiliki PHP atau XAMPP karena XAMPP sudah memiliki PHP di dalamnya):

## Akhir Kata

Selamat, ya! Kamu sudah menyelesaikan tutorial tentang instalasi IDE dan instalasi Web Server dan memahami rencana pembelajaran untuk praktikum _PEMWEB_ semester ini 🔥.

Ke depannya, kalau sedang mengerjakan tugas, jangan grogi sama banyaknya materi, ya. Santai saja, ini bukan lomba _sprint_ kok; pelan-pelan saja, pasti bisa. Kode-kode itu tidak harus langsung masuk ke otak, tapi yang penting dimengerti, kan? Jadi, **jangan sampai asal _copy-paste_ tanpa mengerti** ya, nanti jadi bingung sendiri. Kalau memang buntu, jangan malu untuk bertanya ke teman atau asisten dosen. Asisten dosen sudah pasti siap bantuin 🥹🫶🏻, kok. Jadi, semangat terus dan nikmati prosesnya. _Good luck!_

## Referensi Tambahan

- [About pull request merges](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/incorporating-changes-from-a-pull-request/about-pull-request-merges)
- [Resolving a merge conflict on GitHub](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/addressing-merge-conflicts/resolving-a-merge-conflict-on-github)

## Kontributor

- Addin Hadi Rizal
- Abraham Willem Hersubagyo
- Bani Rijal Barru Faza
- Mohammed Nasser

## Credits

Tutorial ini dikembangkan oleh Asisten Praktikum Pemrograman Website 2025. Segala tutorial serta instruksi yang dicantumkan pada repositori ini dirancang sedemikian rupa sehingga mahasiswa yang sedang mengambil mata kuliah Pemrograman Website dapat menyelesaikan tutorial saat sesi lab berlangsung.

[GitHub]: https://github.com/