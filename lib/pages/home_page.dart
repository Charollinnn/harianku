import 'package:flutter/material.dart';
import '../data/data_catatan.dart';
import '../models/catatan.dart';
import 'detail_page.dart';
import 'tambah_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const warnaUtama = Color(0xFF00897B);

  final List<String> _kategori = ['Semua', 'Pribadi', 'Kuliah', 'Kerja', 'Ide'];
  String _kategoriAktif = 'Semua';
  String _kataKunci = '';

  List<Catatan> get _hasil {
    return daftarCatatan.where((c) {
      final cocokKategori =
          _kategoriAktif == 'Semua' || c.kategori == _kategoriAktif;
      final cocokKata =
          c.judul.toLowerCase().contains(_kataKunci.toLowerCase());
      return cocokKategori && cocokKata;
    }).toList();
  }

  Future<void> _bukaTambahCatatan() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const TambahPage()),
    );
    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final hasil = _hasil;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 4),
              child: Text(
                'Halo, Mahasiswa 👋',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: warnaUtama,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Apa yang ingin kamu catat hari ini?',
                style: TextStyle(color: Colors.black54),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                onChanged: (nilai) {
                  setState(() {
                    _kataKunci = nilai;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Cari catatan...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: _kategori.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final nama = _kategori[index];
                  final aktif = nama == _kategoriAktif;
                  return ChoiceChip(
                    label: Text(nama),
                    selected: aktif,
                    showCheckmark: false,
                    selectedColor: warnaUtama,
                    labelStyle: TextStyle(
                      color: aktif ? Colors.white : Colors.black87,
                    ),
                    onSelected: (_) {
                      setState(() {
                        _kategoriAktif = nama;
                      });
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: hasil.isEmpty
                  ? const Center(child: Text('Catatan tidak ditemukan'))
                  : ListView.builder(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 90),
                      itemCount: hasil.length,
                      itemBuilder: (context, index) {
                        final catatan = hasil[index];
                        return _KartuCatatan(
                          catatan: catatan,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => DetailPage(catatan: catatan),
                              ),
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _bukaTambahCatatan,
        backgroundColor: warnaUtama,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _KartuCatatan extends StatelessWidget {
  final Catatan catatan;
  final VoidCallback onTap;

  const _KartuCatatan({required this.catatan, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: catatan.warna,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        catatan.judul,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${catatan.kategori} • ${catatan.tanggal}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  catatan.prioritas,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}