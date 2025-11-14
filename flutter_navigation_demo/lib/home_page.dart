import 'package:flutter/material.dart';
import 'about_page.dart';
import 'feedback_form_page.dart';
import 'feedback_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String _feedbackMessage = '';

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return _buildHomeContent();
      case 1:
        return FeedbackDetailPage(data: _feedbackMessage);
      case 2:
        return _buildProfileContent();
      default:
        return _buildHomeContent();
    }
  }

  Widget _buildHomeContent() {
    return Container(
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
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFFF69B4).withOpacity(0.2),
                      blurRadius: 15,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.home,
                  size: 64,
                  color: Color(0xFFFF69B4),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Selamat Datang! ',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF555555),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Aplikasi Navigasi dengan Tema Pink',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF888888),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              if (_feedbackMessage.isNotEmpty) ...[
                Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.feedback,
                              color: Color(0xFFFF69B4),
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Feedback Terbaru:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFF69B4),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF0F5),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color(0xFFFFB6C1),
                            ),
                          ),
                          child: Text(
                            _feedbackMessage,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color(0xFF555555),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ] else ...[
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Icon(
                          Icons.lightbulb_outline,
                          size: 48,
                          color: Color(0xFFFF69B4),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Belum ada feedback',
                          style: TextStyle(
                            color: Color(0xFF888888),
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Klik tombol "Isi Feedback" untuk memulai',
                          style: TextStyle(
                            color: Color(0xFFAAAAAA),
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileContent() {
    return Container(
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
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFFF69B4).withOpacity(0.2),
                    blurRadius: 15,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(
                Icons.person,
                size: 64,
                color: Color(0xFFFF69B4),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Profil Pengguna ',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF555555),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Nama: Rosita Br Bangun',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF888888),
              ),
            ),
            const Text(
              'Email: rositabangun57@gmail.com',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF888888),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _navigateToForm(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FeedbackFormPage()),
    );
    
    if (result != null && result is String) {
      setState(() {
        _feedbackMessage = result;
        _selectedIndex = 1;
      });
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Feedback berhasil dikirim!'),
          backgroundColor: const Color(0xFFFF69B4),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beranda'),
        backgroundColor: const Color(0xFFFF69B4),
        foregroundColor: Colors.white,
      ),
      drawer: _buildDrawer(context),
      body: _getPage(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFFFF69B4),
        unselectedItemColor: const Color(0xFFAAAAAA),
        backgroundColor: Colors.white,
        elevation: 8,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feedback_outlined),
            activeIcon: Icon(Icons.feedback),
            label: 'Feedback',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _navigateToForm(context),
        icon: const Icon(Icons.send, color: Colors.white),
        label: const Text(
          'Isi Feedback',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFFFF69B4),
        elevation: 6,
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: Container(
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
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFFF69B4),
                    Color(0xFFFF1493),
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.apps, size: 48, color: Colors.white),
                  const SizedBox(height: 8),
                  const Text(
                    'Menu Navigasi',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Pink Theme',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Color(0xFFFF69B4)),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                setState(() => _selectedIndex = 0);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info, color: Color(0xFFFF69B4)),
              title: const Text('Tentang Aplikasi'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.feedback, color: Color(0xFFFF69B4)),
              title: const Text('Form Feedback'),
              onTap: () {
                Navigator.pop(context);
                _navigateToForm(context);
              },
            ),
            const Divider(color: Color(0xFFFFB6C1)),
            ListTile(
              leading: const Icon(Icons.color_lens, color: Color(0xFFFF69B4)),
              title: const Text('Tema Pink'),
              subtitle: const Text('Soft pink theme'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Color(0xFFFF69B4)),
              title: const Text('Pengaturan'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}