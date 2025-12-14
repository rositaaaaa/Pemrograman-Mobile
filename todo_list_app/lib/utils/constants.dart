import 'package:flutter/material.dart';

class AppConstants {
  static const String appName = 'My Pink Todo';
  static const String storageKey = 'todos';
  
  // Filter types
  static const String filterAll = 'all';
  static const String filterDone = 'done';
  static const String filterNotDone = 'notyet';
  
  // Messages
  static const String emptyTodoMessage = 'Yay! Tidak ada tugas~';
  static const String addTodoTitle = 'Buat Tugas Baru ✨';
  static const String editTodoTitle = 'Edit Tugas ✏️';
  static const String cancelText = 'Batal';
  static const String saveText = 'Simpan';
  static const String deleteText = 'Hapus';
  static const String confirmDeleteTitle = 'Hapus Tugas?';
  static const String confirmDeleteMessage = 'Tugas ini akan dihapus permanen!';
}

class AppColors {
  static const primaryColor = Color(0xFFEC407A);
  static const primaryLight = Color(0xFFFF77A9);
  static const primaryDark = Color(0xFFB4004E);
  static const accentColor = Color(0xFFFF80AB);
  static const dangerColor = Color(0xFFFF5252);
  static const successColor = Color(0xFF69F0AE);
  static const backgroundColor = Color(0xFFFFF0F5);
  static const cardColor = Colors.white;
  static const textColor = Color(0xFF880E4F);
}

class AppGradients {
  static const primaryGradient = LinearGradient(
    colors: [Color(0xFFEC407A), Color(0xFFF48FB1)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const appBarGradient = LinearGradient(
    colors: [Color(0xFFEC407A), Color(0xFFF06292)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}