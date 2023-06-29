import 'package:flutter/material.dart';
import 'package:quizonepiece/01_data/quiz/quiz.dart';

void main() {
  runApp(const RootApp());
}

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Quiz();
  }
}
