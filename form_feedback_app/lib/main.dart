import 'package:flutter/material.dart';
import 'feedback_form_page.dart';

void main() {
  runApp(const FormFeedbackApp());
}

class FormFeedbackApp extends StatelessWidget {
  const FormFeedbackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Feedback App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pinkAccent.shade100,
          primary: Colors.pinkAccent.shade100,
        ),
        useMaterial3: true,
      ),
      home: const FeedbackFormPage(),
    );
  }
}
