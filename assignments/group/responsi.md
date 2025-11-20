---
id: responsi
title: RESPONSI AKHIR DBMS
sidebar_label: Responsi DBMS
sidebar_position: 1
Path: assignments/group/responsi
---

## Ketentuan: 

1. Buat satu Entity Relationship Diagram (ERD) dengan tema yang sudah disediakan
2. Komponen ERD: Entitas, Atribut, Hubungan (Relationship), dan Kardinalitas.
3. Selain membuat ERD buatkan juga implementasi kode SQL nya
4. Minimal tabel yang wajib dibuat berjumlah 10 tabel
5. Semakin kompleks ERD yang dibuat maka nilai semakin bagus

## Tema ERD

Ide Tema ERD :

1. Tema 1 – Sistem Perpustakaan Kampus / Sekolah
2. Tema 2 – Sistem Reservasi Hotel / Penginapan
3. Tema 3 – Sistem Penjualan Online (Toko Online Sederhana)
4. Tema 4 – Sistem Klinik / Poliklinik Sederhana
5. Tema 5 – Sistem Manajemen Kursus / Bimbel

## Isi Laporan

### BAB I – PENDAHULUAN

1. **Latar Belakang**

- Kenapa sistem ini dibutuhkan?

- Masalah apa yang ada pada proses manual saat ini?

- Contoh: “Di perpustakaan sekolah, pencatatan peminjaman masih manual sehingga sering terjadi data hilang…”

2. **Rumusan Masalah**

- Pertanyaan yang ingin dijawab.

- Contoh:

    - Bagaimana merancang basis data untuk sistem perpustakaan?

    - Bagaimana memodelkan data anggota, buku, dan peminjaman?

3. **Tujuan**

- Tujuan pembuatan proyek.

- Contoh:

    - Merancang ERD untuk sistem perpustakaan.

    - Mengimplementasikan rancangan ke dalam SQL (CREATE TABLE, dll).

4. **Batasan Masalah**

- Apa yang dibahas dan tidak dibahas.

- Contoh: tidak membahas tampilan aplikasi, hanya sampai basis data.

5. **Manfaat (opsional tapi bagus kalau ada)**

- Manfaat untuk siswa, pengguna, sekolah, dll.

### BAB II – LANDASAN TEORI

- Berisi teori sebagai dasar.

_(Bab ini tidak perlu terlalu panjang, yang penting menunjukkan teman" paham dasar teorinya.)_

### BAB III – ANALISIS DAN PERANCANGAN SISTEM

Ini bagian inti untuk **ERD**:

1. **Deskripsi Singkat Sistem yang Akan Dibuat**

- Cerita alur proses.

    - Contoh (tema perpustakaan):

    - Anggota mendaftar

    - Meminjam buku, dst

2. **Identifikasi Kebutuhan Data**

- Daftar entitas yang digunakan dan penjelasan singkat tiap entitas.

- Contoh tabel:

    - Entitas: ANGGOTA – menyimpan data anggota perpustakaan

    - Entitas: BUKU – menyimpan data buku, dll.

3. **Perancangan ERD**

- Gambar ERD lengkap.

- Tunjukkan kardinalitas (1–1, 1–N, M–N, dll).

4. **Penjelasan Relasi Antar Entitas**

- Jelaskan hubungan penting, misalnya:

    - “Satu anggota dapat melakukan banyak peminjaman, satu peminjaman dilakukan oleh tepat satu anggota.”

5. **Pemetaan ERD ke Model Relasional (Tabel)**

- Tabel-tabel hasil transformasi ERD.

- Daftar nama tabel, atribut, tipe data, primary key, foreign key.

    - Bisa bentuknya:

    - TABEL ANGGOTA (id_anggota [PK], nama, alamat, …)

    - TABEL PEMINJAMAN (id_peminjaman [PK], id_anggota [FK], tgl_pinjam, …)

### BAB IV – IMPLEMENTASI BASIS DATA

Ini bagian untuk **kode SQL**:

1. **Kode SQL Pembuatan Tabel (DDL)**

- Listing perintah CREATE TABLE untuk semua tabel (minimal 10).

- Sertakan primary key, foreign key.

2. **Pengisian Data Contoh (DML – INSERT)**

- Beberapa contoh INSERT untuk mengisi data ke tabel.

3. **Contoh Query**

- Beberapa SELECT (mungkin JOIN), UPDATE, DELETE jika mau.

- Tunjukkan bahwa struktur tabel sudah benar dan bisa dipakai.

4. **Hasil Pengujian**

- Screenshot hasil query dan struktur tabel.

### BAB V – PENUTUP

1. **Kesimpulan**

- Ringkasan hasil yang dicapai:

2. **Saran**

- Pengembangan lebih lanjut, misalnya:

    - Ditambah tampilan aplikasi, laporan otomatis, dst.

### Daftar Pustaka

- Buku / web / Jurnal yang dipakai sebagai referensi.

### Lampiran (opsional)

- ERD versi besar.

- Kode SQL lengkap (jika di Bab IV hanya ditampilkan sebagian).


## Pengumpulan

Tugas dikumpulkan berjumlah 2 file. 

File pertama source code dalam bentuk **.SQL**

File kedua adalah laporan dalam bentuk **PDF**

dengan ketentuan nama berkas contoh kelompok 1 👉🏻 `Responsi_Kelompok_1_.sql` & `Responsi_Kelompok_1_.pdf`

[Template Cover Laporan Docs 😴](https://docs.google.com/document/d/1kx1ru4vx-CHQNEVbLMbwejyr3mHqStHZ/edit?usp=sharing&ouid=103843316818891282446&rtpof=true&sd=true)

[Template Cover Laporan PDF 😴](https://drive.google.com/file/d/1x08DR5UU2ezNnyiOBOrKylxy7baP_02k/view?usp=sharing)

Pengumpulan tugas pada `Google Classroom` masing" kelas.

## Kontributor

- Addin Hadi Rizal
- Clementine Dwayani Danitasari
- Mohammed Nasser

:::info
## Credits

Tutorial ini dikembangkan oleh Asisten Praktikum DBMS 2025. Segala tutorial serta instruksi yang dicantumkan pada repositori ini dirancang sedemikian rupa sehingga mahasiswa yang sedang mengambil mata kuliah Basis Data dapat menyelesaikan tutorial saat sesi lab berlangsung.
:::