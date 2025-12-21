import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wisata_indonesia/services/auth_service.dart';
import 'package:wisata_indonesia/services/theme_service.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final themeService = Provider.of<ThemeService>(context);
    final user = authService.currentUser;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).colorScheme.secondary,
                    ],
                  ),
                ),
              ),
              title: const Text('Profil'),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                    child: Icon(
                      Icons.person,
                      size: 60,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    user?.displayName ?? 'Pengguna',
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    user?.email ?? 'email@contoh.com',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Card(
                    color: Theme.of(context).cardColor,
                    child: Column(
                      children: [
                        SwitchListTile(
                          title: const Text('Dark Mode'),
                          subtitle: Text(
                            themeService.isDarkMode ? 'Aktif' : 'Nonaktif',
                            style: TextStyle(
                              color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.6),
                            ),
                          ),
                          secondary: Icon(
                            themeService.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                            color: themeService.isDarkMode
                                ? Colors.amber
                                : Theme.of(context).primaryColor,
                          ),
                          value: themeService.isDarkMode,
                          onChanged: (value) {
                            themeService.setThemeMode(
                              value ? ThemeMode.dark : ThemeMode.light,
                            );
                          },
                        ),
                        const Divider(height: 1),
                        ListTile(
                          leading: const Icon(Icons.edit),
                          title: const Text('Update Nama'),
                          onTap: () {
                            _showUpdateNameDialog(context, authService);
                          },
                        ),
                        const Divider(height: 1),
                        ListTile(
                          leading: const Icon(Icons.logout, color: Colors.red),
                          title: const Text('Logout', style: TextStyle(color: Colors.red)),
                          onTap: () {
                            authService.signOut();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showUpdateNameDialog(BuildContext context, AuthService authService) {
    final TextEditingController nameController = TextEditingController(
      text: authService.currentUser?.displayName ?? '',
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Update Nama'),
        content: TextField(
          controller: nameController,
          decoration: const InputDecoration(
            hintText: 'Masukkan nama baru',
            labelText: 'Nama',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () async {
              final newName = nameController.text.trim();
              if (newName.isNotEmpty) {
                try {
                  await authService.updateDisplayName(newName);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Nama berhasil diperbarui'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  Navigator.pop(context);
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Gagal memperbarui nama: $e'),
                      backgroundColor: Colors.red,
                      duration: const Duration(seconds: 2),
                    ),
                  );
                }
              }
            },
            child: const Text('Simpan'),
          ),
        ],
      ),
    );
  }
}