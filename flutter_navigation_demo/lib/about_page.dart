import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Aplikasi'),
        backgroundColor: const Color(0xFFFF69B4),
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFF0F5),
              Color(0xFFFFE4EC),
              Colors.white,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF69B4).withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.flutter_dash,
                        size: 48,
                        color: Color(0xFFFF69B4),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Tentang Aplikasi ',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFF69B4),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Flutter Navigation Demo\n\n'
                      'Aplikasi ini dibuat untuk mempelajari navigasi dasar Flutter, termasuk:\n\n'
                      '• Navigator.push() & Navigator.pop()\n'
                      '• Pengiriman data antar halaman\n'
                      '• BottomNavigationBar & Drawer\n\n'
                      'Desain dengan tema warna pink yang lembut dan elegan.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF555555),
                        height: 1.6,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF69B4),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Made with  Flutter',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}