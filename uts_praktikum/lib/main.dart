import 'package:flutter/material.dart';
import 'pages/dashboard_page.dart';

void main() {
  runApp(const MyPortoApp());
}

class MyPortoApp extends StatelessWidget {
  const MyPortoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyPorto',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: const DashboardPage(),
    );
  }
}
