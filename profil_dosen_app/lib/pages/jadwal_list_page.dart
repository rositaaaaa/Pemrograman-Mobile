import 'package:flutter/material.dart';
import '../data/dummy_jadwal.dart';
import '../models/jadwal.dart';
import 'dosen_detail_page.dart';

class JadwalListPage extends StatelessWidget {
  const JadwalListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 💕 AppBar dengan warna pink elegan
      appBar: AppBar(
        title: const Text(
          'Daftar Dosen & Jadwal Kuliah',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFE91E63),
        centerTitle: true,
        elevation: 6,
        shadowColor: Colors.pinkAccent,
      ),

      // 🌷 Latar belakang gradasi pink lembut
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFC1E3), Color(0xFFFFE4F2)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(14),
          itemCount: daftarJadwal.length,
          itemBuilder: (context, index) {
            Jadwal data = daftarJadwal[index];
            return Card(
              elevation: 8,
              shadowColor: Colors.pinkAccent.withOpacity(0.3),
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 12,
                ),

                // 🩷 Avatar dengan warna lembut
                leading: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pinkAccent.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const CircleAvatar(
                    backgroundColor: Color(0xFFE91E63),
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                ),

                // 🌸 Nama dosen & mata kuliah
                title: Text(
                  data.dosen,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Color(0xFFAD1457),
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    data.mataKuliah,
                    style: const TextStyle(color: Colors.black87, fontSize: 14),
                  ),
                ),

                // 👉 Panah ke detail
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFFE91E63),
                ),

                // 🚪 Aksi pindah ke detail dosen
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DosenDetailPage(jadwal: data),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
