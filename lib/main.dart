import 'package:first_app/screens/image_screen.dart';
import 'package:flutter/material.dart';

// Core Flutter Material UI library

void main() {
  runApp(const MyApp());
  // Entry point of the Flutter app
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // Removes the DEBUG banner (easy to forget)

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        // Seed-based dynamic color generation
      ),

      home: const ImageScreen(),
      // First screen of the app
    );
  }
}

