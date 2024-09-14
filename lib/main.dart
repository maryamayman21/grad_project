import 'package:flutter/material.dart';
import 'package:grad_proj/views/item_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ItemScreen(),
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
          bodyMedium: TextStyle(fontSize: 20, color: Colors.black),
          bodySmall: TextStyle(fontSize: 16, color: Colors.black38),
        ),
      ),
    );
  }
}
