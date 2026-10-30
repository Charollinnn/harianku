import 'package:flutter/material.dart';
import '../data/data_catatan.dart';
import '../models/catatan.dart';

class TambahPage extends StatefulWidget {
  const TambahPage({super.key});

  @override
  State<TambahPage> createState() => _TambahPageState();
}

class _TambahPageState extends State<TambahPage> {
  static const warnaUtama = Color(0xFF00897B);

  final _judulController = TextEditingController();
  final _isiController = TextEditingController();

  final List<String> _daftarKategori = ['Pribadi', 'Kuliah', 'Kerja', 'Ide'];
  final List<Color> _daftarWarna = const [
    Color(0xFFFFF3C4),
    Color(0xFFD6EAF8),
    Color(0xFFD5F5E3),
    Color(0xFFFADBD8),
    Color(0xFFE8DAEF),
  ];
  final List<String> _bulan = [
    'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
    'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember',
  ];

  String? _kategori;
  Color _warna = const Color(0xFFFFF3C4);
  String _prioritas = 'Sedang';

  @override
  void dispose() {
    _judulController.dispose();
    _isiController.dispose();
    super.dispose();
  }

  String _tanggalHariIni() {
    final sekarang = DateTime.now();
    return '${sekarang.day} ${_bulan[sekarang.month - 1]} ${sekarang.year}';
  }

  void _simpan() {
    if (_judulController.text.trim().isEmpty || _kategori == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Judul dan kategori wajib diisi')),
      );
      return;
    }

    daftarCatatan.insert(
      0,
      Catatan(
        judul: _judulController.text.trim(),
        isi: _isiController.text.trim(),
        kategori: _kategori!,
        prioritas: _prioritas,
        tanggal: _tanggalHariIni(),
        warna: _warna,
      ),
    );

    Navigator.pop(context);
  }

  InputDecoration _dekorasi(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
    );
  }

  Widget _label(String teks) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 8),
      child: Text(
        teks,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Catatan'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _label('Judul Catatan'),
                TextField(
                  controller: _judulController,
                  decoration: _dekorasi('Masukkan judul catatan'),
                ),
                _label('Isi Catatan'),
                TextField(
                  controller: _isiController,
                  maxLines: 5,
                  decoration: _dekorasi('Tulis catatan Anda di sini...'),
                ),
                _label('Kategori'),
                DropdownButtonFormField<String>(
                  value: _kategori,
                  hint: const Text('Pilih kategori'),
                  decoration: _dekorasi(''),
                  items: _daftarKategori
                      .map((k) => DropdownMenuItem(value: k, child: Text(k)))
                      .toList(),
                  onChanged: (nilai) {
                    setState(() {
                      _kategori = nilai;
                    });
                  },
                ),
                _label('Warna'),
                Row(
                  children: _daftarWarna.map((warna) {
                    final dipilih = warna == _warna;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _warna = warna;
                        });
                      },
                      child: Container(
                        width: 44,
                        height: 44,
                        margin: const EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                          color: warna,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: dipilih ? warnaUtama : Colors.black12,
                            width: dipilih ? 3 : 1,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                _label('Prioritas'),
                SizedBox(
                  width: double.infinity,
                  child: SegmentedButton<String>(
                    segments: const [
                      ButtonSegment(value: 'Rendah', label: Text('Rendah')),
                      ButtonSegment(value: 'Sedang', label: Text('Sedang')),
                      ButtonSegment(value: 'Tinggi', label: Text('Tinggi')),
                    ],
                    selected: {_prioritas},
                    showSelectedIcon: false,
                    style: SegmentedButton.styleFrom(
                      selectedBackgroundColor: warnaUtama,
                      selectedForegroundColor: Colors.white,
                    ),
                    onSelectionChanged: (pilihan) {
                      setState(() {
                        _prioritas = pilihan.first;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 28),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _simpan,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: warnaUtama,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text('Simpan', style: TextStyle(fontSize: 16)),
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