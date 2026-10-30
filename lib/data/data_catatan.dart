import 'package:flutter/material.dart';
import '../models/catatan.dart';

final List<Catatan> daftarCatatan = [
  const Catatan(
    judul: 'Ide Proyek Akhir',
    isi: 'Membuat aplikasi mobile dengan fitur yang berguna untuk mahasiswa.',
    kategori: 'Ide',
    prioritas: 'Tinggi',
    tanggal: '29 Oktober 2026',
    warna: Color(0xFFFFF3C4),
  ),
  const Catatan(
    judul: 'Tugas Pemrograman Mobile',
    isi: 'Selesaikan UI 5 halaman, rekam video, dan susun laporan.',
    kategori: 'Kuliah',
    prioritas: 'Tinggi',
    tanggal: '28 Oktober 2026',
    warna: Color(0xFFD6EAF8),
  ),
  const Catatan(
    judul: 'Rapat Kelompok PBL',
    isi: 'Bahas pembagian tugas dan jadwal pengerjaan minggu ini.',
    kategori: 'Kerja',
    prioritas: 'Sedang',
    tanggal: '27 Oktober 2026',
    warna: Color(0xFFD5F5E3),
  ),
  const Catatan(
    judul: 'Belanja Bulanan',
    isi: 'Sabun, beras, telur, dan kebutuhan dapur lainnya.',
    kategori: 'Pribadi',
    prioritas: 'Rendah',
    tanggal: '26 Oktober 2026',
    warna: Color(0xFFFADBD8),
  ),
  const Catatan(
    judul: 'Jurnal Hari Ini',
    isi: 'Hari ini cukup padat, tapi semua target berhasil dikerjakan.',
    kategori: 'Pribadi',
    prioritas: 'Rendah',
    tanggal: '25 Oktober 2026',
    warna: Color(0xFFE8DAEF),
  ),
];