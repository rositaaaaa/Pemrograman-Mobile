import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang Aplikasi'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // Logo UIN STS Jambi
            Image.asset(
              'assets/uin_sts_logo.png',
              height: 120,
            ),
            SizedBox(height: 20),

            // Deskripsi Aplikasi
            Text(
              'Aplikasi Campus Feedback ini dikembangkan untuk membantu kampus '
              'mengumpulkan pendapat dan masukan dari mahasiswa secara mudah, '
              'interaktif, dan terstruktur.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),

            // Info Dosen & Mata Kuliah
            Card(
              elevation: 2,
              child: ListTile(
                leading: Icon(Icons.person, color: Colors.pinkAccent.shade100),
                title: Text('Dosen Pengampu'),
                subtitle: Text('Ahmad Nasukha, S.Hum, M.Si - Pemograman Mobile'),
              ),
            ),
            SizedBox(height: 10),

            // Info Pengembang
            Card(
              elevation: 2,
              child: ListTile(
                leading: Icon(Icons.school, color: Colors.pinkAccent.shade100),
                title: Text('Pengembang'),
                subtitle: Text('Rosita Br Bangun - 701230082'),
              ),
            ),
            SizedBox(height: 10),

            // Tahun Akademik
            Card(
              elevation: 2,
              child: ListTile(
                leading: Icon(Icons.calendar_today, color: Colors.pinkAccent.shade100),
                title: Text('Tahun Akademik'),
                subtitle: Text('2025/2026'),
              ),
            ),
            Spacer(),

            // Tombol kembali ke beranda
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent.shade100,
                  padding: EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back),
                label: Text('Kembali ke Beranda'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}