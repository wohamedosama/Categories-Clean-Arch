import 'package:flutter/material.dart';
import 'package:test_apis/core/di/simple_di.dart';
import 'package:test_apis/features/presentation/screens/categories_screen.dart';

void main() {
  SimpleDI.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CategoriesScreen(),
    );
  }
}
