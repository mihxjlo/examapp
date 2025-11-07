import 'package:flutter/material.dart';
import 'package:test_proj/screens/details.dart';
import 'screens/home.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Распоред за испити - 223165',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const MyHomePage(title: 'Распоред за испити - 223165'),
        "/details": (context) => const DetailsPage(),
      },
    );
  }
}

