// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// GANTI INI → sesuai name di pubspec.yaml
import 'package:wisata_indonesia/main.dart';

void main() {
  testWidgets('Wisata Indonesia app smoke test', (WidgetTester tester) async {
    // Build app
    await tester.pumpWidget(const MyApp());

    // Contoh test dasar (boleh kamu ubah / hapus nanti)
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
