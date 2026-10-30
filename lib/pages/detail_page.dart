import 'package:flutter/material.dart';
import '../models/catatan.dart';

class DetailPage extends StatelessWidget {
  final Catatan catatan;

  const DetailPage({super.key, required this.catatan});

  static const warnaUtama = Color(0xFF00897B);

  Color _warnaPrioritas() {
    switch (catatan.prioritas) {
      case 'Tinggi':
        return const Color(0xFFE53935);
      case 'Sedang':
        return const Color(0xFFFB8C00);
      default:
        return const Color(0xFF43A047);
    }
  }

  Widget _label(IconData ikon, String teks, Color warna) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(ikon, size: 16, color: warna),
          const SizedBox(width: 6),
          Text(
            teks,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: warna,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Catatan'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: catatan.warna,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        catatan.judul,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 14),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          _label(Icons.folder_outlined, catatan.kategori,
                              warnaUtama),
                          _label(Icons.flag_outlined, catatan.prioritas,
                              _warnaPrioritas()),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Icon(Icons.calendar_today_outlined,
                        size: 18, color: Colors.black54),
                    const SizedBox(width: 8),
                    Text(
                      catatan.tanggal,
                      style: const TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
                const Divider(height: 32),
                const Text(
                  'Isi Catatan',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: warnaUtama,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  catatan.isi.isEmpty ? 'Tidak ada isi catatan.' : catatan.isi,
                  style: const TextStyle(fontSize: 15, height: 1.6),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}