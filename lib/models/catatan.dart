import 'package:flutter/material.dart';

class Catatan {
  final String judul;
  final String isi;
  final String kategori;
  final String prioritas;
  final String tanggal;
  final Color warna;

  const Catatan({
    required this.judul,
    required this.isi,
    required this.kategori,
    required this.prioritas,
    required this.tanggal,
    required this.warna,
  });
}